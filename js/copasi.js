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
     */
    static get TC() {
        return {
            LSODA: 'Deterministic (LSODA)',
            RADAU5: 'Deterministic (RADAU5)',
            DIRECT_METHOD: 'Stochastic (Direct method)',
            GIBSON_BRUCK: 'Stochastic (Gibson + Bruck)',
            TAULEAP: 'Stochastic (τ-Leap)',
        };
    }

    /**
     * Constructs a new COPASI instance from the WASM module
     * @param Module the WASM module
     * 
     */
    constructor(Module) {
        this.Module = Module;

        // initialize wasm methods
        this.getVersion = Module.getVersion
        this.getMessages = Module.getMessages;
        this.steadyState = Module.steadyState;
        this.oneStep = Module.oneStep;
        this.initCps = Module.initCps;
        this.destroy = Module.destroy;

        // init runtime
        this.initCps();
    }

    /**
     * loads an example (if the WASM module was compiled with FS support)
     * 
     * @param {string} path 
     * @returns model information as an object
     */
    loadExample(path) 
    {
        this.Module.destroy();
        this.Module.initCps();
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
        this.Module.destroy();
        this.Module.initCps();
        return JSON.parse(this.Module.loadModel(modelCode));
    }

    simulate() {
        return this.Module.simulate();
    }

    simulate2D() {
        this.Module.simulate();
        return this._vector2dToArray(this.Module.getSimulationResults2D());
    }

    simulateEx(startTime, endTime, numPoints) {
        return this.Module.simulateEx(startTime, endTime, numPoints);
    }

    simulateEx2D(startTime, endTime, numPoints) {
        this.Module.simulateEx(startTime, endTime, numPoints);
        return this._vector2dToArray(this.Module.getSimulationResults2D());
    }

    simulateYaml(yamlProcessingOptions) {
        if (typeof yamlProcessingOptions !== 'string') {
            yamlProcessingOptions = JSON.stringify(yamlProcessingOptions);
        }
        return this.Module.simulateYaml(yamlProcessingOptions);
    }

    simulateYaml2D(yamlProcessingOptions) {
        if (typeof yamlProcessingOptions !== 'string') {
            yamlProcessingOptions = JSON.stringify(yamlProcessingOptions);
        }
        this.Module.simulateYaml(yamlProcessingOptions);
        return this._vector2dToArray(this.Module.getSimulationResults2D());
    }

    reset() {
        // Add code here to reset the simulator
        this.Module.reset();
    }


    // add a property version with the contents of `getVersion`
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

    _vectorToArray(v) {
        var result = [];
        for (var i = 0; i < v.size(); i++) {
            result.push(v.get(i));
        }
        return result;
    }

    // convert 2d vector to Array
    _vector2dToArray(v) {
        var result = [];
        for (var i = 0; i < v.size(); i++) {
            result.push(this._vectorToArray(v.get(i)));
        }
        return result;
    }

    get floatingSpeciesConcentrations() {
        return this._vectorToArray(this.Module.getFloatingSpeciesConcentrations());
    }

    get ratesOfChange() {
        return this._vectorToArray(this.Module.getRatesOfChange());
    }

    get floatingSpeciesNames() {
        return this._vectorToArray(this.Module.getFloatingSpeciesNames());
    }

    get boundarySpeciesConcentrations() {
        return this._vectorToArray(this.Module.getBoundarySpeciesConcentrations());
    }

    get boundarySpeciesNames() {
        return this._vectorToArray(this.Module.getBoundarySpeciesNames());
    }

    get reactionNames() {
        return this._vectorToArray(this.Module.getReactionNames());
    }
    
    get reactionRates() {
        return this._vectorToArray(this.Module.getReactionRates());
    }

    get compartmentNames() {
        return this._vectorToArray(this.Module.getCompartmentNames());
    }

    get compartmentSizes() {
        return this._vectorToArray(this.Module.getCompartmentSizes());
    }

    get globalParameterNames() {
        return this._vectorToArray(this.Module.getGlobalParameterNames());
    }

    get globalParameterValues() {
        return this._vectorToArray(this.Module.getGlobalParameterValues());
    }

    get localParameterNames() {
        return this._vectorToArray(this.Module.getLocalParameterNames());
    }

    get localParameterValues() {
        return this._vectorToArray(this.Module.getLocalParameterValues());
    }

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

    get modelInfo() {
        return JSON.parse(this.Module.getModelInfo());
    }

    get selectionList() {
        return this._vectorToArray(this.Module.getSelectionList());
    }

    get selectedValues() {
        return this._vectorToArray(this.Module.getSelectedValues());
    }

    set selectionList(arg) 
    {
        var vector = new this.Module.StringVector();
        arg.forEach((item) => vector.push_back(item));
        return this.Module.setSelectionList(vector);
    }
}

// if module is defined, export the COPASI class
if (typeof module !== 'undefined') {
    module.exports = COPASI;
}

//export default COPASI;
//export {COPASI};