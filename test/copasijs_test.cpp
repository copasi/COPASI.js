#include <catch2/catch_test_macros.hpp>
#include <catch2/catch_approx.hpp>
#include <catch2/matchers/catch_matchers_vector.hpp>
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

TEST_CASE("Load Model", "[copasijs]") 
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

TEST_CASE("Load SBML Model", "[copasijs][sbml]")
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
    REQUIRE(value == 2);

    reset();
    setValue("S1", 1);

    data = simulateEx(0, 10, 11);
    CAPTURE(data);
    json = nlohmann::json::parse(data);
    REQUIRE(json["titles"][0] == "Time");
    REQUIRE(json["titles"][1] == "S1");
    REQUIRE(json["columns"][0].size() == json["recorded_steps"].get<int>());
    REQUIRE(json["columns"][1][0] == 1);

    // reset again and check that the value is back to 0
    reset();
    data = simulateEx(0, 10, 11);
    CAPTURE(data);
    json = nlohmann::json::parse(data);
    REQUIRE(json["titles"][1] == "S1");
    REQUIRE(json["columns"][1][0] == 0);

    setValue("J0_v0", 8);

    // test difference between reset and restAll by changing the value of S1 and J0_v0
    setValue("S1", 1);
    setValue("J0_v0", 10);

    reset();
    // now S1 should be 0 and J0_v0 should be 10
    REQUIRE(getValue("S1") == 0);
    REQUIRE(getValue("J0_v0") == 10);

    // now run resetAll
    setValue("S1", 1);
    setValue("J0_v0", 10);
    resetAll();
    // now S1 should be 0 and J0_v0 should be 8
    REQUIRE(getValue("S1") == 0);
    REQUIRE(getValue("J0_v0") == 8);

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
}


TEST_CASE("Load COVID Model", "[copasijs][mca]")
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
}

