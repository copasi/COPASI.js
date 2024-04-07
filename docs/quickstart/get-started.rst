Quickstart
==========

.. _building_library:

Building the library
--------------------

Building the library has been tested with emscripten 3.1.45 and upwards. So first ensure that you 
have activated the emscripten environment you want to use. Then run the following scripts from 
the root folder:

```bash
./dev/em-dependencies.sh
```

This will download / checkout the dependencies and then build them. 


```bash
./dev/em-build.sh
```

creates the the emsccripten build of the library for the node.js environment. Resulting files are then 
places in `./dist-node/`. If you want to use files with the web environment use 

```bash
./dev/em-web.sh
```

For all cmake switches also see the `CMakeLists.txt` file. 



.. _using_library:

Using the library
--------------------

To use the JavaScript library in your project, you just copy the files from `dist-node` to your project. 

```javascript
var createApi = require('./copasijs.js');
var COPASI = require('./copasi.js');
var fs = require("fs");

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
  
});
```

for the web version it will work similarly, except that you wont use the file system module,  but rather 
load the model file from a string. 