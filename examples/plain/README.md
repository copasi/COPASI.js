## Example of using HTML + JavaScript
To use COPASI.js without framework in HTML, simply include the 
script files: 

```html
  <script src="copasi.js" type="text/javascript"></script>
  <script src="copasijs.js" type="text/javascript"> </script>
```

then instantiate in a script tag like so: 

```javascript
<script>
  var copasi = null;
  createCpsModule().then(module => {
    copasi = new COPASI(module);
    console.log(copasi.version);
    //...
  });
```
