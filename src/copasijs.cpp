#ifdef EMSCRIPTEN
#include <emscripten.h>
#include <emscripten/bind.h>
using namespace emscripten;
#define COPASI_MAIN
#endif 

#include "copasijs.h"

#ifdef __cplusplus
#define EXTERN extern "C"
#else
#define EXTERN
#endif

using namespace std;
using namespace nlohmann;


// define a struct for information from model, containing ptr to CDataObject, SBML id string, and common name
struct CModelElement
{
    CDataObject *pObj;
    std::string sbmlId;
    CRegisteredCommonName cnInitial;
    CRegisteredCommonName cn;
    const double* pValue;
    const double* pRates = NULL;
};

static CDataModel *pDataModel = NULL;
static std::map<std::string, CModelElement> mFloatingSpecies = {};
static std::map<std::string, std::string> mFloatingSpeciesIdMap = {};
static std::map<std::string, CModelElement> mBoundarySpecies = {};
static std::map<std::string, std::string> mBoundarySpeciesIdMap = {};
static std::map<std::string, CModelElement> mCompartments = {};
static std::map<std::string, std::string> mCompartmentsIdMap = {};
static std::map<std::string, CModelElement> mReactions = {};
static std::map<std::string, std::string> mReactionsIdMap = {};
static std::map<std::string, CModelElement> mLocalParameters = {};
static std::map<std::string, CModelElement> mGlobalParameters = {};
static std::map<std::string, std::string> mGlobalParametersIdMap = {};
static std::vector<std::string> mSelectionList = {};
static std::vector<const double*> mSelectedValues = {};
static std::vector<std::string> mAllIds = {};
static CDataHandler *mpDataHandler = NULL;

static std::string mLastSimulationJSON = ""; 
static std::vector<std::vector<double>> mLastSimulationResults2D = {};
static ordered_json mLastSimulationResults = {};

ordered_json convertGroupToJson(CCopasiParameterGroup* pGroup, bool basicOnly /* = true*/)
{
    ordered_json group;
    for (size_t i = 0; i < pGroup->size(); ++i)
    {
        auto* param = pGroup->getParameter(i);
        if (param == NULL || dynamic_cast<CCopasiParameterGroup*>(param) != NULL
        || !param->isEditable()
        || (basicOnly && !param->isBasic()))
            continue;

        auto name = param->getObjectName();
        auto type = param->getType();
        switch(type)
        {
            case CCopasiParameter::Type::DOUBLE:
            case CCopasiParameter::Type::UDOUBLE:
                group[name] = param->getValue<C_FLOAT64>();
                break;
            case CCopasiParameter::Type::INT:
                group[name] = param->getValue<int>();
                break;
            case CCopasiParameter::Type::UINT:
                group[name] = param->getValue<unsigned C_INT32>();
                break;
            case CCopasiParameter::Type::BOOL:
                group[name] = param->getValue<bool>();
                break;
            case CCopasiParameter::Type::STRING:
                group[name] = param->getValue<std::string>();
                break;
            default:
                break;
        }
    }
    return group;
}

void setGroupFromJson(CCopasiParameterGroup* pGroup, ordered_json& settings)
{
    for (auto& el : settings.items()) 
    {
        auto* param = pGroup->getParameter(el.key());
        if (param == NULL || dynamic_cast<CCopasiParameterGroup*>(param) != NULL)
            continue;
        auto type = param->getType();
        switch(type)
        {
            case CCopasiParameter::Type::DOUBLE:
            case CCopasiParameter::Type::UDOUBLE:
                param->setValue(el.value().get<double>());
                break;
            case CCopasiParameter::Type::INT:
                param->setValue(el.value().get<int>());
                break;
            case CCopasiParameter::Type::UINT:
                param->setValue(el.value().get<unsigned C_INT32>());
                break;
            case CCopasiParameter::Type::BOOL:
                param->setValue(el.value().get<bool>());
                break;
            case CCopasiParameter::Type::STRING:
                param->setValue(el.value().get<std::string>());
                break;
            default:
                break;
        }
    }
}

int initCps()
{
    CRootContainer::init(0, NULL);
    if (CRootContainer::getRoot() == NULL)
        return -1;
    pDataModel = CRootContainer::addDatamodel();
    pDataModel->newModel(NULL, true);
    return 0;
}

void destroyAPI()
{
    mFloatingSpecies.clear();
    mFloatingSpeciesIdMap.clear();
    mBoundarySpecies.clear();
    mBoundarySpeciesIdMap.clear();
    mCompartments.clear();
    mCompartmentsIdMap.clear();
    mReactions.clear();
    mReactionsIdMap.clear();
    mLocalParameters.clear();
    mGlobalParameters.clear();
    mGlobalParametersIdMap.clear();
    mSelectionList.clear();
    mSelectedValues.clear();
    mAllIds.clear();

    mLastSimulationJSON = "";
    mLastSimulationResults2D.clear();
    mLastSimulationResults.clear();

    if (mpDataHandler != NULL)
    {
        delete mpDataHandler;
        mpDataHandler = NULL;
    }

    if (pDataModel != NULL)
        CRootContainer::removeDatamodel(pDataModel);

    pDataModel = NULL;
    CRootContainer::destroy();
}

std::string getVersion()
{
    const CVersion &current = CVersion::VERSION;
    return current.getVersion();
}

std::string getMessages(int start, const std::string& filter)
{
    if (CCopasiMessage::size() <= start)
        return "";
    
    std::stringstream str;
    for (size_t i = start; i < CCopasiMessage::size(); ++i)
    {
        auto msg = CCopasiMessage::getFirstMessage();
        auto text = msg.getText();
        if (!filter.empty() && text.find(filter) != std::string::npos)
            continue;
        if (text.empty())
            continue;
        str << text << std::endl;
    }
    return str.str();
}

ordered_json convertDataHandlerToJSON(const CDataHandler& dh)
{
    auto &data = dh.getDuringData();

    ordered_json j;
    j["status"] = "success";
    j["num_variables"] = mSelectionList.size();
    j["recorded_steps"] = data.size();
    j["titles"] = mSelectionList;

    std::vector<std::vector<double>> columns;
    for (size_t i = 0; i < mSelectionList.size(); ++i)
    {
        std::vector<double> column;
        for (size_t j = 0; j < data.size(); ++j)
        {
            column.push_back(data[j][i]);
        }
        columns.push_back(column);
    }
    j["columns"] = columns;

    return j;
}

ordered_json convertTimeSeriesToJSON(const CTimeSeries& ts)
{
    ordered_json j;
    j["status"] = "success";
    j["num_variables"] = ts.getNumVariables();
    j["recorded_steps"] = ts.getRecordedSteps();
    std::vector<std::string> titles;
    std::vector<std::vector<double>> data;
    for (int i = 0; i < ts.getNumVariables(); ++i)
    {
        titles.push_back(ts.getTitle(i));

        std::vector<double> column;
        for (int j = 0; j < ts.getRecordedSteps(); ++j)
        {
            column.push_back(ts.getConcentrationData(j, i));
        }
        data.push_back(column);
    }
    j["titles"] = titles;
    j["columns"] = data;

    return j;
}

void fillStream(const CTimeSeries &ts, std::stringstream &str)
{
    str << "<table>";
    str << "<thead>";

    for (int i = 0; i < ts.getNumVariables(); ++i)
    {
        str << "<th>" << ts.getTitle(i) << "</th>";
    }

    str << "</thread>";

    for (int i = 0; i < ts.getRecordedSteps(); ++i)
    {
        str << "<tr>";
        for (int j = 0; j < ts.getNumVariables(); ++j)
        {
            str << "<td>" << ts.getConcentrationData(i, j) << "</td>";
        }
        str << "</tr>";
    }

    str << "</table>";
}

void cpsFree(char *ptr)
{
    free(ptr);
}

double getValue(const std::string &nameOrId)
{
    auto it = mFloatingSpecies.find(nameOrId);
    if (it == mFloatingSpecies.end())
    {
        auto idIt = mFloatingSpeciesIdMap.find(nameOrId);
        if (idIt != mFloatingSpeciesIdMap.end())
            it = mFloatingSpecies.find(idIt->second);
    }
    if (it != mFloatingSpecies.end())
        return *it->second.pValue;

    it = mBoundarySpecies.find(nameOrId);
    if (it == mBoundarySpecies.end())
    {
        auto idIt = mBoundarySpeciesIdMap.find(nameOrId);
        if (idIt != mBoundarySpeciesIdMap.end())
            it = mBoundarySpecies.find(idIt->second);
    }
    if (it != mBoundarySpecies.end())
        return *it->second.pValue;

    it = mCompartments.find(nameOrId);
    if (it == mCompartments.end())
    {
        auto idIt = mCompartmentsIdMap.find(nameOrId);
        if (idIt != mCompartmentsIdMap.end())
            it = mCompartments.find(idIt->second);
    }
    if (it != mCompartments.end())
        return *it->second.pValue;

    it = mReactions.find(nameOrId);
    if (it == mReactions.end())
    {
        auto idIt = mReactionsIdMap.find(nameOrId);
        if (idIt != mReactionsIdMap.end())
            it = mReactions.find(idIt->second);
    }
    if (it != mReactions.end())
        return *it->second.pValue;

    it = mLocalParameters.find(nameOrId);
    if (it != mLocalParameters.end())
        return *it->second.pValue;
    
    it = mGlobalParameters.find(nameOrId);
    if (it == mGlobalParameters.end())
    {
        auto idIt = mGlobalParametersIdMap.find(nameOrId);
        if (idIt != mGlobalParametersIdMap.end())
            it = mGlobalParameters.find(idIt->second);
    }
    if (it != mGlobalParameters.end())
        return *it->second.pValue;
    return std::numeric_limits<double>::quiet_NaN();
}

bool setModelElement(std::map<std::string, CModelElement>& map, std::map<std::string, std::string>& idMap, const std::string& name, double value, CModel* model)
{
    auto it = map.find(name);
    if (it == map.end())
    {
        auto idIt = idMap.find(name);
        if (idIt != idMap.end())
            it = map.find(idIt->second);
    }
    if (it != map.end())
    {
        CMetab* pMetab = dynamic_cast<CMetab*>(it->second.pObj);
        if (pMetab)
        {
            model->updateInitialValues(pMetab->getInitialConcentrationReference(), false);

            double oldValue = model->getMathContainer().getMathObject(pMetab->getInitialConcentrationReference())->getValue();

            pMetab->setConcentration(value);
            pMetab->setInitialConcentration(value);
            model->updateInitialValues(pMetab->getInitialConcentrationReference(), false);

            double newValue = model->getMathContainer().getMathObject(pMetab->getInitialConcentrationReference())->getValue();


            return true;
        }

        CModelEntity* pEntity = dynamic_cast<CModelEntity*>(it->second.pObj);
        if (pEntity)
        {
            pEntity->setValue(value);
            pEntity->setInitialValue(value);
            std::set<const CDataObject*> changes = {pEntity->getInitialValueReference(), pEntity->getValueReference()};

            model->updateInitialValues(changes, true);
            return true;
        }
        
    }
    return false;
}

void setValue(const std::string& nameOrId, double value)
{
    if (!pDataModel)
        return;

    auto* model = pDataModel->getModel();
    if (!model)
        return;

    // look through floating species by name first, falling back
    // for id if not found
    if (setModelElement(mFloatingSpecies, mFloatingSpeciesIdMap, nameOrId, value, model))
        return;

    // boundary species 
    if (setModelElement(mBoundarySpecies, mBoundarySpeciesIdMap, nameOrId, value, model))
        return;
    
    // now compartments
    if (setModelElement(mCompartments, mCompartmentsIdMap, nameOrId, value, model))
        return;
    
    // and global parameters
    if (setModelElement(mGlobalParameters, mGlobalParametersIdMap, nameOrId, value, model))
        return;


}

void setValueByName(const std::string& key, double dValue)
{
  if (!pDataModel)
    return;

  auto* model = pDataModel->getModel();
  if (!model)
    return;
	
  auto* obj = const_cast<CDataObject*> (pDataModel->findObjectByDisplayName(key));
	if (obj == NULL)
		return;

	bool isReference = obj->getObjectType() == "Reference";
	CMetab* pMetab = isReference ? dynamic_cast<CMetab*>(obj->getObjectParent())
		: dynamic_cast<CMetab*>(obj);

	CModelEntity* pEntity = isReference ? dynamic_cast<CModelEntity*>(obj->getObjectParent())
		: dynamic_cast<CModelEntity*>(obj);
	CCopasiParameter* pParam = isReference ? dynamic_cast<CCopasiParameter*>(obj->getObjectParent())
		: dynamic_cast<CCopasiParameter*>(obj);

	if (pMetab && obj->getObjectType() != "Reference")
	{
		obj = pMetab->getInitialConcentrationReference();
	}
	else if (pEntity && obj->getObjectType() != "Reference")
	{
		obj = pEntity->getInitialValueReference();
	}

	model->updateInitialValues(obj);
	if (pMetab)
	{
		pMetab->setInitialConcentration(dValue);
	}
	else if (pEntity)
	{
		pEntity->setInitialValue(dValue);
	}
	else if (pParam)
	{
		CReaction* pReaction = dynamic_cast<CReaction*>(obj->getObjectAncestor("Reaction"));
		if (pReaction)
			pReaction->setParameterValue(pParam->getObjectName(), dValue);
	}
	model->updateInitialValues(obj);
}


void setSelectionList(const std::vector<std::string>& selectionList)
{
    mSelectionList = selectionList;

    if (mpDataHandler != NULL)
        delete mpDataHandler;
    mpDataHandler = new CDataHandler();
    mSelectedValues.clear();

    std::vector<std::string> toBeRemoved;

    for(auto& item : mSelectionList)
    {
        if (item == "Time" || item == "time")
        {
            mSelectedValues.push_back(&pDataModel->getModel()->getValue());
            mpDataHandler->addDuringName(pDataModel->getModel()->getValueReference()->getCN());
            continue;
        }

        auto it = mFloatingSpecies.find(item);
        if (it == mFloatingSpecies.end())
        {
            auto idIt = mFloatingSpeciesIdMap.find(item);
            if (idIt != mFloatingSpeciesIdMap.end())
                it = mFloatingSpecies.find(idIt->second);
        }
        if (it != mFloatingSpecies.end())
        {
            mSelectedValues.push_back(it->second.pValue);
            mpDataHandler->addDuringName(it->second.cn);
            continue;
        }

        it = mBoundarySpecies.find(item);
        if (it == mBoundarySpecies.end())
        {
            auto idIt = mBoundarySpeciesIdMap.find(item);
            if (idIt != mBoundarySpeciesIdMap.end())
                it = mBoundarySpecies.find(idIt->second);
        }
        if (it != mBoundarySpecies.end())
        {
            mSelectedValues.push_back(it->second.pValue);
            mpDataHandler->addDuringName(it->second.cn);
            continue;
        }

        it = mCompartments.find(item);
        if (it == mCompartments.end())
        {
            auto idIt = mCompartmentsIdMap.find(item);
            if (idIt != mCompartmentsIdMap.end())
                it = mCompartments.find(idIt->second);
        }
        if (it != mCompartments.end())
        {
            mSelectedValues.push_back(it->second.pValue);
            mpDataHandler->addDuringName(it->second.cn);
            continue;
        }

        it = mReactions.find(item);
        if (it == mReactions.end())
        {
            auto idIt = mReactionsIdMap.find(item);
            if (idIt != mReactionsIdMap.end())
                it = mReactions.find(idIt->second);
        }
        if (it != mReactions.end())
        {
            mSelectedValues.push_back(it->second.pValue);
            mpDataHandler->addDuringName(it->second.cn);
            continue;
        }

        it = mLocalParameters.find(item);
        if (it != mLocalParameters.end())
        {
            mSelectedValues.push_back(it->second.pValue);
            mpDataHandler->addDuringName(it->second.cn);
            continue;
        }

        it = mGlobalParameters.find(item);
        if (it == mGlobalParameters.end())
        {
            auto idIt = mGlobalParametersIdMap.find(item);
            if (idIt != mGlobalParametersIdMap.end())
                it = mGlobalParameters.find(idIt->second);
        }
        if (it != mGlobalParameters.end())
        {
            mSelectedValues.push_back(it->second.pValue);
            mpDataHandler->addDuringName(it->second.cn);
            continue;
        }

        // we still havent found it ... lets try
        // to resolve it using display names
        auto* obj = const_cast<CDataObject*> (pDataModel->findObjectByDisplayName(item));
        if (obj == NULL)
            continue;
        bool isReference = obj->getObjectType() == "Reference";
        if (isReference)
        {
            mSelectedValues.push_back(reinterpret_cast<const double*>(obj->getValuePointer()));
            mpDataHandler->addDuringName(obj->getCN());
            continue;
        }
        CMetab* pMetab = dynamic_cast<CMetab*>(obj);
        if (pMetab)
        {
            mSelectedValues.push_back(&pMetab->getConcentration());
            mpDataHandler->addDuringName(pMetab->getConcentrationReference()->getCN());
            continue;
        }

        CModelEntity* pEntity = dynamic_cast<CModelEntity*>(obj);
        if (pEntity)
        {
            mSelectedValues.push_back(&pEntity->getValue());
            mpDataHandler->addDuringName(pEntity->getValueReference()->getCN());
            continue;
        }

        toBeRemoved.push_back(item);
    }   

    // remove entries that could not be resolved
    for (auto& item : toBeRemoved)
    {
        auto it = std::find(mSelectionList.begin(), mSelectionList.end(), item);
        if (it != mSelectionList.end())
            mSelectionList.erase(it);
    }

}

ordered_json buildModelInfo()
{
    mFloatingSpecies.clear();
    mFloatingSpeciesIdMap.clear();
    mBoundarySpecies.clear();
    mBoundarySpeciesIdMap.clear();
    mCompartments.clear();
    mCompartmentsIdMap.clear();
    mReactions.clear();
    mReactionsIdMap.clear();
    mLocalParameters.clear();
    mGlobalParameters.clear();
    mGlobalParametersIdMap.clear();
    mSelectionList.clear();
    mSelectionList.push_back("Time");
    mSelectedValues.clear();
    mAllIds.clear();


    ordered_json modelInfo;
    auto *pModel = pDataModel->getModel();
    auto &pMetabs = pModel->getMetabolites();
    auto &pReactions = pModel->getReactions();
    auto &pCompartments = pModel->getCompartments();
    auto &pModelValues = pModel->getModelValues();

    std::vector<json> species;
    for (auto &metab : pMetabs)
    {
        ordered_json m;
        m["name"] = metab.getObjectName();
        m["id"] = metab.getSBMLId();
        m["compartment"] = metab.getCompartment()->getObjectName();
        m["initial_concentration"] = metab.getInitialConcentration();
        m["initial_particle_number"] = metab.getInitialValue();
        m["particle_number"] = metab.getValue();
        m["concentration"] = metab.getConcentration();
        m["type"] = CModelEntity::StatusName[metab.getStatus()];

        CModelElement s = {
            &metab,
            metab.getSBMLId(),
            metab.getInitialConcentrationReference()->getCN(),
            metab.getConcentrationReference()->getCN(),
            &metab.getConcentration(),
            reinterpret_cast<const double*>(metab.getConcentrationRateReference()->getValuePointer())
        };

        mAllIds.push_back(metab.getSBMLId());

        if (metab.getStatus() == CModelEntity::Status::FIXED)
        {
            mBoundarySpecies[metab.getObjectName()] = s;
            mBoundarySpeciesIdMap[metab.getSBMLId()] = metab.getObjectName();
        }
        else
        {
            mFloatingSpecies[metab.getObjectName()] = s;
            mFloatingSpeciesIdMap[metab.getSBMLId()] = metab.getObjectName();
            mSelectionList.push_back(metab.getObjectName());
        }


        species.push_back(m);
    }
    modelInfo["species"] = species;

    std::vector<json> compartments;
    for (auto& compartment : pCompartments)
    {
        ordered_json c;
        c["name"] = compartment.getObjectName();
        c["id"] = compartment.getSBMLId();
        c["size"] = compartment.getInitialValue();
        c["type"] = CModelEntity::StatusName[compartment.getStatus()];
        compartments.push_back(c);

        CModelElement cp = {
            &compartment,
            compartment.getSBMLId(),
            compartment.getInitialValueReference()->getCN(),
            compartment.getValueReference()->getCN(),
            &compartment.getValue()
        };
        mCompartments[compartment.getObjectName()] = cp;
        mCompartmentsIdMap[compartment.getSBMLId()] = compartment.getObjectName();
        mAllIds.push_back(compartment.getSBMLId());

        if (compartment.getStatus() != CModelEntity::Status::FIXED)
            mSelectionList.push_back(compartment.getObjectName());
    }
    modelInfo["compartments"] = compartments;

    std::vector<json> reactions;
    for (auto &reaction : pReactions)
    {
        ordered_json r;
        r["name"] = reaction.getObjectName();
        r["id"] = reaction.getSBMLId();
        r["reversible"] = reaction.isReversible();
        r["scheme"] = reaction.getReactionScheme();

        std::vector<json> localParameters;
        auto& params = reaction.getParameters();
        auto& fun_params = reaction.getFunctionParameters();
        auto num_params = fun_params.size();
        for (size_t i = 0; i < num_params; ++i)
        {
            auto* fun_parameter = fun_params[i];
            auto& name = fun_parameter->getObjectName();
            if (reaction.isLocalParameter(name) == false)
                continue;
            ordered_json p;
            p["name"] = name;
            p["value"] = reaction.getParameterValue(name);
            localParameters.push_back(p);

            auto& cns = reaction.getParameterCNs(name);
            auto& obj = reaction.getParameterObjects(name);

            if (cns.empty() || obj.empty())
                continue;

            CModelElement lp = {
                const_cast<CDataObject*>(obj[0]),
                "",
                cns[0],
                cns[0],
                &reaction.getParameterValue(name)
            };
            mLocalParameters[obj[0]->getObjectDisplayName()] = lp;
        }
        r["local_parameters"] = localParameters;
        reactions.push_back(r);

        CModelElement re = {
            &reaction,
            reaction.getSBMLId(),
            reaction.getFluxReference()->getCN(),
            reaction.getFluxReference()->getCN(),
            &reaction.getFlux()
        };
        mReactions[reaction.getObjectName()] = re;
        mReactionsIdMap[reaction.getSBMLId()] = reaction.getObjectName();
        mAllIds.push_back(reaction.getSBMLId());
    }
    modelInfo["reactions"] = reactions;

    // global parameters
    std::vector<json> globalParameters;
    for (auto &param : pModelValues)
    {
        ordered_json p;
        p["name"] = param.getObjectName();
        p["id"] = param.getSBMLId();
        p["value"] = param.getValue();
        p["initial_value"] = param.getInitialValue();
        p["type"] = CModelEntity::StatusName[param.getStatus()];
        globalParameters.push_back(p);

        CModelElement gp = {
            &param,
            param.getSBMLId(),
            param.getInitialValueReference()->getCN(),
            param.getValueReference()->getCN(),
            &param.getValue()
        };
        mGlobalParameters[param.getObjectName()] = gp;
        mGlobalParametersIdMap[param.getSBMLId()] = param.getObjectName();
        mAllIds.push_back(param.getSBMLId());

        if (param.getStatus() != CModelEntity::Status::FIXED)
            mSelectionList.push_back(param.getObjectName());
    }
    modelInfo["global_parameters"] = globalParameters;

    modelInfo["time"] = pModel->getValue();

    modelInfo["model"]["name"] = pModel->getObjectName();
    modelInfo["model"]["notes"] = pModel->getNotes();

    modelInfo["status"] = "success";
    modelInfo["messages"] = getMessages(0, "No Output");

    setSelectionList(mSelectionList);

    return modelInfo;
}

std::string getModelInfo()
{
    if (pDataModel == NULL)
        initCps();

    return buildModelInfo().dump(2);
}

void _removeFixedElementsFromSet(CModelParameterGroup* group)
{
    if (!group)
        return;
    
    std::vector< CModelParameter * > toBeRemoved;
    for (auto it = group->begin(); it != group->end(); ++it)
    {
        auto* p = *it;
        if (p == NULL)
            continue;

        auto *pGroup = dynamic_cast<CModelParameterGroup*>(p);
        if (pGroup)
        {
            _removeFixedElementsFromSet(pGroup);
            continue;
        }
        if (p->getSimulationType() == CModelEntity::Status::FIXED)
        {
            toBeRemoved.push_back(p);
        }
    }

    for (auto* p : toBeRemoved)
    {
        group->remove(p);
    }
}

void loadCommon()
{
    auto* pModel = pDataModel->getModel();
    pModel->applyInitialValues();
    auto& sets = pModel->getModelParameterSets();
    auto* newSet = new CModelParameterSet("_initial_state");
    sets.add(newSet, true);
    newSet->createFromModel();

    // now create a second one with only the state variables
    newSet = new CModelParameterSet("_initial_state_variables_only");
    sets.add(newSet, true);
    newSet->createFromModel();
    _removeFixedElementsFromSet(newSet);
}

std::string loadFromFile(const std::string& modelFile)
{
    try
    {
        destroyAPI();
        initCps();

        CCopasiMessage::clearDeque();

        if (!pDataModel->loadModel(modelFile, NULL, true))
            if (!pDataModel->importSBML(modelFile))
            {
                CCopasiMessage message(CCopasiMessage::ERROR, "Error loading model");
                ordered_json modelInfo;
                modelInfo["status"] = "error";
                modelInfo["messages"] = getMessages();
                return modelInfo.dump(2);
            }

        loadCommon();
    }
    catch (CCopasiException &e)
    {
        ordered_json modelInfo;
        modelInfo["status"] = "error";
        modelInfo["messages"] = getMessages();
        return modelInfo.dump(2);
    }
    catch (std::exception &e)
    {
        ordered_json modelInfo;
        modelInfo["status"] = "error";
        modelInfo["messages"] = e.what();
        return modelInfo.dump(2);
    }

    return buildModelInfo().dump(2);
}

std::string loadModel(const std::string& cpsCode)
{
    try
    {
        destroyAPI();
        initCps();

        CCopasiMessage::clearDeque();

        if (!pDataModel->loadFromString(cpsCode))
            if (!pDataModel->importSBMLFromString(cpsCode))
            {
                CCopasiMessage message(CCopasiMessage::ERROR, "Error loading model");
                ordered_json modelInfo;
                modelInfo["status"] = "error";
                modelInfo["messages"] = getMessages();
                return modelInfo.dump(2);
            }

        loadCommon();
    }
    catch (CCopasiException &e)
    {
        ordered_json modelInfo;
        modelInfo["status"] = "error";
        modelInfo["messages"] = getMessages();
        return modelInfo.dump(2);
    }
    catch (std::exception &e)
    {
        ordered_json modelInfo;
        modelInfo["status"] = "error";
        modelInfo["messages"] = e.what();
        return modelInfo.dump(2);
    }

    return buildModelInfo().dump(2);
}

void reset()
{
    if (pDataModel == NULL)
        initCps();

    auto* pModel = pDataModel->getModel();
    auto& set = pModel->getModelParameterSets()["_initial_state_variables_only"];
    set.updateModel();
    pModel->applyInitialValues();
}

void resetAll()
{
    if (pDataModel == NULL)
        initCps();

    auto* pModel = pDataModel->getModel();
    auto& set = pModel->getModelParameterSets()["_initial_state"];
    set.updateModel();
    pModel->applyInitialValues();
}

void applyYaml(ordered_json& yaml)
{
    auto &task = dynamic_cast<CTrajectoryTask &>((*pDataModel->getTaskList())["Time-Course"]);
    task.setUpdateModel(true);
    auto *problem = dynamic_cast<CTrajectoryProblem *>(task.getProblem());

    if (!yaml["problem"].empty())
    {
        auto& p = yaml["problem"];
        setGroupFromJson(problem, p);

        // need to take extra care with step number / stepsize
        // as those might not be honored if set via group
        if (!p["Duration"].empty())
            problem->setDuration(p["Duration"].get<double>());        
        if (!p["StepNumber"].empty())
            problem->setStepNumber(p["StepNumber"].get<int>());
        if (!p["StepSize"].empty())
            problem->setStepSize(p["StepSize"].get<double>());        
        if (!p["OutputStartTime"].empty())
            problem->setOutputStartTime(p["OutputStartTime"].get<double>());        
        
    }

    if (!yaml["method"].empty())
    {
        auto& m = yaml["method"];
        if (!m["name"].empty())
            task.setMethodType(CTaskEnum::MethodName.toEnum(m["name"].get<string>()));
        auto* method = task.getMethod();
        setGroupFromJson(method, m);
    }

    if (!yaml["initial_values"].empty())
    {
        auto& iv = yaml["initial_values"];
        auto* model = pDataModel->getModel();
        for (auto& [key, value] : iv.items())
        {
            double dValue = value.get<double>();
            setValueByName(key, dValue);
        }
    }

}

void ensureModel()
{
    if (pDataModel == NULL)
        initCps();

    pDataModel = &(*CRootContainer::getDatamodelList())[0];
}

std::vector<std::vector<double>> getSimulationResults2D()
{
    if (mpDataHandler != NULL)
        return mpDataHandler->getDuringData();

    auto &task = dynamic_cast<CTrajectoryTask &>((*pDataModel->getTaskList())["Time-Course"]);
    auto &ts = task.getTimeSeries();

    std::vector<std::vector<double>> results;
    for (int i = 0; i < ts.getRecordedSteps(); ++i)
    {
        std::vector<double> row;
        for (int j = 0; j < ts.getNumVariables(); ++j)
        {
            row.push_back(ts.getConcentrationData(i, j));
        }
        results.push_back(row);
    }
    return results;
}

double steadyState()
{
    ensureModel();

    auto &task = dynamic_cast<CSteadyStateTask &>((*pDataModel->getTaskList())["Steady-State"]);
    task.setUpdateModel(true);

    if (!task.initialize(CCopasiTask::OUTPUT_UI, pDataModel, NULL))
        return std::numeric_limits<double>::quiet_NaN();

    if (!task.process(false))
        return std::numeric_limits<double>::quiet_NaN();

    if (!task.restore())
        return std::numeric_limits<double>::quiet_NaN();

    auto* method = dynamic_cast<CSteadyStateMethod*>(task.getMethod());
    if (method == NULL)
        return std::numeric_limits<double>::quiet_NaN();
    auto log = method->getMethodLog();

    // rfind last instance of 'rate:' <number> and extract number
    auto pos = log.rfind("Rate: ");
    if (pos == std::string::npos)
        return std::numeric_limits<double>::quiet_NaN();
    pos += 6;
    auto end = log.find("\n", pos);
    if (end == std::string::npos)
        return std::numeric_limits<double>::quiet_NaN();
    auto rate = log.substr(pos, end-pos);
    auto rateValue = std::stod(rate);
    return rateValue;
}


std::string simulateJSON(ordered_json& yaml)
{
    try
    {
        ensureModel();

        CCopasiMessage::clearDeque();

        auto &task = dynamic_cast<CTrajectoryTask &>((*pDataModel->getTaskList())["Time-Course"]);
        task.setUpdateModel(true);
        auto *problem = dynamic_cast<CTrajectoryProblem *>(task.getProblem());

        applyYaml(yaml);
        problem->setTimeSeriesRequested(true);

        std::stringstream str;

        size_t pos = CCopasiMessage::size();

        setSelectionList(mSelectionList);

        if (mpDataHandler)
            pDataModel->addInterface(mpDataHandler);

        if (!task.initialize(CCopasiTask::OUTPUT_UI, pDataModel, NULL))
        {
            ordered_json modelInfo;
            modelInfo["status"] = "error";
            modelInfo["messages"] = getMessages(pos, "No Output");
            return modelInfo.dump(2);            
        }

        if (!task.process(true))
        {
            ordered_json modelInfo;
            modelInfo["status"] = "error";
            modelInfo["messages"] = getMessages(pos, "No Output");
            return modelInfo.dump(2);            
        }

        if (!task.restore())
        {
            ordered_json modelInfo;
            modelInfo["status"] = "error";
            modelInfo["messages"] = getMessages(pos, "No Output");
            return modelInfo.dump(2);            
        }

        if (mpDataHandler)
        {
            pDataModel->removeInterface(mpDataHandler);
            return convertDataHandlerToJSON(*mpDataHandler).dump(2);
        }
        else
        {
            auto &ts = task.getTimeSeries();
            //fillStream(ts, str);

            //return str.str().c_str();
            return convertTimeSeriesToJSON(ts).dump(2);
        }
    }
    catch (CCopasiException &e)
    {
        return e.getMessage().getText().c_str();
    }
    catch (std::exception &e)
    {
        return e.what();
    }
}

std::string getTimeCourseSettings()
{
    ensureModel();
    ordered_json yaml;
    auto &task = dynamic_cast<CTrajectoryTask &>((*pDataModel->getTaskList())["Time-Course"]);
    auto *problem = dynamic_cast<CTrajectoryProblem *>(task.getProblem());
    yaml["problem"] = convertGroupToJson(problem);
    yaml["method"] = convertGroupToJson(task.getMethod());
    yaml["method"]["name"] = task.getMethod()->getObjectName();
    return yaml.dump(2);
}

void setTimeCourseSettings(const std::string& settings)
{
    ensureModel();
    ordered_json yaml = ordered_json::parse(settings);
    applyYaml(yaml);
}

std::string simulateYaml(const std::string& processingYaml)
{
    auto yaml = nlohmann::ordered_json::parse(processingYaml);
    return simulateJSON(yaml);
}

std::string simulate() 
{
    ordered_json yaml;
    return simulateJSON(yaml);
}

std::string simulateEx(double timeStart, double timeEnd, int numPoints) 
{
    ordered_json yaml;
    numPoints = numPoints > 1 ? numPoints-1 : numPoints;
    yaml["problem"]["StepNumber"] = numPoints;
    yaml["problem"]["OutputStartTime"] = timeStart;
    yaml["problem"]["Duration"] = timeEnd;
    double stepSize = (timeEnd - timeStart) / numPoints;
    yaml["problem"]["StepSize"] = stepSize;
    return simulateJSON(yaml);
}

std::vector<std::string> getReactionNames()
{
    std::vector<std::string> names;
    for (auto& [key, value] : mReactions)
    {
        names.push_back(key);
    }
    return names;
}

std::vector<std::string> getReactionIds()
{
    std::vector<std::string> ids;
    for (auto& [key, value] : mReactionsIdMap)
    {
        ids.push_back(key);
    }
    return ids;
}

std::vector<double> getReactionRates()
{
    std::vector<double> rates;
    for (auto& [key, value] : mReactions)
    {
        rates.push_back(*value.pValue);
    }
    return rates;
}

std::vector<std::string> getFloatingSpeciesNames()
{
    std::vector<std::string> names;
    for (auto& [key, value] : mFloatingSpecies)
    {
        names.push_back(key);
    }
    return names;
}

std::vector<std::string> getFloatingSpeciesIds()
{
    std::vector<std::string> ids;
    for (auto& [key, value] : mFloatingSpeciesIdMap)
    {
        ids.push_back(key);
    }
    return ids;
}

std::vector<double> getFloatingSpeciesConcentrations()
{
    std::vector<double> concentrations;
    for (auto& [key, value] : mFloatingSpecies)
    {
        concentrations.push_back(*value.pValue);
    }
    return concentrations;
}

std::vector<double> getRatesOfChange()
{
    std::vector<double> concentrations;
    for (auto& [key, value] : mFloatingSpecies)
    {
        if (value.pRates != NULL)
            concentrations.push_back(*value.pRates);
        else
            concentrations.push_back(std::numeric_limits<double>::quiet_NaN());
    }
    return concentrations;
}


std::vector<std::string> getBoundarySpeciesNames()
{
    std::vector<std::string> names;
    for (auto& [key, value] : mBoundarySpecies)
    {
        names.push_back(key);
    }
    return names;
}


std::vector<std::string> getBoundarySpeciesIds()
{
    std::vector<std::string> ids;
    for (auto& [key, value] : mBoundarySpeciesIdMap)
    {
        ids.push_back(key);
    }
    return ids;
}

std::vector<double> getBoundarySpeciesConcentrations()
{
    std::vector<double> concentrations;
    for (auto& [key, value] : mBoundarySpecies)
    {
        concentrations.push_back(*value.pValue);
    }
    return concentrations;
}

std::vector<std::string> getCompartmentNames()
{
    std::vector<std::string> names;
    for (auto& [key, value] : mCompartments)
    {
        names.push_back(key);
    }
    return names;
}


std::vector<std::string> getCompartmentIds()
{
    std::vector<std::string> ids;
    for (auto& [key, value] : mCompartmentsIdMap)
    {
        ids.push_back(key);
    }
    return ids;
}

std::vector<double> getCompartmentSizes()
{
    std::vector<double> sizes;
    for (auto& [key, value] : mCompartments)
    {
        sizes.push_back(*value.pValue);
    }
    return sizes;
}

std::vector<std::string> getGlobalParameterNames()
{
    std::vector<std::string> names;
    for (auto& [key, value] : mGlobalParameters)
    {
        names.push_back(key);
    }
    return names;
}

std::vector<std::string> getGlobalParameterIds()
{
    std::vector<std::string> ids;
    for (auto& [key, value] : mGlobalParametersIdMap)
    {
        ids.push_back(key);
    }
    return ids;
}

std::vector<double> getGlobalParameterValues()
{
    std::vector<double> values;
    for (auto& [key, value] : mGlobalParameters)
    {
        values.push_back(*value.pValue);
    }
    return values;
}

std::vector<std::string> getLocalParameterNames()
{
    std::vector<std::string> names;
    for (auto& [key, value] : mLocalParameters)
    {
        names.push_back(key);
    }
    return names;
}

std::vector<double> getLocalParameterValues()
{
    std::vector<double> values;
    for (auto& [key, value] : mLocalParameters)
    {
        values.push_back(*value.pValue);
    }
    return values;
}

double oneStep(double startTime, double stepSize)
{
    ordered_json yaml;
    yaml["problem"]["StepSize"] = stepSize;
    yaml["problem"]["OutputStartTime"] = startTime;
    yaml["problem"]["Duration"] = startTime + stepSize;
    simulateJSON(yaml);
    return startTime + stepSize;
}

std::vector<std::string> getSelectionList()
{
    return mSelectionList;
}

std::vector<double> getSelectionValues()
{
    std::vector<double> values;
    for (auto* pValue : mSelectedValues)
    {
        values.push_back(*pValue);
    }
    return values;
}


#ifdef EMSCRIPTEN
EMSCRIPTEN_BINDINGS(copasi_binding)
{
    register_vector<int>("IntVector");
    register_vector<char>("CharVector");
    register_vector<float>("FloatVector");
    register_vector<double>("DoubleVector");
    register_vector< std::vector<double> >("DoubleVectorVector");
    register_vector<std::string>("StringVector");

    emscripten::function("initCps", &initCps);
    emscripten::function("destroy", &destroyAPI);  
    emscripten::function("getVersion", &getVersion);
    emscripten::function("getMessages", &getMessages);
    emscripten::function("getModelInfo", &getModelInfo);
    emscripten::function("loadFromFile", &loadFromFile);
    emscripten::function("loadModel", &loadModel);
    emscripten::function("reset", &reset);
    emscripten::function("resetAll", &resetAll);
    emscripten::function("simulate", &simulate);
    emscripten::function("simulateYaml", &simulateYaml);
    emscripten::function("simulateEx", &simulateEx);
    emscripten::function("getTimeCourseSettings", &getTimeCourseSettings);
    emscripten::function("setTimeCourseSettings", &setTimeCourseSettings);
    emscripten::function("getFloatingSpeciesNames", &getFloatingSpeciesNames);
    emscripten::function("getFloatingSpeciesIds", &getFloatingSpeciesIds);
    emscripten::function("getBoundarySpeciesNames", &getBoundarySpeciesNames);
    emscripten::function("getBoundarySpeciesIds", &getBoundarySpeciesIds);
    emscripten::function("getFloatingSpeciesConcentrations", &getFloatingSpeciesConcentrations);
    emscripten::function("getBoundarySpeciesConcentrations", &getBoundarySpeciesConcentrations);
    emscripten::function("getRatesOfChange", &getRatesOfChange);
    emscripten::function("getReactionNames", &getReactionNames);
    emscripten::function("getReactionIds", &getReactionIds);
    emscripten::function("getReactionRates", &getReactionRates);
    emscripten::function("getSimulationResults2D", &getSimulationResults2D);
    emscripten::function("getCompartmentNames", &getCompartmentNames);
    emscripten::function("getCompartmentIds", &getCompartmentIds);
    emscripten::function("getCompartmentSizes", &getCompartmentSizes);
    emscripten::function("getGlobalParameterNames", &getGlobalParameterNames);
    emscripten::function("getGlobalParameterIds", &getGlobalParameterIds);
    emscripten::function("getGlobalParameterValues", &getGlobalParameterValues);
    emscripten::function("getLocalParameterNames", &getLocalParameterNames);
    emscripten::function("getLocalParameterValues", &getLocalParameterValues);

    emscripten::function("getValue", &getValue);
    emscripten::function("setValue", &setValue);
    emscripten::function("setValueByName", &setValueByName);


    emscripten::function("oneStep", &oneStep);
    emscripten::function("steadyState", &steadyState);

    emscripten::function("getSelectionList", &getSelectionList);
    emscripten::function("getSelectedValues", &getSelectionValues);
    emscripten::function("setSelectionList", &setSelectionList);

}
#endif