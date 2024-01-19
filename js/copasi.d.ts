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
}

export interface CompartmentInfo {
    id: string;
    name: string;
    size: number;
    type: string;
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
}

export interface GlobalParamterInfo {   
    name: string;
    value: number;
    initial_value: number;
    id: string;
    type: string;
}

export interface ModelInfo {
    species: SpeciesInfo[];
    compartments: CompartmentInfo[];
    reactions: ReactionInfo[];
    global_parameters: GlobalParamterInfo[];
    model : ModelName;
    time: number;
    status: string;
    messages: string;
}

export default class COPASI {
    constructor(module: any);
    reset(): void;
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
    readonly floatingSpeciesConcentrations : number[];
    readonly ratesOfChange : number[];
    readonly floatingSpeciesNames : string[];
    readonly boundarySpeciesConcentrations : number[];
    readonly boundarySpeciesNames : string[];
    readonly reactionNames : string[];
    readonly reactionRates : number[];
    readonly compartmentNames : string[];
    readonly compartmentSizes : number[];
    readonly globalParameterNames : string[];
    readonly globalParameterValues : number[];
    readonly localParameterNames : string[];
    readonly localParameterValues : number[];
}

export {COPASI};
export default COPASI;