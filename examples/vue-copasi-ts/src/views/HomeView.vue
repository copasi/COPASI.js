<script setup lang="ts">
import { ref, onMounted, inject } from 'vue'
import {type COPASI } from '../copasi'
import {type CopasiPlugin } from '../copasi-plugin-type'

// inject the COPASI object from the main app
const copasi : CopasiPlugin|undefined = inject('$copasi')

const data: any = ref(null);
const simData: any = ref(null);
const model : any = ref('');
const info : any = ref(null);

onMounted(async () => {

  if (!copasi?.instance || copasi?.state == 'loading'){
    // load the copasi object
    return;
  }

  if (!model.value){
      // download `brusselator.cps` model copied to 
      // /public folder
      const response = await fetch("brusselator.cps");
      const modelText = await response.text();
      model.value = modelText;
  }

  if (!info.value){
    info.value = copasi.instance.loadModel(model.value);
  }

  if (!simData.value) {
    // simulate it parsing the json result
    simData.value =  copasi.instance.simulate(); 
  }

  if (!data.value && simData.value){
    // convert data to plotly format
    data.value = [];
    for (var i = 1; i < simData.value.num_variables; i++) {
      var trace = {
        x: simData.value.columns[0],
        y: simData.value.columns[i],
        type: "scatter",
        name: simData.value.titles[i]
      };
      data.value.push(trace);
    }  
  }
  
});

</script>



<template>
  <main>
    <div v-if="data == null">
      <p>loading...</p>
    </div>
    
    <div v-else>
    <VuePlotly :data="data" :layout="layout" :display-mode-bar="false"></VuePlotly>
    <div>
      <p>Model: {{ info?.model.name }}</p>
      <p >COPASI Version: {{copasi?.version}}</p>
    </div>
    </div>
  </main>
</template>


<script lang="ts">
// get plotly ready
import { VuePlotly } from 'vue3-plotly'

export default {
  components: {
    VuePlotly
  },
  data() {
    return {
      data:[{
        x: [1,2,3,4],
        y: [10,15,13,17],
        type:"scatter"
      }],
      layout:{
        title: "Time Course"
      }
    }
  }
}


</script>