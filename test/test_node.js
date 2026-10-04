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
    
    // cleanup
    instance.destroy();
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

    // cleanup
    instance.destroy();
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

    // cleanup
    instance.destroy();
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

    // cleanup
    instance.destroy();
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

    
    // experiments
    console.log(instance.experimentNames);
    console.log(instance.experimentDefinitions);
    console.log(instance.getCurrentFit());


    // cleanup
    instance.destroy();
});

test('loads YeastGlycolysis model', async () => {
    const Module = await getModule();
    const instance = createInstance(Module);
    const data = fs.readFileSync(yeastPath, 'utf8');

    model = instance.loadModel(data);
    assert.ok(model.status != 'error')
    console.log(instance);
    console.log(instance.runTask('Time-Course', true));
    console.log(instance.simulationResults);

    // cleanup
    instance.destroy();
});

test('creates a new empty model', async () => {
    const Module = await getModule();
    const instance = createInstance(Module);
    const data = fs.readFileSync(path.resolve(__dirname, '../example_files/brusselator.cps'), 'utf8');
    const loaded = instance.loadModel(data);
    assert.equal(loaded.status, 'success');
    assert.ok(loaded.species.length > 0);

    const info = instance.newModel();
    assert.equal(info.status, 'success');
    assert.equal(info.species.length, 0);
    assert.equal(info.reactions.length, 0);
    assert.ok(info.model);
    assert.deepEqual(instance.selectionList, ['Time']);

    instance.destroy();
});

test('applies sparse model changes', async () => {
    const Module = await getModule();
    const instance = createInstance(Module);
    const data = fs.readFileSync(path.resolve(__dirname, '../example_files/brusselator.cps'), 'utf8');
    const loaded = instance.loadModel(data);
    assert.equal(loaded.status, 'success');

    const compartment = loaded.compartments[0].name;
    const updated = instance.applyModelChanges({
        species: [{ name: 'X', initial_concentration: 5.0 }],
        model: { name: 'Patched Brusselator' }
    });
    assert.equal(updated.status, 'success');
    assert.equal(updated.model.name, 'Patched Brusselator');
    const x = updated.species.find((s) => s.name === 'X');
    assert.ok(x);
    assert.equal(x.initial_concentration, 5);

    const created = instance.applyModelChanges({
        species: [{ op: 'create', name: 'Z', compartment, initial_concentration: 1 }],
        reactions: [{ op: 'create', name: 'R_XZ', scheme: 'X -> Z', reversible: false }]
    });
    assert.equal(created.status, 'success');
    assert.ok(created.species.some((s) => s.name === 'Z'));
    assert.ok(created.reactions.some((r) => r.name === 'R_XZ'));
    assert.ok(instance.selectionList.includes('Z'));

    const sim = instance.simulateEx(0, 1, 3);
    assert.equal(sim.status, 'success');

    const missing = instance.applyModelChanges({
        species: [{ name: 'does_not_exist', initial_concentration: 1 }]
    });
    assert.equal(missing.status, 'error');

    const renamed = instance.applyModelChanges({
        species: [{ name: 'X', new_name: 'Xrenamed' }]
    });
    assert.equal(renamed.status, 'success');
    assert.ok(renamed.species.some((s) => s.name === 'Xrenamed'));
    assert.ok(!renamed.species.some((s) => s.name === 'X'));
    assert.ok(instance.selectionList.includes('Xrenamed'));
    assert.ok(!instance.selectionList.includes('X'));

    assert.ok(instance.selectionList.includes('Y'));
    const deleted = instance.applyModelChanges({
        species: [{ op: 'delete', name: 'Y' }]
    });
    assert.equal(deleted.status, 'success');
    assert.ok(!deleted.species.some((s) => s.name === 'Y'));
    assert.ok(!instance.selectionList.includes('Y'));
    assert.ok(instance.selectionList.includes('Xrenamed'));

    instance.destroy();
});

test('deletes compartment then creates reaction j0 A -> B', async () => {
    const Module = await getModule();
    const instance = createInstance(Module);
    const data = fs.readFileSync(path.resolve(__dirname, '../example_files/brusselator.cps'), 'utf8');
    const loaded = instance.loadModel(data);
    assert.equal(loaded.status, 'success');

    const compartment = loaded.compartments[0].name;
    const result = instance.applyModelChanges({
        compartments: [{ op: 'delete', name: compartment }],
        reactions: [{ op: 'create', name: 'j0', scheme: 'A -> B' }]
    });
    assert.equal(result.status, 'success');
    assert.ok(result.reactions.some((r) => r.name === 'j0'));
    assert.ok(result.species.some((s) => s.name === 'A'));
    assert.ok(result.species.some((s) => s.name === 'B'));
    assert.ok(result.compartments.length >= 1);
    assert.ok(instance.selectionList.includes('A'));
    assert.ok(instance.selectionList.includes('B'));

    instance.destroy();
});

test('returns a shared simulation matrix without JSON columns', async () => {
    const Module = await getModule();
    const instance = createInstance(Module);
    const data = fs.readFileSync(path.resolve(__dirname, '../example_files/brusselator.cps'), 'utf8');
    const loaded = instance.loadModel(data);
    assert.equal(loaded.status, 'success');

    const full = instance.simulateEx(0, 10, 11, true);
    assert.equal(full.status, 'success');
    assert.ok(Array.isArray(full.columns));

    const matrix = instance.simulationMatrix;
    assert.equal(matrix.rows, full.recorded_steps);
    assert.equal(matrix.cols, full.num_variables);
    assert.ok(matrix.data instanceof Float64Array);
    assert.equal(matrix.data.length, matrix.rows * matrix.cols);

    for (let step = 0; step < matrix.rows; step++) {
        for (let variable = 0; variable < matrix.cols; variable++) {
            assert.equal(matrix.data[step * matrix.cols + variable], full.columns[variable][step]);
        }
    }

    const again = instance.simulationMatrix;
    assert.equal(again.data.buffer, matrix.data.buffer);
    assert.equal(again.data.byteOffset, matrix.data.byteOffset);
    assert.equal(again.data.length, matrix.data.length);

    const first = matrix.data.slice();

    instance.reset();
    const meta = instance.simulateEx(0, 10, 11, false);
    assert.equal(meta.status, 'success');
    assert.ok(Array.isArray(meta.titles));
    assert.equal(meta.columns, undefined);
    assert.equal(meta.recorded_steps, full.recorded_steps);
    assert.equal(meta.num_variables, full.num_variables);

    const fast = instance.simulationMatrix;
    assert.ok(fast.data instanceof Float64Array);
    assert.equal(fast.data.length, first.length);
    for (let i = 0; i < first.length; i++) {
        assert.equal(fast.data[i], first[i]);
    }

    instance.destroy();
});
