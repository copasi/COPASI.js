//#include <catch2/catch_test_macros.hpp>
//#include <catch2/catch_approx.hpp>
//#include <catch2/matchers/catch_matchers_vector.hpp>
#define CATCH_CONFIG_RUNNER
#include <catch.hpp>
#define COPASI_MAIN
#include "copasijs.h"

#include <cstdlib>


class Instance {
public:
    Instance() {
        
    }

    ~Instance() {
        destroyAPI();
    }
};

/**
 * Tries to find the test file in the srcdir environment variable.
 *
 * @param fileName the filename relative to this tests srcdir
 *        environment variable.
 *
 * If the filename cannot be found, the test from which this function
 * is called will fail.
 *
 * @return the full path to the test file
 */
std::string getTestFile(const std::string& fileName)
{
  std::stringstream str;
  char* srcDir = getenv("srcdir");

  if (srcDir != NULL) str << srcDir;
  else str << ".";

  str << "/" << fileName;
  std::string fullName = str.str();

  return fullName;
}

TEST_CASE("Test version", "[copasijs]") {
    std::string version = getVersion();
    CAPTURE(version);
    REQUIRE(!version.empty());
}

TEST_CASE("Load Model", "[copasijs][brusselator]") 
{
    Instance instance;
    std::string model = loadFromFile(getTestFile("../example_files/brusselator.cps"));
    REQUIRE(!model.empty());
    REQUIRE(model != "Error loading model");

    auto selectionList = getSelectionList();
    REQUIRE_THAT(selectionList, Catch::Matchers::Equals(std::vector<std::string>{"Time", "X", "Y"}));
    auto selectionValues = getSelectionValues();
    REQUIRE(selectionValues.size() == 3);
    REQUIRE_THAT(selectionValues, Catch::Matchers::Approx(std::vector<double>{0, 3, 3}));

    // lets have a look at the time course settings
    auto timeCourseSettings = getTimeCourseSettings();
    CAPTURE(timeCourseSettings);

    // now simulate using onestep
    double time = 0;
    double stepSize = 1;
    double numSteps = 11;
    std::vector<double> timePoints;
    std::vector<double> xPoints;
    std::vector<double> yPoints;
    while (time < numSteps) {
        oneStep(time, stepSize);
        timePoints.push_back(time);
        auto values = getSelectionValues();
        xPoints.push_back(values[1]);
        yPoints.push_back(values[2]);
        time += stepSize;
    }
    REQUIRE(timePoints.size() == 11);
    REQUIRE_THAT(timePoints, Catch::Matchers::Approx(std::vector<double>{0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}));

    reset();

    // ensure that time is again 0
    selectionValues = getSelectionValues();
    REQUIRE(selectionValues.size() == 3);
    REQUIRE_THAT(selectionValues, Catch::Matchers::Approx(std::vector<double>{0, 3, 3}));

    // now run a simulation to look that the json format is in the expected format
    auto data = simulateEx(0, 10, 11);
    CAPTURE(data);
    auto json = nlohmann::json::parse(data);
    REQUIRE(json["titles"][0] == "Time");
    REQUIRE(json["columns"][0].size() == json["recorded_steps"].get<int>());
}

TEST_CASE("Simulate SBML multiple times", "[copasijs][multiple]")
{
    Instance instance;
    std::string model = loadFromFile(getTestFile("../example_files/oscli.xml"));

    auto data = simulateEx(0, 10, 11);
    CAPTURE(data);
    auto json = nlohmann::json::parse(data);
    REQUIRE(json["recorded_steps"].get<int>() == 11);
    
    data = simulateEx(10, 20, 11);
    CAPTURE(data);
    CAPTURE(getTimeCourseSettings());
    json = nlohmann::json::parse(data);
    REQUIRE(json["recorded_steps"].get<int>() == 11);

    data = simulateEx(12, 30, 11);
    CAPTURE(data);
    CAPTURE(getTimeCourseSettings());
    json = nlohmann::json::parse(data);
    REQUIRE(json["recorded_steps"].get<int>() == 11);


}


TEST_CASE("Test stepsize in multiple runs", "[copasijs][multiple]")
{
    Instance instance;
    std::string model = loadFromFile(getTestFile("../example_files/oscli.xml"));

    
    nlohmann::ordered_json yaml;
    yaml["problem"]["OutputStartTime"] = 0;
    yaml["problem"]["Duration"] = 10;
    yaml["problem"]["StepSize"] = 1;

    auto data = simulateJSON(yaml);
    CAPTURE(data);
    CAPTURE(getTimeCourseSettings());
    auto json = nlohmann::json::parse(data);
    REQUIRE(json["recorded_steps"].get<int>() == 11);

    yaml["problem"]["OutputStartTime"] = 10;
    yaml["problem"]["Duration"] = 20;
    data = simulateJSON(yaml);
    CAPTURE(data);
    CAPTURE(getTimeCourseSettings());
    json = nlohmann::json::parse(data);
    REQUIRE(json["recorded_steps"].get<int>() == 11);

    yaml["problem"]["StepSize"] = 0.1;
    data = simulateJSON(yaml);
    CAPTURE(data);
    CAPTURE(getTimeCourseSettings());
    json = nlohmann::json::parse(data);
    REQUIRE(json["recorded_steps"].get<int>() == 101);
}

TEST_CASE("Load SBML Model", "[copasijs][sbml][setValue]")
{
    Instance instance;
    std::string model = loadFromFile(getTestFile("../example_files/oscli.xml"));
    REQUIRE(!model.empty());
    REQUIRE(model != "Error loading model");

    auto selectionList = getSelectionList();
    REQUIRE_THAT(selectionList, Catch::Matchers::Equals(std::vector<std::string>{"Time", "S1", "S2"}));
    auto selectionValues = getSelectionValues();
    REQUIRE(selectionValues.size() == 3);
    REQUIRE_THAT(selectionValues, Catch::Matchers::Approx(std::vector<double>{0, 0, 1}));

    // lets have a look at the time course settings
    auto timeCourseSettings = getTimeCourseSettings();
    CAPTURE(timeCourseSettings);

    // now simulate using onestep
    double time = 0;
    double stepSize = 1;
    double numSteps = 11;
    std::vector<double> timePoints;
    std::vector<double> xPoints;
    std::vector<double> yPoints;
    while (time < numSteps) {
        oneStep(time, stepSize);
        timePoints.push_back(time);
        auto values = getSelectionValues();
        xPoints.push_back(values[1]);
        yPoints.push_back(values[2]);
        time += stepSize;
    }
    REQUIRE(timePoints.size() == 11);
    REQUIRE_THAT(timePoints, Catch::Matchers::Approx(std::vector<double>{0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}));

    reset();

    // ensure that time is again 0
    selectionValues = getSelectionValues();
    REQUIRE(selectionValues.size() == 3);
    REQUIRE_THAT(selectionValues, Catch::Matchers::Approx(std::vector<double>{0, 0, 1}));

    // now run a simulation to look that the json format is in the expected format
    auto data = simulateEx(0, 10, 11);
    CAPTURE(data);
    auto json = nlohmann::json::parse(data);
    REQUIRE(json["titles"][0] == "Time");
    REQUIRE(json["columns"][0].size() == json["recorded_steps"].get<int>());

    reset();
    // now use setValue / getValue to change the value of S1
    double value = getValue("S1");
    CAPTURE(value);
    REQUIRE(value == 0);
    setValue("S1", 1);
    value = getValue("S1");
    CAPTURE(value);
    REQUIRE(value == 1);

    // now the global parameter J0_v0 that initially is 8
    value = getValue("J0_v0");
    CAPTURE(value);
    REQUIRE(value == 8);
    setValue("J0_v0", 10);
    value = getValue("J0_v0");
    CAPTURE(value);
    REQUIRE(value == 10);
    
    // and compartment that is initially 1
    value = getValue("compartment");
    CAPTURE(value);
    REQUIRE(value == 1);
    setValue("compartment", 2);
    value = getValue("compartment");
    CAPTURE(value);
    REQUIRE(value == 2.0);

    reset();
    value = getValue("S1");
    REQUIRE(value == 0.0);
    setValue("S1", 1);

    data = simulateEx(0, 10, 11);
    CAPTURE(data);
    json = nlohmann::json::parse(data);
    REQUIRE(json["titles"][0] == "Time");
    REQUIRE(json["titles"][1] == "S1");
    REQUIRE(json["columns"][0].size() == json["recorded_steps"].get<int>());
    REQUIRE(json["columns"][1][0] == 1.0);

    // reset again and check that the value is back to 0
    reset();
    data = simulateEx(0, 10, 11);
    CAPTURE(data);
    json = nlohmann::json::parse(data);
    REQUIRE(json["titles"][1] == "S1");
    REQUIRE(json["columns"][1][0] == 0.0);

    setValue("J0_v0", 8);

    // test difference between reset and restAll by changing the value of S1 and J0_v0
    setValue("S1", 1);
    setValue("J0_v0", 10);

    reset();
    // now S1 should be 0 and J0_v0 should be 10
    REQUIRE(getValue("S1") == 0.0);
    REQUIRE(getValue("J0_v0") == 10.0);

    // test changing the initial value, 
    setValue("[S1]_0", 1);

    // it should persist after reset
    reset();
    REQUIRE(getValue("[S1]_0") == Approx(1.0));
    REQUIRE(getValue("S1") == 1.0);

    // and be reset after resetAll
    resetAll();
    REQUIRE(getValue("[S1]_0") == 0.0);
    REQUIRE(getValue("S1") == 0.0);

    // and running reset after resetAll should not change the value
    reset();
    REQUIRE(getValue("S1") == 0.0);

    // now run resetAll
    setValue("S1", 1);
    setValue("J0_v0", 10);
    resetAll();
    // now S1 should be 0 and J0_v0 should be 8
    REQUIRE(getValue("S1") == 0.0);
    REQUIRE(getValue("J0_v0") == 8.0);

}


TEST_CASE("Load COVID Model", "[copasijs][slow]") 
{
    Instance instance;
    std::string model = loadFromFile(getTestFile("../example_files/covid.cps"));
    REQUIRE(!model.empty());
    REQUIRE(model != "Error loading model");

    auto selectionList = getSelectionList();
    REQUIRE_THAT(selectionList, Catch::Matchers::Equals(std::vector<std::string>{"Time", "S", "I", "R", "q"}));
    auto selectionValues = getSelectionValues();
    REQUIRE(selectionValues.size() == 5);
    REQUIRE_THAT(selectionValues, Catch::Matchers::Approx(std::vector<double>{0.0, 0.999999875, 0.000000125, 0.0, 0.012372199}));

    // lets have a look at the time course settings
    auto timeCourseSettings = getTimeCourseSettings();
    CAPTURE(timeCourseSettings);

    // now simulate using onestep
    double time = 0;
    double stepSize = 1;
    double numSteps = 11;
    std::vector<double> timePoints;
    std::vector<double> xPoints;
    std::vector<double> yPoints;
    while (time < numSteps) {
        oneStep(time, stepSize);
        timePoints.push_back(time);
        auto values = getSelectionValues();
        xPoints.push_back(values[1]);
        yPoints.push_back(values[2]);
        time += stepSize;
    }
    REQUIRE(timePoints.size() == 11);
    REQUIRE_THAT(timePoints, Catch::Matchers::Approx(std::vector<double>{0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}));

    reset();

    // ensure that time is again 0
    selectionValues = getSelectionValues();
    CAPTURE(selectionValues);
    REQUIRE(selectionValues.size() == 5);
    REQUIRE_THAT(selectionValues, Catch::Matchers::Approx(std::vector<double>{0.0, 0.999999875, 0.000000125, 0.0, 0.012372199}));

    // now run a simulation to look that the json format is in the expected format
    auto data = simulateEx(0, 10, 11);
    CAPTURE(data);
    auto json = nlohmann::json::parse(data);
    REQUIRE(json["titles"][0] == "Time");
    CAPTURE(json["titles"][0]);
    CAPTURE(json["titles"][0].size());
    REQUIRE(json["columns"][0].size() == json["recorded_steps"].get<int>());
}



TEST_CASE("Steadystate test", "[copasijs][steadystate]") 
{
    Instance instance;
    std::string model = loadFromFile(getTestFile("../example_files/brusselator.cps"));
    REQUIRE(!model.empty());
    REQUIRE(model != "Error loading model");

    auto selectionList = getSelectionList();
    REQUIRE_THAT(selectionList, Catch::Matchers::Equals(std::vector<std::string>{"Time", "X", "Y"}));
    auto selectionValues = getSelectionValues();
    REQUIRE(selectionValues.size() == 3);
    REQUIRE_THAT(selectionValues, Catch::Matchers::Approx(std::vector<double>{0, 3, 3}));

    // run to steady state
    double closeNess = steadyState();
    REQUIRE(closeNess < 0.1);

    // look at steady state values
    selectionValues = getSelectionValues();
    REQUIRE(selectionValues.size() == 3);
    REQUIRE_THAT(selectionValues, Catch::Matchers::Approx(std::vector<double>{0, 0.5, 6}));

    // get the jacobian
    auto jacobian = getJacobian();
    auto jac2d = getJacobian2D();    
    auto eigenValues = getEigenValues2D();

    REQUIRE(jac2d.size() == 2);

    jacobian = getJacobianReduced();
    jac2d = getJacobianReduced2D();
    eigenValues = getEigenValuesReduced2D();

    REQUIRE(jac2d.size() == 2);

    auto settings = getTaskSettings("Steady-State");
    REQUIRE(!settings.empty());
}


TEST_CASE("Test MCA", "[copasijs][mca]")
{
	Instance instance;
	std::string model = loadFromFile(getTestFile("../example_files/brusselator.cps"));
	REQUIRE(!model.empty());
	REQUIRE(model != "Error loading model");

	auto selectionList = getSelectionList();

	// add elasticities to selectionlist
	selectionList.push_back("CN=Root,Vector=TaskList[Metabolic Control Analysis],Method=MCA Method (Reder),Array=Scaled elasticities[(R1)][X]");
	selectionList.push_back("CN=Root,Vector=TaskList[Metabolic Control Analysis],Method=MCA Method (Reder),Array=Unscaled elasticities[(R1)][X]");
	selectionList.push_back("CN=Root,Vector=TaskList[Metabolic Control Analysis],Method=MCA Method (Reder),Array=Scaled concentration control coefficients[X][(R1)]");
	selectionList.push_back("CN=Root,Vector=TaskList[Metabolic Control Analysis],Method=MCA Method (Reder),Array=Unscaled concentration control coefficients[X][(R1)]");
	selectionList.push_back("CN=Root,Vector=TaskList[Metabolic Control Analysis],Method=MCA Method (Reder),Array=Scaled flux control coefficients[(R1)][(R1)]");
	selectionList.push_back("CN=Root,Vector=TaskList[Metabolic Control Analysis],Method=MCA Method (Reder),Array=Unscaled flux control coefficients[(R1)][(R1)]");

	setSelectionList(selectionList);

	auto result = simulateEx(0, 10, 11);

	auto result2d = getSimulationResults2D();

	REQUIRE(result2d.size() == 11);

  computeMca(true);

  auto selected = getSelectionValues();

  REQUIRE(selected.size() == 9);

  auto cccs = getConcentrationControlCoefficients(true);
  auto cccs2d = getConcentrationControlCoefficients2D(true);
  auto fccs = getFluxControlCoefficients(true);
  auto fccs2d = getFluxControlCoefficients2D(true);
  auto elasticities = getElasticities(true);
  auto elasticities2d = getElasticities2D(true);

  double dValue = getValue("EE(R1,X)");
  REQUIRE(dValue == dValue);
  dValue = getValue("uEE(R1,X)");
  REQUIRE(dValue == dValue);
  dValue = getValue("FCC(R1,R1)");
  REQUIRE(dValue == dValue);
  dValue = getValue("uFCC(R1,R1)");
  REQUIRE(dValue == dValue);
  dValue = getValue("CCC(X,R1)");
  REQUIRE(dValue == dValue);
  dValue = getValue("uCCC(X,R1)");
  REQUIRE(dValue == dValue);

  dValue = getValue("nonExistent(X,R1)");
  REQUIRE(dValue != dValue);
  dValue = getValue("uCCC(A,R1)");
	REQUIRE(dValue != dValue);

  std::string mcaResult = getMcaProtocol();
  REQUIRE(!mcaResult.empty());

  std::string settings = getMcaSettings();
  CAPTURE(settings);
  REQUIRE(!settings.empty());

  REQUIRE(setMcaSettings(settings));

}


TEST_CASE("Test Settings", "[copasijs][settings]")
{
    std::string settings = getTaskSettings("Time-Course");
    CAPTURE(settings);
    REQUIRE(!settings.empty());

    settings = getTaskSettings("Linear Noise Approximation");
    CAPTURE(settings);
    REQUIRE(!settings.empty());
}

TEST_CASE("Test Optimization", "[copasijs][optimization]")
{
    Instance instance;
    std::string model = loadFromFile(getTestFile("../example_files/HimmelblauFunction.cps"));
    REQUIRE(!model.empty());
    REQUIRE(model != "Error loading model");
    
    REQUIRE(runOptimization(true));

    auto optItems = getOptItems();
    CAPTURE(optItems);
    REQUIRE(!optItems.empty());

    auto optSolution = getOptSolution();
    CAPTURE(optSolution);
    REQUIRE(!optSolution.empty());

    auto optStatistic = getOptStatistic();
    CAPTURE(optStatistic);
    REQUIRE(!optStatistic.empty());

    auto optSettings = getOptSettings();
    CAPTURE(optSettings);
    REQUIRE(!optSettings.empty());
}

TEST_CASE("Test Parameter Estimation with error", "[copasijs][parameter_estimation]")
{
  Instance instance;
  std::string model = loadFromFile(getTestFile("../example_files/brusselator.cps"));
  REQUIRE(!model.empty());
  REQUIRE(model != "Error loading model");

  REQUIRE(runParameterEstimation(true) == false);

  std::string messages = getMessages(0);
  CAPTURE(messages);
  REQUIRE(!messages.empty());
}


TEST_CASE("Test Parameter Estimation", "[copasijs][parameter_estimation]")
{
    Instance instance;
    std::string model = loadFromFile(getTestFile("../example_files/LM-test1.cps"));
    REQUIRE(!model.empty());
    REQUIRE(model != "Error loading model");

    REQUIRE(runParameterEstimation(true));

    auto fitItems = getFitItems();
    CAPTURE(fitItems);
    REQUIRE(!fitItems.empty());

    auto fitSolution = getFitSolution();
    CAPTURE(fitSolution);
    REQUIRE(!fitSolution.empty());

    auto fitStatistic = getFitStatistic();
    CAPTURE(fitStatistic);
    REQUIRE(!fitStatistic.empty());
}


TEST_CASE("Test PE omex", "[copasijs][parameter_estimation][omex]")
{
    Instance instance;
    std::string model = loadCombineArchive(getTestFile("../example_files/schaber1.omex"));
    REQUIRE(!model.empty());
    REQUIRE(model != "Error loading model");

    
    REQUIRE(runParameterEstimation(true));

    auto fitItems = getFitItems();
    CAPTURE(fitItems);
    REQUIRE(!fitItems.empty());

    auto fitSolution = getFitSolution();
    CAPTURE(fitSolution);
    REQUIRE(!fitSolution.empty());

    auto fitStatistic = getFitStatistic();
    CAPTURE(fitStatistic);
    REQUIRE(!fitStatistic.empty());

    auto fim = getFim();
    CAPTURE(fim);
    REQUIRE(!fim.empty());

    auto correlationMatrix = getCorrelationMatrix();
    CAPTURE(correlationMatrix);
    REQUIRE(!correlationMatrix.empty());

    auto fitSettings = getFitSettings();
    CAPTURE(fitSettings);
    REQUIRE(!fitSettings.empty());

    auto currentFit = getCurrentFit();
    CAPTURE(currentFit);
    REQUIRE(!currentFit.empty());
}

TEST_CASE("Test access to data files", "[copasijs][parameter_estimation][data]")
{
  Instance instance;
  std::string model = loadFromFile(getTestFile("../example_files/LM-test1.cps"));
  REQUIRE(!model.empty());
  REQUIRE(model != "Error loading model");

	auto names = getExperimentNames();
  REQUIRE(!names.empty());
  auto expInfo = getExperimentDefinition(names[0]);
	REQUIRE(!expInfo.empty());

  auto data = getExperimentData(names[0]);
	REQUIRE(data.size() == 100);

  REQUIRE(runParameterEstimation(true));

  auto currentFit = getCurrentFit(false);
  CAPTURE(currentFit);
  REQUIRE(!currentFit.empty());

  // parse the fit
  auto fitJson = nlohmann::json::parse(currentFit);
  // get the exp_data for the first experiment
  auto expData = fitJson[0]["exp_data"].get<std::vector<std::vector<double>>>();;
  // vs the simulated data
  auto simData = fitJson[0]["simulated_data"].get<std::vector<std::vector<double>>>();
  // verify that the sizes match
  REQUIRE(expData.size() == simData.size());

  auto lastExp = expData[expData.size() - 1];
  auto lastSim = simData[simData.size() - 1];

  auto expData4 = fitJson[3]["exp_data"].get<std::vector<std::vector<double>>>();;
  auto simData4 = fitJson[3]["simulated_data"].get<std::vector<std::vector<double>>>();
  REQUIRE(expData4.size() == simData4.size());
  auto lastExp4 = expData4[expData4.size() - 1];
  auto lastSim4 = simData4[simData4.size() - 1];

}

TEST_CASE("Test current fit helpers", "[copasijs][parameter_estimation][current_fit]")
{
    Instance instance;
    std::string model = loadFromFile(getTestFile("../example_files/LM-test1.cps"));
    REQUIRE(!model.empty());
    REQUIRE(model != "Error loading model");

    REQUIRE(computeCurrentFitSolution());

    auto names = getExperimentNames();
    REQUIRE(!names.empty());

    REQUIRE(computeFitTrajectory("does-not-exist").empty());

    auto trajectory = computeFitTrajectory(names[0]);
    CAPTURE(trajectory);
    REQUIRE(!trajectory.empty());

    auto json = nlohmann::json::parse(trajectory);
    REQUIRE(json["name"] == names[0]);
    REQUIRE(json.contains("exp_data"));
    REQUIRE(json.contains("dependent_cn"));
    REQUIRE(json["dependent_cn"].size() >= 2);
    REQUIRE(json.contains("simulated_data"));
    REQUIRE(json["simulated_data"].size() > 0);

    auto currentFit = getCurrentFit(false);
    CAPTURE(currentFit);
    REQUIRE(!currentFit.empty());

    auto fitJson = nlohmann::json::parse(currentFit);
    REQUIRE(fitJson.is_array());
    REQUIRE(fitJson.size() == names.size());
    REQUIRE(fitJson[0].contains("simulated_data"));
    REQUIRE(fitJson[0]["simulated_data"].size() > 0);
}

TEST_CASE("Test Messages", "[copasijs][messages]")
{
    Instance instance;
    std::string model = loadFromFile("none-existing");
    REQUIRE(!model.empty());
    auto messages = getMessages();
    REQUIRE(messages.empty());
    CCopasiMessage(CCopasiMessage::WARNING, "random message to ignore 1");
    CCopasiMessage(CCopasiMessage::WARNING, "random message to ignore 2");

    int numMessages = CCopasiMessage::size();
    CCopasiMessage(CCopasiMessage::WARNING, "warning 1");
    CCopasiMessage(CCopasiMessage::WARNING, "warning 2");
    CCopasiMessage(CCopasiMessage::WARNING, "warning 3");
    CCopasiMessage(CCopasiMessage::WARNING, "warning 4");
    CCopasiMessage(CCopasiMessage::WARNING, "warning 5");
    messages = getMessages(numMessages + 3);
    REQUIRE(!messages.empty());
    messages = getMessages(numMessages, "warning 2");
    REQUIRE(!messages.empty());
    messages = getMessages();
    REQUIRE(!messages.empty());
}


TEST_CASE("Test GEPASI", "[copasijs][gepasi]")
{
    Instance instance;
    std::string model = loadFromFile(getTestFile("../example_files/YeastGlycolysis.gps"));
    REQUIRE(!model.empty());
    REQUIRE(model != "Error loading model");
    
    REQUIRE(runTask("Time-Course", true));

    std::string results = getSimulationResults();
    CAPTURE(results);
    REQUIRE(!results.empty());

}

TEST_CASE("Test LNA failure", "[copasijs][lna]")
{
  Instance instance;
  std::string model = loadCombineArchive(getTestFile("../example_files/Elowitz.omex"));
  REQUIRE(!model.empty());
  REQUIRE(model != "Error loading model");

  REQUIRE(runLNA(true) == false);

  std::string messages = getLNAResults(false);
  CAPTURE(messages);
  REQUIRE(!messages.empty());

}


TEST_CASE("Test LNA error", "[copasijs][lna]")
{
  Instance instance;
  std::string model = loadFromFile(getTestFile("../example_files/LM-test1.cps"));
  REQUIRE(!model.empty());
  REQUIRE(model != "Error loading model");

  REQUIRE(runLNA(true) == false);

  std::string messages = getMessages(0);

  std::string results = getLNAResults();
  CAPTURE(results);
  REQUIRE(!results.empty());

  // now convert and try again

  results = convertToIrreversible();
  CAPTURE(results);
  REQUIRE(!results.empty());

  REQUIRE(runLNA(true));
  results = getLNAResults();
  CAPTURE(results);
  REQUIRE(!results.empty());

  std::string settings = getLNASettings();
  CAPTURE(settings);
  REQUIRE(!settings.empty());

  REQUIRE(setLNASettings(settings));


}


int main(int argc, char *argv[])
{
  CRootContainer::init(0, NULL);

  int result = Catch::Session().run(argc, argv);

  CRootContainer::destroy();

  return result;
}