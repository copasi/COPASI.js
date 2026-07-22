import type exp from "constants";

export interface SimResult {
    num_variables: number;
    recorded_steps: number;
    titles: string[];
    columns: string[];
}

export interface SpeciesInfo {
    compartment: string;
    concentration: number;
    id: string;
    name: string;
    initial_concentration: number;
    initial_particle_number: number;
    particle_number: number;
    type: string;
    initial_expression: string;
    expression: string;
}

export interface CompartmentInfo {
    id: string;
    name: string;
    size: number;
    type: string;
    initial_expression: string;
    expression: string;
}
export interface LocalParamterInfo {
    name: string;
    value: number;
}

export interface ReactionInfo {
    id: string;
    name: string;
    reversible: boolean;
    scheme: string;
    local_paramters: LocalParamterInfo[];
}

export interface ModelName
{
    name: string;
    notes: string;
    time_unit: string;
    volume_unit: string;
    quantity_unit: string;
    area_unit: string;
    length_unit: string;
    initial_time: number;
    avogadro: number;
}

export interface GlobalParamterInfo {   
    name: string;
    value: number;
    initial_value: number;
    id: string;
    type: string;
    initial_expression: string;
    expression: string;
}

export interface EventInfo {
    id: string;
    name: string;
    trigger: string;
    delay: string;
    priority: string;
    assignments: string;
}

export interface ModelInfo {
    species: SpeciesInfo[];
    compartments: CompartmentInfo[];
    reactions: ReactionInfo[];
    global_parameters: GlobalParamterInfo[];
    events: EventInfo[];
    model : ModelName;
    time: number;
    status: string;
    messages: string;
}

export default class COPASI {
    constructor(module: any);
    reset(): void;
    resetAll(): void;
    readonly version: string;
    _vectorToArray(v: any): any[];
    loadExample(path: string) : ModelInfo;
    loadModel(modelCode: string): ModelInfo;
    simulate() : object;
    simulate2D() : number[][];
    simulateEx(startTime : number, endTime : number, numPoints : number) : SimResult;
    simulateEx2D(startTime : number, endTime : number, numPoints : number) : number[][];
    simulateYaml(yamlProcessingOptions : string|object) : SimResult;
    simulateYaml2D(yamlProcessingOptions : string|object) : SimResult;
    getValue(nameOrId: string): number;
    setValue(nameOrId: string, value: number): void;
    readonly floatingSpeciesConcentrations : number[];
    readonly ratesOfChange : number[];
    readonly floatingSpeciesNames : string[];
    readonly floatingSpeciesIds : string[];
    readonly boundarySpeciesConcentrations : number[];
    readonly boundarySpeciesNames : string[];
    readonly boundarySpeciesIds : string[];
    readonly reactionNames : string[];
    readonly reactionIds : string[];
    readonly reactionRates : number[];
    readonly compartmentNames : string[];
    readonly compartmentIds : string[];
    readonly compartmentSizes : number[];
    readonly globalParameterNames : string[];
    readonly globalParameterIds : string[];
    readonly globalParameterValues : number[];
    readonly localParameterNames : string[];
    readonly localParameterValues : number[];
    readonly jacobian: object;
    readonly jacobian2D: number[][];
    readonly eigenValues2D: number[][];
    readonly reducedJacobian: object;
    readonly reducedJacobian2D: number[][];
    readonly eigenValuesReduced2D: number[][];

    readonly stoichiometryMatrix: object;
	readonly reducedStoichiometryMatrix: object;
    readonly linkMatrix: object;
    
    getFluxControlCoefficients(scaled: boolean): object;
    getFluxControlCoefficients2D(scaled: boolean): number[][];
    getConcentrationControlCoefficients(scaled: boolean): object;
    getConcentrationControlCoefficients2D(scaled: boolean): number[][];
    getElasticities(scaled: boolean): object;
    getElasticities2D(scaled: boolean): number[][];

    setMethod(taskName: string, methodName: string): boolean;
    getAvailableMethods(taskName: string): string[];
    getSteadyStateProtocol(): string;
    getStabilityAnalysis(): string;
    getTaskSettings(taskName: string): object;
    setTaskSettings(taskName: string, settings: object): void;
    getLNAResults(scaled: boolean): object;
    runLNA(useInitialValues: boolean): boolean;


}

export {COPASI};
export default COPASI;