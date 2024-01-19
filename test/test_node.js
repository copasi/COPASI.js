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

    // run 
  
});
