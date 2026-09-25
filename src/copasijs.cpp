#ifdef __EMSCRIPTEN__
#include <emscripten.h>
#include <emscripten/bind.h>
using namespace emscripten;
#define COPASI_MAIN

#include <sys/resource.h>
#include <sys/time.h>
#include <errno.h>

extern "C" int getrusage(int who, struct rusage* usage)
{
  if (usage == nullptr)
  {
    errno = EFAULT;
    return -1;
  }

  // Accept the values COPASI uses.
  if (who != RUSAGE_SELF && who != RUSAGE_THREAD)
  {
    errno = EINVAL;
    return -1;
  }

  memset(usage, 0, sizeof(*usage));

  const double ms = emscripten_get_now();

  usage->ru_utime.tv_sec = static_cast<time_t>(ms / 1000.0);
  usage->ru_utime.tv_usec = static_cast<suseconds_t>(
    static_cast<long long>(ms * 1000.0) % 1000000);

  return 0;
}

#ifdef COPASIJS_EXCEPTION_DEBUG

#include <emscripten/emscripten.h>
#include <cstdio>

extern "C" void __real___cxa_throw(void*, void*, void (*)(void*));

extern "C" void __wrap___cxa_throw(void* ex, void* type, void (*dest)(void*))
{
  fprintf(stderr, "\n========== C++ exception thrown ==========\n");

  const char* stack = emscripten_run_script_string(R"(
        (new Error()).stack
    )");

  if (stack)
    fprintf(stderr, "%s\n", stack);

  __real___cxa_throw(ex, type, dest);
}

#endif

#endif

#include "copasijs.h"

#include <copasi/core/CDataContainer.h>

#include <copasi/utilities/CDirEntry.h>

#include <copasi/steadystate/CEigen.h>
#include <regex>
#include <cstring>
#include <limits>
#include <algorithm>

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
  CDataObject* pObj;
  std::string sbmlId;
  CRegisteredCommonName cnInitial;
  CRegisteredCommonName cn;
  const double* pValue;
  const double* pRates = nullptr;
};

static CDataModel* pDataModel = nullptr;
static std::map<std::string, CModelElement> mFloatingSpecies = {};
static std::map<std::string, std::string> mFloatingSpeciesIdMap = {};
static std::vector<std::string> mFloatingSpeciesOrder = {};
static std::map<std::string, CModelElement> mBoundarySpecies = {};
static std::map<std::string, std::string> mBoundarySpeciesIdMap = {};
static std::vector<std::string> mBoundarySpeciesOrder = {};
static std::map<std::string, CModelElement> mCompartments = {};
static std::map<std::string, std::string> mCompartmentsIdMap = {};
static std::vector<std::string> mCompartmentOrder = {};
static std::map<std::string, CModelElement> mReactions = {};
static std::map<std::string, std::string> mReactionsIdMap = {};
static std::vector<std::string> mReactionOrder = {};
static std::map<std::string, CModelElement> mLocalParameters = {};
static std::vector<std::string> mLocalParameterOrder = {};
static std::map<std::string, CModelElement> mGlobalParameters = {};
static std::map<std::string, std::string> mGlobalParametersIdMap = {};
static std::vector<std::string> mGlobalParameterOrder = {};
static std::vector<std::string> mSelectionList = {};
static std::vector<const double*> mSelectedValues = {};
static CDataHandler* mpDataHandler = nullptr;
static CDataHandler* mpLastDataHandler = nullptr;
static bool mAutoUpdateModel = true;
static int mIndent = 2;

static bool jsonHas(const ordered_json& j, const std::string& key)
{
  if (!j.contains(key))
    return false;
  const auto& v = j.at(key);
  if (v.is_null() || v.is_discarded())
    return false;
  if (v.is_object() || v.is_array() || v.is_string())
    return !v.empty();
  return true;
}

static std::string jsonError(const std::string& messages)
{
  ordered_json modelInfo;
  modelInfo["status"] = "error";
  modelInfo["messages"] = messages;
  return modelInfo.dump(mIndent);
}

static CModelElement* findElement(std::map<std::string, CModelElement>& map,
  const std::map<std::string, std::string>* idMap,
  const std::string& name)
{
  auto it = map.find(name);
  if (it == map.end() && idMap != nullptr)
  {
    auto idIt = idMap->find(name);
    if (idIt != idMap->end())
      it = map.find(idIt->second);
  }
  if (it == map.end())
    return nullptr;
  return &it->second;
}

template <typename T>
static T* getTaskPtr(const std::string& taskName)
{
  ensureModel();
  if (pDataModel == nullptr)
    return nullptr;
  auto* taskList = pDataModel->getTaskList();
  if (taskList == nullptr || taskList->getIndex(taskName) == C_INVALID_INDEX)
    return nullptr;
  return dynamic_cast<T*>(&(*taskList)[taskName]);
}

static std::vector<std::string> orderedIds(const std::vector<std::string>& order,
  const std::map<std::string, CModelElement>& map)
{
  std::vector<std::string> ids;
  ids.reserve(order.size());
  for (const auto& name : order)
  {
    auto it = map.find(name);
    ids.push_back(it != map.end() ? it->second.sbmlId : std::string());
  }
  return ids;
}

static std::vector<double> orderedValues(const std::vector<std::string>& order,
  const std::map<std::string, CModelElement>& map)
{
  std::vector<double> values;
  values.reserve(order.size());
  for (const auto& name : order)
  {
    auto it = map.find(name);
    if (it != map.end() && it->second.pValue != nullptr)
      values.push_back(*it->second.pValue);
    else
      values.push_back(std::numeric_limits<double>::quiet_NaN());
  }
  return values;
}

static CModelParameterSet* getNamedParameterSet(CModel* pModel, const std::string& name)
{
  if (pModel == nullptr)
    return nullptr;
  auto& sets = pModel->getModelParameterSets();
  auto idx = sets.getIndex(name);
  if (idx == C_INVALID_INDEX)
    return nullptr;
  return &sets[idx];
}

struct DataHandlerInterfaceGuard
{
  CDataModel* dm = nullptr;
  CDataHandler* handler = nullptr;

  DataHandlerInterfaceGuard(CDataModel* d, CDataHandler* h) : dm(d), handler(h)
  {
    if (dm != nullptr && handler != nullptr)
      dm->addInterface(handler);
  }

  ~DataHandlerInterfaceGuard()
  {
    if (dm != nullptr && handler != nullptr)
      dm->removeInterface(handler);
  }
};

void setIndent(int indent)
{
  mIndent = indent;
}

int getIndent()
{
  return mIndent;
}

ordered_json convertGroupToJson(CCopasiParameterGroup* pGroup, bool basicOnly /* = true*/)
{
  ordered_json group = ordered_json::object();
  if (pGroup == nullptr)
    return group;

  for (size_t i = 0; i < pGroup->size(); ++i)
  {
    auto* param = pGroup->getParameter(i);
    if (param == nullptr || dynamic_cast<CCopasiParameterGroup*>(param) != nullptr || !param->isEditable() || (basicOnly && !param->isBasic()))
      continue;

    auto name = param->getObjectName();
    auto type = param->getType();
    switch (type)
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
  if (pGroup == nullptr)
    return;

  for (auto& el : settings.items())
  {
    auto* param = pGroup->getParameter(el.key());
    if (param == nullptr || dynamic_cast<CCopasiParameterGroup*>(param) != nullptr)
      continue;
    if (el.value().is_null() || el.value().empty())
      continue;

    try
    {
      auto type = param->getType();
      switch (type)
      {
      case CCopasiParameter::Type::DOUBLE:
      case CCopasiParameter::Type::UDOUBLE:
        if (el.value().is_number())
          param->setValue(el.value().get<double>());
        break;
      case CCopasiParameter::Type::INT:
        if (el.value().is_number())
          param->setValue(el.value().get<int>());
        break;
      case CCopasiParameter::Type::UINT:
        if (el.value().is_number())
          param->setValue(el.value().get<unsigned C_INT32>());
        break;
      case CCopasiParameter::Type::BOOL:
        if (el.value().is_boolean())
          param->setValue(el.value().get<bool>());
        break;
      case CCopasiParameter::Type::STRING:
        if (el.value().is_string())
          param->setValue(el.value().get<std::string>());
        break;
      default:
        break;
      }
    }
    catch (const std::exception&)
    {
      continue;
    }
  }
}

int initCps()
{
  CRootContainer::init(0, nullptr);
  if (CRootContainer::getRoot() == nullptr)
    return -1;
  pDataModel = CRootContainer::addDatamodel();
  pDataModel->newModel(nullptr, true);
  return 0;
}

void destroyAPI()
{
  clearLists();

  if (pDataModel != nullptr)
    CRootContainer::removeDatamodel(pDataModel);

  pDataModel = nullptr;
  CRootContainer::destroy();
}

void clearLists()
{
  mFloatingSpecies.clear();
  mFloatingSpeciesIdMap.clear();
  mFloatingSpeciesOrder.clear();
  mBoundarySpecies.clear();
  mBoundarySpeciesIdMap.clear();
  mBoundarySpeciesOrder.clear();
  mCompartments.clear();
  mCompartmentsIdMap.clear();
  mCompartmentOrder.clear();
  mReactions.clear();
  mReactionsIdMap.clear();
  mReactionOrder.clear();
  mLocalParameters.clear();
  mLocalParameterOrder.clear();
  mGlobalParameters.clear();
  mGlobalParametersIdMap.clear();
  mGlobalParameterOrder.clear();
  mSelectionList.clear();
  mSelectedValues.clear();

  if (mpDataHandler != nullptr)
  {
    delete mpDataHandler;
    mpDataHandler = nullptr;
  }
}

std::string getVersion()
{
  const CVersion& current = CVersion::VERSION;
  return current.getVersion();
}

std::string getMessages(int start, const std::string& filter)
{
  if (CCopasiMessage::size() <= start)
    return "";

  int numMessages = CCopasiMessage::size();
  std::vector<std::string> messsages;
  for (int i = numMessages; i > start; --i)
  {
    auto msg = CCopasiMessage::getLastMessage();
    if (msg.getNumber() == 6401) // no more messages available
      break;
    auto text = msg.getText();
    if (msg.getNumber() == 8305) // never a need to see no output defined
      continue;
    if (!filter.empty() && text.find(filter) != std::string::npos)
      continue;
    if (text.empty())
      continue;
    messsages.push_back(text);
  }

  std::stringstream str;
  for (auto it = messsages.rbegin(); it != messsages.rend(); ++it)
    str << *it << std::endl;


  return str.str();
}

ordered_json convertDataHandlerToJSON(const CDataHandler& dh)
{
  auto& data = dh.getDuringData();

  ordered_json j;
  j["status"] = "success";
  j["num_variables"] = mSelectionList.size();
  j["recorded_steps"] = data.size();
  j["titles"] = mSelectionList;

  std::vector<std::vector<double>> columns;
  columns.reserve(mSelectionList.size());
  for (size_t i = 0; i < mSelectionList.size(); ++i)
  {
    std::vector<double> column;
    column.reserve(data.size());
    for (size_t j = 0; j < data.size(); ++j)
    {
      if (i < data[j].size())
        column.push_back(data[j][i]);
      else
        column.push_back(std::numeric_limits<double>::quiet_NaN());
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

void fillStream(const CTimeSeries& ts, std::stringstream& str)
{
  str << "<table>";
  str << "<thead>";

  for (int i = 0; i < ts.getNumVariables(); ++i)
  {
    str << "<th>" << ts.getTitle(i) << "</th>";
  }

  str << "</thead>";

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

void cpsFree(char* ptr)
{
  free(ptr);
}

double getValue(const std::string& nameOrId)
{
  if (auto* el = findElement(mFloatingSpecies, &mFloatingSpeciesIdMap, nameOrId))
    return el->pValue ? *el->pValue : std::numeric_limits<double>::quiet_NaN();

  if (auto* el = findElement(mBoundarySpecies, &mBoundarySpeciesIdMap, nameOrId))
    return el->pValue ? *el->pValue : std::numeric_limits<double>::quiet_NaN();

  if (auto* el = findElement(mCompartments, &mCompartmentsIdMap, nameOrId))
    return el->pValue ? *el->pValue : std::numeric_limits<double>::quiet_NaN();

  if (auto* el = findElement(mReactions, &mReactionsIdMap, nameOrId))
    return el->pValue ? *el->pValue : std::numeric_limits<double>::quiet_NaN();

  if (auto* el = findElement(mLocalParameters, nullptr, nameOrId))
    return el->pValue ? *el->pValue : std::numeric_limits<double>::quiet_NaN();

  if (auto* el = findElement(mGlobalParameters, &mGlobalParametersIdMap, nameOrId))
    return el->pValue ? *el->pValue : std::numeric_limits<double>::quiet_NaN();

  auto* ccObj = resolveMcaObject(nameOrId);
  if (ccObj)
    return *reinterpret_cast<const double*>(ccObj->getValuePointer());

  if (pDataModel)
  {
    auto* obj = const_cast<CDataObject*>(pDataModel->findObjectByDisplayName(nameOrId));
    if (!obj)
    {
      obj = const_cast<CDataObject*>(dynamic_cast<const CDataObject*>(pDataModel->getObjectFromCN(CCommonName(nameOrId))));
    }

    if (obj)
    {
      if (obj->getObjectType() == "Reference")
      {
        return *reinterpret_cast<const double*>(obj->getValuePointer());
      }

      auto* pMetab = dynamic_cast<CMetab*>(obj);
      if (pMetab)
      {
        return pMetab->getConcentration();
      }

      auto* pEntity = dynamic_cast<CModelEntity*>(obj);
      if (pEntity)
      {
        return pEntity->getValue();
      }
    }
  }

  return std::numeric_limits<double>::quiet_NaN();
}

bool setModelElement(std::map<std::string, CModelElement>& map, std::map<std::string, std::string>& idMap, const std::string& name, double value, CModel* model)
{
  auto* el = findElement(map, &idMap, name);
  if (el == nullptr)
    return false;

  CMetab* pMetab = dynamic_cast<CMetab*>(el->pObj);
  if (pMetab)
  {
    model->updateInitialValues(pMetab->getInitialConcentrationReference(), false);

    pMetab->setConcentration(value);
    pMetab->setInitialConcentration(value);
    model->updateInitialValues(pMetab->getInitialConcentrationReference(), false);

    return true;
  }

  CModelEntity* pEntity = dynamic_cast<CModelEntity*>(el->pObj);
  if (pEntity)
  {
    pEntity->setValue(value);
    pEntity->setInitialValue(value);
    std::set<const CDataObject*> changes = { pEntity->getInitialValueReference(), pEntity->getValueReference() };

    model->updateInitialValues(changes, true);
    return true;
  }

  return false;
}

static bool setInitialConcentrationByDisplayName(const std::string& name, double value, CModel* model)
{
  if (name.size() < 2 || name.compare(name.size() - 2, 2, "_0") != 0 || pDataModel == nullptr)
    return false;

  auto* obj = const_cast<CDataObject*>(pDataModel->findObjectByDisplayName(name));
  auto* set = getNamedParameterSet(model, "_initial_state_variables_only");
  if (obj == nullptr || set == nullptr)
    return false;

  auto* pGroup = const_cast<CModelParameterGroup*>(
    dynamic_cast<const CModelParameterGroup*>(set->getModelParameter("String=Initial Species Values")));
  if (pGroup == nullptr)
    return false;

  auto* pMetab = dynamic_cast<CMetab*>(obj->getObjectParent());
  if (pMetab == nullptr)
    return false;

  model->updateInitialValues(obj, false);
  pMetab->setInitialConcentration(value);
  model->updateInitialValues(obj, false);

  auto* pParam = dynamic_cast<CModelParameterSpecies*>(pGroup->getModelParameter(pMetab->getCN()));
  if (pParam)
  {
    pParam->setValue(value, CCore::Framework::Concentration, true);
    return true;
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

  if (setModelElement(mFloatingSpecies, mFloatingSpeciesIdMap, nameOrId, value, model))
    return;

  if (setModelElement(mBoundarySpecies, mBoundarySpeciesIdMap, nameOrId, value, model))
    return;

  if (setModelElement(mCompartments, mCompartmentsIdMap, nameOrId, value, model))
    return;

  if (setModelElement(mGlobalParameters, mGlobalParametersIdMap, nameOrId, value, model))
    return;

  setInitialConcentrationByDisplayName(nameOrId, value, model);
}

void setValueByName(const std::string& key, double dValue)
{
  if (!pDataModel)
    return;

  auto* model = pDataModel->getModel();
  if (!model)
    return;

  auto* obj = const_cast<CDataObject*>(pDataModel->findObjectByDisplayName(key));
  if (obj == NULL)
  {
    obj = const_cast<CDataObject*>(
      dynamic_cast<const CDataObject*>(pDataModel->getObjectFromCN(CCommonName(key))));

    if (obj == NULL)
      return;
  }


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

CDataObject* resolveSpecificMcaObject(const std::string& item, const std::string& abbrev, const std::string& arrayName, bool surroundArg1, bool surroundArg2)
{
  CDataObject* ccObj = NULL;
  if (item.find(abbrev) == 0 && item.rfind(")") == item.size() - 1)
  {
    auto pos = item.find(",");
    if (pos == std::string::npos)
      return NULL;
    auto arg1 = item.substr(abbrev.length(), pos - abbrev.length());
    if (arg1.empty())
      return NULL;
    // if the reaction name is not surrounded by ( and ) pad them
    if (surroundArg1 && arg1[0] != '(' && arg1[arg1.size() - 1] != ')')
      arg1 = "(" + arg1 + ")";
    auto arg2 = item.substr(pos + 1, item.size() - pos - 2);
    if (arg2.empty())
      return NULL;
    if (surroundArg2 && arg2[0] != '(' && arg2[arg2.size() - 1] != ')')
      arg2 = "(" + arg2 + ")";

    if (pDataModel == nullptr || pDataModel->getTaskList() == nullptr)
      return nullptr;

    auto* taskList = pDataModel->getTaskList();
    if (taskList->getIndex("Metabolic Control Analysis") == C_INVALID_INDEX)
      return nullptr;

    auto* task = dynamic_cast<CMCATask*>(&(*taskList)["Metabolic Control Analysis"]);
    auto* method = task ? dynamic_cast<CMCAMethod*>(task->getMethod()) : nullptr;

    if (method == nullptr)
      return nullptr;

    std::string cn = method->getCN() + std::string(",Array=") + arrayName + std::string("[") + arg1 + std::string("][") + arg2 + std::string("]");

    ccObj = const_cast<CDataObject*>(dynamic_cast<const CDataObject*>(pDataModel->getObject(cn)));

    if (ccObj)
    {
      std::string cn2 = ccObj->getCN();
      if (cn2 != cn)
        return NULL;
    }
  }

  return ccObj;
}

CDataObject* resolveMcaObject(const std::string& item)
{
  CDataObject* ccObj = resolveSpecificMcaObject(item, "uEE(", "Unscaled elasticities", true, false);
  if (ccObj)
  {
    return ccObj;
  }

  ccObj = resolveSpecificMcaObject(item, "EE(", "Scaled elasticities", true, false);
  if (ccObj)
  {
    return ccObj;
  }

  ccObj = resolveSpecificMcaObject(item, "uCCC(", "Unscaled concentration control coefficients", false, true);
  if (ccObj)
  {
    return ccObj;
  }

  ccObj = resolveSpecificMcaObject(item, "CCC(", "Scaled concentration control coefficients", false, true);
  if (ccObj)
  {
    return ccObj;
  }

  ccObj = resolveSpecificMcaObject(item, "uFCC(", "Unscaled flux control coefficients", true, true);
  if (ccObj)
  {
    return ccObj;
  }

  ccObj = resolveSpecificMcaObject(item, "FCC(", "Scaled flux control coefficients", true, true);
  if (ccObj)
  {
    return ccObj;
  }

  return NULL;
}

static std::string cnToDisplayName(const std::string& cn)
{
  if (!pDataModel)
    return cn;

  auto* obj = const_cast<CDataObject*>(dynamic_cast<const CDataObject*>(pDataModel->getObject(CCommonName(cn))));
  if (obj == NULL)
    return cn;

  auto isValidName = [](const std::string& name) -> bool
    {
      return !name.empty() && name.find("[not found]") == std::string::npos;
    };

  if (obj->getObjectType() == "Reference")
  {
    auto* parent = obj->getObjectParent();
    if (parent != NULL && parent->getObjectType() != "Model")
    {
      auto parentDisplayName = parent->getObjectDisplayName();
      if (isValidName(parentDisplayName))
        return parentDisplayName;
    }

    auto objectName = obj->getObjectName();
    if (isValidName(objectName))
      return objectName;
  }

  auto displayName = obj->getObjectDisplayName();
  if (isValidName(displayName))
    return displayName;

  auto objectName = obj->getObjectName();
  if (isValidName(objectName))
    return objectName;

  return cn;
}

void setSelectionList(const std::vector<std::string>& selectionList)
{
  ensureModel();

  mSelectionList = selectionList;

  if (mpDataHandler != nullptr)
    delete mpDataHandler;
  mpDataHandler = new CDataHandler();
  mSelectedValues.clear();

  std::vector<std::string> toBeRemoved;

  auto addElement = [&](CModelElement* el) -> bool
    {
      if (el == nullptr || el->pValue == nullptr)
        return false;
      mSelectedValues.push_back(el->pValue);
      mpDataHandler->addDuringName(el->cn);
      return true;
    };

  for (auto& item : mSelectionList)
  {
    if (item == "Time" || item == "time")
    {
      mSelectedValues.push_back(&pDataModel->getModel()->getValue());
      mpDataHandler->addDuringName(pDataModel->getModel()->getValueReference()->getCN());
      continue;
    }

    if (addElement(findElement(mFloatingSpecies, &mFloatingSpeciesIdMap, item)))
      continue;
    if (addElement(findElement(mBoundarySpecies, &mBoundarySpeciesIdMap, item)))
      continue;
    if (addElement(findElement(mCompartments, &mCompartmentsIdMap, item)))
      continue;
    if (addElement(findElement(mReactions, &mReactionsIdMap, item)))
      continue;
    if (addElement(findElement(mLocalParameters, nullptr, item)))
      continue;
    if (addElement(findElement(mGlobalParameters, &mGlobalParametersIdMap, item)))
      continue;

    // see if item is a CN, in which case resolve it directly
    if (item.find("CN=") == 0)
    {
      auto* obj = const_cast<CDataObject*>(dynamic_cast<const CDataObject*>(pDataModel->getObject(item)));
      std::string name = obj ? obj->getObjectName() : std::string();
      if (obj != nullptr && name.find("[not found]") == std::string::npos)
      {
        mSelectedValues.push_back(reinterpret_cast<const double*>(obj->getValuePointer()));
        mpDataHandler->addDuringName(obj->getCN());
        continue;
      }
    }

    // we still havent found it ... lets try
    // to resolve it using display names
    auto* obj = const_cast<CDataObject*>(pDataModel->findObjectByDisplayName(item));
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

    // elasticieties or control coefficients could also be in here with the
    // special notation of:
    //
    //  - uEE(ReactionName, SpeciesName)
    //  - EE(ReactionName, SpeciesName)
    //  - uCCC(SpeciesName, ReactionName)
    //  - CCC(SpeciesName, ReactionName)
    //  - uFCC(ReactionName, ReactionName)
    //  - FCC(ReactionName, ReactionName)
    //

    // lets try to resolve the special cases
    auto* ccObj = resolveMcaObject(item);
    if (ccObj)
    {
      mSelectedValues.push_back(reinterpret_cast<const double*>(ccObj->getValuePointer()));
      mpDataHandler->addDuringName(ccObj->getCN());
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

std::string expressionToString(const CExpression* expr)
{
  if (!expr)
    return std::string();

  return expressionToString(expr->getInfix());
}

std::string expressionToString(const std::string& infix)
{
  // this is a string like <CN=Root,Model=Iron Mouse Pv4 - HPX,Vector=Values[c0],Reference=InitialValue>*3.84615e-05+(<CN=Root,Model=Iron Mouse Pv4 - HPX,Vector=Values[a3],Reference=InitialValue>*<CN=Root,Model=Iron Mouse Pv4 - HPX,Reference=Initial Time>^3-<CN=Root,Model=Iron Mouse Pv4 - HPX,Vector=Values[a2],Reference=InitialValue>*<CN=Root,Model=Iron Mouse Pv4 - HPX,Reference=Initial Time>^2+<CN=Root,Model=Iron Mouse Pv4 - HPX,Vector=Values[a1],Reference=InitialValue>*<CN=Root,Model=Iron Mouse Pv4 - HPX,Reference=Initial Time>-<CN=Root,Model=Iron Mouse Pv4 - HPX,Vector=Values[a0],Reference=InitialValue>)*3.84615e-05
  // in a next step, we want to replace the CN=Root,Model=Iron Mouse Pv4 - HPX,Vector=Values[c0],Reference=InitialValue with the actual variable name
  // so first we capture the cn, then we look up the object by CN, and then we replace the CN with the object name
  // using the regex pattern: <(CN=([^\\\\>]|\\\\.)*)>

  static const std::regex cnRegex(R"(<(CN=([^\\>]|\\.)*)>)");

  std::string result;
  std::sregex_iterator it(infix.begin(), infix.end(), cnRegex);
  std::sregex_iterator end;
  size_t lastPos = 0;

  for (; it != end; ++it)
  {
    const auto& match = *it;
    result.append(infix, lastPos, static_cast<size_t>(match.position()) - lastPos);
    result += std::string("{") + cnToDisplayName(match[1].str()) + std::string("}");
    lastPos = static_cast<size_t>(match.position() + match.length());
  }

  result.append(infix, lastPos, std::string::npos);

  if (!result.empty())
    return result;

  return infix;
}

ordered_json buildModelInfo()
{
  mFloatingSpecies.clear();
  mFloatingSpeciesIdMap.clear();
  mFloatingSpeciesOrder.clear();
  mBoundarySpecies.clear();
  mBoundarySpeciesIdMap.clear();
  mBoundarySpeciesOrder.clear();
  mCompartments.clear();
  mCompartmentsIdMap.clear();
  mCompartmentOrder.clear();
  mReactions.clear();
  mReactionsIdMap.clear();
  mReactionOrder.clear();
  mLocalParameters.clear();
  mLocalParameterOrder.clear();
  mGlobalParameters.clear();
  mGlobalParametersIdMap.clear();
  mGlobalParameterOrder.clear();
  mSelectionList.clear();
  mSelectionList.push_back("Time");
  mSelectedValues.clear();

  ordered_json modelInfo;
  if (pDataModel == nullptr || pDataModel->getModel() == nullptr)
  {
    modelInfo["status"] = "error";
    modelInfo["messages"] = "No model loaded";
    return modelInfo;
  }

  auto* pModel = pDataModel->getModel();
  auto& pMetabs = pModel->getMetabolites();
  auto& pReactions = pModel->getReactions();
  auto& pCompartments = pModel->getCompartments();
  auto& pModelValues = pModel->getModelValues();
  auto& pEvents = pModel->getEvents();

  std::vector<json> species;
  for (auto& metab : pMetabs)
  {
    ordered_json m;
    m["name"] = metab.getObjectName();
    m["id"] = metab.getSBMLId();
    m["compartment"] = metab.getCompartment() ? metab.getCompartment()->getObjectName() : "";
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
        reinterpret_cast<const double*>(metab.getConcentrationRateReference()->getValuePointer()) };

    if (metab.getStatus() == CModelEntity::Status::FIXED)
    {
      mBoundarySpecies[metab.getObjectName()] = s;
      mBoundarySpeciesIdMap[metab.getSBMLId()] = metab.getObjectName();
      mBoundarySpeciesOrder.push_back(metab.getObjectName());
    }
    else
    {
      mFloatingSpecies[metab.getObjectName()] = s;
      mFloatingSpeciesIdMap[metab.getSBMLId()] = metab.getObjectName();
      mFloatingSpeciesOrder.push_back(metab.getObjectName());
      mSelectionList.push_back(metab.getObjectName());
    }

    m["initial_expression"] = expressionToString(metab.getInitialExpressionPtr());
    m["expression"] = expressionToString(metab.getExpressionPtr());

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
    c["initial_expression"] = expressionToString(compartment.getInitialExpressionPtr());
    c["expression"] = expressionToString(compartment.getExpressionPtr());
    compartments.push_back(c);

    CModelElement cp = {
        &compartment,
        compartment.getSBMLId(),
        compartment.getInitialValueReference()->getCN(),
        compartment.getValueReference()->getCN(),
        &compartment.getValue() };
    mCompartments[compartment.getObjectName()] = cp;
    mCompartmentsIdMap[compartment.getSBMLId()] = compartment.getObjectName();
    mCompartmentOrder.push_back(compartment.getObjectName());

    if (compartment.getStatus() != CModelEntity::Status::FIXED)
      mSelectionList.push_back(compartment.getObjectName());
  }
  modelInfo["compartments"] = compartments;

  std::vector<json> reactions;
  for (auto& reaction : pReactions)
  {
    ordered_json r;
    r["name"] = reaction.getObjectName();
    r["id"] = reaction.getSBMLId();
    r["reversible"] = reaction.isReversible();
    r["scheme"] = reaction.getReactionScheme();

    std::vector<json> localParameters;
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
          obj[0] ? reinterpret_cast<const double*>(obj[0]->getValuePointer()) : nullptr };
      auto displayName = obj[0]->getObjectDisplayName();
      mLocalParameters[displayName] = lp;
      mLocalParameterOrder.push_back(displayName);
    }
    r["local_parameters"] = localParameters;
    reactions.push_back(r);

    CModelElement re = {
        &reaction,
        reaction.getSBMLId(),
        reaction.getFluxReference()->getCN(),
        reaction.getFluxReference()->getCN(),
        &reaction.getFlux() };
    mReactions[reaction.getObjectName()] = re;
    mReactionsIdMap[reaction.getSBMLId()] = reaction.getObjectName();
    mReactionOrder.push_back(reaction.getObjectName());
  }
  modelInfo["reactions"] = reactions;

  // global parameters
  std::vector<json> globalParameters;
  for (auto& param : pModelValues)
  {
    ordered_json p;
    p["name"] = param.getObjectName();
    p["id"] = param.getSBMLId();
    p["value"] = param.getValue();
    p["initial_value"] = param.getInitialValue();
    p["type"] = CModelEntity::StatusName[param.getStatus()];
    p["initial_expression"] = expressionToString(param.getInitialExpressionPtr());
    p["expression"] = expressionToString(param.getExpressionPtr());
    globalParameters.push_back(p);

    CModelElement gp = {
        &param,
        param.getSBMLId(),
        param.getInitialValueReference()->getCN(),
        param.getValueReference()->getCN(),
        &param.getValue() };
    mGlobalParameters[param.getObjectName()] = gp;
    mGlobalParametersIdMap[param.getSBMLId()] = param.getObjectName();
    mGlobalParameterOrder.push_back(param.getObjectName());

    if (param.getStatus() != CModelEntity::Status::FIXED)
      mSelectionList.push_back(param.getObjectName());
  }
  modelInfo["global_parameters"] = globalParameters;

  modelInfo["events"] = ordered_json::array();
  for (auto& event : pEvents)
  {
    ordered_json e;
    e["name"] = event.getObjectName();
    e["id"] = event.getSBMLId();
    e["trigger"] = expressionToString(event.getTriggerExpressionPtr());
    e["delay"] = expressionToString(event.getDelayExpressionPtr());
    e["priority"] = expressionToString(event.getPriorityExpressionPtr());
    std::stringstream targets;
    for (auto& assignment : event.getAssignments())
    {
      if (!assignment.getTargetObject())
        continue;
      targets << assignment.getTargetObject()->getObjectName() << " = " << expressionToString(assignment.getExpressionPtr()) << "; ";
    }
    e["assignments"] = targets.str();
    modelInfo["events"].push_back(e);
  }

  modelInfo["time"] = pModel->getValue();

  modelInfo["model"]["name"] = pModel->getObjectName();
  modelInfo["model"]["notes"] = pModel->getNotes();
  modelInfo["model"]["time_unit"] = pModel->getTimeUnit();
  modelInfo["model"]["volume_unit"] = pModel->getVolumeUnit();
  modelInfo["model"]["quantity_unit"] = pModel->getQuantityUnit();
  modelInfo["model"]["area_unit"] = pModel->getAreaUnit();
  modelInfo["model"]["length_unit"] = pModel->getLengthUnit();
  modelInfo["model"]["initial_time"] = pModel->getInitialTime();
  modelInfo["model"]["avogadro"] = pModel->getAvogadro();
  modelInfo["model"]["model_type"] = pModel->getModelType() == CModel::ModelType::deterministic ? "deterministic" : "stochastic";
  modelInfo["model"]["time"] = pModel->getTime();
 
  modelInfo["status"] = "success";
  modelInfo["messages"] = getMessages(0, "No Output");

  setSelectionList(mSelectionList);

  return modelInfo;
}

std::string getModelInfo()
{
  if (pDataModel == nullptr)
    initCps();

  auto savedSelection = mSelectionList;
  auto info = buildModelInfo();
  if (!savedSelection.empty())
    setSelectionList(savedSelection);
  return info.dump(mIndent);
}

void _removeFixedElementsFromSet(CModelParameterGroup* group)
{
  if (!group)
    return;

  std::vector<CModelParameter*> toBeRemoved;
  for (auto it = group->begin(); it != group->end(); ++it)
  {
    auto* p = *it;
    if (p == NULL)
      continue;

    auto* pGroup = dynamic_cast<CModelParameterGroup*>(p);
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

  auto ensureSet = [&](const std::string& name) -> CModelParameterSet*
    {
      auto idx = sets.getIndex(name);
      if (idx != C_INVALID_INDEX)
        sets.remove(name);
      auto* set = new CModelParameterSet(name);
      sets.add(set, true);
      set->createFromModel();
      return set;
    };

  ensureSet("_initial_state");
  auto* variablesOnly = ensureSet("_initial_state_variables_only");
  _removeFixedElementsFromSet(variablesOnly);
}

std::string loadCombineArchive(const std::string& modelFile)
{
  try
  {
    destroyAPI();
    initCps();

    CCopasiMessage::clearDeque();

    if (!pDataModel->openCombineArchive(modelFile, NULL, true))
    {
      CCopasiMessage message(CCopasiMessage::ERROR, "Error loading model");
      ordered_json modelInfo;
      modelInfo["status"] = "error";
      modelInfo["messages"] = getMessages();
      return modelInfo.dump(mIndent);
    }

    loadCommon();
  }
  catch (CCopasiException& e)
  {
    ordered_json modelInfo;
    modelInfo["status"] = "error";
    modelInfo["messages"] = getMessages();
    return modelInfo.dump(mIndent);
  }
  catch (std::exception& e)
  {
    ordered_json modelInfo;
    modelInfo["status"] = "error";
    modelInfo["messages"] = e.what();
    return modelInfo.dump(mIndent);
  }

  return buildModelInfo().dump(mIndent);
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
        return modelInfo.dump(mIndent);
      }

    loadCommon();
  }
  catch (CCopasiException& e)
  {
    ordered_json modelInfo;
    modelInfo["status"] = "error";
    modelInfo["messages"] = getMessages();
    return modelInfo.dump(mIndent);
  }
  catch (std::exception& e)
  {
    ordered_json modelInfo;
    modelInfo["status"] = "error";
    modelInfo["messages"] = e.what();
    return modelInfo.dump(mIndent);
  }

  return buildModelInfo().dump(mIndent);
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
        return modelInfo.dump(mIndent);
      }

    loadCommon();
  }
  catch (CCopasiException& e)
  {
    ordered_json modelInfo;
    modelInfo["status"] = "error";
    modelInfo["messages"] = getMessages();
    return modelInfo.dump(mIndent);
  }
  catch (std::exception& e)
  {
    ordered_json modelInfo;
    modelInfo["status"] = "error";
    modelInfo["messages"] = e.what();
    return modelInfo.dump(mIndent);
  }

  return buildModelInfo().dump(mIndent);
}

void reset()
{
  if (pDataModel == nullptr)
    initCps();

  auto* pModel = pDataModel ? pDataModel->getModel() : nullptr;
  auto* set = getNamedParameterSet(pModel, "_initial_state_variables_only");
  if (set == nullptr || pModel == nullptr)
    return;
  set->updateModel();
  pModel->applyInitialValues();
}

void resetAll()
{
  if (pDataModel == nullptr)
    initCps();

  auto* pModel = pDataModel ? pDataModel->getModel() : nullptr;
  auto* set = getNamedParameterSet(pModel, "_initial_state");
  if (set == nullptr || pModel == nullptr)
    return;
  set->updateModel();
  pModel->applyInitialValues();
}

bool setMethod(const std::string& taskName, const std::string& methodName)
{
  ensureModel();

  auto& taskList = *pDataModel->getTaskList();
  if (taskList.getIndex(taskName) == C_INVALID_INDEX)
    return false;

  auto& task = (*pDataModel->getTaskList())[taskName];
  return task.setMethodType(CTaskEnum::MethodName.toEnum(methodName));
}

bool runTask(const std::string& taskName, bool useInitialValues)
{
  ensureModel();

  auto& taskList = *pDataModel->getTaskList();
  if (taskList.getIndex(taskName) == C_INVALID_INDEX)
    return false;

  auto& task = (*pDataModel->getTaskList())[taskName];
  if (!task.initialize(CCopasiTask::OUTPUT_UI, pDataModel, NULL))
    return false;

  if (!task.process(useInitialValues))
    return false;

  if (!task.restore())
    return false;

  return true;
}

std::string convertToIrreversible()
{
  ensureModel();
  auto* pModel = pDataModel->getModel();
  if (!pModel)
  {
    ordered_json modelInfo;
    modelInfo["status"] = "error";
    modelInfo["messages"] = "no model loaded";
    return modelInfo.dump(mIndent);
  }

  CCopasiMessage::clearDeque();
  bool result = pModel->convert2NonReversible();

  pModel->forceCompile(NULL);

  clearLists();
  loadCommon();

  if (!result)
  {
    ordered_json modelInfo;
    modelInfo["status"] = "error";
    modelInfo["messages"] = getMessages();
    return modelInfo.dump(mIndent);
  }

  return buildModelInfo().dump(mIndent);
}

bool setTaskSettings(const std::string& taskName, const std::string& settingsJson)
{
  ordered_json settings;
  try
  {
    settings = ordered_json::parse(settingsJson);
  }
  catch (const std::exception& e)
  {
    return false;
  }

  ensureModel();

  auto& taskList = *pDataModel->getTaskList();
  if (taskList.getIndex(taskName) == C_INVALID_INDEX)
    return false;

  auto& task = (*pDataModel->getTaskList())[taskName];
  auto* problem = task.getProblem();
  if (!problem)
    return false;

  ordered_json problemSettings = settings;
  if (jsonHas(settings, "problem"))
    problemSettings = settings["problem"];
  setGroupFromJson(problem, problemSettings);

  // Handle specific settings that may not be covered by the group
  if (auto* trajProblem = dynamic_cast<CTrajectoryProblem*>(problem))
  {
    if (jsonHas(problemSettings, "Duration"))
      trajProblem->setDuration(problemSettings["Duration"].get<double>());
    if (jsonHas(problemSettings, "StepNumber"))
      trajProblem->setStepNumber(problemSettings["StepNumber"].get<int>());
    if (jsonHas(problemSettings, "StepSize"))
      trajProblem->setStepSize(problemSettings["StepSize"].get<double>());
    if (jsonHas(problemSettings, "OutputStartTime"))
      trajProblem->setOutputStartTime(problemSettings["OutputStartTime"].get<double>());
  }

  if (jsonHas(settings, "update_model"))
    task.setUpdateModel(settings["update_model"].get<bool>());
  if (jsonHas(settings, "scheduled"))
    task.setScheduled(settings["scheduled"].get<bool>());

  if (jsonHas(settings, "method"))
  {
    auto& m = settings["method"];
    if (jsonHas(m, "name"))
      task.setMethodType(CTaskEnum::MethodName.toEnum(m["name"].get<string>()));
    auto* method = task.getMethod();
    setGroupFromJson(method, m);
  }

  return true;
}

void applyYaml(ordered_json& yaml)
{
  auto* task = getTaskPtr<CTrajectoryTask>("Time-Course");
  if (task == nullptr)
    return;

  auto* problem = dynamic_cast<CTrajectoryProblem*>(task->getProblem());

  if (jsonHas(yaml, "update_model"))
    task->setUpdateModel(yaml["update_model"].get<bool>());

  if (jsonHas(yaml, "problem") && problem != nullptr)
  {
    auto& p = yaml["problem"];
    setGroupFromJson(problem, p);

    // need to take extra care with step number / stepsize
    // as those might not be honored if set via group
    if (jsonHas(p, "Duration"))
      problem->setDuration(p["Duration"].get<double>());
    if (jsonHas(p, "StepNumber"))
      problem->setStepNumber(p["StepNumber"].get<int>());
    if (jsonHas(p, "StepSize"))
      problem->setStepSize(p["StepSize"].get<double>());
    if (jsonHas(p, "OutputStartTime"))
      problem->setOutputStartTime(p["OutputStartTime"].get<double>());
  }

  if (jsonHas(yaml, "method"))
  {
    auto& m = yaml["method"];
    if (jsonHas(m, "name"))
      task->setMethodType(CTaskEnum::MethodName.toEnum(m["name"].get<string>()));
    auto* method = task->getMethod();
    setGroupFromJson(method, m);
  }

  if (jsonHas(yaml, "initial_values"))
  {
    auto& iv = yaml["initial_values"];
    auto* model = pDataModel->getModel();
    if (model == nullptr)
      return;
    for (auto& [key, value] : iv.items())
    {
      if (!value.is_number())
        continue;
      setValueByName(key, value.get<double>());
    }
  }
}

void ensureModel()
{
  if (pDataModel == nullptr)
  {
    if (initCps() != 0)
      return;
  }

  auto* list = CRootContainer::getDatamodelList();
  if (list == nullptr || list->size() == 0)
    return;

  pDataModel = &(*list)[0];
}

std::vector<std::vector<double>> getSimulationResults2D()
{
  if (mpDataHandler != nullptr)
    return mpDataHandler->getDuringData();

  auto* task = getTaskPtr<CTrajectoryTask>("Time-Course");
  if (task == nullptr)
    return {};

  auto& ts = task->getTimeSeries();

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

std::vector<std::vector<double>> convertCEigen(const CEigen& eValues)
{
  std::vector<std::vector<double>> values;

  auto& imag = eValues.getI();
  auto& real = eValues.getR();

  for (size_t i = 0; i < imag.size(); ++i)
  {
    std::vector<double> row;
    row.push_back(real[i]);
    row.push_back(imag[i]);
    values.push_back(row);
  }

  return values;
}

std::vector<std::vector<double>> convertCArray(CArrayInterface* pArray)
{
  std::vector<std::vector<double>> values;
  if (pArray == NULL || pArray->dimensionality() != 2)
    return values;

  auto arrayDim = pArray->size();

  for (size_t i = 0; i < arrayDim[0]; ++i)
  {
    std::vector<double> row;
    for (size_t j = 0; j < arrayDim[1]; ++j)
    {
      CArrayInterface::index_type idx = { i, j };
      row.push_back((*pArray)[idx]);
    }
    values.push_back(row);
  }

  return values;
}

ordered_json convertDataArray(const CDataArray* pArray)
{
  ordered_json result;

  if (pArray == NULL)
    return result;

  switch (pArray->dimensionality())
  {
  case 1:
  {
    std::vector<std::string> rows = pArray->getAnnotationsString(0);
    std::vector<std::vector<double>> values = convertCArray(const_cast<CArrayInterface*>(pArray->getArray()));

    result["rows"] = rows;
    result["values"] = values;
    break;

  }
  case 2:
  {
    std::vector<std::string> columns = pArray->getAnnotationsString(1);
    std::vector<std::string> rows = pArray->getAnnotationsString(0);
    std::vector<std::vector<double>> values = convertCArray(const_cast<CArrayInterface*>(pArray->getArray()));

    result["columns"] = columns;
    result["rows"] = rows;
    result["values"] = values;
    break;
  }
  default:
    CCopasiMessage(CCopasiMessage::WARNING, "Data array has unsupported dimensionality: %d", pArray->dimensionality());
    break;
  }

  return result;
}

static CSteadyStateTask* getSteadyStateTask()
{
  return getTaskPtr<CSteadyStateTask>("Steady-State");
}

static CMCAMethod* getMcaMethod()
{
  auto* task = getTaskPtr<CMCATask>("Metabolic Control Analysis");
  return task ? dynamic_cast<CMCAMethod*>(task->getMethod()) : nullptr;
}

static COptProblem* getOptProblem()
{
  auto* task = getTaskPtr<COptTask>("Optimization");
  return task ? dynamic_cast<COptProblem*>(task->getProblem()) : nullptr;
}

static CFitProblem* getFitProblem()
{
  auto* task = getTaskPtr<CFitTask>("Parameter Estimation");
  return task ? dynamic_cast<CFitProblem*>(task->getProblem()) : nullptr;
}

std::string getJacobian()
{
  auto* task = getSteadyStateTask();
  if (task == nullptr)
    return convertDataArray(nullptr).dump(mIndent);

  return convertDataArray(task->getJacobianAnnotated()).dump(mIndent);
}

std::string getStoichiometryMatrix(bool reduced /*= false*/)
{
  ensureModel();
  if (pDataModel == nullptr || pDataModel->getModel() == nullptr)
    return convertDataArray(nullptr).dump(mIndent);

  auto* pMatrix = reduced ? pDataModel->getModel()->getRedStoiAnnotation() : pDataModel->getModel()->getStoiAnnotation();

  return convertDataArray(pMatrix).dump(mIndent);
}

std::string getLinkMatrix()
{
  ensureModel();
  if (pDataModel == nullptr || pDataModel->getModel() == nullptr)
    return convertDataArray(nullptr).dump(mIndent);

  return convertDataArray(pDataModel->getModel()->getLAnnotation()).dump(mIndent);
}

std::vector<std::vector<double>> getJacobian2D()
{
  auto* task = getSteadyStateTask();
  if (task == nullptr)
    return {};

  auto* pMatrix = task->getJacobianAnnotated();
  if (pMatrix == nullptr)
    return {};

  return convertCArray(pMatrix->getArray());
}

std::vector<std::vector<double>> getEigenValues2D()
{
  auto* task = getSteadyStateTask();
  if (task == nullptr)
    return {};

  return convertCEigen(task->getEigenValues());
}

std::string getJacobianReduced()
{
  auto* task = getSteadyStateTask();
  if (task == nullptr)
    return convertDataArray(nullptr).dump(mIndent);

  return convertDataArray(task->getJacobianXAnnotated()).dump(mIndent);
}

std::vector<std::vector<double>> getJacobianReduced2D()
{
  auto* task = getSteadyStateTask();
  if (task == nullptr)
    return {};

  auto* pMatrix = task->getJacobianXAnnotated();
  if (pMatrix == nullptr)
    return {};

  return convertCArray(pMatrix->getArray());
}

std::vector<std::vector<double>> getEigenValuesReduced2D()
{
  auto* task = getSteadyStateTask();
  if (task == nullptr)
    return {};

  return convertCEigen(task->getEigenValuesReduced());
}

std::string getFluxControlCoefficients(bool scaled)
{
  auto* method = getMcaMethod();
  if (method == nullptr)
    return convertDataArray(nullptr).dump(mIndent);

  auto* pMatrix = scaled ? method->getScaledFluxCCAnn() : method->getUnscaledFluxCCAnn();
  return convertDataArray(pMatrix).dump(mIndent);
}

std::vector<std::vector<double>> getFluxControlCoefficients2D(bool scaled)
{
  auto* method = getMcaMethod();
  if (method == nullptr)
    return {};

  auto* pMatrix = scaled ? method->getScaledFluxCCAnn() : method->getUnscaledFluxCCAnn();
  return pMatrix ? convertCArray(pMatrix->getArray()) : std::vector<std::vector<double>>{};
}

std::string getConcentrationControlCoefficients(bool scaled)
{
  auto* method = getMcaMethod();
  if (method == nullptr)
    return convertDataArray(nullptr).dump(mIndent);

  auto* pMatrix = scaled ? method->getScaledConcentrationCCAnn() : method->getUnscaledConcentrationCCAnn();
  return convertDataArray(pMatrix).dump(mIndent);
}

std::vector<std::vector<double>> getConcentrationControlCoefficients2D(bool scaled)
{
  auto* method = getMcaMethod();
  if (method == nullptr)
    return {};

  auto* pMatrix = scaled ? method->getScaledConcentrationCCAnn() : method->getUnscaledConcentrationCCAnn();
  return pMatrix ? convertCArray(pMatrix->getArray()) : std::vector<std::vector<double>>{};
}

std::string getElasticities(bool scaled)
{
  auto* method = getMcaMethod();
  if (method == nullptr)
    return convertDataArray(nullptr).dump(mIndent);

  auto* pMatrix = scaled ? method->getScaledElasticitiesAnn() : method->getUnscaledElasticitiesAnn();
  return convertDataArray(pMatrix).dump(mIndent);
}

std::vector<std::vector<double>> getElasticities2D(bool scaled)
{
  auto* method = getMcaMethod();
  if (method == nullptr)
    return {};

  auto* pMatrix = scaled ? method->getScaledElasticitiesAnn() : method->getUnscaledElasticitiesAnn();
  return pMatrix ? convertCArray(pMatrix->getArray()) : std::vector<std::vector<double>>{};
}

double steadyState(bool stabilityAnalysis, bool forceUpdateModel)
{
  auto* task = getSteadyStateTask();
  if (task == nullptr)
    return std::numeric_limits<double>::quiet_NaN();

  if (forceUpdateModel)
    task->setUpdateModel(forceUpdateModel);

  auto* problem = dynamic_cast<CSteadyStateProblem*>(task->getProblem());
  if (problem == nullptr)
    return std::numeric_limits<double>::quiet_NaN();
  problem->setStabilityAnalysisRequested(stabilityAnalysis);

  if (!task->initialize(CCopasiTask::OUTPUT_UI, pDataModel, nullptr))
    return std::numeric_limits<double>::quiet_NaN();

  if (!task->process(false))
    return std::numeric_limits<double>::quiet_NaN();

  if (!task->restore())
    return std::numeric_limits<double>::quiet_NaN();

  auto* method = dynamic_cast<CSteadyStateMethod*>(task->getMethod());
  if (method == nullptr)
    return std::numeric_limits<double>::quiet_NaN();
  auto log = method->getMethodLog();

  auto pos = log.rfind("Rate: ");
  if (pos == std::string::npos)
    return std::numeric_limits<double>::quiet_NaN();
  pos += 6;
  auto end = log.find("\n", pos);
  if (end == std::string::npos)
    return std::numeric_limits<double>::quiet_NaN();
  auto rate = log.substr(pos, end - pos);
  try
  {
    return std::stod(rate);
  }
  catch (const std::exception&)
  {
    return std::numeric_limits<double>::quiet_NaN();
  }
}

std::string getSteadyStateStatus()
{
  auto* task = getSteadyStateTask();
  if (task == nullptr)
    return "A steady state with given resolution couldn't be found.";

  auto& result = task->getResult();

  if (result == CSteadyStateMethod::found)
    return "A steady state with given resolution was found.";
  else if (result == CSteadyStateMethod::notFound)
    return "No steady state with given resolution was found!";
  else if (result == CSteadyStateMethod::foundEquilibrium)
    return "An equilibrium steady state (zero fluxes) was found.";
  else if (result == CSteadyStateMethod::foundNegative)
    return "An invalid steady state (negative concentrations) was found.";
  else
    return "A steady state with given resolution couldn't be found.";
}

std::string getStabilityAnalysis()
{
  auto* task = getSteadyStateTask();
  if (task == nullptr)
    return "";

  std::stringstream ss;
  ss << task->getEigenValuesReduced();
  return ss.str();
}

std::string getSteadyStateProtocol()
{
  auto* task = getSteadyStateTask();
  if (task == nullptr)
    return "No steady state method available.";

  auto pMethod = dynamic_cast<CSteadyStateMethod*>(task->getMethod());
  if (!pMethod)
    return "No steady state method available.";

  return pMethod->getMethodLog();
}

bool computeMca(bool performSteadyState, bool updateModel)
{
  auto* task = getTaskPtr<CMCATask>("Metabolic Control Analysis");
  if (task == nullptr)
    return false;

  task->setUpdateModel(updateModel);

  auto* problem = dynamic_cast<CMCAProblem*>(task->getProblem());
  if (problem == nullptr)
    return false;
  problem->setSteadyStateRequested(performSteadyState);

  if (!task->initialize(CCopasiTask::OUTPUT_UI, pDataModel, nullptr))
    return false;

  if (!task->process(false))
    return false;

  if (!task->restore())
    return false;

  return true;
}

std::string getMcaProtocol()
{
  std::stringstream str;
  auto* task = getTaskPtr<CMCATask>("Metabolic Control Analysis");
  if (!task)
    return std::string();

  task->printResult(&str);
  return str.str();
}

std::string getMcaSettings()
{
  auto* task = getTaskPtr<CMCATask>("Metabolic Control Analysis");
  if (!task)
    return std::string();

  auto* pProblem = dynamic_cast<CMCAProblem*>(task->getProblem());
  if (!pProblem)
    return std::string();

  ordered_json yaml;

  yaml["update_model"] = task->isUpdateModel();
  yaml["scheduled"] = task->isScheduled();
  yaml["steady_state_requested"] = pProblem->isSteadyStateRequested();

  yaml["problem"] = convertGroupToJson(pProblem);

  auto* method = task->getMethod();
  if (method != nullptr)
  {
    yaml["method"] = convertGroupToJson(method);
    yaml["method"]["name"] = method->getObjectName();
  }

  if (pProblem->isSteadyStateRequested())
  {
    auto *pSteadyState = getTaskPtr<CSteadyStateTask>("Steady-State");
    auto methodObj = convertGroupToJson(pSteadyState->getMethod());

    // add properties from methodObj to yaml["method"] if they are not already present
    for (auto& [key, value] : methodObj.items())
    {
      if (!yaml["method"].contains(key))
      {
        yaml["method"][key] = value;
      }
    }
  }

  return yaml.dump(mIndent);
}

bool setMcaSettings(const std::string& settingsJson)
{
  auto* task = getTaskPtr<CMCATask>("Metabolic Control Analysis");
  if (!task)
    return false;

  auto* pProblem = dynamic_cast<CMCAProblem*>(task->getProblem());
  if (!pProblem)
    return false;

  ordered_json settings;
  try
  {
    settings = ordered_json::parse(settingsJson);
  }
  catch (const std::exception& e)
  {
    return false;
  }

  if (jsonHas(settings, "update_model"))
    task->setUpdateModel(settings["update_model"].get<bool>());

  if (jsonHas(settings, "scheduled"))
    task->setScheduled(settings["scheduled"].get<bool>());

  if (jsonHas(settings, "steady_state_requested"))
    pProblem->setSteadyStateRequested(settings["steady_state_requested"].get<bool>());

  ordered_json problemSettings = settings;
  if (jsonHas(settings, "problem"))
    problemSettings = settings["problem"];
  setGroupFromJson(pProblem, problemSettings);

  if (pProblem->isSteadyStateRequested())
  {
    auto *pSteadyState = getTaskPtr<CSteadyStateTask>("Steady-State");
    auto* method = pSteadyState->getMethod();
    if (method != nullptr && jsonHas(settings, "method"))
    {
      auto& m = settings["method"];
      setGroupFromJson(method, m);
    }
  }
  return true;
}

std::string getLNASettings()
{
  auto* task = getTaskPtr<CLNATask>("Linear Noise Approximation");
  if (!task)
    return std::string();

  auto* pProblem = dynamic_cast<CLNAProblem*>(task->getProblem());
  if (!pProblem)
    return std::string();

  ordered_json yaml;

  yaml["update_model"] = task->isUpdateModel();
  yaml["scheduled"] = task->isScheduled();
  yaml["steady_state_requested"] = pProblem->isSteadyStateRequested();

  yaml["problem"] = convertGroupToJson(pProblem);

  auto* method = task->getMethod();
  if (method != nullptr)
  {
    yaml["method"] = convertGroupToJson(method);
    yaml["method"]["name"] = method->getObjectName();
  }

  if (pProblem->isSteadyStateRequested())
  {
    auto* pSteadyState = getTaskPtr<CSteadyStateTask>("Steady-State");
    auto methodObj = convertGroupToJson(pSteadyState->getMethod());

    // add properties from methodObj to yaml["method"] if they are not already present
    for (auto& [key, value] : methodObj.items())
    {
      if (!yaml["method"].contains(key))
      {
        yaml["method"][key] = value;
      }
    }
  }

  return yaml.dump(mIndent);
}

bool setLNASettings(const std::string& settingsJson)
{
  auto* task = getTaskPtr<CLNATask>("Linear Noise Approximation");
  if (!task)
    return false;

  auto* pProblem = dynamic_cast<CLNAProblem*>(task->getProblem());
  if (!pProblem)
    return false;

  ordered_json settings;
  try
  {
    settings = ordered_json::parse(settingsJson);
  }
  catch (const std::exception& e)
  {
    return false;
  }

  if (jsonHas(settings, "update_model"))
    task->setUpdateModel(settings["update_model"].get<bool>());

  if (jsonHas(settings, "scheduled"))
    task->setScheduled(settings["scheduled"].get<bool>());

  if (jsonHas(settings, "steady_state_requested"))
    pProblem->setSteadyStateRequested(settings["steady_state_requested"].get<bool>());

  ordered_json problemSettings = settings;
  if (jsonHas(settings, "problem"))
    problemSettings = settings["problem"];
  setGroupFromJson(pProblem, problemSettings);

  if (pProblem->isSteadyStateRequested())
  {
    auto* pSteadyState = getTaskPtr<CSteadyStateTask>("Steady-State");
    auto* method = pSteadyState->getMethod();
    if (method != nullptr && jsonHas(settings, "method"))
    {
      auto& m = settings["method"];
      setGroupFromJson(method, m);
    }
  }
  return true;
}

static std::string buildLNAStatusMessage(CSteadyStateMethod::ReturnCode status, CLNAMethod::EVStatus eStatus)
{
  if (status == CSteadyStateMethod::found && eStatus == CLNAMethod::allNeg)
    return "Steady State found.";
  if (status == CSteadyStateMethod::foundEquilibrium && eStatus == CLNAMethod::allNeg)
    return "Equilibrium steady state.";
  if (status == CSteadyStateMethod::foundNegative)
    return "Invalid steady state (negative concentrations). No LNA calculated!";
  if (status == CSteadyStateMethod::notFound)
    return "No steady state found. No LNA calculated!";
  if (eStatus == CLNAMethod::nonNegEigenvaluesExist)
    return "The reduced system has non-negative Eigen values! No LNA calculated!";

  return "Unknown LNA status.";
}

bool runLNA(bool useInitialValues)
{
  auto* task = getTaskPtr<CLNATask>("Linear Noise Approximation");
  if (task == nullptr)
    return false;

  if (!task->initialize(CCopasiTask::OUTPUT_UI, pDataModel, nullptr))
    return false;

  if (!task->process(useInitialValues))
    return false;

  if (!task->restore(true))
    return false;

  return true;
}

std::string getLNAResults(bool scaled)
{
  auto* task = getTaskPtr<CLNATask>("Linear Noise Approximation");
  auto* method = task ? dynamic_cast<CLNAMethod*>(task->getMethod()) : nullptr;

  ordered_json result;

  if (method == nullptr)
  {
    result["status"] = "LNA method not available.";
    return result.dump(mIndent);
  }

  result["status"] = buildLNAStatusMessage(method->getSteadyStateStatus(), method->getEigenValueStatus());
  result["covariance_matrix"] = convertDataArray(scaled ? method->getScaledCovarianceMatrixAnn() : method->getUnscaledCovarianceMatrixAnn());
  result["reduced_covariance_matrix"] = convertDataArray(scaled ? method->getScaledCovarianceMatrixReducedAnn() : method->getUnscaledCovarianceMatrixReducedAnn());
  result["reduced_b_matrix"] = convertDataArray(scaled ? method->getScaledBMatrixReducedAnn() : method->getUnscaledBMatrixReducedAnn());

  return result.dump(mIndent);
}

static double optBoundToDouble(const CRegisteredCommonName& bound)
{
  try
  {
    return std::stod(std::string(bound));
  }
  catch (...)
  {
    return std::numeric_limits<double>::quiet_NaN();
  }
}

static ordered_json getAffectedExperimentNames(const CFitItem* fitItem);

bool runOptimization(bool useInitialValues)
{
  ensureModel();
  if (pDataModel == nullptr || pDataModel->getModel() == nullptr)
    return false;

  pDataModel->getModel()->compileIfNecessary(nullptr);

  auto* task = getTaskPtr<COptTask>("Optimization");
  if (task == nullptr)
    return false;

  if (!task->initialize(CCopasiTask::OUTPUT_UI, pDataModel, nullptr))
    return false;

  if (!task->process(useInitialValues))
    return false;

  if (!task->restore(true))
    return false;

  return true;
}

void addItemsToArray(ordered_json& result, const std::vector<COptItem*>& items)
{
  for (const auto* item : items)
  {
    if (item == NULL)
      continue;

    const CDataObject* obj = dynamic_cast<const CDataObject*>(
      pDataModel->getObject(CCommonName(item->getObjectCN())));
    if (obj == NULL)
      continue;

    const CDataObject* parent = obj->getObjectParent();
    std::string name = parent != NULL ? parent->getObjectDisplayName() : obj->getObjectDisplayName();

    ordered_json entry;
    entry["lower"] = optBoundToDouble(item->getLowerBound());
    entry["upper"] = optBoundToDouble(item->getUpperBound());
    entry["start"] = item->getStartValue();
    entry["name"] = name;
    entry["object_cn"] = item->getObjectCN();

    auto* fitItem = dynamic_cast<const CFitItem*>(item);
    if (fitItem != NULL)
      entry["affected"] = getAffectedExperimentNames(fitItem);

    result.push_back(entry);
  }
}

std::string getOptItems()
{
  auto* problem = getOptProblem();

  ordered_json result = ordered_json::array();

  if (problem == nullptr)
    return result.dump(mIndent);

  const auto& items = problem->getOptItemList(false);
  addItemsToArray(result, items);

  return result.dump(mIndent);
}

std::string getOptSolution()
{
  auto* problem = getOptProblem();

  ordered_json result = ordered_json::array();

  if (problem == nullptr)
    return result.dump(mIndent);

  const auto& solution = problem->getSolutionVariables(false);
  const auto& grad = problem->getVariableGradients();

  const auto& items = problem->getOptItemList(false);

  if (solution.size() != items.size())
    return result.dump(mIndent);

  for (size_t i = 0; i < solution.size(); ++i)
  {
    auto* item = items[i];
    if (item == NULL)
      continue;

    const CDataObject* obj = dynamic_cast<const CDataObject*>(
      pDataModel->getObject(CCommonName(item->getObjectCN())));
    if (obj == NULL)
      continue;

    const CDataObject* parent = obj->getObjectParent();
    std::string name = parent != NULL ? parent->getObjectDisplayName() : obj->getObjectDisplayName();

    ordered_json entry;
    entry["name"] = name;
    entry["lower"] = optBoundToDouble(item->getLowerBound());
    entry["upper"] = optBoundToDouble(item->getUpperBound());
    entry["start"] = item->getLastStartValue();
    entry["sol"] = solution[i];
    entry["gradient"] = grad.size() > i ? grad[i] : std::numeric_limits<double>::quiet_NaN();
    result.push_back(entry);
  }

  return result.dump(mIndent);
}

std::string getOptStatistic()
{
  auto* problem = getOptProblem();

  ordered_json result;

  if (problem == nullptr)
    return result.dump(mIndent);

  result["obj"] = problem->getSolutionValue();
  unsigned C_INT32 f_evals = problem->getFunctionEvaluations();
  double cpu_time = problem->getExecutionTime();
  result["f_evals"] = f_evals;
  result["failed_evals_exception"] = problem->getFailedEvaluationsExc();
  result["failed_evals_nan"] = problem->getFailedEvaluationsNaN();
  result["constraint_evals"] = problem->getConstraintEvaluations();
  result["failed_constraint_evals"] = problem->geFailedConstraintCounter();
  result["cpu_time"] = cpu_time;

  if (f_evals == 0 || cpu_time == 0.0)
    result["evals_per_sec"] = 0.0;
  else
    result["evals_per_sec"] = f_evals / cpu_time;

  return result.dump(mIndent);
}

static ordered_json getAffectedExperimentNames(const CFitItem* fitItem)
{
  ordered_json affected = ordered_json::array();
  if (fitItem == NULL)
    return affected;

  auto* keyFactory = CRootContainer::getKeyFactory();
  for (size_t j = 0; j < fitItem->getExperimentCount(); ++j)
  {
    auto* obj = keyFactory != NULL ? keyFactory->get(fitItem->getExperiment(j)) : NULL;
    if (obj != NULL)
      affected.push_back(obj->getObjectName());
  }
  return affected;
}

bool runParameterEstimation(bool useInitialValues)
{
  ensureModel();
  if (pDataModel == nullptr || pDataModel->getModel() == nullptr)
    return false;

  pDataModel->getModel()->compileIfNecessary(nullptr);

  auto* task = getTaskPtr<CFitTask>("Parameter Estimation");
  auto* problem = task ? dynamic_cast<CFitProblem*>(task->getProblem()) : nullptr;

  if (!task->initialize(CCopasiTask::OUTPUT_UI, pDataModel, nullptr))
    return false;

  if (!task->process(useInitialValues))
    return false;

  if (!task->restore(true))
    return false;

  return true;
}

std::string getFitSolution()
{
  auto* problem = getFitProblem();

  ordered_json result = ordered_json::array();

  if (problem == nullptr)
    return result.dump(mIndent);

  const auto& solution = problem->getSolutionVariables(false);
  const auto& gradients = problem->getVariableGradients();
  const auto& stddev = problem->getVariableStdDeviations();
  const auto& items = problem->getOptItemList(false);

  if (solution.size() != items.size())
    return result.dump(mIndent);

  for (size_t i = 0; i < solution.size(); ++i)
  {
    auto* item = items[i];
    if (item == NULL)
      continue;

    const CDataObject* obj = dynamic_cast<const CDataObject*>(
      pDataModel->getObject(CCommonName(item->getObjectCN())));
    if (obj == NULL)
      continue;

    const CDataObject* parent = obj->getObjectParent();
    std::string name = parent != NULL ? parent->getObjectDisplayName() : obj->getObjectDisplayName();

    ordered_json entry;
    entry["name"] = name;
    entry["lower"] = optBoundToDouble(item->getLowerBound());
    entry["upper"] = optBoundToDouble(item->getUpperBound());
    entry["sol"] = solution[i];
    entry["start"] = item->getLastStartValue();
    entry["affected"] = getAffectedExperimentNames(dynamic_cast<CFitItem*>(item));
    entry["gradient"] = gradients.size() > i ? gradients[i] : std::numeric_limits < double>::quiet_NaN();
    entry["stddev"] = stddev.size() > i ? stddev[i] : std::numeric_limits < double>::quiet_NaN();
    result.push_back(entry);
  }

  return result.dump(mIndent);
}

std::string getFim()
{
  auto* problem = getFitProblem();

  ordered_json result;

  if (problem == nullptr)
    return result.dump(mIndent);

  result["fim"] = convertDataArray(&problem->getFisherInformation()); 
  result["fim_eigenvalues"] = convertDataArray(&problem->getFisherInformationEigenvalues());
  result["fim_eigenvectors"] = convertDataArray(&problem->getFisherInformationEigenvectors());

  result["scaled_fim"] = convertDataArray(&problem->getScaledFisherInformation());
  result["scaled_fim_eigenvalues"] = convertDataArray(&problem->getScaledFisherInformationEigenvalues());
  result["scaled_fim_eigenvectors"] = convertDataArray(&problem->getScaledFisherInformationEigenvectors());

  return result.dump(mIndent);
}

std::string getFitItems()
{
  auto* problem = getFitProblem();

  ordered_json result = ordered_json::array();

  if (problem == nullptr)
    return result.dump(mIndent);

  const auto& items = problem->getOptItemList(false);
  addItemsToArray(result, items);

  return result.dump(mIndent);
}

std::string getFitStatistic()
{
  auto* problem = getFitProblem();

  ordered_json result;

  if (problem == nullptr)
    return result.dump(mIndent);

  auto& experiments = problem->getExperimentSet();
  unsigned C_INT32 f_evals = problem->getFunctionEvaluations();
  double cpu_time = problem->getExecutionTime();

  result["obj"] = problem->getSolutionValue();
  result["rms"] = problem->getRMS();
  result["sd"] = problem->getStdDeviation();
  result["f_evals"] = f_evals;
  result["failed_evals_exception"] = problem->getFailedEvaluationsExc();
  result["failed_evals_nan"] = problem->getFailedEvaluationsNaN();
  result["constraint_evals"] = problem->getConstraintEvaluations();
  result["failed_constraint_evals"] = problem->geFailedConstraintCounter();
  result["cpu_time"] = cpu_time;
  result["data_points"] = experiments.getDataPointCount();
  result["valid_data_points"] = experiments.getValidValueCount();

  if (f_evals == 0 || cpu_time == 0.0)
    result["evals_per_sec"] = 0.0;
  else
    result["evals_per_sec"] = f_evals / cpu_time;

  return result.dump(mIndent);
}

std::string getCorrelationMatrix()
{
  auto* problem = getFitProblem();

  ordered_json result;

  if (problem == nullptr)
    return result.dump(mIndent);

  return convertDataArray(&problem->getCorrelations()).dump(mIndent);
}

std::string getSimulationResults()
{
  auto* task = getTaskPtr<CTrajectoryTask>("Time-Course");
  if (task == nullptr)
  {
    ordered_json j;
    j["status"] = "success";
    j["num_variables"] = 0;
    j["recorded_steps"] = 0;
    j["titles"] = std::vector<std::string>{};
    j["columns"] = std::vector<std::vector<double>>{};
    return j.dump(mIndent);
  }

  return convertTimeSeriesToJSON(task->getTimeSeries()).dump(mIndent);
}

std::string simulateJSON(ordered_json& yaml)
{
  try
  {
    ensureModel();

    CCopasiMessage::clearDeque();

    auto* task = getTaskPtr<CTrajectoryTask>("Time-Course");
    if (task == nullptr)
      return jsonError("Time-Course task not available.");

    if (mAutoUpdateModel)
      task->setUpdateModel(true);

    auto* problem = dynamic_cast<CTrajectoryProblem*>(task->getProblem());

    applyYaml(yaml);
    if (problem != nullptr)
      problem->setTimeSeriesRequested(true);

    size_t pos = CCopasiMessage::size();

    setSelectionList(mSelectionList);

    DataHandlerInterfaceGuard handlerGuard(pDataModel, mpDataHandler);

    if (!task->initialize(CCopasiTask::OUTPUT_UI, pDataModel, nullptr))
      return jsonError(getMessages(pos, "No Output"));

    if (!task->process(true))
      return jsonError(getMessages(pos, "No Output"));

    if (!task->restore())
      return jsonError(getMessages(pos, "No Output"));

    if (mpDataHandler)
      return convertDataHandlerToJSON(*mpDataHandler).dump(mIndent);

    return convertTimeSeriesToJSON(task->getTimeSeries()).dump(mIndent);
  }
  catch (CCopasiException& e)
  {
    return jsonError(getMessages(0, "No Output"));
  }
  catch (std::exception& e)
  {
    return jsonError(e.what());
  }
}

std::string getTimeCourseSettings()
{
  ordered_json yaml;
  auto* task = getTaskPtr<CTrajectoryTask>("Time-Course");
  if (task == nullptr)
    return yaml.dump(mIndent);

  auto* problem = dynamic_cast<CTrajectoryProblem*>(task->getProblem());
  if (problem != nullptr)
    yaml["problem"] = convertGroupToJson(problem);

  auto* method = task->getMethod();
  if (method != nullptr)
  {
    yaml["method"] = convertGroupToJson(method);
    yaml["method"]["name"] = method->getObjectName();
  }
  return yaml.dump(mIndent);
}

std::string getOptSettings()
{
  auto* task = getTaskPtr<COptTask>("Optimization");
  auto* problem = task ? dynamic_cast<COptProblem*>(task->getProblem()) : nullptr;
  if (!task || !problem)
    return "";

  ordered_json yaml;

  yaml["update_model"] = task->isUpdateModel();
  yaml["scheduled"] = task->isScheduled();

  yaml["problem"] = convertGroupToJson(problem);

  auto* method = task->getMethod();
  if (method != nullptr)
  {
    yaml["method"] = convertGroupToJson(method);
    yaml["method"]["name"] = method->getObjectName();
  }

  yaml["objective"] = expressionToString(problem->getObjectiveFunction());
  yaml["subtask"] = CTaskEnum::TaskName[problem->getSubtaskType()];
  yaml["maximize"] = problem->maximize();

  auto& optItems = problem->getOptItemList(false);
  ordered_json items = ordered_json::array();
  addItemsToArray(items, optItems);
  yaml["items"] = items;

  auto& optConstraints = problem->getConstraintList();
  ordered_json constraints = ordered_json::array();
  addItemsToArray(constraints, optConstraints);
  yaml["constraints"] = constraints;

  return yaml.dump(mIndent);
}

std::string getFitSettings()
{
  auto* task = getTaskPtr<CFitTask>("Parameter Estimation");
  auto* problem = task ? dynamic_cast<CFitProblem*>(task->getProblem()) : nullptr;
  if (!task || !problem)
    return "";

  ordered_json yaml;

  yaml["update_model"] = task->isUpdateModel();
  yaml["scheduled"] = task->isScheduled();

  yaml["problem"] = convertGroupToJson(problem);

  auto* method = task->getMethod();
  if (method != nullptr)
  {
    yaml["method"] = convertGroupToJson(method);
    yaml["method"]["name"] = method->getObjectName();
  }

  auto& optItems = problem->getOptItemList(false);
  ordered_json items = ordered_json::array();
  addItemsToArray(items, optItems);
  yaml["items"] = items;

  auto& optConstraints = problem->getConstraintList();
  ordered_json constraints = ordered_json::array();
  addItemsToArray(constraints, optConstraints);
  yaml["constraints"] = constraints;

  return yaml.dump(mIndent);
}

nlohmann::ordered_json _getExperimentDefinition(const CExperiment* exp)
{
  ordered_json yaml;
  if (!exp)
    return yaml;

  yaml["name"] = exp->getObjectName();
  yaml["filename"] = exp->getFileName();
  yaml["type"] = CTaskEnum::TaskName[exp->getExperimentType()];
  yaml["separator"] = exp->getSeparator();
  yaml["first_row"] = exp->getFirstRow();
  yaml["last_row"] = exp->getLastRow();
  yaml["num_rows"] = exp->getNumDataRows();
  yaml["num_cols"] = exp->getNumColumns();
  yaml["weight_method"] = CExperiment::WeightMethodName[exp->getWeightMethod()];
  yaml["normalize_per_experiment"] = exp->getNormalizeWeightsPerExperiment();

  // add mapping
  auto& objMap = exp->getObjectMap();
  std::vector<std::string> dependentCns;
  std::vector<std::string> independentCns;
  std::string timeCn;
  for (int i = 0; i < objMap.size(); ++i)
  {
    ordered_json mapping;
    mapping["object_cn"] = objMap.getObjectCN(i);
    mapping["role"] = CExperiment::TypeName[objMap.getRole(i)];
    if (objMap.getRole(i) == CExperiment::Type::dependent)
      dependentCns.push_back(objMap.getObjectCN(i));
    else if (objMap.getRole(i) == CExperiment::Type::independent)
      independentCns.push_back(objMap.getObjectCN(i));
    else if (objMap.getRole(i) == CExperiment::Type::time)
    {
      timeCn = pDataModel->getModel()->getValueReference()->getCN();
      mapping["object_cn"] = timeCn;
    }
    mapping["name"] = objMap.getName(i);
    mapping["scale"] = objMap.getScale(i);
    mapping["default_scale"] = objMap.getDefaultScale(i);
    yaml["mapping"].push_back(mapping);
  }

  // columns
  std::vector<std::string> columns;
  if (!timeCn.empty())
    columns.push_back(timeCn);

  for (const auto& cn : dependentCns)
    columns.push_back(cn);

  for (const auto& cn : independentCns)
    columns.push_back(cn);

  yaml["columns"] = columns;

  return yaml;
}

nlohmann::ordered_json _getExperimentDefinition(const std::string& experimentName)
{
  ensureModel();

  ordered_json yaml;
  auto* task = getTaskPtr<CFitTask>("Parameter Estimation");
  auto* problem = task ? dynamic_cast<CFitProblem*>(task->getProblem()) : nullptr;
  if (!task || !problem)
    return yaml;

  auto& expSet = problem->getExperimentSet();
  auto index = expSet.getIndex(experimentName);
  if (index == C_INVALID_INDEX)
    return yaml;

  return _getExperimentDefinition(expSet.getExperiment(index));
}

std::vector<std::string> getExperimentNames()
{
  ensureModel();
  std::vector<std::string> names;
  auto* task = getTaskPtr<CFitTask>("Parameter Estimation");
  auto* problem = task ? dynamic_cast<CFitProblem*>(task->getProblem()) : nullptr;
  if (!task || !problem)
    return names;

  auto& expSet = problem->getExperimentSet();
  for (size_t i = 0; i < expSet.size(); ++i)
  {
    names.push_back(expSet.getExperiment(i)->getObjectName());
  }
  return names;
}

std::string getExperimentDefinition(const std::string& experimentName)
{
  return _getExperimentDefinition(experimentName).dump(mIndent);
}

std::string getExperimentDefinitions()
{
  ensureModel();
  ordered_json yaml = ordered_json::array();
  auto* task = getTaskPtr<CFitTask>("Parameter Estimation");
  auto* problem = task ? dynamic_cast<CFitProblem*>(task->getProblem()) : nullptr;
  if (!task || !problem)
    return yaml.dump(mIndent);

  auto& expSet = problem->getExperimentSet();
  for (size_t i = 0; i < expSet.size(); ++i)
  {
    yaml.push_back(_getExperimentDefinition(expSet.getExperiment(i)));
  }
  return yaml.dump(mIndent);
}

std::vector<std::vector<double>> getExperimentData(const std::string& experimentName, bool includeIndependent/* = true*/)
{
  ensureModel();
  std::vector<std::vector<double>> data;
  auto* task = getTaskPtr<CFitTask>("Parameter Estimation");
  auto* problem = task ? dynamic_cast<CFitProblem*>(task->getProblem()) : nullptr;
  if (!task || !problem)
    return data;

  auto& expSet = problem->getExperimentSet();
  auto index = expSet.getIndex(experimentName);
  if (index == C_INVALID_INDEX)
    return data;

  auto* exp = expSet.getExperiment(index);
  if (!exp)
    return data;

  auto& timeData = exp->getTimeData();
  auto& dependentData = exp->getDependentData();
  auto& independentData = exp->getIndependentData();

  for (int i = 0; i < dependentData.numRows(); ++i)
  {
    std::vector<double> row;
    row.push_back(timeData[i]);
    for (int j = 0; j < dependentData.numCols(); ++j)
    {
      row.push_back(dependentData(i, j));
    }
    if (includeIndependent)
      for (int j = 0; j < independentData.numCols(); ++j)
      {
        row.push_back(independentData(i, j));
      }
    data.push_back(row);
  }

  return data;
}

bool setExperimentData(const std::string& experimentName,
  const std::string& fileName,
  const std::vector<std::vector<double>>& data)
{
  ensureModel();
  auto* task = getTaskPtr<CFitTask>("Parameter Estimation");
  auto* problem = task ? dynamic_cast<CFitProblem*>(task->getProblem()) : nullptr;
  if (!task || !problem)
    return false;

  auto& expSet = problem->getExperimentSet();
  auto index = expSet.getIndex(experimentName);
  if (index == C_INVALID_INDEX)
    return false;

  auto* exp = expSet.getExperiment(index);
  if (!exp)
    return false;

  // write data to file using the separator defined in the experiment

  std::ofstream file(fileName);
  if (!file.is_open())
    return false;

  for (const auto& row : data)
  {
    for (size_t i = 0; i < row.size(); ++i)
    {
      file << row[i];
      if (i < row.size() - 1)
        file << exp->getSeparator();
    }
    file << std::endl;
  }
  file.close();

  exp->setFileName(fileName);
  exp->setFirstRow(1);
  exp->setLastRow(data.size());

  return true;
}

bool setExperimentFilename(const std::string& experimentName, const std::string& fileName)
{
  ensureModel();

  // check that the file exists
  if (!CDirEntry::exist(fileName))
    return false;

  auto* task = getTaskPtr<CFitTask>("Parameter Estimation");
  auto* problem = task ? dynamic_cast<CFitProblem*>(task->getProblem()) : nullptr;
  if (!task || !problem)
    return false;

  auto& expSet = problem->getExperimentSet();
  auto index = expSet.getIndex(experimentName);
  if (index == C_INVALID_INDEX)
    return false;

  auto* exp = expSet.getExperiment(index);
  if (!exp)
    return false;

  exp->setFileName(fileName);

  expSet.compile(&(pDataModel->getModel()->getMathContainer()));

  return true;
}

CExperiment::WeightMethod _getExperimentWeightType(const std::string& weightMethodName)
{
  int count = 0;
  while (!CExperiment::WeightMethodName[count++].empty())
    if (CExperiment::WeightMethodName[count] == weightMethodName)
      return (CExperiment::WeightMethod)count;
  return CExperiment::WeightMethod::MEAN;
}

bool setExperimentDefinition(const std::string& experimentName, const std::string& definition)
{
  ensureModel();

  auto* task = getTaskPtr<CFitTask>("Parameter Estimation");
  auto* problem = task ? dynamic_cast<CFitProblem*>(task->getProblem()) : nullptr;
  if (!task || !problem)
    return false;

  auto& expSet = problem->getExperimentSet();
  auto index = expSet.getIndex(experimentName);
  if (index == C_INVALID_INDEX)
    return false;

  auto* exp = expSet.getExperiment(index);

  try
  {
    ordered_json yaml = ordered_json::parse(definition);
    exp->setFileName(yaml["filename"].get<std::string>());
    exp->setSeparator(yaml["separator"].get<std::string>());
    exp->setWeightMethod(_getExperimentWeightType(yaml["weight_method"].get<std::string>()));
    exp->setFirstRow(yaml["first_row"].get<int>());
    exp->setLastRow(yaml["last_row"].get<int>());
    exp->setNormalizeWeightsPerExperiment(yaml["normalize_per_experiment"].get<bool>());

    expSet.compile(&(pDataModel->getModel()->getMathContainer()));
    return true;
  }
  catch (const std::exception&)
  {
    return false;
  }
}

static CExperiment* getExperimentByName(const std::string& experimentName)
{
  auto* problem = getFitProblem();
  if (!problem)
    return nullptr;

  auto& expSet = problem->getExperimentSet();
  auto index = expSet.getIndex(experimentName);
  if (index == C_INVALID_INDEX)
    return nullptr;

  return expSet.getExperiment(index);
}

static nlohmann::json experimentFitBase(CExperiment* exp)
{
  nlohmann::json expData;
  if (!exp)
    return expData;

  expData["name"] = exp->getObjectName();
  expData["type"] = CTaskEnum::TaskName[exp->getExperimentType()];
  expData["exp_data"] = getExperimentData(exp->getObjectName(), false);
  return expData;
}

bool computeCurrentFitSolution()
{
  ensureModel();
  auto* task = getTaskPtr<CFitTask>("Parameter Estimation");
  auto* problem = task ? dynamic_cast<CFitProblem*>(task->getProblem()) : nullptr;
  if (!task || !problem)
    return false;

  std::string peSettings = getTaskSettings("Parameter Estimation");
  task->setMethodType(CTaskEnum::Method::Statistics);
  problem->setCalculateStatistics(false);
  problem->setCreateParameterSets(false);
  task->setUpdateModel(true);

  bool success = false;
  if (task->initialize(CCopasiTask::OUTPUT_UI, nullptr, nullptr))
  {
    success = task->process(false);
    if (!task->restore(true))
      success = false;
  }

  setTaskSettings("Parameter Estimation", peSettings);
  return success;
}

static nlohmann::json _computeFitTrajectory(CExperiment* exp)
{
  nlohmann::json expData = experimentFitBase(exp);
  if (!exp)
    return expData;

  exp->updateModelWithIndependentData(0);

  auto& times = exp->getTimeData();
  if (times.size() == 0)
    return expData;

  std::stringstream timeVals;
  for (auto& val : times)
    timeVals << val << " ";


  CTrajectoryTask* timeCourseTask = getTaskPtr<CTrajectoryTask>("Time-Course");
  CTrajectoryProblem* timeCourseProblem = timeCourseTask ? dynamic_cast<CTrajectoryProblem*>(timeCourseTask->getProblem()) : nullptr;
  if (!timeCourseTask || !timeCourseProblem)
    return expData;

  std::string timeCourseSettings = getTaskSettings("Time-Course");
  timeCourseProblem->setValues(timeVals.str());
  timeCourseProblem->setUseValues(true);

  timeCourseProblem->setTimeSeriesRequested(false);
  timeCourseProblem->setOutputStartTime(times[0]);
  timeCourseProblem->setStartInSteadyState(exp->getTimeSeriesStartInSteadyState());

  CDataHandler dataHandler;
  std::vector<std::string> duringNames;

  duringNames.push_back(pDataModel->getModel()->getValueReference()->getCN());
  dataHandler.addDuringName(pDataModel->getModel()->getValueReference()->getCN());

  for (auto& [pObj, index] : exp->getDependentObjectsMap())
  {
    duringNames.push_back(pObj->getCN());
    dataHandler.addDuringName(pObj->getCN());
  }

  {
    DataHandlerInterfaceGuard guard(pDataModel, &dataHandler);
    timeCourseTask->initialize(CCopasiTask::OUTPUT_UI, pDataModel, nullptr);
    timeCourseTask->process(true);
    timeCourseTask->restore(true);
  }

  expData["dependent_cn"] = duringNames;
  expData["simulated_data"] = dataHandler.getDuringData();

  setTaskSettings("Time-Course", timeCourseSettings);
  dataHandler.cleanup();
  return expData;
}

std::string computeFitTrajectory(const std::string& experimentName)
{
  ensureModel();
  auto* exp = getExperimentByName(experimentName);
  if (!exp)
    return "";
  return _computeFitTrajectory(exp).dump(mIndent);
}

static nlohmann::json _computeFitSteadyState(CExperiment* exp)
{
  nlohmann::json expData = experimentFitBase(exp);
  if (!exp)
    return expData;

  exp->updateModelWithIndependentData(0);

  CSteadyStateTask* steadyStateTask = getTaskPtr<CSteadyStateTask>("Steady-State");
  CSteadyStateProblem* steadyStateProblem = steadyStateTask ? dynamic_cast<CSteadyStateProblem*>(steadyStateTask->getProblem()) : nullptr;
  if (!steadyStateTask || !steadyStateProblem)
    return expData;

  std::string steadyStateSettings = getTaskSettings("Steady-State");

  CDataHandler dataHandler;
  std::vector<std::string> names;

  for (auto& [pObj, index] : exp->getDependentObjectsMap())
  {
    names.push_back(pObj->getCN());
    dataHandler.addAfterName(pObj->getCN());
  }

  {
    DataHandlerInterfaceGuard guard(pDataModel, &dataHandler);
    steadyStateTask->initialize(CCopasiTask::OUTPUT_UI, pDataModel, nullptr);
    steadyStateTask->process(false);
    steadyStateTask->restore(true);
  }

  expData["dependent_cn"] = names;
  expData["simulated_data"] = dataHandler.getAfterData();

  dataHandler.cleanup();
  setTaskSettings("Steady-State", steadyStateSettings);
  return expData;
}

std::string computeFitSteadyState(const std::string& experimentName)
{
  ensureModel();
  auto* exp = getExperimentByName(experimentName);
  if (!exp)
    return "";
  return _computeFitSteadyState(exp).dump(mIndent);
}

std::string getCurrentFit(bool computeCurrentSolution /*=true*/)
{
  ensureModel();
  auto* problem = getFitProblem();
  if (!problem)
    return "";

  if (computeCurrentSolution && !computeCurrentFitSolution())
    return "";

  auto results = nlohmann::json::array();
  auto& expSet = problem->getExperimentSet();
  auto& optItems = problem->getOptItemList(false);

  // write values from current solution into optItems
  auto sols = problem->getSolutionVariables(false);
  for (size_t i = 0; i < sols.size() && i < optItems.size(); ++i)
  {
    auto* item = dynamic_cast<CFitItem*>(optItems[i]);
    if (item != NULL)
      item->setItemValue(sols[i], COptItem::CheckPolicyFlag::None);
  }

  auto& pContainer = pDataModel->getModel()->getMathContainer();
  auto& mCompleteInitialState = pContainer.getCompleteInitialState();

  std::vector< CObjectInterface::ObjectSet > ObjectSet;
  ObjectSet.resize(expSet.getExperimentCount());
  size_t i, Index, imax = expSet.getExperimentCount();

  // Build a matrix of experiment and experiment local items.
  CMatrix<CFitItem*> mExperimentValues;
  mExperimentValues.resize(expSet.getExperimentCount(), optItems.size());
  mExperimentValues = NULL;

  CVector<CCore::CUpdateSequence> mExperimentInitialUpdates;
  mExperimentInitialUpdates.resize(expSet.getExperimentCount());

  auto it = optItems.begin();
  auto end = optItems.end();

  for (int j = 0; it != end; ++it, ++j)
  {
    auto* pItem = dynamic_cast<CFitItem*>(*it);

    if (pItem == NULL)
      continue;

    std::string Annotation = pItem->getObjectDisplayName();

    // We cannot directly change the container values as multiple parameters
    // may point to the same value.

    imax = pItem->getExperimentCount();

    if (imax == 0)
    {
      for (i = 0, imax = expSet.getExperimentCount(); i < imax; i++)
      {
        const CObjectInterface* object = pItem->getItemObject();

        if (object != NULL)
        {
          mExperimentValues(i, j) = pItem;
          ObjectSet[i].insert(object);
        }
      }
    }
    else
    {
      Annotation += "; {" + pItem->getExperiments() + "}";

      for (i = 0; i < imax; i++)
      {
        if ((Index = expSet.keyToIndex(pItem->getExperiment(i))) == C_INVALID_INDEX)
          return "";

        const CObjectInterface* object = pItem->getItemObject();

        if (object != NULL)
        {
          mExperimentValues(Index, j) = pItem;
          //std::cout << " setting Index: " << Index << " and i: " << j << " for experiment: " << pItem->getExperiment(i) << std::endl;
          ObjectSet[Index].insert(object);
        }
      };
    }


    // Create a joined sequence of update methods for parameters and independent values.
    for (i = 0, imax = expSet.getExperimentCount(); i < imax; i++)
    {
      pContainer.getInitialDependencies().getUpdateSequence(mExperimentInitialUpdates[i], CCore::SimulationContext::UpdateMoieties, ObjectSet[i], pContainer.getInitialStateObjects());
    }


  }

  for (size_t i = 0; i < expSet.size(); ++i)
  {
    auto* exp = expSet.getExperiment(i);
    if (!exp)
      continue;

    CFitItem** ppUpdate = mExperimentValues[i];
    CFitItem** ppUpdateEnd = ppUpdate + optItems.size();

    /*pContainer.fetchInitialState();
    pContainer.updateInitialValues(CCore::Framework::ParticleNumbers);
    pContainer.applyInitialValues();
    pContainer.updateSimulatedValues(false);
    pContainer.updateTransientDataValues();*/

    // set the global and experiment local fit item values.
    for (; ppUpdate != ppUpdateEnd; ppUpdate++)
      if (*ppUpdate)
      {
        C_FLOAT64 Value = (*ppUpdate)->getItemValue();
        //(*ppUpdate)->COptItem::setItemValue(Value, COptItem::CheckPolicyFlag::None);
        setValueByName((*ppUpdate)->getObjectCN(), Value);
      }

    /*pContainer.applyUpdateSequence(mExperimentInitialUpdates[i]);
    exp->updateModelWithIndependentData(0);
    pContainer.pushAllTransientValues();
    pContainer.pushInitialState();*/



    if (exp->getExperimentType() == CTaskEnum::Task::timeCourse)
      results.push_back(_computeFitTrajectory(exp));
    else
      results.push_back(_computeFitSteadyState(exp));

    //pContainer.setCompleteInitialState(CompleteExperimentInitialState);
  }
  return results.dump(mIndent);
}

std::string getTaskSettings(const std::string& taskName)
{
  ensureModel();
  ordered_json yaml;
  if (pDataModel == nullptr || pDataModel->getTaskList() == nullptr)
    return yaml.dump(mIndent);
  if (pDataModel->getTaskList()->getIndex(taskName) == C_INVALID_INDEX)
    return yaml.dump(mIndent);

  auto& task = (*pDataModel->getTaskList())[taskName];

  yaml["update_model"] = task.isUpdateModel();
  yaml["scheduled"] = task.isScheduled();

  auto* problem = task.getProblem();
  if (problem == nullptr)
    return yaml.dump(mIndent);

  yaml["problem"] = convertGroupToJson(problem);

  auto* method = task.getMethod();
  if (method != nullptr)
  {
    yaml["method"] = convertGroupToJson(method);
    yaml["method"]["name"] = method->getObjectName();
  }
  return yaml.dump(mIndent);
}

std::vector<std::string> getAvailableMethods(const std::string& taskName)
{
  ensureModel();
  if (pDataModel->getTaskList()->getIndex(taskName) == C_INVALID_INDEX)
    return {};

  auto& task = (*pDataModel->getTaskList())[taskName];
  auto* pMethods = task.getValidMethods();
  std::vector<std::string> methodNames;
  if (pMethods)
  {
    int count = 0;
    while (pMethods[count] != CTaskEnum::Method::UnsetMethod)
    {
      methodNames.push_back(CTaskEnum::MethodName[pMethods[count]]);
      count++;
    }
  }
  return methodNames;
}

void setTimeCourseSettings(const std::string& settings)
{
  ensureModel();
  try
  {
    ordered_json yaml = ordered_json::parse(settings);
    applyYaml(yaml);
  }
  catch (const std::exception&)
  {
  }
}

std::string simulateYaml(const std::string& processingYaml)
{
  try
  {
    auto yaml = nlohmann::ordered_json::parse(processingYaml);
    return simulateJSON(yaml);
  }
  catch (const std::exception& e)
  {
    return jsonError(e.what());
  }
}

std::string simulate()
{
  ordered_json yaml;
  return simulateJSON(yaml);
}

std::string simulateEx(double timeStart, double timeEnd, int numPoints)
{
  ordered_json yaml;
  numPoints = numPoints > 1 ? numPoints - 1 : numPoints;
  if (numPoints < 1)
    numPoints = 1;

  yaml["problem"]["StepNumber"] = numPoints;
  yaml["problem"]["OutputStartTime"] = timeStart;
  yaml["problem"]["Duration"] = timeEnd;
  double stepSize = (timeEnd - timeStart) / numPoints;
  yaml["problem"]["StepSize"] = stepSize;
  yaml["problem"]["AutomaticStepSize"] = false;
  return simulateJSON(yaml);
}

std::vector<std::string> getReactionNames()
{
  return mReactionOrder;
}

std::vector<std::string> getReactionIds()
{
  return orderedIds(mReactionOrder, mReactions);
}

std::vector<double> getReactionRates()
{
  return orderedValues(mReactionOrder, mReactions);
}

std::vector<std::string> getFloatingSpeciesNames()
{
  return mFloatingSpeciesOrder;
}

std::vector<std::string> getFloatingSpeciesIds()
{
  return orderedIds(mFloatingSpeciesOrder, mFloatingSpecies);
}

std::vector<double> getFloatingSpeciesConcentrations()
{
  return orderedValues(mFloatingSpeciesOrder, mFloatingSpecies);
}

std::vector<double> getRatesOfChange()
{
  std::vector<double> rates;
  rates.reserve(mFloatingSpeciesOrder.size());
  for (const auto& name : mFloatingSpeciesOrder)
  {
    auto it = mFloatingSpecies.find(name);
    if (it != mFloatingSpecies.end() && it->second.pRates != nullptr)
      rates.push_back(*it->second.pRates);
    else
      rates.push_back(std::numeric_limits<double>::quiet_NaN());
  }
  return rates;
}

std::vector<std::string> getBoundarySpeciesNames()
{
  return mBoundarySpeciesOrder;
}

std::vector<std::string> getBoundarySpeciesIds()
{
  return orderedIds(mBoundarySpeciesOrder, mBoundarySpecies);
}

std::vector<double> getBoundarySpeciesConcentrations()
{
  return orderedValues(mBoundarySpeciesOrder, mBoundarySpecies);
}

std::vector<std::string> getCompartmentNames()
{
  return mCompartmentOrder;
}

std::vector<std::string> getCompartmentIds()
{
  return orderedIds(mCompartmentOrder, mCompartments);
}

std::vector<double> getCompartmentSizes()
{
  return orderedValues(mCompartmentOrder, mCompartments);
}

std::vector<std::string> getGlobalParameterNames()
{
  return mGlobalParameterOrder;
}

std::vector<std::string> getGlobalParameterIds()
{
  return orderedIds(mGlobalParameterOrder, mGlobalParameters);
}

std::vector<double> getGlobalParameterValues()
{
  return orderedValues(mGlobalParameterOrder, mGlobalParameters);
}

std::vector<std::string> getLocalParameterNames()
{
  return mLocalParameterOrder;
}

std::vector<double> getLocalParameterValues()
{
  return orderedValues(mLocalParameterOrder, mLocalParameters);
}

double oneStep(double startTime, double stepSize)
{
  ordered_json yaml;
  yaml["problem"]["StepSize"] = stepSize;
  yaml["problem"]["OutputStartTime"] = startTime;
  yaml["problem"]["Duration"] = startTime + stepSize;
  auto result = simulateJSON(yaml);
  try
  {
    auto j = ordered_json::parse(result);
    if (j.contains("status") && j["status"] == "error")
      return std::numeric_limits<double>::quiet_NaN();
  }
  catch (const std::exception&)
  {
    return std::numeric_limits<double>::quiet_NaN();
  }
  return startTime + stepSize;
}

std::vector<std::string> getSelectionList()
{
  return mSelectionList;
}

std::vector<double> getSelectionValues()
{
  std::vector<double> values;
  values.reserve(mSelectedValues.size());
  for (auto* pValue : mSelectedValues)
  {
    values.push_back(pValue ? *pValue : std::numeric_limits<double>::quiet_NaN());
  }
  return values;
}

std::string getLastMessages()
{
  return CCopasiMessage::getAllMessageText();
}

void clearMessages()
{
  CCopasiMessage::clearDeque();
}

bool getAutoUpdateModel()
{
  return mAutoUpdateModel;
}

void setAutoUpdateModel(bool autoUpdate)
{
  mAutoUpdateModel = autoUpdate;
}

#ifdef __EMSCRIPTEN__
EMSCRIPTEN_BINDINGS(copasi_binding)
{
  register_vector<int>("IntVector");
  register_vector<char>("CharVector");
  register_vector<float>("FloatVector");
  register_vector<double>("DoubleVector");
  register_vector<std::vector<double>>("DoubleVectorVector");
  register_vector<std::string>("StringVector");

  emscripten::function("initCps", &initCps);
  emscripten::function("destroy", &destroyAPI);
  emscripten::function("getVersion", &getVersion);
  emscripten::function("getMessages", optional_override([]()
    { return getMessages(0, std::string()); }));
  emscripten::function("getMessages", optional_override([](int start)
    { return getMessages(start, std::string()); }));
  emscripten::function("getMessages", &getMessages);
  emscripten::function("getModelInfo", &getModelInfo);
  emscripten::function("loadFromFile", &loadFromFile);
  emscripten::function("loadCombineArchive", &loadCombineArchive);
  emscripten::function("loadModel", &loadModel);
  emscripten::function("reset", &reset);
  emscripten::function("resetAll", &resetAll);
  emscripten::function("simulate", &simulate);
  emscripten::function("simulateYaml", &simulateYaml);
  emscripten::function("simulateEx", &simulateEx);
  emscripten::function("getSimulationResults", &getSimulationResults);
  emscripten::function("getTimeCourseSettings", &getTimeCourseSettings);
  emscripten::function("setTimeCourseSettings", &setTimeCourseSettings);
  emscripten::function("getTaskSettings", &getTaskSettings);
  emscripten::function("setTaskSettings", &setTaskSettings);
  emscripten::function("runTask", &runTask);
  emscripten::function("getAvailableMethods", &getAvailableMethods);
  emscripten::function("setMethod", &setMethod);
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

  emscripten::function("getModelValue", &getValue);
  emscripten::function("setModelValue", &setValue);
  emscripten::function("setValueByName", &setValueByName);

  emscripten::function("oneStep", &oneStep);
  emscripten::function("steadyState", &steadyState);
  emscripten::function("getStabilityAnalysis", &getStabilityAnalysis);
  emscripten::function("getSteadyStateStatus", &getSteadyStateStatus);
  emscripten::function("getSteadyStateProtocol", &getSteadyStateProtocol);
  emscripten::function("computeMca", &computeMca);
  emscripten::function("getMcaProtocol", &getMcaProtocol);
  emscripten::function("getMcaSettings", &getMcaSettings);
  emscripten::function("setMcaSettings", &setMcaSettings);
  emscripten::function("runLNA", &runLNA);
  emscripten::function("getLNAResults", &getLNAResults);
  emscripten::function("getLNASettings", &getLNASettings);
  emscripten::function("setLNASettings", &setLNASettings);
  emscripten::function("runOptimization", &runOptimization);
  emscripten::function("getOptItems", &getOptItems);
  emscripten::function("getOptSolution", &getOptSolution);
  emscripten::function("getOptStatistic", &getOptStatistic);
  emscripten::function("getOptSettings", &getOptSettings);
  emscripten::function("runParameterEstimation", &runParameterEstimation);
  emscripten::function("getFitSolution", &getFitSolution);
  emscripten::function("getFitItems", &getFitItems);
  emscripten::function("getFitStatistic", &getFitStatistic);
  emscripten::function("getFitSettings", &getFitSettings);

  emscripten::function("getSelectionList", &getSelectionList);
  emscripten::function("getSelectedValues", &getSelectionValues);
  emscripten::function("setSelectionList", &setSelectionList);

  emscripten::function("getJacobian", &getJacobian);
  emscripten::function("getJacobian2D", &getJacobian2D);
  emscripten::function("getEigenValues2D", &getEigenValues2D);
  emscripten::function("getJacobianReduced", &getJacobianReduced);
  emscripten::function("getJacobianReduced2D", &getJacobianReduced2D);
  emscripten::function("getEigenValuesReduced2D", &getEigenValuesReduced2D);

  emscripten::function("getStoichiometryMatrix", &getStoichiometryMatrix);
  emscripten::function("getLinkMatrix", &getLinkMatrix);

  // mca results
  emscripten::function("getFluxControlCoefficients", &getFluxControlCoefficients);
  emscripten::function("getFluxControlCoefficients2D", &getFluxControlCoefficients2D);
  emscripten::function("getConcentrationControlCoefficients", &getConcentrationControlCoefficients);
  emscripten::function("getConcentrationControlCoefficients2D", &getConcentrationControlCoefficients2D);
  emscripten::function("getElasticities", &getElasticities);
  emscripten::function("getElasticities2D", &getElasticities2D);

  // messages
  emscripten::function("getLastMessages", &getLastMessages);
  emscripten::function("clearMessages", &clearMessages);

  // experiments
  emscripten::function("getExperimentNames", &getExperimentNames);
  emscripten::function("getExperimentDefinition", &getExperimentDefinition);
  emscripten::function("getExperimentDefinitions", &getExperimentDefinitions);
  emscripten::function("setExperimentData", &setExperimentData);
  emscripten::function("setExperimentFilename", &setExperimentFilename);
  emscripten::function("setExperimentDefinition", &setExperimentDefinition);
  emscripten::function("computeCurrentFitSolution", &computeCurrentFitSolution);
  emscripten::function("computeFitTrajectory", &computeFitTrajectory);
  emscripten::function("computeFitSteadyState", &computeFitSteadyState);
  emscripten::function("getCurrentFit", &getCurrentFit);
  emscripten::function("getFim", &getFim);
  emscripten::function("getCorrelationMatrix", &getCorrelationMatrix);

  // auto update model
  emscripten::function("getAutoUpdateModel", &getAutoUpdateModel);
  emscripten::function("setAutoUpdateModel", &setAutoUpdateModel);

  emscripten::function("convertToIrreversible", &convertToIrreversible);

  emscripten::function("getIndent", &getIndent);
  emscripten::function("setIndent", &setIndent);

}
#endif