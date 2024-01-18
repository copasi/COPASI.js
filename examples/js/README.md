# Node.js
To use COPASI.js in Node.js simply require the scripts: 

```javascript
var createApi = require('./copasijs.js');
var COPASI = require('./copasi.js');
```

then instantiate like so: 

```javascript
createApi().then((Module) => {
    // instantiate COPASI simulator
    var instance = new COPASI(Module);

    // now ready to call any method
    console.log('Using COPASI: ', instance.version);

    //...
});
```