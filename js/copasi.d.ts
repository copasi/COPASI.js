import type exp from "constants";

export interface SimResult {
    num_variables: number;
    recorded_steps: number;
    titles: string[];
    columns?: number[][];
    status?: string;
}

export interface SimulationMatrix {
    rows: number;
    cols: number;
    data: Float64Array;
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

export type ModelChangeOp = "update" | "create" | "delete";

export interface ModelChangeAssignment {
    target: string;
    expression: string;
}

export interface SpeciesChange {
    op?: ModelChangeOp;
    name?: string;
    id?: string;
    new_name?: string;
    new_id?: string;
    compartment?: string;
    initial_concentration?: number;
    initial_particle_number?: number;
    type?: string;
    initial_expression?: string;
    expression?: string;
}

export interface CompartmentChange {
    op?: ModelChangeOp;
    name?: string;
    id?: string;
    new_name?: string;
    new_id?: string;
    size?: number;
    type?: string;
    initial_expression?: string;
    expression?: string;
}

export interface LocalParameterChange {
    name: string;
    value: number;
}

export interface ReactionChange {
    op?: ModelChangeOp;
    name?: string;
    id?: string;
    new_name?: string;
    new_id?: string;
    scheme?: string;
    reversible?: boolean;
    local_parameters?: LocalParameterChange[];
}

export interface ParameterChange {
    op?: ModelChangeOp;
    name?: string;
    id?: string;
    new_name?: string;
    new_id?: string;
    value?: number;
    initial_value?: number;
    type?: string;
    initial_expression?: string;
    expression?: string;
}

export interface EventChange {
    op?: ModelChangeOp;
    name?: string;
    id?: string;
    new_name?: string;
    new_id?: string;
    trigger?: string;
    delay?: string;
    priority?: string;
    assignments?: ModelChangeAssignment[] | string;
}

export interface ModelChanges {
    model?: Partial<ModelName> & { model_type?: string };
    species?: SpeciesChange[];
    compartments?: CompartmentChange[];
    reactions?: ReactionChange[];
    global_parameters?: ParameterChange[];
    events?: EventChange[];
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
    autoUpdateModel: boolean;
    _vectorToArray(v: any): any[];
    loadExample(path: string) : ModelInfo;
    loadModel(modelCode: string): ModelInfo;
    newModel(): ModelInfo;
    loadFromFile(modelFile: string): ModelInfo;
    loadCombineArchive(modelFile: string): ModelInfo;
    applyModelChanges(changes: ModelChanges | string): ModelInfo;
    readonly modelInfo: ModelInfo;
    simulate(includeData?: boolean) : object;
    simulate2D() : number[][];
    simulateEx(startTime : number, endTime : number, numPoints : number, includeData?: boolean) : SimResult;
    simulateEx2D(startTime : number, endTime : number, numPoints : number) : number[][];
    simulateYaml(yamlProcessingOptions : string|object, includeData?: boolean) : SimResult;
    simulateYaml2D(yamlProcessingOptions : string|object) : SimResult;
    readonly simulationMatrix: SimulationMatrix;
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

    readonly optSettings: object;
    readonly fitSettings: object;

    readonly simulationResults: object;
    
    getFluxControlCoefficients(scaled: boolean): object;
    getFluxControlCoefficients2D(scaled: boolean): number[][];
    getConcentrationControlCoefficients(scaled: boolean): object;
    getConcentrationControlCoefficients2D(scaled: boolean): number[][];
    getElasticities(scaled: boolean): object;
    getElasticities2D(scaled: boolean): number[][];

    setMethod(taskName: string, methodName: string): boolean;
    getAvailableMethods(taskName: string): string[];
    steadyState(stabilityAnalysis?: boolean, updateModel?: boolean): number;
    computeMca(performSteadyState?: boolean, updateModel?: boolean): boolean;
    getSteadyStateProtocol(): string;
    getSteadyStateStatus(): string;
    getStabilityAnalysis(): string;
    getTaskSettings(taskName: string): object;
    setTaskSettings(taskName: string, settings: object): void;
    getLNAResults(scaled?: boolean): object;
    runLNA(useInitialValues?: boolean): boolean;

    runOptimization(useInitialValues?: boolean): boolean;
    readonly optItems: object;
    readonly optSolution: object;
    readonly optStatistic: object;

    runParameterEstimation(useInitialValues?: boolean): boolean;
    readonly correlationMatrix: object;
    readonly fischerInformationMatrix: object;
    readonly indent: number;
    readonly fitSolution: object;
    readonly fitItems: object;
    readonly fitStatistic: object;

    runTask(taskName: string, useInitialValues?: boolean): boolean;


    readonly experimentNames: string[];
    readonly experimentDefinitions: object;
    
    getCurrentFit(computeCurrentSolution?: boolean): object;
    
    setExperimentDefinition(experimentName: string, experimentDefinition: object): boolean;
    getExperimentDefinition(experimentName: string): object;
    setExperimentFilename(experimentName: string, experimentFilename: string): boolean;
    
    convertToIrreversible(): object;

    mcaSettings: object;
    mcaProtocol: string;

    lnaSettings: object;
}

export {COPASI};
export default COPASI;