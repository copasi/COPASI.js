export { default as COPASI } from "./copasi.js";
export type * from "./copasi.js";

export interface CpsModuleConfig {
    locateFile?: (path: string, prefix?: string) => string;
}

export function createCpsModule(moduleArg?: CpsModuleConfig): Promise<any>;
export default createCpsModule;
