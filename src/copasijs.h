#ifndef COPASIJS_H
#define COPASIJS_H

#include <copasi/CopasiTypes.h>
#include <copasi/utilities/CVersion.h>
#include <copasi/utilities/CCopasiException.h>
#include <copasi/report/CDataHandler.h>

#include "json.hpp"

#include <sstream>

/// @brief returns the version of the COPASI library
std::string getVersion();

/// @brief returns all messages from the COPASI library
std::string getMessages();

/// @brief sets the selection list
/// @param selectionList the selection list
///
/// The selection list controlls which values are returned by the
/// simulation. 
/// 
/// @see getSelectionList, getSelectionValues
///
void setSelectionList(const std::vector<std::string>& selectionList);

/// @return the current selection list
std::vector<std::string> getSelectionList();

/// @return the current selected values
std::vector<double> getSelectionValues();

/// @brief gets the selection list
std::vector<std::string> getSelectionList();

/// @brief builds a model info object
/// @return the model info as json object
///
/// The info object will be in the following 
/// format:
///
/// ```json
/// {
///  "species": [
///    {
///      "compartment": "compartment",
///      "concentration": 2.9999959316797846,
///      "id": "",
///      "initial_concentration": 2.9999959316797846,
///      "initial_particle_number": 1.80664e+21,
///      "name": "X",
///      "particle_number": 1.80664e+21,
///      "type": "reactions"
///    },
///    ...
///  ],
///  "compartments": [
///    {
///      "id": "",
///      "name": "compartment",
///      "size": 1.0,
///      "type": "fixed"
///    },
///    ...
///  ],
///  "reactions": [
///    {
///      "id": "",
///      "local_parameters": [
///        {
///          "name": "k1",
///          "value": 1.0
///        }
///      ],
///      "name": "R1",
///      "reversible": false,
///      "scheme": "A -> X"
///    },
///    ...
///  ],
///  "global_parameters": [],
///  "time": 0.0,
///  "model": {
///    "name": "The Brusselator",
///    "notes": ""
///    }
///  "status": "success",
///  "messages": ""
///  }
/// ```
nlohmann::ordered_json buildModelInfo();

/// @brief gets the model info object as string
/// @see buildModelInfo
std::string getModelInfo();

/// @brief loads a model from a file
/// @param modelFile the file to load
/// @return the model info as string
std::string loadFromFile(const std::string& modelFile);

/// @brief loads a model from a string
/// @param modelString the model as string can be sbml or copasi format
/// @return the model info as string
std::string loadModel(const std::string& modelString);

/// @brief resets the model
///
/// This function resets the model to the state after loading
/// the model. 
void reset();

/// @brief applies a yaml string to the model
/// @param yaml the yaml string to apply
///
///
/// The problem / method options as returned by @see getTimeCourseSettings
/// To change initial condictions you would use:
///
/// ```json
/// {
///  "initial_values":
///    {
///      "name": value,
///      ...
///    }
/// }
/// ```
///
///  where `name` would be the display name of the element to change. If no 
/// specific reference is used, the initial concentration will be changed 
/// for species, and initial values for all other model entities. 
///
/// The syntax to use for specific references would be: `[A]_0` for the initial 
/// concentration of species `A`, `Values[t].InitialValue` for the initial value
/// of a global parameter or `(r1).k` for the local parameter `k` of reaction `r1`.
void applyYaml(nlohmann::ordered_json& yaml);

/// @brief returns the last simulation result from the
/// time series object as 2D double vector
std::vector<std::vector<double>> getSimulationResults2D();

/// @brief runs the steady state task and returns the 
/// closeness to steady state as result. 
/// @return the closeness to steady state
double steadyState();

/// @brief runs a simulation and returns the result as json string
/// @param yaml the yaml string with the simulation settings and possibly 
/// changed initial values the format is the same as @see applyYaml
/// @return the result as json string in the following format
///
/// ```json
/// {
///     "num_variables": 3,
///     "recorded_steps": 11,
///     "titles": [
///       "Time",
///       ...
///     ],
///     "columns": [
///       [
///         0.0,
///         1.0,
///         ...
///       ],
///       ...
///     ]
/// }
/// ```
///
std::string simulateYaml(const std::string& processingYaml);

/// @brief runs a simulation and returns the result as json string
///
/// This function uses the current model state and the current time course settings
/// @see getTimeCourseSettings
///
/// @return the result as json string in the following format
///
/// ```json
/// {
///     "num_variables": 3,
///     "recorded_steps": 11,
///     "titles": [
///       "Time",
///       ...
///     ],
///     "columns": [
///       [
///         0.0,
///         1.0,
///         ...
///       ],
///       ...
///     ]
/// }
/// ```
///
std::string simulate();

/// @brief runs a simulation and returns the result as json string
/// @param timeStart the start time of the simulation
/// @param timeEnd the end time of the simulation
/// @param numPoints the number of points to calculate
/// @return the result as json string in the following format
///
/// ```json
/// {
///     "num_variables": 3,
///     "recorded_steps": 11,
///     "titles": [
///       "Time",
///       ...
///     ],
///     "columns": [
///       [
///         0.0,
///         1.0,
///         ...
///       ],
///       ...
///     ]
/// }
/// ```
///
std::string simulateEx(double timeStart, double timeEnd, int numPoints);

/// @brief runs a simulation for one outputstep
///
/// This is just a convenience function equivalent of running 
/// simulateEx(startTime, startTime + stepSize, 1)
///
/// @return the end time of the simulation
double oneStep(double startTime, double stepSize);

/// @brief returns the time course settings as json string
/// @return the json string with the following format
///
/// ```json
/// {
/// "problem": {
///   "AutomaticStepSize": false,
///   "StepNumber": 200,
///   "StepSize": 0.5,
///   "Duration": 100.0,
///   "TimeSeriesRequested": true,
///   "OutputStartTime": 2.0,
///   "Output Event": false,
///   "Start in Steady State": false,
///   "Use Values": false,
///   "Values": "",
///   "Continue on Simultaneous Events": false
/// },
/// "method": {
///   "Integrate Reduced Model": true,
///   "Relative Tolerance": 1e-06,
///   "Absolute Tolerance": 1e-12,
///   "Max Internal Steps": 10000,
///   "Max Internal Step Size": 0.0,
///   "name": "Deterministic (LSODA)"
/// }
/// ```
///
std::string getTimeCourseSettings();

/// @brief sets the time course settings from a json string
/// @param settings the json string with the same format as @see getTimeCourseSettings
void setTimeCourseSettings(const std::string& settings);

/// @return the name of all reactions in the model
std::vector<std::string> getReactionNames();

/// @return the reaction rates
std::vector<double> getReactionRates();

/// @return the names of all floating species
std::vector<std::string> getFloatingSpeciesNames();

/// @return the concentrations of all floating species
std::vector<double> getFloatingSpeciesConcentrations();

/// @return the rates of change of all floating species
std::vector<double> getRatesOfChange();

/// @return the names of all boundary species
std::vector<std::string> getBoundarySpeciesNames();

/// @return the concentrations of all boundary species
std::vector<double> getBoundarySpeciesConcentrations();

/// @return the names of all compartments
std::vector<std::string> getCompartmentNames();

/// @return the sizes of all compartments
std::vector<double> getCompartmentSizes();

/// @return the names of all global parameters
std::vector<std::string> getGlobalParameterNames();

/// @return the values of all global parameters
std::vector<double> getGlobalParameterValues();

/// @brief returns local paramters names
/// 
/// The local parameter names will be (reaction name).(local parameter name)
/// 
/// @return the names of all local parameters
std::vector<std::string> getLocalParameterNames();

/// @return local paramters values
std::vector<double> getLocalParameterValues();


#pragma region  // internal calls Internal

/// @brief frees a pointer allocated by the COPASI library
void cpsFree(char *ptr);

/// @brief initializes the COPASI library 
///
/// This function also ensures that a data model exists
///
/// @return true if successful
int initCps();

/// @brief destroys the API, datamodel and root container
void destroyAPI();

/// @brief ensures that a data model exists
/// This will call @see initCps if necessary
void ensureModel();


/// @brief this function converts a parameter group to a json object
/// @param pGroup the parameter group to convert
/// @param basicOnly if true (default) only the basic information is converted
/// @return an ordered json object
nlohmann::ordered_json convertGroupToJson(CCopasiParameterGroup* pGroup, bool basicOnly = true);

/// @brief this function sets a parameter group from a json object
/// @param pGroup the parameter group to change
/// @param settings the json object with values to change
void setGroupFromJson(CCopasiParameterGroup* pGroup, nlohmann::ordered_json& settings);

/// @brief converts a data handler to a json object
nlohmann::ordered_json convertDataHandlerToJSON(const CDataHandler& dh);

/// @brief converts a time series to a json object
nlohmann::ordered_json convertTimeSeriesToJSON(const CTimeSeries& ts);

/// @brief fills a stream with the data from a time series
/// This generates Data in the form of a table (might not be needded anymore)
void fillStream(const CTimeSeries &ts, std::stringstream &str);

/// @brief helper method after loading from file / string
/// constructs a parameter set for the initial state, that is 
// used by the reset method to reset the model to the initial state. 
void loadCommon();

/// @brief runs a simulation and returns the result as json string
/// @param yaml the yaml object with the simulation settings and possibly 
/// changed initial values the format is the same as @see applyYaml
/// @return the result as json string in the following format
///
/// ```json
/// {
///     "num_variables": 3,
///     "recorded_steps": 11,
///     "titles": [
///       "Time",
///       ...
///     ],
///     "columns": [
///       [
///         0.0,
///         1.0,
///         ...
///       ],
///       ...
///     ]
/// }
/// ```
///
std::string simulateJSON(nlohmann::ordered_json& yaml);
#pragma endregion


#endif // COPASIJS_H