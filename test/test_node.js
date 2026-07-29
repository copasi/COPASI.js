const test = require('node:test');
const assert = require('node:assert/strict');
const path = require('node:path');
const fs = require('node:fs');

const createApi = require('./copasijs.js');
const COPASI = require('./copasi.js');

const inputModelPath = process.argv[2];
const himmelblauPath = path.resolve(__dirname, '../example_files/HimmelblauFunction.cps');
const yeastPath = path.resolve(__dirname, '../example_files/YeastGlycolysis.gps');

let modulePromise = null;

function getModule() {
    if (!modulePromise) {
        modulePromise = createApi();
    }

    return modulePromise;
}

function createInstance(Module) {
    const instance = new COPASI(Module);
    console.log('Using COPASI: ', instance.version);
    return instance;
}

function loadInputModel() {
    assert.ok(inputModelPath, 'Expected model path in process.argv[2]');
    return fs.readFileSync(inputModelPath, 'utf8');
}

test('loads model from string twice and simulates each run', async () => {
    const Module = await getModule();
    const instance = createInstance(Module);
    const data = loadInputModel();

    console.log(instance.loadModel(data));
    console.log(instance.simulateEx(0, 10, 11));

    console.log(instance.loadModel(data));
    console.log(instance.simulateEx(0, 10, 11));
});

test('runs time course and steady state with jacobian outputs', async () => {
    const Module = await getModule();
    const instance = createInstance(Module);
    const data = loadInputModel();

    console.log(instance.loadModel(data));

    console.log(instance.getTaskSettings(instance.TaskNames.TimeCourse));
    console.log(instance.simulateEx(0, 10, 11));

    console.log(instance.getTaskSettings(instance.TaskNames.SteadyState));
    console.log(instance.steadyState());

    console.log(instance.jacobian);
    console.log(instance.jacobian2D);
    console.log(instance.eigenValues2D);
    console.log(instance.reducedJacobian);
    console.log(instance.reducedJacobian2D);
    console.log(instance.eigenValuesReduced2D);
});

test('runs MCA, control coefficients, and LNA', async () => {
    const Module = await getModule();
    const instance = createInstance(Module);
    const data = loadInputModel();

    console.log(instance.loadModel(data));

    const selection = instance.selectionList;
    selection.push('EE(J0,S1)');

    console.log(selection);
    instance.selectionList = selection;

    const result = instance.simulateEx(0, 10, 11);
    console.log(result);

    instance.computeMca(true);
    console.log(instance.getTaskSettings(instance.TaskNames.MetabolicControlAnalysis));

    console.log('Flux control coefficients: ');
    console.log(instance.getFluxControlCoefficients(true));
    console.log(instance.getFluxControlCoefficients(false));

    console.log('Concentration control coefficients: ');
    console.log(instance.getConcentrationControlCoefficients(true));
    console.log(instance.getConcentrationControlCoefficients(false));

    console.log('Elasticities: ');
    console.log(instance.getElasticities(true));
    console.log(instance.getElasticities(false));

    console.log('Running LNA: ');
    console.log(instance.getTaskSettings(instance.TaskNames.LinearNoiseApproximation));
    console.log(instance.runLNA(true));
    const scaledResults = instance.getLNAResults(true);
    console.log('Scaled results: ');
    console.log(scaledResults);
    console.log('Covariance matrix: ');
    console.log(scaledResults.covariance_matrix);
    console.log('Reduced covariance matrix: ');
    console.log(scaledResults.reduced_covariance_matrix);
    console.log('Reduced b matrix: ');
    console.log(scaledResults.reduced_b_matrix);

    console.log(instance.getTaskSettings('Optimization'));
    console.log(instance.getTaskSettings('Parameter Estimation'));

    instance.reset();
});

test('runs optimization for Himmelblau example', async () => {
    const Module = await getModule();
    const instance = createInstance(Module);
    const data = fs.readFileSync(himmelblauPath, 'utf8');

    console.log(instance.loadModel(data));

    console.log('Optimization settings: ');
    console.log(instance.getTaskSettings('Optimization'));

    instance.setTaskSettings('Optimization', {
        problem: {
            'Randomize Start Values': false,
        },
        method: {
            name: 'Levenberg - Marquardt',
            'Iteration Limit': 200,
            Tolerance: 1e-6,
        },
    });

    console.log('Running Optimization: ');
    const ok = instance.Module.runOptimization(true);
    console.log(ok);
    assert.ok(ok);

    const solution = JSON.parse(instance.Module.getOptSolution());
    console.log('Opt solution: ');
    console.log(solution);

    const statistic = JSON.parse(instance.Module.getOptStatistic());
    console.log('Opt statistic: ');
    console.log(statistic);
});

test('runs parameter estimation for LM-test1 example', async () => {
    const Module = await getModule();
    const instance = createInstance(Module);

    console.log(instance.loadExample('/LM-test1.cps'));

    console.log('Parameter Estimation settings: ');
    console.log(instance.getTaskSettings('Parameter Estimation'));

    console.log('Running Parameter Estimation: ');
    const ok = instance.Module.runParameterEstimation(true);
    console.log(ok);
    assert.ok(ok);

    const solution = JSON.parse(instance.Module.getFitSolution());
    console.log('Fit solution: ');
    console.log(solution);

    const statistic = JSON.parse(instance.Module.getFitStatistic());
    console.log('Fit statistic: ');
    console.log(statistic);
});

test('loads YeastGlycolysis model', async () => {
    const Module = await getModule();
    const instance = createInstance(Module);
    const data = fs.readFileSync(yeastPath, 'utf8');

    console.log(instance.loadModel(data));
});