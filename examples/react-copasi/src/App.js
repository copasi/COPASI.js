import './App.css';

import React from 'react';
import Plot from 'react-plotly.js';
import createCpsModule from './copasijs.js';
import COPASI from './copasi.js';

class App extends React.Component {
  constructor(props) {
    super(props);

    // make up dummy state
    this.state = { copasi: {version: 'not loaded'}, data: { columns: [[0], [0], [0]] }, info: null };

    // grab example model from public folder
    var brusselator = null;
    fetch("brusselator.cps")
      .then(response => response.text())
      .then(model => brusselator = model)
      .then(() => {

        // load copasi module
        createCpsModule().then((cps) => {
          var instance = new COPASI(cps);

          // load example
          var modelInfo = instance.loadModel(brusselator);

          // simulate it parsing the json result
          var simResults = JSON.parse(instance.Module.simulate());

          // update state
          this.setState({ copasi: instance, data: simResults, info: modelInfo });
        })});
  };

  render() {
    return (
      <div className="App">
        <header className="App-header">
        <Plot
          data={[
            {
              x: this.state.data.columns[0],
              y: this.state.data.columns[1],
              type: 'scatter',
              mode: 'lines+markers',
              marker: { color: 'red' },
              name: 'Y',
            },
            {
              x: this.state.data.columns[0],
              y: this.state.data.columns[2],
              type: 'scatter',
              mode: 'lines+markers',
              marker: { color: 'blue' },
              name: 'Y',
            },
          ]}
          layout={{ width: 640, height: 480, title: 'Time Course' }}
        />

        <Plot
          data={[
            {
              x: this.state.data.columns[1],
              y: this.state.data.columns[2],
              type: 'scatter',
              mode: 'lines+markers',
              marker: { color: 'red' },
              name: 'X|Y',
            }
          ]}
          layout={{ width: 640, height: 480, title: 'Phase Plot' }}
        />

        <span>COPASI version: {this.state.copasi.version}</span>
        </header>
      </div>

    );
  }
}

export default App;
