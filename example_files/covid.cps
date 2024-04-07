<?xml version="1.0" encoding="UTF-8"?>
<!-- generated with COPASI 4.29 (Build 228) (http://www.copasi.org) at 2021-01-25T15:32:17Z -->
<?oxygen RNGSchema="http://www.copasi.org/static/schema/CopasiML.rng" type="xml"?>
<COPASI xmlns="http://www.copasi.org/static/schema" versionMajor="4" versionMinor="29" versionDevel="228" copasiSourcesModified="0">
  <ListOfFunctions>
    <Function key="Function_40" name="Rate Law for reaction" type="UserDefined" reversible="false">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_40">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2020-08-12T15:23:47Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        r*I
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_264" name="r" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_263" name="I" order="1" role="substrate"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_41" name="mass action Grenfeld" type="UserDefined" reversible="false">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_41">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2020-10-28T16:04:37Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        D*(exp(a*q+log(R0max-R0min))+R0min)*S*I
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_261" name="D" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_262" name="a" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_250" name="q" order="2" role="modifier"/>
        <ParameterDescription key="FunctionParameter_265" name="R0max" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_266" name="R0min" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_267" name="S" order="5" role="substrate"/>
        <ParameterDescription key="FunctionParameter_268" name="I" order="6" role="substrate"/>
      </ListOfParameterDescriptions>
    </Function>
  </ListOfFunctions>
  <Model key="Model_1" name="Basic SIR" simulationType="time" timeUnit="d" volumeUnit="1" areaUnit="m²" lengthUnit="m" quantityUnit="#" type="deterministic" avogadroConstant="6.0221408570000002e+23">
    <MiriamAnnotation>
<rdf:RDF
   xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#"
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
   xmlns:vCard="http://www.w3.org/2001/vcard-rdf/3.0#">
  <rdf:Description rdf:about="#Model_1">
    <dcterms:bibliographicCitation>
      <rdf:Description>
        <CopasiMT:isDescribedBy rdf:resource="urn:miriam:doi:10.1126/science.abc2535"/>
      </rdf:Description>
    </dcterms:bibliographicCitation>
    <dcterms:bibliographicCitation>
      <rdf:Description>
        <CopasiMT:isDescribedBy rdf:resource="urn:miriam:arxiv:https://cds. climate. copernicus. eu/cdsapp. 2018"/>
      </rdf:Description>
    </dcterms:bibliographicCitation>
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2020-08-12T15:19:03Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
    <dcterms:creator>
      <rdf:Description>
        <vCard:N>
          <rdf:Description>
            <vCard:Family>Klahn</vCard:Family>
            <vCard:Given>Brian</vCard:Given>
          </rdf:Description>
        </vCard:N>
        <vCard:ORG>
          <rdf:Description>
            <vCard:Orgname>University of Virginia</vCard:Orgname>
          </rdf:Description>
        </vCard:ORG>
      </rdf:Description>
    </dcterms:creator>
    <dcterms:creator>
      <rdf:Description>
        <vCard:EMAIL>mat3kk@virginia.edu</vCard:EMAIL>
        <vCard:N>
          <rdf:Description>
            <vCard:Family>Thakur</vCard:Family>
            <vCard:Given>Mugdha</vCard:Given>
          </rdf:Description>
        </vCard:N>
        <vCard:ORG>
          <rdf:Description>
            <vCard:Orgname>University of Virginia</vCard:Orgname>
          </rdf:Description>
        </vCard:ORG>
      </rdf:Description>
    </dcterms:creator>
    <dcterms:creator>
      <rdf:Description>
        <vCard:EMAIL>shoops@virginia.edu</vCard:EMAIL>
        <vCard:N>
          <rdf:Description>
            <vCard:Family>Hoops</vCard:Family>
            <vCard:Given>Stefan</vCard:Given>
          </rdf:Description>
        </vCard:N>
        <vCard:ORG>
          <rdf:Description>
            <vCard:Orgname>University of Virginia</vCard:Orgname>
          </rdf:Description>
        </vCard:ORG>
      </rdf:Description>
    </dcterms:creator>
    <dcterms:creator>
      <rdf:Description>
        <vCard:N>
          <rdf:Description>
            <vCard:Family>Espinoza</vCard:Family>
            <vCard:Given>Baltazar</vCard:Given>
          </rdf:Description>
        </vCard:N>
        <vCard:ORG>
          <rdf:Description>
            <vCard:Orgname>University of Virginia</vCard:Orgname>
          </rdf:Description>
        </vCard:ORG>
      </rdf:Description>
    </dcterms:creator>
    <dcterms:modified>
      <rdf:Description>
        <dcterms:W3CDTF>2020-12-17T16:50:24</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:modified>
  </rdf:Description>
</rdf:RDF>

    </MiriamAnnotation>
    <Comment>
      SIRS model with no demograhy.

To reproduce Figure 2c in Baker et. al. 2020 (https://science.sciencemag.org/content/sci/early/2020/05/15/science.abc2535.full.pdf)
Parameters used are the paper's best fit values for OC43.

Specific humidity is monthly data aggregated over the years 2014-2020 from the copernicus website for New York (Lat: 42.935, Lon: -75.515)
Acknowledgement: The ERA5 data used is publicly available at: \url{https://cds.climate.copernicus.eu/cdsapp#!/dataset/reanalysis-era5-pressure-levels?tab=overview} generated by Copernicus Services [2018].
    </Comment>
    <ListOfCompartments>
      <Compartment key="Compartment_0" name="Population" simulationType="fixed" dimensionality="0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Compartment_0">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2020-08-12T15:19:41Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <Comment>
          Population for New York
        </Comment>
      </Compartment>
    </ListOfCompartments>
    <ListOfMetabolites>
      <Metabolite key="Metabolite_0" name="S" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_0">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2020-08-12T15:19:53Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <Comment>
          Number of susceptible individuals
        </Comment>
      </Metabolite>
      <Metabolite key="Metabolite_1" name="I" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_1">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2020-08-12T15:19:55Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <Comment>
          Number of infected individuals

Initial Number assumed as per the paper.
        </Comment>
      </Metabolite>
      <Metabolite key="Metabolite_2" name="R" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_2">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2020-08-12T15:20:01Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <Comment>
          Number of recovered individuals
        </Comment>
      </Metabolite>
      <Metabolite key="Metabolite_3" name="q" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_3">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2020-10-28T17:02:03Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <Comment>
          Specific humidity.
Please see the events for the coded daily specific humidity used to calculate the disease transmission rate.
        </Comment>
      </Metabolite>
    </ListOfMetabolites>
    <ListOfModelValues>
      <ModelValue key="ModelValue_0" name="L" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_0">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2020-12-17T21:55:08Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <Comment>
          Waning rate of the temporary immunity of the recovered individuals
        </Comment>
      </ModelValue>
      <ModelValue key="ModelValue_1" name="a" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2020-12-17T21:55:24Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <Comment>
          Climate dependence parameter.
        </Comment>
      </ModelValue>
      <ModelValue key="ModelValue_2" name="R0max" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_2">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2020-12-17T21:55:28Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <Comment>
          Maximum of the range of R0
        </Comment>
      </ModelValue>
      <ModelValue key="ModelValue_3" name="R0min" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_3">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2020-12-17T21:55:31Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <Comment>
          Minimum of the range of R0
        </Comment>
      </ModelValue>
      <ModelValue key="ModelValue_4" name="r" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_4">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2020-12-17T21:55:51Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <Comment>
          Rate of recovery. (1/duration of infectious period)
        </Comment>
      </ModelValue>
    </ListOfModelValues>
    <ListOfReactions>
      <Reaction key="Reaction_0" name="Infection" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_0">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2020-08-12T15:20:10Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <Comment>
          Disease transmission to susceptible individual upon contact with an infected individual.
Note the disease transmission coefficient is a function of specific humnidity.
        </Comment>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_0" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_1" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_1" stoichiometry="2"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_3" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_5370" name="D" value="0.2"/>
          <Constant key="Parameter_5369" name="a" value="-32.5"/>
          <Constant key="Parameter_5368" name="R0max" value="2.5"/>
          <Constant key="Parameter_5367" name="R0min" value="1.5"/>
        </ListOfConstants>
        <KineticLaw function="Function_41" unitType="Default" scalingCompartment="CN=Root,Model=Basic SIR,Vector=Compartments[Population]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_261">
              <SourceParameter reference="ModelValue_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_262">
              <SourceParameter reference="ModelValue_1"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_250">
              <SourceParameter reference="Metabolite_3"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_265">
              <SourceParameter reference="ModelValue_2"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_266">
              <SourceParameter reference="ModelValue_3"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_267">
              <SourceParameter reference="Metabolite_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_268">
              <SourceParameter reference="Metabolite_1"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1" name="Recovery" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_1">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2020-08-12T15:22:01Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <Comment>
          Recovery of infected indiviuals
        </Comment>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_1" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_2" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_5366" name="r" value="0.2"/>
        </ListOfConstants>
        <KineticLaw function="Function_40" unitType="Default" scalingCompartment="CN=Root,Model=Basic SIR,Vector=Compartments[Population]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_264">
              <SourceParameter reference="ModelValue_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_263">
              <SourceParameter reference="Metabolite_1"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_2" name="Susceptible" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_2">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2020-10-28T18:46:35Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <Comment>
          Waning of the temporary immunity of recovered individuals
        </Comment>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_2" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_0" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_5365" name="r" value="0.0023"/>
        </ListOfConstants>
        <KineticLaw function="Function_40" unitType="Default" scalingCompartment="CN=Root,Model=Basic SIR,Vector=Compartments[Population]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_264">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_263">
              <SourceParameter reference="Metabolite_2"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
    </ListOfReactions>
    <ListOfEvents>
      <Event key="Event_0" name="pe_event_0" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_0">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 1
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0124334
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_1" name="pe_event_1" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_1">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 2
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0124946
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_2" name="pe_event_2" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_2">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 3
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0125558
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_3" name="pe_event_3" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_3">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 4
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.012617
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_4" name="pe_event_4" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_4">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 5
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0126782
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_5" name="pe_event_5" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_5">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 6
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0127394
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_6" name="pe_event_6" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_6">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 7
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0128006
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_7" name="pe_event_7" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_7">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 8
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0128618
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_8" name="pe_event_8" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_8">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 9
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0129231
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_9" name="pe_event_9" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_9">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 10
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0129843
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_10" name="pe_event_10" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_10">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 11
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0130455
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_11" name="pe_event_11" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_11">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 12
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0131067
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_12" name="pe_event_12" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_12">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 13
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0131679
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_13" name="pe_event_13" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_13">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 14
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0132291
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_14" name="pe_event_14" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_14">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 15
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0132903
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_15" name="pe_event_15" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_15">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 16
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0133515
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_16" name="pe_event_16" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_16">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 17
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0134127
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_17" name="pe_event_17" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_17">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 18
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0134739
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_18" name="pe_event_18" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_18">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 19
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0135351
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_19" name="pe_event_19" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_19">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 20
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0135963
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_20" name="pe_event_20" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_20">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 21
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0136575
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_21" name="pe_event_21" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_21">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 22
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0137187
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_22" name="pe_event_22" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_22">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 23
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0137799
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_23" name="pe_event_23" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_23">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 24
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0138411
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_24" name="pe_event_24" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_24">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 25
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0139023
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_25" name="pe_event_25" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_25">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 26
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0139636
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_26" name="pe_event_26" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_26">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 27
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0140248
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_27" name="pe_event_27" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_27">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 28
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.014086
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_28" name="pe_event_28" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_28">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 29
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0141472
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_29" name="pe_event_29" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_29">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 30
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0142084
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_30" name="pe_event_30" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_30">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 31
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0145359
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_31" name="pe_event_31" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_31">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 32
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0148635
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_32" name="pe_event_32" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_32">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 33
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.015191
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_33" name="pe_event_33" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_33">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 34
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0155186
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_34" name="pe_event_34" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_34">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 35
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0158461
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_35" name="pe_event_35" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_35">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 36
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0161737
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_36" name="pe_event_36" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_36">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 37
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0165013
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_37" name="pe_event_37" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_37">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 38
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0168288
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_38" name="pe_event_38" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_38">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 39
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0171564
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_39" name="pe_event_39" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_39">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 40
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0174839
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_40" name="pe_event_40" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_40">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 41
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0178115
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_41" name="pe_event_41" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_41">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 42
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.018139
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_42" name="pe_event_42" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_42">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 43
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0184666
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_43" name="pe_event_43" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_43">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 44
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0187941
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_44" name="pe_event_44" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_44">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 45
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0191217
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_45" name="pe_event_45" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_45">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 46
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0194493
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_46" name="pe_event_46" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_46">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 47
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0197768
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_47" name="pe_event_47" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_47">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 48
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0201044
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_48" name="pe_event_48" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_48">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 49
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0204319
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_49" name="pe_event_49" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_49">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 50
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0207595
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_50" name="pe_event_50" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_50">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 51
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.021087
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_51" name="pe_event_51" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_51">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 52
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0214146
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_52" name="pe_event_52" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_52">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 53
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0217421
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_53" name="pe_event_53" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_53">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 54
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0220697
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_54" name="pe_event_54" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_54">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 55
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0223973
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_55" name="pe_event_55" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_55">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 56
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0227248
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_56" name="pe_event_56" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_56">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 57
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0230524
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_57" name="pe_event_57" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_57">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 58
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0233799
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_58" name="pe_event_58" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_58">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 59
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0237075
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_59" name="pe_event_59" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_59">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 60
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.024035
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_60" name="pe_event_60" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_60">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 61
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0244023
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_61" name="pe_event_61" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_61">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 62
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0247695
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_62" name="pe_event_62" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_62">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 63
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0251367
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_63" name="pe_event_63" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_63">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 64
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.025504
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_64" name="pe_event_64" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_64">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 65
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0258712
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_65" name="pe_event_65" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_65">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 66
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0262384
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_66" name="pe_event_66" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_66">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 67
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0266057
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_67" name="pe_event_67" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_67">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 68
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0269729
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_68" name="pe_event_68" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_68">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 69
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0273401
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_69" name="pe_event_69" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_69">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 70
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0277073
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_70" name="pe_event_70" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_70">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 71
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0280746
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_71" name="pe_event_71" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_71">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 72
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0284418
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_72" name="pe_event_72" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_72">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 73
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.028809
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_73" name="pe_event_73" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_73">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 74
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0291763
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_74" name="pe_event_74" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_74">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 75
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0295435
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_75" name="pe_event_75" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_75">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 76
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0299107
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_76" name="pe_event_76" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_76">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 77
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.030278
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_77" name="pe_event_77" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_77">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 78
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0306452
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_78" name="pe_event_78" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_78">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 79
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0310124
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_79" name="pe_event_79" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_79">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 80
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0313797
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_80" name="pe_event_80" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_80">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 81
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0317469
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_81" name="pe_event_81" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_81">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 82
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0321141
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_82" name="pe_event_82" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_82">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 83
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0324814
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_83" name="pe_event_83" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_83">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 84
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0328486
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_84" name="pe_event_84" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_84">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 85
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0332158
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_85" name="pe_event_85" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_85">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 86
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0335831
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_86" name="pe_event_86" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_86">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 87
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0339503
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_87" name="pe_event_87" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_87">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 88
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0343175
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_88" name="pe_event_88" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_88">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 89
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0346848
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_89" name="pe_event_89" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_89">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 90
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.035052
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_90" name="pe_event_90" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_90">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 91
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0353727
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_91" name="pe_event_91" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_91">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 92
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0356934
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_92" name="pe_event_92" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_92">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 93
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0360141
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_93" name="pe_event_93" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_93">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 94
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0363348
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_94" name="pe_event_94" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_94">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 95
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0366555
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_95" name="pe_event_95" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_95">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 96
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0369762
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_96" name="pe_event_96" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_96">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 97
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0372969
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_97" name="pe_event_97" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_97">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 98
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0376176
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_98" name="pe_event_98" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_98">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 99
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0379383
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_99" name="pe_event_99" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_99">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 100
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.038259
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_100" name="pe_event_100" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_100">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 101
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0385797
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_101" name="pe_event_101" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_101">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 102
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0389004
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_102" name="pe_event_102" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_102">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 103
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0392211
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_103" name="pe_event_103" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_103">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 104
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0395418
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_104" name="pe_event_104" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_104">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 105
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0398625
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_105" name="pe_event_105" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_105">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 106
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0401832
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_106" name="pe_event_106" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_106">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 107
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0405039
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_107" name="pe_event_107" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_107">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 108
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0408246
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_108" name="pe_event_108" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_108">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 109
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0411453
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_109" name="pe_event_109" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_109">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 110
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.041466
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_110" name="pe_event_110" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_110">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 111
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0417867
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_111" name="pe_event_111" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_111">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 112
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0421074
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_112" name="pe_event_112" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_112">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 113
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0424281
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_113" name="pe_event_113" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_113">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 114
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0427488
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_114" name="pe_event_114" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_114">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 115
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0430695
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_115" name="pe_event_115" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_115">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 116
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0433902
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_116" name="pe_event_116" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_116">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 117
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0437109
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_117" name="pe_event_117" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_117">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 118
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0440316
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_118" name="pe_event_118" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_118">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 119
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0443523
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_119" name="pe_event_119" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_119">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 120
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.044673
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_120" name="pe_event_120" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_120">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 121
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0449723
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_121" name="pe_event_121" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_121">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 122
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0452716
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_122" name="pe_event_122" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_122">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 123
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0455709
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_123" name="pe_event_123" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_123">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 124
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0458703
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_124" name="pe_event_124" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_124">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 125
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0461696
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_125" name="pe_event_125" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_125">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 126
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0464689
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_126" name="pe_event_126" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_126">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 127
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0467682
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_127" name="pe_event_127" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_127">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 128
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0470675
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_128" name="pe_event_128" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_128">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 129
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0473668
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_129" name="pe_event_129" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_129">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 130
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0476661
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_130" name="pe_event_130" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_130">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 131
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0479654
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_131" name="pe_event_131" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_131">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 132
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0482647
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_132" name="pe_event_132" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_132">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 133
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.048564
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_133" name="pe_event_133" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_133">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 134
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0488633
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_134" name="pe_event_134" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_134">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 135
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0491626
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_135" name="pe_event_135" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_135">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 136
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0494619
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_136" name="pe_event_136" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_136">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 137
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0497613
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_137" name="pe_event_137" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_137">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 138
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0500606
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_138" name="pe_event_138" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_138">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 139
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0503599
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_139" name="pe_event_139" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_139">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 140
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0506592
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_140" name="pe_event_140" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_140">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 141
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0509585
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_141" name="pe_event_141" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_141">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 142
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0512578
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_142" name="pe_event_142" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_142">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 143
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0515571
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_143" name="pe_event_143" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_143">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 144
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0518564
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_144" name="pe_event_144" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_144">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 145
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0521557
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_145" name="pe_event_145" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_145">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 146
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.052455
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_146" name="pe_event_146" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_146">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 147
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0527543
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_147" name="pe_event_147" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_147">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 148
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0530536
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_148" name="pe_event_148" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_148">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 149
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0533529
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_149" name="pe_event_149" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_149">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 150
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0536523
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_150" name="pe_event_150" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_150">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 151
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0538258
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_151" name="pe_event_151" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_151">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 152
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0539994
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_152" name="pe_event_152" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_152">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 153
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0541729
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_153" name="pe_event_153" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_153">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 154
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0543465
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_154" name="pe_event_154" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_154">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 155
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.05452
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_155" name="pe_event_155" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_155">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 156
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0546936
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_156" name="pe_event_156" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_156">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 157
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0548671
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_157" name="pe_event_157" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_157">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 158
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0550407
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_158" name="pe_event_158" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_158">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 159
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0552142
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_159" name="pe_event_159" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_159">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 160
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0553878
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_160" name="pe_event_160" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_160">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 161
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0555613
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_161" name="pe_event_161" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_161">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 162
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0557349
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_162" name="pe_event_162" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_162">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 163
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0559084
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_163" name="pe_event_163" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_163">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 164
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.056082
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_164" name="pe_event_164" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_164">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 165
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0562556
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_165" name="pe_event_165" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_165">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 166
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0564291
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_166" name="pe_event_166" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_166">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 167
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0566027
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_167" name="pe_event_167" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_167">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 168
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0567762
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_168" name="pe_event_168" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_168">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 169
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0569498
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_169" name="pe_event_169" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_169">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 170
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0571233
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_170" name="pe_event_170" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_170">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 171
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0572969
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_171" name="pe_event_171" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_171">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 172
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0574704
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_172" name="pe_event_172" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_172">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 173
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.057644
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_173" name="pe_event_173" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_173">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 174
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0578175
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_174" name="pe_event_174" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_174">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 175
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0579911
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_175" name="pe_event_175" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_175">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 176
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0581646
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_176" name="pe_event_176" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_176">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 177
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0583382
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_177" name="pe_event_177" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_177">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 178
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0585117
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_178" name="pe_event_178" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_178">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 179
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0586853
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_179" name="pe_event_179" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_179">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 180
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0588589
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_180" name="pe_event_180" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_180">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 181
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0587291
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_181" name="pe_event_181" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_181">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 182
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0585993
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_182" name="pe_event_182" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_182">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 183
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0584696
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_183" name="pe_event_183" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_183">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 184
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0583398
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_184" name="pe_event_184" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_184">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 185
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0582101
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_185" name="pe_event_185" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_185">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 186
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0580803
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_186" name="pe_event_186" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_186">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 187
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0579505
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_187" name="pe_event_187" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_187">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 188
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0578208
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_188" name="pe_event_188" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_188">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 189
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.057691
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_189" name="pe_event_189" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_189">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 190
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0575613
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_190" name="pe_event_190" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_190">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 191
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0574315
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_191" name="pe_event_191" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_191">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 192
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0573017
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_192" name="pe_event_192" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_192">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 193
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.057172
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_193" name="pe_event_193" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_193">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 194
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0570422
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_194" name="pe_event_194" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_194">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 195
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0569125
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_195" name="pe_event_195" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_195">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 196
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0567827
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_196" name="pe_event_196" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_196">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 197
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.056653
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_197" name="pe_event_197" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_197">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 198
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0565232
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_198" name="pe_event_198" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_198">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 199
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0563934
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_199" name="pe_event_199" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_199">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 200
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0562637
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_200" name="pe_event_200" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_200">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 201
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0561339
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_201" name="pe_event_201" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_201">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 202
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0560042
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_202" name="pe_event_202" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_202">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 203
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0558744
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_203" name="pe_event_203" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_203">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 204
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0557446
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_204" name="pe_event_204" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_204">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 205
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0556149
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_205" name="pe_event_205" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_205">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 206
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0554851
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_206" name="pe_event_206" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_206">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 207
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0553554
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_207" name="pe_event_207" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_207">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 208
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0552256
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_208" name="pe_event_208" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_208">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 209
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0550958
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_209" name="pe_event_209" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_209">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 210
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0549661
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_210" name="pe_event_210" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_210">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 211
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0545798
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_211" name="pe_event_211" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_211">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 212
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0541935
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_212" name="pe_event_212" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_212">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 213
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0538072
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_213" name="pe_event_213" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_213">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 214
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0534208
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_214" name="pe_event_214" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_214">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 215
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0530345
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_215" name="pe_event_215" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_215">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 216
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0526482
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_216" name="pe_event_216" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_216">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 217
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0522619
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_217" name="pe_event_217" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_217">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 218
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0518756
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_218" name="pe_event_218" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_218">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 219
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0514893
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_219" name="pe_event_219" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_219">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 220
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.051103
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_220" name="pe_event_220" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_220">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 221
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0507167
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_221" name="pe_event_221" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_221">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 222
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0503304
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_222" name="pe_event_222" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_222">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 223
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0499441
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_223" name="pe_event_223" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_223">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 224
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0495578
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_224" name="pe_event_224" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_224">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 225
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0491714
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_225" name="pe_event_225" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_225">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 226
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0487851
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_226" name="pe_event_226" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_226">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 227
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0483988
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_227" name="pe_event_227" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_227">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 228
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0480125
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_228" name="pe_event_228" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_228">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 229
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0476262
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_229" name="pe_event_229" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_229">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 230
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0472399
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_230" name="pe_event_230" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_230">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 231
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0468536
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_231" name="pe_event_231" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_231">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 232
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0464673
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_232" name="pe_event_232" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_232">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 233
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.046081
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_233" name="pe_event_233" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_233">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 234
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0456947
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_234" name="pe_event_234" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_234">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 235
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0453083
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_235" name="pe_event_235" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_235">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 236
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.044922
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_236" name="pe_event_236" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_236">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 237
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0445357
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_237" name="pe_event_237" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_237">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 238
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0441494
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_238" name="pe_event_238" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_238">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 239
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0437631
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_239" name="pe_event_239" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_239">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 240
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0433768
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_240" name="pe_event_240" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_240">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 241
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0428196
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_241" name="pe_event_241" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_241">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 242
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0422624
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_242" name="pe_event_242" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_242">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 243
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0417053
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_243" name="pe_event_243" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_243">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 244
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0411481
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_244" name="pe_event_244" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_244">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 245
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0405909
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_245" name="pe_event_245" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_245">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 246
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0400337
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_246" name="pe_event_246" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_246">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 247
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0394766
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_247" name="pe_event_247" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_247">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 248
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0389194
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_248" name="pe_event_248" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_248">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 249
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0383622
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_249" name="pe_event_249" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_249">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 250
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.037805
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_250" name="pe_event_250" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_250">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 251
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0372479
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_251" name="pe_event_251" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_251">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 252
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0366907
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_252" name="pe_event_252" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_252">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 253
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0361335
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_253" name="pe_event_253" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_253">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 254
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0355763
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_254" name="pe_event_254" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_254">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 255
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0350192
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_255" name="pe_event_255" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_255">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 256
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.034462
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_256" name="pe_event_256" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_256">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 257
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0339048
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_257" name="pe_event_257" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_257">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 258
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0333476
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_258" name="pe_event_258" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_258">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 259
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0327905
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_259" name="pe_event_259" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_259">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 260
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0322333
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_260" name="pe_event_260" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_260">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 261
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0316761
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_261" name="pe_event_261" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_261">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 262
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0311189
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_262" name="pe_event_262" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_262">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 263
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0305618
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_263" name="pe_event_263" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_263">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 264
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0300046
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_264" name="pe_event_264" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_264">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 265
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0294474
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_265" name="pe_event_265" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_265">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 266
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0288902
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_266" name="pe_event_266" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_266">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 267
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0283331
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_267" name="pe_event_267" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_267">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 268
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0277759
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_268" name="pe_event_268" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_268">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 269
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0272187
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_269" name="pe_event_269" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_269">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 270
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0266615
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_270" name="pe_event_270" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_270">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 271
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0263149
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_271" name="pe_event_271" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_271">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 272
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0259683
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_272" name="pe_event_272" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_272">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 273
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0256216
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_273" name="pe_event_273" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_273">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 274
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.025275
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_274" name="pe_event_274" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_274">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 275
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0249284
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_275" name="pe_event_275" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_275">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 276
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0245817
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_276" name="pe_event_276" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_276">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 277
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0242351
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_277" name="pe_event_277" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_277">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 278
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0238884
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_278" name="pe_event_278" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_278">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 279
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0235418
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_279" name="pe_event_279" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_279">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 280
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0231952
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_280" name="pe_event_280" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_280">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 281
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0228485
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_281" name="pe_event_281" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_281">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 282
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0225019
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_282" name="pe_event_282" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_282">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 283
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0221553
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_283" name="pe_event_283" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_283">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 284
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0218086
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_284" name="pe_event_284" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_284">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 285
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.021462
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_285" name="pe_event_285" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_285">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 286
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0211153
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_286" name="pe_event_286" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_286">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 287
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0207687
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_287" name="pe_event_287" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_287">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 288
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0204221
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_288" name="pe_event_288" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_288">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 289
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0200754
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_289" name="pe_event_289" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_289">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 290
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0197288
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_290" name="pe_event_290" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_290">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 291
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0193822
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_291" name="pe_event_291" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_291">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 292
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0190355
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_292" name="pe_event_292" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_292">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 293
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0186889
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_293" name="pe_event_293" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_293">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 294
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0183422
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_294" name="pe_event_294" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_294">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 295
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0179956
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_295" name="pe_event_295" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_295">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 296
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.017649
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_296" name="pe_event_296" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_296">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 297
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0173023
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_297" name="pe_event_297" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_297">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 298
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0169557
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_298" name="pe_event_298" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_298">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 299
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.016609
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_299" name="pe_event_299" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_299">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 300
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0162624
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_300" name="pe_event_300" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_300">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 301
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0161014
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_301" name="pe_event_301" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_301">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 302
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0159405
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_302" name="pe_event_302" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_302">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 303
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0157795
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_303" name="pe_event_303" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_303">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 304
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0156185
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_304" name="pe_event_304" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_304">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 305
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0154575
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_305" name="pe_event_305" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_305">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 306
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0152965
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_306" name="pe_event_306" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_306">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 307
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0151356
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_307" name="pe_event_307" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_307">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 308
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0149746
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_308" name="pe_event_308" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_308">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 309
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0148136
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_309" name="pe_event_309" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_309">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 310
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0146526
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_310" name="pe_event_310" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_310">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 311
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0144917
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_311" name="pe_event_311" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_311">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 312
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0143307
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_312" name="pe_event_312" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_312">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 313
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0141697
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_313" name="pe_event_313" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_313">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 314
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0140087
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_314" name="pe_event_314" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_314">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 315
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0138477
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_315" name="pe_event_315" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_315">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 316
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0136868
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_316" name="pe_event_316" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_316">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 317
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0135258
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_317" name="pe_event_317" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_317">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 318
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0133648
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_318" name="pe_event_318" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_318">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 319
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0132038
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_319" name="pe_event_319" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_319">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 320
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0130428
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_320" name="pe_event_320" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_320">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 321
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0128819
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_321" name="pe_event_321" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_321">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 322
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0127209
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_322" name="pe_event_322" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_322">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 323
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0125599
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_323" name="pe_event_323" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_323">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 324
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0123989
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_324" name="pe_event_324" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_324">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 325
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.012238
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_325" name="pe_event_325" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_325">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 326
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.012077
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_326" name="pe_event_326" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_326">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 327
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.011916
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_327" name="pe_event_327" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_327">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 328
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.011755
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_328" name="pe_event_328" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_328">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 329
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.011594
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_329" name="pe_event_329" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_329">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 330
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0114331
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_330" name="pe_event_330" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_330">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 331
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0114331
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_331" name="pe_event_331" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_331">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 332
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0114331
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_332" name="pe_event_332" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_332">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 333
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0114331
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_333" name="pe_event_333" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_333">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 334
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0114331
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_334" name="pe_event_334" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_334">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 335
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0114331
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_335" name="pe_event_335" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_335">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 336
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0114331
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_336" name="pe_event_336" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_336">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 337
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0114331
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_337" name="pe_event_337" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_337">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 338
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0114331
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_338" name="pe_event_338" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_338">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 339
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0114331
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_339" name="pe_event_339" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_339">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 340
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0114331
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_340" name="pe_event_340" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_340">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 341
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0114331
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_341" name="pe_event_341" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_341">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 342
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0114331
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_342" name="pe_event_342" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_342">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 343
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0114331
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_343" name="pe_event_343" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_343">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 344
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0114331
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_344" name="pe_event_344" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_344">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 345
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0114331
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_345" name="pe_event_345" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_345">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 346
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0114331
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_346" name="pe_event_346" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_346">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 347
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0114331
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_347" name="pe_event_347" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_347">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 348
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0114331
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_348" name="pe_event_348" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_348">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 349
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0114331
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_349" name="pe_event_349" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_349">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 350
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0114331
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_350" name="pe_event_350" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_350">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 351
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0114331
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_351" name="pe_event_351" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_351">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 352
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0114331
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_352" name="pe_event_352" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_352">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 353
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0114331
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_353" name="pe_event_353" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_353">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 354
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0114331
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_354" name="pe_event_354" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_354">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 355
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0114331
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_355" name="pe_event_355" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_355">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 356
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0114331
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_356" name="pe_event_356" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_356">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 357
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0114331
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_357" name="pe_event_357" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_357">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 358
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0114331
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_358" name="pe_event_358" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_358">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 359
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0114331
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_359" name="pe_event_359" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Event_359">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2020-11-11T16:14:46Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=Basic SIR,Reference=Time>%360 > 360
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" targetKey="Metabolite_3">
            <Expression>
              0.0114331
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
    </ListOfEvents>
    <ListOfModelParameterSets activeSet="ModelParameterSet_1">
      <ModelParameterSet key="ModelParameterSet_1" name="Initial State">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelParameterSet_1">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2021-01-25T15:17:59Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=Basic SIR" value="0" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=Basic SIR,Vector=Compartments[Population]" value="8000000" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[S]" value="7999999" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[I]" value="1" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[R]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" value="98977.592000000004" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=Basic SIR,Vector=Values[L]" value="0.0023" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=Basic SIR,Vector=Values[a]" value="-32.5" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=Basic SIR,Vector=Values[R0max]" value="2.5" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=Basic SIR,Vector=Values[R0min]" value="1.5" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=Basic SIR,Vector=Values[r]" value="0.20000000000000001" type="ModelValue" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=Basic SIR,Vector=Reactions[Infection]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Basic SIR,Vector=Reactions[Infection],ParameterGroup=Parameters,Parameter=D" value="0.20000000000000001" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=Basic SIR,Vector=Values[r],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=Basic SIR,Vector=Reactions[Infection],ParameterGroup=Parameters,Parameter=a" value="-32.5" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=Basic SIR,Vector=Values[a],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=Basic SIR,Vector=Reactions[Infection],ParameterGroup=Parameters,Parameter=R0max" value="2.5" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=Basic SIR,Vector=Values[R0max],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=Basic SIR,Vector=Reactions[Infection],ParameterGroup=Parameters,Parameter=R0min" value="1.5" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=Basic SIR,Vector=Values[R0min],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Basic SIR,Vector=Reactions[Recovery]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Basic SIR,Vector=Reactions[Recovery],ParameterGroup=Parameters,Parameter=r" value="0.20000000000000001" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=Basic SIR,Vector=Values[r],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Basic SIR,Vector=Reactions[Susceptible]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Basic SIR,Vector=Reactions[Susceptible],ParameterGroup=Parameters,Parameter=r" value="0.0023" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=Basic SIR,Vector=Values[L],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_0" name="OC43">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelParameterSet_0">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2021-01-25T15:17:59Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=Basic SIR" value="0" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=Basic SIR,Vector=Compartments[Population]" value="8000000" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[S]" value="7999999" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[I]" value="1" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[R]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q]" value="98977.592000000004" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=Basic SIR,Vector=Values[L]" value="0.0023" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=Basic SIR,Vector=Values[a]" value="-32.5" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=Basic SIR,Vector=Values[R0max]" value="2.5" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=Basic SIR,Vector=Values[R0min]" value="1.5" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=Basic SIR,Vector=Values[r]" value="0.20000000000000001" type="ModelValue" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=Basic SIR,Vector=Reactions[Infection]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Basic SIR,Vector=Reactions[Infection],ParameterGroup=Parameters,Parameter=D" value="0.20000000000000001" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=Basic SIR,Vector=Values[r],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=Basic SIR,Vector=Reactions[Infection],ParameterGroup=Parameters,Parameter=a" value="-32.5" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=Basic SIR,Vector=Values[a],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=Basic SIR,Vector=Reactions[Infection],ParameterGroup=Parameters,Parameter=R0max" value="2.5" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=Basic SIR,Vector=Values[R0max],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=Basic SIR,Vector=Reactions[Infection],ParameterGroup=Parameters,Parameter=R0min" value="1.5" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=Basic SIR,Vector=Values[R0min],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Basic SIR,Vector=Reactions[Recovery]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Basic SIR,Vector=Reactions[Recovery],ParameterGroup=Parameters,Parameter=r" value="0.20000000000000001" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=Basic SIR,Vector=Values[r],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Basic SIR,Vector=Reactions[Susceptible]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Basic SIR,Vector=Reactions[Susceptible],ParameterGroup=Parameters,Parameter=r" value="0.0023" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=Basic SIR,Vector=Values[L],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
    </ListOfModelParameterSets>
    <StateTemplate>
      <StateTemplateVariable objectReference="Model_1"/>
      <StateTemplateVariable objectReference="Metabolite_0"/>
      <StateTemplateVariable objectReference="Metabolite_1"/>
      <StateTemplateVariable objectReference="Metabolite_2"/>
      <StateTemplateVariable objectReference="Metabolite_3"/>
      <StateTemplateVariable objectReference="Compartment_0"/>
      <StateTemplateVariable objectReference="ModelValue_0"/>
      <StateTemplateVariable objectReference="ModelValue_1"/>
      <StateTemplateVariable objectReference="ModelValue_2"/>
      <StateTemplateVariable objectReference="ModelValue_3"/>
      <StateTemplateVariable objectReference="ModelValue_4"/>
    </StateTemplate>
    <InitialState type="initialState">
      0 7999999 1 0 98977.592000000004 8000000 0.0023 -32.5 2.5 1.5 0.20000000000000001 
    </InitialState>
  </Model>
  <ListOfTasks>
    <Task key="Task_15" name="Steady-State" type="steadyState" scheduled="false" updateModel="false">
      <Report reference="Report_11" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="JacobianRequested" type="bool" value="1"/>
        <Parameter name="StabilityAnalysisRequested" type="bool" value="1"/>
      </Problem>
      <Method name="Enhanced Newton" type="EnhancedNewton">
        <Parameter name="Resolution" type="unsignedFloat" value="1.0000000000000001e-09"/>
        <Parameter name="Derivation Factor" type="unsignedFloat" value="0.001"/>
        <Parameter name="Use Newton" type="bool" value="1"/>
        <Parameter name="Use Integration" type="bool" value="1"/>
        <Parameter name="Use Back Integration" type="bool" value="0"/>
        <Parameter name="Accept Negative Concentrations" type="bool" value="0"/>
        <Parameter name="Iteration Limit" type="unsignedInteger" value="50"/>
        <Parameter name="Maximum duration for forward integration" type="unsignedFloat" value="1000000000"/>
        <Parameter name="Maximum duration for backward integration" type="unsignedFloat" value="1000000"/>
        <Parameter name="Target Criterion" type="string" value="Distance and Rate"/>
      </Method>
    </Task>
    <Task key="Task_16" name="Time-Course" type="timeCourse" scheduled="false" updateModel="false">
      <Report reference="Report_12" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="AutomaticStepSize" type="bool" value="0"/>
        <Parameter name="StepNumber" type="unsignedInteger" value="1458"/>
        <Parameter name="StepSize" type="float" value="0.4941660947"/>
        <Parameter name="Duration" type="float" value="720"/>
        <Parameter name="TimeSeriesRequested" type="bool" value="1"/>
        <Parameter name="OutputStartTime" type="float" value="0"/>
        <Parameter name="Output Event" type="bool" value="1"/>
        <Parameter name="Start in Steady State" type="bool" value="0"/>
        <Parameter name="Use Values" type="bool" value="0"/>
        <Parameter name="Values" type="string" value=""/>
      </Problem>
      <Method name="Deterministic (LSODA)" type="Deterministic(LSODA)">
        <Parameter name="Integrate Reduced Model" type="bool" value="0"/>
        <Parameter name="Relative Tolerance" type="unsignedFloat" value="9.9999999999999995e-07"/>
        <Parameter name="Absolute Tolerance" type="unsignedFloat" value="9.9999999999999998e-13"/>
        <Parameter name="Max Internal Steps" type="unsignedInteger" value="100000"/>
        <Parameter name="Max Internal Step Size" type="unsignedFloat" value="0"/>
      </Method>
    </Task>
    <Task key="Task_17" name="Scan" type="scan" scheduled="false" updateModel="false">
      <Problem>
        <Parameter name="Subtask" type="unsignedInteger" value="1"/>
        <ParameterGroup name="ScanItems">
          <ParameterGroup name="ScanItem">
            <Parameter name="Number of steps" type="unsignedInteger" value="10"/>
            <Parameter name="Type" type="unsignedInteger" value="1"/>
            <Parameter name="Object" type="cn" value="CN=Root,Model=Basic SIR,Vector=Reactions[Infection],ParameterGroup=Parameters,Parameter=k1,Reference=Value"/>
            <Parameter name="Minimum" type="float" value="1"/>
            <Parameter name="Maximum" type="float" value="5"/>
            <Parameter name="log" type="bool" value="0"/>
            <Parameter name="Values" type="string" value=""/>
            <Parameter name="Use Values" type="bool" value="0"/>
          </ParameterGroup>
          <ParameterGroup name="ScanItem">
            <Parameter name="Number of steps" type="unsignedInteger" value="10"/>
            <Parameter name="Type" type="unsignedInteger" value="0"/>
            <Parameter name="Object" type="cn" value=""/>
          </ParameterGroup>
          <ParameterGroup name="ScanItem">
            <Parameter name="Number of steps" type="unsignedInteger" value="5"/>
            <Parameter name="Type" type="unsignedInteger" value="2"/>
            <Parameter name="Object" type="cn" value="CN=Root,Model=Basic SIR,Vector=Reactions[Recovery],ParameterGroup=Parameters,Parameter=r,Reference=Value"/>
            <Parameter name="Minimum" type="float" value="0.10000000000000001"/>
            <Parameter name="Maximum" type="float" value="0.40000000000000002"/>
            <Parameter name="log" type="bool" value="0"/>
            <Parameter name="Distribution type" type="unsignedInteger" value="0"/>
          </ParameterGroup>
        </ParameterGroup>
        <Parameter name="Output in subtask" type="bool" value="1"/>
        <Parameter name="Adjust initial conditions" type="bool" value="0"/>
        <Parameter name="Continue on Error" type="bool" value="0"/>
      </Problem>
      <Method name="Scan Framework" type="ScanFramework">
      </Method>
    </Task>
    <Task key="Task_18" name="Elementary Flux Modes" type="fluxMode" scheduled="false" updateModel="false">
      <Report reference="Report_13" target="" append="1" confirmOverwrite="1"/>
      <Problem>
      </Problem>
      <Method name="EFM Algorithm" type="EFMAlgorithm">
      </Method>
    </Task>
    <Task key="Task_19" name="Optimization" type="optimization" scheduled="false" updateModel="false">
      <Report reference="Report_14" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="Subtask" type="cn" value="CN=Root,Vector=TaskList[Steady-State]"/>
        <ParameterText name="ObjectiveExpression" type="expression">
          
        </ParameterText>
        <Parameter name="Maximize" type="bool" value="0"/>
        <Parameter name="Randomize Start Values" type="bool" value="0"/>
        <Parameter name="Calculate Statistics" type="bool" value="1"/>
        <ParameterGroup name="OptimizationItemList">
        </ParameterGroup>
        <ParameterGroup name="OptimizationConstraintList">
        </ParameterGroup>
      </Problem>
      <Method name="Random Search" type="RandomSearch">
        <Parameter name="Log Verbosity" type="unsignedInteger" value="0"/>
        <Parameter name="Number of Iterations" type="unsignedInteger" value="100000"/>
        <Parameter name="Random Number Generator" type="unsignedInteger" value="1"/>
        <Parameter name="Seed" type="unsignedInteger" value="0"/>
      </Method>
    </Task>
    <Task key="Task_20" name="Parameter Estimation" type="parameterFitting" scheduled="false" updateModel="false">
      <Report reference="Report_15" target="../../Desktop/FirstParamEst.txt" append="0" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="Maximize" type="bool" value="0"/>
        <Parameter name="Randomize Start Values" type="bool" value="0"/>
        <Parameter name="Calculate Statistics" type="bool" value="1"/>
        <ParameterGroup name="OptimizationItemList">
          <ParameterGroup name="FitItem">
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=Basic SIR,Vector=Reactions[Infection],ParameterGroup=Parameters,Parameter=q,Reference=Value"/>
            <Parameter name="LowerBound" type="cn" value="1e-06"/>
            <Parameter name="UpperBound" type="cn" value="1e+06"/>
            <Parameter name="StartValue" type="float" value="0"/>
            <ParameterGroup name="Affected Experiments">
            </ParameterGroup>
            <ParameterGroup name="Affected Cross Validation Experiments">
            </ParameterGroup>
          </ParameterGroup>
        </ParameterGroup>
        <ParameterGroup name="OptimizationConstraintList">
        </ParameterGroup>
        <Parameter name="Steady-State" type="cn" value="CN=Root,Vector=TaskList[Steady-State]"/>
        <Parameter name="Time-Course" type="cn" value="CN=Root,Vector=TaskList[Time-Course]"/>
        <Parameter name="Create Parameter Sets" type="bool" value="0"/>
        <Parameter name="Use Time Sens" type="bool" value="0"/>
        <Parameter name="Time-Sens" type="cn" value=""/>
        <ParameterGroup name="Experiment Set">
          <ParameterGroup name="Experiment">
            <Parameter name="Key" type="key" value="Experiment_0"/>
            <Parameter name="File Name" type="file" value="daily_average(1).csv"/>
            <Parameter name="First Row" type="unsignedInteger" value="1"/>
            <Parameter name="Last Row" type="unsignedInteger" value="361"/>
            <Parameter name="Experiment Type" type="unsignedInteger" value="1"/>
            <Parameter name="Normalize Weights per Experiment" type="bool" value="1"/>
            <Parameter name="Separator" type="string" value=","/>
            <Parameter name="Weight Method" type="unsignedInteger" value="1"/>
            <Parameter name="Data is Row Oriented" type="bool" value="1"/>
            <Parameter name="Row containing Names" type="unsignedInteger" value="1"/>
            <Parameter name="Number of Columns" type="unsignedInteger" value="2"/>
            <ParameterGroup name="Object Map">
              <ParameterGroup name="0">
                <Parameter name="Role" type="unsignedInteger" value="3"/>
              </ParameterGroup>
              <ParameterGroup name="1">
                <Parameter name="Role" type="unsignedInteger" value="2"/>
                <Parameter name="Object CN" type="cn" value="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q],Reference=Concentration"/>
              </ParameterGroup>
            </ParameterGroup>
          </ParameterGroup>
        </ParameterGroup>
        <ParameterGroup name="Validation Set">
          <Parameter name="Weight" type="unsignedFloat" value="1"/>
          <Parameter name="Threshold" type="unsignedInteger" value="5"/>
        </ParameterGroup>
      </Problem>
      <Method name="Genetic Algorithm" type="GeneticAlgorithm">
        <Parameter name="Log Verbosity" type="unsignedInteger" value="0"/>
        <Parameter name="Number of Generations" type="unsignedInteger" value="200"/>
        <Parameter name="Population Size" type="unsignedInteger" value="300000"/>
        <Parameter name="Random Number Generator" type="unsignedInteger" value="1"/>
        <Parameter name="Seed" type="unsignedInteger" value="0"/>
        <Parameter name="Mutation Variance" type="float" value="0.10000000000000001"/>
        <Parameter name="Stop after # Stalled Generations" type="unsignedInteger" value="0"/>
      </Method>
    </Task>
    <Task key="Task_21" name="Metabolic Control Analysis" type="metabolicControlAnalysis" scheduled="false" updateModel="false">
      <Report reference="Report_16" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="Steady-State" type="key" value="Task_15"/>
      </Problem>
      <Method name="MCA Method (Reder)" type="MCAMethod(Reder)">
        <Parameter name="Modulation Factor" type="unsignedFloat" value="1.0000000000000001e-09"/>
        <Parameter name="Use Reder" type="bool" value="1"/>
        <Parameter name="Use Smallbone" type="bool" value="1"/>
      </Method>
    </Task>
    <Task key="Task_22" name="Lyapunov Exponents" type="lyapunovExponents" scheduled="false" updateModel="false">
      <Report reference="Report_17" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="ExponentNumber" type="unsignedInteger" value="3"/>
        <Parameter name="DivergenceRequested" type="bool" value="1"/>
        <Parameter name="TransientTime" type="float" value="0"/>
      </Problem>
      <Method name="Wolf Method" type="WolfMethod">
        <Parameter name="Orthonormalization Interval" type="unsignedFloat" value="1"/>
        <Parameter name="Overall time" type="unsignedFloat" value="1000"/>
        <Parameter name="Relative Tolerance" type="unsignedFloat" value="9.9999999999999995e-07"/>
        <Parameter name="Absolute Tolerance" type="unsignedFloat" value="9.9999999999999998e-13"/>
        <Parameter name="Max Internal Steps" type="unsignedInteger" value="10000"/>
      </Method>
    </Task>
    <Task key="Task_23" name="Time Scale Separation Analysis" type="timeScaleSeparationAnalysis" scheduled="false" updateModel="false">
      <Report reference="Report_18" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="StepNumber" type="unsignedInteger" value="100"/>
        <Parameter name="StepSize" type="float" value="0.01"/>
        <Parameter name="Duration" type="float" value="1"/>
        <Parameter name="TimeSeriesRequested" type="bool" value="1"/>
        <Parameter name="OutputStartTime" type="float" value="0"/>
      </Problem>
      <Method name="ILDM (LSODA,Deuflhard)" type="TimeScaleSeparation(ILDM,Deuflhard)">
        <Parameter name="Deuflhard Tolerance" type="unsignedFloat" value="0.0001"/>
      </Method>
    </Task>
    <Task key="Task_24" name="Sensitivities" type="sensitivities" scheduled="false" updateModel="false">
      <Report reference="Report_19" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="SubtaskType" type="unsignedInteger" value="1"/>
        <ParameterGroup name="TargetFunctions">
          <Parameter name="SingleObject" type="cn" value=""/>
          <Parameter name="ObjectListType" type="unsignedInteger" value="7"/>
        </ParameterGroup>
        <ParameterGroup name="ListOfVariables">
          <ParameterGroup name="Variables">
            <Parameter name="SingleObject" type="cn" value=""/>
            <Parameter name="ObjectListType" type="unsignedInteger" value="41"/>
          </ParameterGroup>
          <ParameterGroup name="Variables">
            <Parameter name="SingleObject" type="cn" value=""/>
            <Parameter name="ObjectListType" type="unsignedInteger" value="0"/>
          </ParameterGroup>
        </ParameterGroup>
      </Problem>
      <Method name="Sensitivities Method" type="SensitivitiesMethod">
        <Parameter name="Delta factor" type="unsignedFloat" value="0.001"/>
        <Parameter name="Delta minimum" type="unsignedFloat" value="9.9999999999999998e-13"/>
      </Method>
    </Task>
    <Task key="Task_25" name="Moieties" type="moieties" scheduled="false" updateModel="false">
      <Report reference="Report_20" target="" append="1" confirmOverwrite="1"/>
      <Problem>
      </Problem>
      <Method name="Householder Reduction" type="Householder">
      </Method>
    </Task>
    <Task key="Task_26" name="Cross Section" type="crosssection" scheduled="false" updateModel="false">
      <Problem>
        <Parameter name="AutomaticStepSize" type="bool" value="0"/>
        <Parameter name="StepNumber" type="unsignedInteger" value="100"/>
        <Parameter name="StepSize" type="float" value="0.01"/>
        <Parameter name="Duration" type="float" value="1"/>
        <Parameter name="TimeSeriesRequested" type="bool" value="1"/>
        <Parameter name="OutputStartTime" type="float" value="0"/>
        <Parameter name="Output Event" type="bool" value="0"/>
        <Parameter name="Start in Steady State" type="bool" value="0"/>
        <Parameter name="Use Values" type="bool" value="0"/>
        <Parameter name="Values" type="string" value=""/>
        <Parameter name="LimitCrossings" type="bool" value="0"/>
        <Parameter name="NumCrossingsLimit" type="unsignedInteger" value="0"/>
        <Parameter name="LimitOutTime" type="bool" value="0"/>
        <Parameter name="LimitOutCrossings" type="bool" value="0"/>
        <Parameter name="PositiveDirection" type="bool" value="1"/>
        <Parameter name="NumOutCrossingsLimit" type="unsignedInteger" value="0"/>
        <Parameter name="LimitUntilConvergence" type="bool" value="0"/>
        <Parameter name="ConvergenceTolerance" type="float" value="0"/>
        <Parameter name="Threshold" type="float" value="0"/>
        <Parameter name="DelayOutputUntilConvergence" type="bool" value="0"/>
        <Parameter name="OutputConvergenceTolerance" type="float" value="0"/>
        <ParameterText name="TriggerExpression" type="expression">
          
        </ParameterText>
        <Parameter name="SingleVariable" type="cn" value=""/>
      </Problem>
      <Method name="Deterministic (LSODA)" type="Deterministic(LSODA)">
        <Parameter name="Integrate Reduced Model" type="bool" value="0"/>
        <Parameter name="Relative Tolerance" type="unsignedFloat" value="9.9999999999999995e-07"/>
        <Parameter name="Absolute Tolerance" type="unsignedFloat" value="9.9999999999999998e-13"/>
        <Parameter name="Max Internal Steps" type="unsignedInteger" value="100000"/>
        <Parameter name="Max Internal Step Size" type="unsignedFloat" value="0"/>
      </Method>
    </Task>
    <Task key="Task_27" name="Linear Noise Approximation" type="linearNoiseApproximation" scheduled="false" updateModel="false">
      <Report reference="Report_21" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="Steady-State" type="key" value="Task_15"/>
      </Problem>
      <Method name="Linear Noise Approximation" type="LinearNoiseApproximation">
      </Method>
    </Task>
    <Task key="Task_28" name="Time-Course Sensitivities" type="timeSensitivities" scheduled="false" updateModel="false">
      <Problem>
        <Parameter name="AutomaticStepSize" type="bool" value="0"/>
        <Parameter name="StepNumber" type="unsignedInteger" value="100"/>
        <Parameter name="StepSize" type="float" value="0.01"/>
        <Parameter name="Duration" type="float" value="1"/>
        <Parameter name="TimeSeriesRequested" type="bool" value="1"/>
        <Parameter name="OutputStartTime" type="float" value="0"/>
        <Parameter name="Output Event" type="bool" value="0"/>
        <Parameter name="Start in Steady State" type="bool" value="0"/>
        <Parameter name="Use Values" type="bool" value="0"/>
        <Parameter name="Values" type="string" value=""/>
        <ParameterGroup name="ListOfParameters">
        </ParameterGroup>
        <ParameterGroup name="ListOfTargets">
        </ParameterGroup>
      </Problem>
      <Method name="LSODA Sensitivities" type="Sensitivities(LSODA)">
        <Parameter name="Integrate Reduced Model" type="bool" value="0"/>
        <Parameter name="Relative Tolerance" type="unsignedFloat" value="9.9999999999999995e-07"/>
        <Parameter name="Absolute Tolerance" type="unsignedFloat" value="9.9999999999999998e-13"/>
        <Parameter name="Max Internal Steps" type="unsignedInteger" value="10000"/>
        <Parameter name="Max Internal Step Size" type="unsignedFloat" value="0"/>
      </Method>
    </Task>
  </ListOfTasks>
  <ListOfReports>
    <Report key="Report_11" name="Steady-State" taskType="steadyState" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Footer>
        <Object cn="CN=Root,Vector=TaskList[Steady-State]"/>
      </Footer>
    </Report>
    <Report key="Report_12" name="Time-Course" taskType="timeCourse" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Time-Course],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="CN=Root,Vector=TaskList[Time-Course],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_13" name="Elementary Flux Modes" taskType="fluxMode" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Footer>
        <Object cn="CN=Root,Vector=TaskList[Elementary Flux Modes],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_14" name="Optimization" taskType="optimization" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Optimization],Object=Description"/>
        <Object cn="String=\[Function Evaluations\]"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="String=\[Best Value\]"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="String=\[Best Parameters\]"/>
      </Header>
      <Body>
        <Object cn="CN=Root,Vector=TaskList[Optimization],Problem=Optimization,Reference=Function Evaluations"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="CN=Root,Vector=TaskList[Optimization],Problem=Optimization,Reference=Best Value"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="CN=Root,Vector=TaskList[Optimization],Problem=Optimization,Reference=Best Parameters"/>
      </Body>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Optimization],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_15" name="Parameter Estimation" taskType="parameterFitting" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Parameter Estimation],Object=Description"/>
        <Object cn="String=\[Function Evaluations\]"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="String=\[Best Value\]"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="String=\[Best Parameters\]"/>
      </Header>
      <Body>
        <Object cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,Reference=Function Evaluations"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,Reference=Best Value"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,Reference=Best Parameters"/>
      </Body>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Parameter Estimation],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_16" name="Metabolic Control Analysis" taskType="metabolicControlAnalysis" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Metabolic Control Analysis],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Metabolic Control Analysis],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_17" name="Lyapunov Exponents" taskType="lyapunovExponents" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Lyapunov Exponents],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Lyapunov Exponents],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_18" name="Time Scale Separation Analysis" taskType="timeScaleSeparationAnalysis" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Time Scale Separation Analysis],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Time Scale Separation Analysis],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_19" name="Sensitivities" taskType="sensitivities" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Sensitivities],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Sensitivities],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_20" name="Moieties" taskType="moieties" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Moieties],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Moieties],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_21" name="Linear Noise Approximation" taskType="linearNoiseApproximation" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Linear Noise Approximation],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Linear Noise Approximation],Object=Result"/>
      </Footer>
    </Report>
  </ListOfReports>
  <ListOfPlots>
    <PlotSpecification name="plot_0" type="Plot2D" active="1" taskTypes="Time-Course">
      <Parameter name="log X" type="bool" value="0"/>
      <Parameter name="log Y" type="bool" value="0"/>
      <ListOfPlotItems>
        <PlotItem name="[I]|Time" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="2"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="1"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=Basic SIR,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[I],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
      </ListOfPlotItems>
    </PlotSpecification>
    <PlotSpecification name="Param Scan Expt" type="Plot2D" active="1" taskTypes="Scan">
      <Parameter name="log X" type="bool" value="0"/>
      <Parameter name="log Y" type="bool" value="0"/>
      <ListOfPlotItems>
        <PlotItem name="I.ParticleNumber|Time" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="2"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=Basic SIR,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[I],Reference=ParticleNumber"/>
          </ListOfChannels>
        </PlotItem>
      </ListOfPlotItems>
    </PlotSpecification>
    <PlotSpecification name="Parameter Estimation Result" type="Plot2D" active="1" taskTypes="Parameter Estimation">
      <Parameter name="log X" type="bool" value="0"/>
      <Parameter name="log Y" type="bool" value="0"/>
      <ListOfPlotItems>
        <PlotItem name="FirstParamEstSIR,(Infection).ParticleFlux(Measured Value)" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="3"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="1"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="1"/>
          <Parameter name="Color" type="string" value="#FF0000"/>
          <Parameter name="Recording Activity" type="string" value="after"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=FirstParamEstSIR,Vector=Fitted Points[0],Reference=Independent Value"/>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=FirstParamEstSIR,Vector=Fitted Points[0],Reference=Measured Value"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="FirstParamEstSIR,(Infection).ParticleFlux(Fitted Value)" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="#FF0000"/>
          <Parameter name="Recording Activity" type="string" value="after"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=FirstParamEstSIR,Vector=Fitted Points[0],Reference=Independent Value"/>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=FirstParamEstSIR,Vector=Fitted Points[0],Reference=Fitted Value"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="FirstParamEstSIR,(Infection).ParticleFlux(Weighted Error)" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="2"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="2"/>
          <Parameter name="Color" type="string" value="#FF0000"/>
          <Parameter name="Recording Activity" type="string" value="after"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=FirstParamEstSIR,Vector=Fitted Points[0],Reference=Independent Value"/>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=FirstParamEstSIR,Vector=Fitted Points[0],Reference=Weighted Error"/>
          </ListOfChannels>
        </PlotItem>
      </ListOfPlotItems>
    </PlotSpecification>
    <PlotSpecification name="Concentrations, Volumes, and Global Quantity Values" type="Plot2D" active="1" taskTypes="">
      <Parameter name="log X" type="bool" value="0"/>
      <Parameter name="log Y" type="bool" value="0"/>
      <ListOfPlotItems>
        <PlotItem name="[S]" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=Basic SIR,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[S],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[I]" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=Basic SIR,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[I],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[R]" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=Basic SIR,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[R],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[q]" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=Basic SIR,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=Basic SIR,Vector=Compartments[Population],Vector=Metabolites[q],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
      </ListOfPlotItems>
    </PlotSpecification>
  </ListOfPlots>
  <GUI>
  </GUI>
  <ListOfUnitDefinitions>
    <UnitDefinition key="Unit_1" name="meter" symbol="m">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Unit_0">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2021-01-25T15:17:56Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        m
      </Expression>
    </UnitDefinition>
    <UnitDefinition key="Unit_5" name="second" symbol="s">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Unit_4">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2021-01-25T15:17:56Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        s
      </Expression>
    </UnitDefinition>
    <UnitDefinition key="Unit_15" name="dimensionless" symbol="1">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Unit_14">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2021-01-25T15:17:56Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        1
      </Expression>
    </UnitDefinition>
    <UnitDefinition key="Unit_17" name="item" symbol="#">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Unit_16">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2021-01-25T15:17:56Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        #
      </Expression>
    </UnitDefinition>
    <UnitDefinition key="Unit_69" name="day" symbol="d">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Unit_68">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2021-01-25T15:17:56Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        86400*s
      </Expression>
    </UnitDefinition>
  </ListOfUnitDefinitions>
</COPASI>
