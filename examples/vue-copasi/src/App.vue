<script setup>
import { ref, onMounted, inject } from 'vue'

// inject the COPASI object from the main app
const copasi = inject('$copasi')

const data = ref(null);
const simData = ref(null);
const model = ref('');
const info = ref(null);

onMounted(async () => {
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
    <h2>COPASI.js Vue3 Example</h2>
    <VuePlotly :data="data" :layout="layout" :display-mode-bar="false"></VuePlotly>
    <div>
      <p>Model: {{ info?.model.name }}</p>
      <p >COPASI Version: {{copasi.instance.version}}</p>
    </div>    
  </main>
</template>

<style scoped>
header {
  line-height: 1.5;
}

.logo {
  display: block;
  margin: 0 auto 2rem;
}

@media (min-width: 1024px) {
  header {
    display: flex;
    place-items: center;
    padding-right: calc(var(--section-gap) / 2);
  }

  .logo {
    margin: 0 2rem 0 0;
  }

  header .wrapper {
    display: flex;
    place-items: flex-start;
    flex-wrap: wrap;
  }
}
</style>


<script>
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