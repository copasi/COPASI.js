import type COPASI from "./copasi";

export interface CopasiPlugin {
    state: string;
    module: any;
    instance: COPASI|undefined;
    version: string;
}