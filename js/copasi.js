/**
 * @class COPASI
 * 
 * This class wraps all the functions exported from
 * emscripten and provides a more convenient interface.
 */
class COPASI {

    /**
     * @enum {string} TC
     * 
     * enum for method names
     * 
     * @property {string} LSODA Deterministic (LSODA)
     * @property {string} RADAU5 Deterministic (RADAU5)
     * @property {string} DIRECT_METHOD Stochastic (Direct method)
     * @property {string} GIBSON_BRUCK Stochastic (Gibson + Bruck)
     * @property {string} TAULEAP Stochastic (τ-Leap)
     */
    TC = {
        LSODA: 'Deterministic (LSODA)',
        RADAU5: 'Deterministic (RADAU5)',
        DIRECT_METHOD: 'Stochastic (Direct method)',
        GIBSON_BRUCK: 'Stochastic (Gibson + Bruck)',
        TAULEAP: 'Stochastic (τ-Leap)',
    };

    /**
     * @enum {string} TaskNames
     * 
     * enum for task names
     * 
     * @property {string} TimeCourse Time-Course
     * @property {string} SteadyState Steady State
     * @property {string} MetabolicControlAnalysis Metabolic Control Analysis
     * @property {string} LinearNoiseApproximation Linear Noise Approximation
     */
    TaskNames = {
        TimeCourse: 'Time-Course',
        SteadyState: 'Steady-State',
        MetabolicControlAnalysis: 'Metabolic Control Analysis',
        LinearNoiseApproximation: 'Linear Noise Approximation',
    };

    /**
     * Constructs a new COPASI instance from the WASM module
     * @param {object} Module the WASM module
     * 
     */
    constructor(Module) {
        this.Module = Module;

        // init runtime
        this.initCps();
    }

    /**
     * Initializes the COPASI library and ensures that a data model exists.
     *
     * Called automatically by the constructor.
     *
     * @returns {number} 0 if successful, -1 otherwise
     */
    initCps() {
        return this.Module.initCps();
    }

    /**
     * Destroys the API, data model and root container.
     */
    destroy() {
        this.Module.destroy();
    }

    /**
     * Returns the version of the COPASI library.
     *
     * @returns {string} the COPASI version
     */
    getVersion() {
        return this.Module.getVersion();
    }

    /**
     * Returns messages from the COPASI library.
     *
     * @param {number} [start=0] the start index of the messages
     * @param {string} [filter=""] messages containing this string will be skipped
     *        (default `""` = no message will be skipped)
     * @returns {string} the messages as string
     */
    getMessages(start = 0, filter = "") {
        return this.Module.getMessages(start, filter);
    }

    /**
     * Looks up the value of a model element by name or SBML id.
     *
     * @param {string} nameOrId the symbol to look up (name or SBML id)
     * @returns {number} the value of the selected symbol
     */
    getValue(nameOrId) {
        return this.Module.getModelValue(nameOrId);
    }

    /**
     * Sets the value of a model element by name or SBML id.
     *
     * @param {string} nameOrId the symbol to set (name or SBML id)
     * @param {number} value the value to set
     */
    setValue(nameOrId, value) {
        this.Module.setModelValue(nameOrId, value);
    }

    /**
     * Resets the model to the state after loading.
     *
     * Unlike {@link COPASI#reset}, this restores the full initial state
     * captured when the model was loaded.
     */
    resetAll() {
        this.Module.resetAll();
    }

    /**
     * Runs a simulation for one output step.
     *
     * This is a convenience function equivalent to
     * `simulateEx(startTime, startTime + stepSize, 1)`.
     *
     * @param {number} startTime the start time of the step
     * @param {number} stepSize the size of the step
     * @returns {number} the end time of the simulation
     */
    oneStep(startTime, stepSize) {
        return this.Module.oneStep(startTime, stepSize);
    }

    /**
     * loads an example (if the WASM module was compiled with FS support)
     * 
     * @param {string} path 
     * @returns model information as an object
     */
    loadExample(path) 
    {
        return JSON.parse(this.Module.loadFromFile(path));
    }

    /**
     * Loads a model from a string containing the model in 
     * SBML or COPASI format. 
     * 
     * @param {string} modelCode in SBML or COPASI format
     * @returns model information as an object
     */
    loadModel(modelCode)
    {
        return JSON.parse(this.Module.loadModel(modelCode));
    }

    /**
     * Loads a model from a COMBINE archive.
     *
     * @param {string} path the path to the COMBINE archive
     * @returns model information as an object
     */
    loadCombineArchive(path)
    {
        return JSON.parse(this.Module.loadCombineArchive(path));
    }

    /**
     * simulates the currently loaded model with its current 
     * time course settings.
     * 
     * @returns {object} simulation results as object
     */
    simulate() {
        return JSON.parse(this.Module.simulate());
    }

    /**
     * simulates the currently loaded model with its current 
     * time course settings.
     * 
     * @returns {number[][]} simulation results as 2D array
     */
    simulate2D() {
        this.Module.simulate();
        return this._vector2dToArray(this.Module.getSimulationResults2D());
    }

    /**
     * simulates the currently loaded model from startTime to 
     * endTime with numPoints points.
     * 
     * @param {number} startTime
     * @param {number} endTime
     * @param {number} numPoints
     * 
     * @returns {object} simulation results as object
     */
    simulateEx(startTime, endTime, numPoints) {
        return JSON.parse(this.Module.simulateEx(startTime, endTime, numPoints));
    }

    /**
     * simulates the currently loaded model from startTime to 
     * endTime with numPoints points.
     * 
     * @param {number} startTime
     * @param {number} endTime
     * @param {number} numPoints
     * 
     * @returns {number[][]} simulation results as 2D array
     */
    simulateEx2D(startTime, endTime, numPoints) {
        this.Module.simulateEx(startTime, endTime, numPoints);
        return this._vector2dToArray(this.Module.getSimulationResults2D());
    }

    /**
     * simulates the currently loaded model after applying
     * the processing instructions.
     *
     * The problem / method options are the same as returned by
     * {@link COPASI#timeCourseSettings}. To change initial conditions:
     *
     * ```json
     * {
     *  "initial_values":
     *    {
     *      "name": value,
     *      ...
     *    }
     * }
     * ```
     *
     * If no specific reference is used, the initial concentration will be
     * changed for species, and initial values for all other model entities.
     * Specific references use COPASI display names, e.g. `[A]_0` for the
     * initial concentration of species `A`, `Values[t].InitialValue` for a
     * global parameter, or `(r1).k` for the local parameter `k` of reaction `r1`.
     * 
     * @param {object|string} yamlProcessingOptions
     * @returns {object} simulation results as object
     */
    simulateYaml(yamlProcessingOptions) {
        if (typeof yamlProcessingOptions !== 'string') {
            yamlProcessingOptions = JSON.stringify(yamlProcessingOptions);
        }
        return JSON.parse(this.Module.simulateYaml(yamlProcessingOptions));
    }

    /**
     * simulates the currently loaded model after applying
     * the processing instructions.
     *
     * The processing options are the same as for {@link COPASI#simulateYaml}.
     * 
     * @param {object|string} yamlProcessingOptions
     * @returns {number[][]} simulation results as 2D array
     */
    simulateYaml2D(yamlProcessingOptions) {
        if (typeof yamlProcessingOptions !== 'string') {
            yamlProcessingOptions = JSON.stringify(yamlProcessingOptions);
        }
        this.Module.simulateYaml(yamlProcessingOptions);
        return this._vector2dToArray(this.Module.getSimulationResults2D());
    }

    /**
     * resets the model
     * 
     * after loading the model, its state was saved as parameterset, 
     * calling reset will apply that parameter set.
     */
    reset() {
        // Add code here to reset the simulator
        this.Module.reset();
    }


    /**
     * @property {string} version returns the COPASI version
     * 
     * @example
     * var copasi = new COPASI(Module);
     * console.log(copasi.version);
     * // prints something like:
     * // 4.32.284
     */
    get version() {
        return this.Module.getVersion();
    }

    /**
     * @property {boolean} autoUpdateModel whether simulations automatically update the model
     * @param {boolean} value the value to set
     */
    get autoUpdateModel() {
        return this.Module.getAutoUpdateModel();
    }

    set autoUpdateModel(value) {
        this.Module.setAutoUpdateModel(value);
    }

    /**
     * Converts a WASM vector to a JavaScript array.
     * @private
     * @param {object} v WASM vector
     * @returns {Array} the converted array
     */
    _vectorToArray(v) {
        var result = [];
        for (var i = 0; i < v.size(); i++) {
            result.push(v.get(i));
        }
        return result;
    }

    /**
     * Converts a WASM 2D vector to a JavaScript 2D array.
     * @private
     * @param {object} v WASM 2D vector
     * @returns {Array[]} the converted 2D array
     */
    _vector2dToArray(v) {
        var result = [];
        for (var i = 0; i < v.size(); i++) {
            result.push(this._vectorToArray(v.get(i)));
        }
        return result;
    }

    /**
     * @property {number[]} floatingSpeciesConcentrations returns floating species concentrations
     */
    get floatingSpeciesConcentrations() {
        return this._vectorToArray(this.Module.getFloatingSpeciesConcentrations());
    }

    /**
     * @property {number[]} ratesOfChange returns rates of change of floating species
     */
    get ratesOfChange() {
        return this._vectorToArray(this.Module.getRatesOfChange());
    }

    /**
     * @property {string[]} floatingSpeciesNames returns floating species names
     */
    get floatingSpeciesNames() {
        return this._vectorToArray(this.Module.getFloatingSpeciesNames());
    }

    /**
     * @property {string[]} floatingSpeciesIds returns floating species ids
     */
    get floatingSpeciesIds() {
        return this._vectorToArray(this.Module.getFloatingSpeciesIds());
    }

    /**
     * @property {number[]} boundarySpeciesConcentrations returns boundary species concentrations
     */
    get boundarySpeciesConcentrations() {
        return this._vectorToArray(this.Module.getBoundarySpeciesConcentrations());
    }

    /**
     * @property {string[]} boundarySpeciesNames returns boundary species names
     */
    get boundarySpeciesNames() {
        return this._vectorToArray(this.Module.getBoundarySpeciesNames());
    }

    /**
     * @property {string[]} boundarySpeciesIds returns boundary species ids
     */
    get boundarySpeciesIds() {
        return this._vectorToArray(this.Module.getBoundarySpeciesIds());
    }

    /**
     * @property {string[]} reactionNames returns reaction names
     */
    get reactionNames() {
        return this._vectorToArray(this.Module.getReactionNames());
    }
    
    /**
     * @property {string[]} reactionIds returns reaction ids
     */
    get reactionIds() {
        return this._vectorToArray(this.Module.getReactionIds());
    }
    /**
     * @property {number[]} reactionRates returns reaction rates
     */
    get reactionRates() {
        return this._vectorToArray(this.Module.getReactionRates());
    }

    /**
     * @property {string[]} compartmentNames returns compartment names
     */
    get compartmentNames() {
        return this._vectorToArray(this.Module.getCompartmentNames());
    }

    /**
     * @property {string[]} compartmentIds returns compartment ids
     */
    get compartmentIds() {
        return this._vectorToArray(this.Module.getCompartmentIds());
    }
    /**
     * @property {number[]} compartmentSizes returns compartment sizes
     */
    get compartmentSizes() {
        return this._vectorToArray(this.Module.getCompartmentSizes());
    }

    /**
     * @property {string[]} globalParameterNames returns global parameter names
     */
    get globalParameterNames() {
        return this._vectorToArray(this.Module.getGlobalParameterNames());
    }

    /**
     * @property {string[]} globalParameterIds returns global parameter ids
     */
    get globalParameterIds() {
        return this._vectorToArray(this.Module.getGlobalParameterIds());
    }
    /**
     * @property {number[]} globalParameterValues returns global parameter values
     */
    get globalParameterValues() {
        return this._vectorToArray(this.Module.getGlobalParameterValues());
    }

    /**
     * @property {string[]} localParameterNames returns local parameter names
     * 
     * Local parameter names, consist of the reaction name in brackets, followed by a dot 
     * and the parameter name. So for example: `(reaction1).k1` for the 
     * local parameter `k1` of the reaction `reaction1`.
     */
    get localParameterNames() {
        return this._vectorToArray(this.Module.getLocalParameterNames());
    }

    /**
     * @property {number[]} localParameterValues returns local parameter values
     */
    get localParameterValues() {
        return this._vectorToArray(this.Module.getLocalParameterValues());
    }

    /**
     * @property {object} timeCourseSettings returns the time course settings as json object
     * 
     * @param {object|string} arg the time course settings to set
     */
    get timeCourseSettings() {
        return JSON.parse(this.Module.getTimeCourseSettings());
    }

    set timeCourseSettings(arg) {
        // test wether arg is string, otherwise stringify
        if (typeof arg !== 'string') {
            arg = JSON.stringify(arg);
        }
        return this.Module.setTimeCourseSettings(arg);
    }

    /**
     * @property {object} modelInfo model information as object
     */
    get modelInfo() {
        return JSON.parse(this.Module.getModelInfo());
    }

    /**
     * @property {string[]} selectionList returns the selection list
     * 
     * The selection list controls what will be in the output of the 
     * simulation calls. 
     */
    get selectionList() {
        return this._vectorToArray(this.Module.getSelectionList());
    }

    set selectionList(arg) 
    {
        var vector = new this.Module.StringVector();
        arg.forEach((item) => vector.push_back(item));
        return this.Module.setSelectionList(vector);
    }

    /**
     * @property {number[]} selectedValues returns the selected values
     */
    get selectedValues() {
        return this._vectorToArray(this.Module.getSelectedValues());
    }

    /**
     * @property {object} jacobian the jacobian as object
     */
    get jacobian() {
        return JSON.parse(this.Module.getJacobian());
    }

    /**
     * @property {number[][]} jacobian2D returns the jacobian as 2D array
     */
    get jacobian2D() {
        return this._vector2dToArray(this.Module.getJacobian2D());
    }

    /**
     * @property { number[][]} eigenValues2D returns the eigenvalues as 2D array
     */
    get eigenValues2D() {
        return this._vector2dToArray(this.Module.getEigenValues2D());
    }

    /**
     * @property {object} reducedJacobian the reduced jacobian as object
     */
    get reducedJacobian() {
        return JSON.parse(this.Module.getJacobianReduced());
    }

    /**
     * @property {number[][]} reducedJacobian2D returns the reduced jacobian as 2D array
     */
    get reducedJacobian2D() {
        return this._vector2dToArray(this.Module.getJacobianReduced2D());
    }

    /**
     * @property { number[][]} eigenValuesReduced2D returns the eigenvalues of the reduced Jacobian as 2D array
     */
    get eigenValuesReduced2D() {
        return this._vector2dToArray(this.Module.getEigenValuesReduced2D());
    }

    /**
     * Retrieves the flux control coefficients for the model 
     * 
     * Note that computeMca must be called before this method
     * 
     * @param {bool} scaled indicating whether the scaled (true) or unscaled coefficients should be returned 
     * @returns {object} the flux control coefficients as object
     */
    getFluxControlCoefficients(scaled)
    {
        return JSON.parse(this.Module.getFluxControlCoefficients(scaled));
    }

    /**
     * Retrieves the flux control coefficients for the model as 2d array
     *
     * Note that computeMca must be called before this method
     *
     * @param {bool} scaled indicating whether the scaled (true) or unscaled coefficients should be returned 
     * @returns {number[][]} the flux control coefficients as 2D array
     */
    getFluxControlCoefficients2D(scaled)
    {
        return this._vector2dToArray(this.Module.getFluxControlCoefficients2D(scaled));
    }
    
    /**
     * Retrieves the concentration control coefficients for the model 
     * 
     * Note that computeMca must be called before this method
     * 
     * @param {bool} scaled indicating whether the scaled (true) or unscaled coefficients should be returned 
     * @returns {object} the concentration control coefficients as object
     */
    getConcentrationControlCoefficients(scaled)
    {
        return JSON.parse(this.Module.getConcentrationControlCoefficients(scaled));
    }

    /**
     * Retrieves the concentration control coefficients for the model as 2d array
     *
     * Note that computeMca must be called before this method
     *
     * @param {bool} scaled indicating whether the scaled (true) or unscaled coefficients should be returned 
     * @returns {number[][]} the concentration control coefficients as 2D array
     */
    getConcentrationControlCoefficients2D(scaled)
    {
        return this._vector2dToArray(this.Module.getConcentrationControlCoefficients2D(scaled));
    }

    /**
     * Retrieves the elasticities
     *
     * Note that computeMca must be called before this method
     * 
     * @param {bool} scaled indicating whether the scaled (true) or unscaled coefficients should be returned 
     * @returns {object} the elasticites as object
     */
    getElasticities(scaled)
    {
        return JSON.parse(this.Module.getElasticities(scaled));
    }

    /**
     * @property {object} simulationResults returns the simulation results as object
     * 
     * Note that the time course tasks should have run first.
     */
    get simulationResults() {
        return JSON.parse(this.Module.getSimulationResults());
    }

    /**
     * Retrieves the elasticities as 2d array
     *
     * Note that computeMca must be called before this method
     * 
     * @param {bool} scaled indicating whether the scaled (true) or unscaled coefficients should be returned 
     * @returns {number[][]} the elasticities as 2D array
     */
    getElasticities2D(scaled)
    {
        return this._vector2dToArray(this.Module.getElasticities2D(scaled));
    }

    /**
     * Runs steady-state analysis.
     *
     * @param {boolean} stabilityAnalysis whether to perform stability analysis
     * @param {boolean} updateModel whether to update the model with steady-state values
     * @returns {number} closeness to steady state
     */
    steadyState(stabilityAnalysis = true, updateModel = true)
    {
        return this.Module.steadyState(stabilityAnalysis, updateModel);
    }

    /**
     * Computes metabolic control analysis.
     *
     * @param {boolean} performSteadyState whether to compute steady state first
     * @param {boolean} updateModel whether to update the model
     * @returns {boolean} true if MCA completed successfully
     */
    computeMca(performSteadyState = true, updateModel = true)
    {
        return this.Module.computeMca(performSteadyState, updateModel);
    }

    /**
     * Runs the Linear Noise Approximation
     * @param {bool} useInitialValues indicating whether the initial values should be used
     * @returns {boolean} true if the LNA was run successfully
     */
    runLNA(useInitialValues = true)
    {
        return this.Module.runLNA(useInitialValues);
    }

    /**
     * Retrieves the results of the Linear Noise Approximation
     * @param {bool} scaled indicating whether the scaled (true) or unscaled results should be returned
     * @returns {object} the results of the LNA as object
     *
     * ```json
     * {
     *   "status": "Steady State found.",
     *   "covariance_matrix": {
     *     "rows": ["X", "Y"],
     *     "columns": ["X", "Y"],
     *     "values": [[...], ...]
     *   },
     *   "reduced_covariance_matrix": { ... },
     *   "reduced_b_matrix": { ... }
     * }
     * ```
     */
    getLNAResults(scaled = true)
    {
        return JSON.parse(this.Module.getLNAResults(scaled));
    }

    /**
     * Retrieves the task setttings for the given task
     * @param {string} taskName the name of the task to get
     * @returns {object} the settings of the task as object
     */
    getTaskSettings(taskName)
    {
        return JSON.parse(this.Module.getTaskSettings(taskName));
    }
    
    /** 
     * Sets the task settings for the given task
     * @param {string} taskName the name of the task to set
     * @param {object|string} settings the settings as object or json string
     * @returns {boolean} true if successful
     */
    setTaskSettings(taskName, settings)
    {
        if (typeof settings !== 'string') {
            settings = JSON.stringify(settings);
        }
        return this.Module.setTaskSettings(taskName, settings);
    }
    
    /**
     * Clears the last recorded messages from the COPASI library
     */
    clearMessages()
    {
        this.Module.clearMessages();
    }

    /**
     * Returns the status of the last stability analysis.
     *
     * @returns {string} the status of the last stability analysis
     */
    getStabilityAnalysis() {
        return this.Module.getStabilityAnalysis();
    }

    /**
     * Returns the steady state protocol.
     *
     * @returns {string} the steady state protocol
     */
    getSteadyStateProtocol() {
        return this.Module.getSteadyStateProtocol();
    }

    /**
     * Returns the status of the last steady-state run.
     *
     * @returns {string} the status of the last steady-state run
     */
    getSteadyStateStatus() {
        return this.Module.getSteadyStateStatus();
    }

    /**
     * Returns the names of all available methods for a task.
     *
     * @param {string} taskName the name of the task to get the available methods for
     * @returns {string[]} the names of all available methods for the task
     */
    getAvailableMethods(taskName) {
        return this._vectorToArray(this.Module.getAvailableMethods(taskName));
    }

    /**
     * Sets the method for the given task
     * @param {string} taskName the name of the task to set the method for
     * @param {string} methodName the name of the method to set
     * @returns {boolean} true if successful
     */
    setMethod(taskName, methodName) {
        return this.Module.setMethod(taskName, methodName);
    }

    /**
     * @property {object} stoichiometryMatrix the stoichiometry matrix as object
     */
    get stoichiometryMatrix() {
        return JSON.parse(this.Module.getStoichiometryMatrix(false));
    }

    /**
     * @property {object} reduced stoichiometryMatrix the stoichiometry matrix as object
     */
    get reducedStoichiometryMatrix() {
        return JSON.parse(this.Module.getStoichiometryMatrix(true));
    }


    /**
     * @property {object} linkMatrix the link matrix as object
     */
    get linkMatrix() {
        return JSON.parse(this.Module.getLinkMatrix());
    }

    /**
     * runs the optimization task with the current settings
     * @param {boolean} useInitialValues whether to use initial values
     * @returns {boolean} true if successful
     */
    runOptimization(useInitialValues = true) {
        return this.Module.runOptimization(useInitialValues);
    }


    /** 
     * @property {object} optItems returns the optimization items as object
     */
    get optItems() {
        return JSON.parse(this.Module.getOptItems());
    }

    /**
     * @property {object} optSolution the optimization solution
     *
     * ```json
     * [
     *   {
     *     "name": "Values[x1]",
     *     "lower": -6.0,
     *     "upper": 6.0,
     *     "sol": 3.0
     *   }
     * ]
     * ```
     */
    get optSolution() {
        return JSON.parse(this.Module.getOptSolution());
    }

    /**
     * @property {object} optStatistic information about the last optimization run
     *
     * ```json
     * {
     *   "obj": 0.0,
     *   "f_evals": 42,
     *   "failed_evals_exception": 0,
     *   "failed_evals_nan": 0,
     *   "constraint_evals": 0,
     *   "failed_constraint_evals": 0,
     *   "cpu_time": 0.01,
     *   "evals_per_sec": 4200.0
     * }
     * ```
     */
    get optStatistic() {
        return JSON.parse(this.Module.getOptStatistic());
    }

    /**
     * runs the parameter estimation task with the current settings
     * @param {boolean} useInitialValues whether to use initial values
     * @returns {boolean} true if successful
     */
    runParameterEstimation(useInitialValues = true) {
        return this.Module.runParameterEstimation(useInitialValues);
    }

    
    /**
     * @property {object} fitSolution the solution found for the fit parameters
     *
     * ```json
     * [
     *   {
     *     "name": "(R1).k2",
     *     "lower": 1e-6,
     *     "upper": 1e6,
     *     "sol": 4.0,
     *     "affected": []
     *   }
     * ]
     * ```
     */
    get fitSolution() {
        return JSON.parse(this.Module.getFitSolution());
    }

    /**
     * @property {object} fitItems returns the fit items as object
     */
    get fitItems() {
        return JSON.parse(this.Module.getFitItems());
    }

    /**
     * @property {object} fitStatistic information about the last parameter estimation run
     *
     * ```json
     * {
     *   "obj": 0.0,
     *   "rms": 0.0,
     *   "sd": 0.0,
     *   "f_evals": 42,
     *   "failed_evals_exception": 0,
     *   "failed_evals_nan": 0,
     *   "constraint_evals": 0,
     *   "failed_constraint_evals": 0,
     *   "cpu_time": 0.01,
     *   "evals_per_sec": 4200.0,
     *   "data_points": 100,
     *   "valid_data_points": 100
     * }
     * ```
     */
    get fitStatistic() {
        return JSON.parse(this.Module.getFitStatistic());
    }

    /**
     * @property {object} fitSettings settings for the parameter estimation task
     *
     * In addition to the fields returned by {@link COPASI#getTaskSettings},
     * this includes the fit items, constraints and data filenames.
     */
    get fitSettings() {
        return JSON.parse(this.Module.getFitSettings());
    }

    /**
     * @property {object} optSettings settings for the optimization task
     *
     * In addition to the fields returned by {@link COPASI#getTaskSettings},
     * this includes the objective function, subtask, optimization items
     * and constraints.
     */
    get optSettings() {
        return JSON.parse(this.Module.getOptSettings());
    }

    /**
     * Runs the named task.
     *
     * @param {string} taskName the name of the task to run
     * @param {boolean} [useInitialValues=true] if true the initial values are used,
     *        otherwise the current state is used
     * @returns {boolean} true if the task was run successfully
     */
    runTask(taskName, useInitialValues = true) {
        return this.Module.runTask(taskName, useInitialValues);
    }

    /**
     * @property {object[]} experimentDefinitions definitions of all parameter
     * estimation experiments
     *
     * Each entry has the same format as {@link COPASI#getExperimentDefinition}.
     */
    get experimentDefinitions() {
        return JSON.parse(this.Module.getExperimentDefinitions());
    }

    /**
     * Sets the definition of an experiment from an object or JSON string.
     *
     * @param {string} experimentName the name of the experiment to set the definition for
     * @param {object|string} experimentDefinition the definition as object or JSON string,
     *        in the same format as {@link COPASI#getExperimentDefinition}
     * @returns {boolean} true if successful
     */
    setExperimentDefinition(experimentName, experimentDefinition) {
        if (typeof experimentDefinition !== 'string') {
            experimentDefinition = JSON.stringify(experimentDefinition);
        }
        return this.Module.setExperimentDefinition(experimentName, experimentDefinition);
    }

    /**
     * Returns the definition of an experiment.
     *
     * @param {string} experimentName the name of the experiment to get the definition for
     * @returns {object} the experiment definition
     *
     * ```json
     * {
     *     "name": "Experiment 1",
     *     "filename": "data.csv",
     *     "type": "Time-Course" | "Steady-State",
     *     "separator": "\t",
     *     "first_row": "1",
     *     "last_row": "10",
     *     "weight_method": "Mean" | "Mean Square" | "Standard Deviation" | "Value Scaling",
     *     "normalize_per_experiment": "false",
     *     "mapping": [{'column': 0,
     *         'type': 'independent',
     *         'cn': 'CN=Root,Model=Kinetics of a  Michaelian enzyme measured spectrophotometrically,Vector=Compartments[compartment],Vector=Metabolites[S],Reference=InitialConcentration',
     *         'object': '[S]_0'},
     *        {'column': 1, 'type': 'time'},
     *        {'column': 2,
     *         'type': 'dependent',
     *         'cn': 'CN=Root,Model=Kinetics of a  Michaelian enzyme measured spectrophotometrically,Vector=Values[signal],Reference=Value',
     *         'object': 'Values[signal]'}]
     * }
     * ```
     */
    getExperimentDefinition(experimentName) {
        return JSON.parse(this.Module.getExperimentDefinition(experimentName));
    }

    /**
     * @property {string[]} experimentNames names of all parameter estimation experiments
     */
    get experimentNames() {
        return this._vectorToArray(this.Module.getExperimentNames());
    }

    /**
     * Sets the data filename of an experiment. The file has to exist.
     *
     * @param {string} experimentName the name of the experiment to set the filename for
     * @param {string} experimentFilename the name of the file to use
     * @returns {boolean} true if successful
     */
    setExperimentFilename(experimentName, experimentFilename) {
        return this.Module.setExperimentFilename(experimentName, experimentFilename);
    }

    /**
     * Returns the current fit of each experiment against the model.
     *
     * @param {boolean} [computeCurrentSolution=true] if true, the current
     *        parameter estimation values are applied to the model first so that
     *        subsequent experiment simulations use the current parameter values
     * @returns {object} the current fit for each experiment
     */
    getCurrentFit(computeCurrentSolution = true) {
        return JSON.parse(this.Module.getCurrentFit(computeCurrentSolution));
    }


}

// if module is defined, export the COPASI class
if (typeof module !== 'undefined') {
    module.exports = COPASI;
}

//export default COPASI;
//export {COPASI};