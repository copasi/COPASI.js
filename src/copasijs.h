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
/// @param start the start index of the messages (default 0)
/// @param filter a filter to apply to the messages (messages containing this string will be skipped)
///        (default "" = no message will be skipped)
/// @return the messages as string
std::string getMessages(int start = 0, const std::string& filter="");

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


/// @brief loads a model from a COMBINE archive
/// @param modelFile the file to load
/// @return the model info as string
std::string loadCombineArchive(const std::string& modelFile);

/// @brief loads a model from a string
/// @param modelString the model as string can be sbml or copasi format
/// @return the model info as string
std::string loadModel(const std::string& modelString);

/// @brief resets the model
///
/// This function resets the models floating species and entities with 
/// ODEs back to their initial values.
void reset();

/// @brief resets the model completely
///
/// This function resets the model to the state after loading
/// the model. 
void resetAll();


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

/// @brief returns the status of the last stability analysis as string
/// @return the status of the last stability analysis as string
std::string getStabilityAnalysis();

/// @brief returns the steady state protocol as string
/// @return the steady state protocol as string
std::string getSteadyStateProtocol();

/// @brief performs metabolic control analysis
///
/// To retrieve the results use the following functions:
/// - @see getFluxControlCoefficients(bool scaled)
/// - @see getConcentrationControlCoefficients(bool scaled)
/// - @see getElasticities(bool scaled)
///
/// @param performSteadyState param indicating, whether the steady state
/// should be computed before the MCA computations
///
/// @return boolean indicating success
bool computeMca(bool performSteadyState=true);

/// @brief runs the Linear Noise Approximation task
/// @param useInitialValues if true the initial values are used, otherwise the current state is used
/// @return boolean indicating success
bool runLNA(bool useInitialValues=true);

/// @brief returns the status and results of the last LNA run as JSON string
/// @param scaled if true the scaled results are returned
/// @return JSON string with status, covariance_matrix, reduced_covariance_matrix, and reduced_b_matrix
///
/// ```json
/// {
///   "status": "Steady State found.",
///   "covariance_matrix": {
///     "rows": ["X", "Y", ...],
///     "columns": ["X", "Y", ...],
///     "values": [[...], ...]
///   },
///   "reduced_covariance_matrix": { ... },
///   "reduced_b_matrix": { ... }
/// }
/// ```
std::string getLNAResults(bool scaled=true);

/// @brief runs the Optimization task
/// @param useInitialValues if true the initial values are used, otherwise the current state is used
/// @return boolean indicating success
bool runOptimization(bool useInitialValues=true);


/// @brief  returns the names of the optimization items as JSON string
/// @return JSON array with the names of the optimization items
std::string getOptItems();

/// @brief returns the solution found for the optimization parameters as JSON string
/// @return JSON array with name, lower, upper, and sol for each parameter
///
/// ```json
/// [
///   {
///     "name": "Values[x1]",
///     "lower": -6.0,
///     "upper": 6.0,
///     "sol": 3.0
///   },
///   ...
/// ]
/// ```
std::string getOptSolution();

/// @brief returns information about the last optimization run as JSON string
/// @return JSON object with the statistic
///
/// ```json
/// {
///   "obj": 0.0,
///   "f_evals": 42,
///   "failed_evals_exception": 0,
///   "failed_evals_nan": 0,
///   "constraint_evals": 0,
///   "failed_constraint_evals": 0,
///   "cpu_time": 0.01,
///   "evals_per_sec": 4200.0
/// }
/// ```
std::string getOptStatistic();

/// @brief runs the Parameter Estimation task
/// @param useInitialValues if true the initial values are used, otherwise the current state is used
/// @return boolean indicating success
bool runParameterEstimation(bool useInitialValues=true);

/// @brief returns the solution found for the fit parameters as JSON string
/// @return JSON array with name, lower, upper, sol, and affected for each parameter
///
/// ```json
/// [
///   {
///     "name": "(R1).k2",
///     "lower": 1e-6,
///     "upper": 1e6,
///     "sol": 4.0,
///     "affected": []
///   },
///   ...
/// ]
/// ```
std::string getFitSolution();

/// @brief returns information about the last parameter estimation run as JSON string
/// @return JSON object with the fit statistic
///
/// ```json
/// {
///   "obj": 0.0,
///   "rms": 0.0,
///   "sd": 0.0,
///   "f_evals": 42,
///   "failed_evals_exception": 0,
///   "failed_evals_nan": 0,
///   "constraint_evals": 0,
///   "failed_constraint_evals": 0,
///   "cpu_time": 0.01,
///   "evals_per_sec": 4200.0,
///   "data_points": 100,
///   "valid_data_points": 100
/// }
/// ```
std::string getFitStatistic();


/// @brief returns the names of the fit items as JSON string
/// @return JSON array with the names of the fit items
std::string getFitItems();

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

/// @return the sbml ids of all reactions if defined
std::vector<std::string> getReactionIds();

/// @return the reaction rates
std::vector<double> getReactionRates();

/// @return the names of all floating species
std::vector<std::string> getFloatingSpeciesNames();

/// @return the sbml ids of all floating species if defined
std::vector<std::string> getFloatingSpeciesIds();

/// @return the concentrations of all floating species
std::vector<double> getFloatingSpeciesConcentrations();

/// @return the rates of change of all floating species
std::vector<double> getRatesOfChange();

/// @return the names of all boundary species
std::vector<std::string> getBoundarySpeciesNames();

/// @return the sbml ids of all boundary species if defined
std::vector<std::string> getBoundarySpeciesIds();

/// @return the concentrations of all boundary species
std::vector<double> getBoundarySpeciesConcentrations();

/// @return the names of all compartments
std::vector<std::string> getCompartmentNames();

/// @return the sbml ids of all compartments if defined
std::vector<std::string> getCompartmentIds();

/// @return the sizes of all compartments
std::vector<double> getCompartmentSizes();

/// @return the names of all global parameters
std::vector<std::string> getGlobalParameterNames();

/// @return the the sbml ids of all global parameters if defined
std::vector<std::string> getGlobalParameterIds();

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

/// @return the value of the selected symbol (lookup via name or sbml id)
/// @param nameOrId the symbol to look up (name or sbml id)
double getValue(const std::string& nameOrId);

/// @brief sets the value of the selected symbol
/// @param nameOrId the symbol to set (name or sbml id)
/// @param value the value to set
void setValue(const std::string& nameOrId, double value);

/// sets the value by display name
void setValueByName(const std::string& name, double value);

/// @brief returns the Jacobian at steady state as JSON string
/// @return the Jacobian as JSON string in the following format
///
/// ```json
/// {
///     "rows": ["X", "Y", ...],
///     "columns": ["X", "Y", ...],
///     "values": [
///         [1.0, 0.0, ...],
///         [0.0, 1.0, ...],
///         ...
///     ]
/// }
/// ```
std::string getJacobian();

/// @brief returns the Jacobian at steady state as 2D double vector
std::vector<std::vector<double>> getJacobian2D();

/// @brief returns the eigenvalues of the Jacobian at steady state as 2D double vector
std::vector<std::vector<double>> getEigenValues2D();

/// @brief returns the reduced Jacobian at steady state as JSON string
/// @return the Jacobian as JSON string in the following format
///
/// ```json
/// {
///     "rows": ["X", "Y", ...],
///     "columns": ["X", "Y", ...],
///     "values": [
///         [1.0, 0.0, ...],
///         [0.0, 1.0, ...],
///         ...
///     ]
/// }
/// ```
std::string getJacobianReduced();


/// @brief returns the reduced Jacobian at steady state as JSON string
/// @param reduced if true the reduced Jacobian is returned, otherwise the full Jacobian is returned
/// @return the Jacobian as JSON string in the following format
///
/// ```json
/// {
///     "rows": ["X", "Y", ...],
///     "columns": ["X", "Y", ...],
///     "values": [
///         [1.0, 0.0, ...],
///         [0.0, 1.0, ...],
///         ...
///     ]
/// }
/// ```
std::string getStoichiometryMatrix(bool reduced = false);

/// @brief returns the stoichiometry matrix as JSON string
/// @return the stoichiometry matrix as JSON string in the following format
///
/// ```json
/// {
///     "rows": ["X", "Y", ...],
///     "columns": ["X", "Y", ...],
///     "values": [
///         [1.0, 0.0, ...],
///         [0.0, 1.0, ...],
///         ...
///     ]
/// }
/// ```
std::string getLinkMatrix();

/// @brief returns the reduced Jacobian at steady state as 2D double vector
std::vector<std::vector<double>> getJacobianReduced2D();

/// @brief returns the reduced eigenvalues of the Jacobian at steady state as 2D double vector
std::vector<std::vector<double>> getEigenValuesReduced2D();

/// @brief returns the flux control coefficients as JSON string
/// @param scaled if true the scaled coefficients are returned
std::string getFluxControlCoefficients(bool scaled);

/// @brief returns the flux control coefficients as 2D double vector
/// @param scaled if true the scaled coefficients are returned
std::vector<std::vector<double>> getFluxControlCoefficients2D(bool scaled);

/// @brief returns the concentration control coefficients as JSON string
/// @param scaled if true the scaled coefficients are returned
std::string getConcentrationControlCoefficients(bool scaled);

/// @brief returns the concentration control coefficients as 2D double vector
/// @param scaled if true the scaled coefficients are returned
std::vector<std::vector<double>> getConcentrationControlCoefficients2D(bool scaled);

/// @brief returns the elasticities as JSON string
/// @param scaled if true the scaled elasticities are returned
std::string getElasticities(bool scaled);

/// @brief returns the elasticities as 2D double vector
/// @param scaled if true the scaled elasticities are returned
std::vector<std::vector<double>> getElasticities2D(bool scaled);

/// @brief returns the last recorded messages from the COPASI library
/// @return the last recorded messages as a string
std::string getLastMessages();

/// @brief clears the last recorded messages from the COPASI library
void clearMessages();

/// @brief returns the settings of a task as json string
/// @param taskName the name of the task to get
/// @return the settings of the task as json string
std::string getTaskSettings(const std::string& taskName);

/// @brief sets the settings of a task from a json string
/// @param taskName the name of the task to set
/// @param settings the settings as json string
/// @return true if successful
bool setTaskSettings(const std::string& taskName, const std::string& settings);

/// @brief returns the names of all available methods for a task
/// @param taskName the name of the task to get the methods for
/// @return the names of all available methods for the task
std::vector<std::string> getAvailableMethods(const std::string& taskName);

/// @brief sets the method of a task
/// @param taskName the name of the task to set the method for
/// @param methodName the name of the method to set @see getAvailableMethods for available methods
/// @return true if successful
bool setMethod(const std::string& taskName, const std::string& methodName);


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

CDataObject* resolveMcaObject(const std::string& item);
#pragma endregion


#endif // COPASIJS_H