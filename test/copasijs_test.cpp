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
