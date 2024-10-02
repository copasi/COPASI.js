var createApi = require('./copasijs.js');
var COPASI = require('./copasi.js');
var fs = require("fs");

var instance = null;

function loadModelFromString(modelString) {

    // load model from string
    console.log(instance.loadModel(modelString));

    // simulate the model
    console.log(instance.simulateEx(0, 10, 11));

    // run
}

createApi().then((Module) => {

    // instantiate COPASI simulator
    instance = new COPASI(Module);

    // check version
    console.log('Using COPASI: ', instance.version);

    // load a local file using the filesystem
    var data = fs.readFileSync(process.argv[2], 'utf8');

    // load model from string
    loadModelFromString(data);

    // load model from string
    loadModelFromString(data);
});



createApi().then((Module) => {

    // instantiate COPASI simulator
    var instance = new COPASI(Module);

    // check version
    console.log('Using COPASI: ', instance.version);

    // load a local file using the filesystem 
    var data = fs.readFileSync(process.argv[2], 'utf8');

    // print model structure
    console.log(instance.loadModel(data));
    
    // simulate the model
    console.log(instance.simulateEx(0, 10, 11));

    // run steady state
    console.log(instance.steadyState());

    // print jacobian
    console.log(instance.jacobian);

    // print jacobian
    console.log(instance.jacobian2D);

    // print eigenvalues
    console.log(instance.eigenValues2D);

    // print jacobian
    console.log(instance.reducedJacobian);

    // print jacobian
    console.log(instance.reducedJacobian2D);

    // print eigenvalues
    console.log(instance.eigenValuesReduced2D);    
  
});


createApi().then((Module) => {

    // instantiate COPASI simulator
    var instance = new COPASI(Module);

    // check version
    console.log('Using COPASI: ', instance.version);

    // load a local file using the filesystem 
    var data = fs.readFileSync(process.argv[2], 'utf8');

    // print model structure
    console.log(instance.loadModel(data));
 
    var selection = instance.selectionList;
    selection.push("EE(J0,S1)")


    console.log(selection);
    instance.selectionList = selection;

    var result = instance.simulateEx(0, 10, 11);
    console.log(result);

    // compute mca
    instance.computeMca(true);

    // print control coefficients
    console.log("Flux control coefficients: ");
    console.log(instance.getFluxControlCoefficients(true));
    console.log(instance.getFluxControlCoefficients(false));

    console.log("Concentration control coefficients: ");
    console.log(instance.getConcentrationControlCoefficients(true));
    console.log(instance.getConcentrationControlCoefficients(false));

    console.log("Elasticities: ");
    console.log(instance.getElasticities(true));
    console.log(instance.getElasticities(false));

    instance.reset();


});
