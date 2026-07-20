<?xml version="1.0" encoding="UTF-8"?>
<!-- generated with COPASI 4.45 (Build 298) (http://www.copasi.org) at 2026-07-20T08:50:32Z -->
<?oxygen RNGSchema="http://www.copasi.org/static/schema/CopasiML.rng" type="xml"?>
<COPASI xmlns="http://www.copasi.org/static/schema" versionMajor="4" versionMinor="45" versionDevel="298" copasiSourcesModified="0">
  <ListOfFunctions>
    <Function key="Function_13" name="Mass action (irreversible)" type="MassAction" reversible="false">
      <MiriamAnnotation>
<rdf:RDF xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#" xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
   <rdf:Description rdf:about="#Function_13">
   <CopasiMT:is rdf:resource="urn:miriam:obo.sbo:SBO:0000041" />
   </rdf:Description>
   </rdf:RDF>
      </MiriamAnnotation>
      <Comment>
        <body xmlns="http://www.w3.org/1999/xhtml">
<b>Mass action rate law for first order irreversible reactions</b>
<p>
Reaction scheme where the products are created from the reactants and the change of a product quantity is proportional to the product of reactant activities. The reaction scheme does not include any reverse process that creates the reactants from the products. The change of a product quantity is proportional to the quantity of one reactant.
</p>
</body>
      </Comment>
      <Expression>
        k1*PRODUCT&lt;substrate_i>
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_80" name="k1" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_81" name="substrate" order="1" role="substrate"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_102" name="PFK kinetics" type="UserDefined" reversible="false">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_102">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vmax*(gR*(F6P/Kf6p)*(ATP/Katp)*(1+F6P/Kf6p+ATP/Katp+gR*F6P/Kf6p*ATP/Katp)/((1+F6P/Kf6p+ATP/Katp+gR*F6P/Kf6p*ATP/Katp)^2+(L0*((1+Ciatp*ATP/Kiatp)/(1+ATP/Kiatp))^2*((1+Camp*AMP/Kamp)/(1+AMP/Kamp))^2*((1+Cf26*F26BP/Kf26+Cf16*F16P/Kf16)/(1+F26BP/Kf26+F16P/Kf16))^2)*(1+Catp*ATP/Katp)^2))
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_772" name="F6P" order="0" role="substrate"/>
        <ParameterDescription key="FunctionParameter_815" name="ATP" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_827" name="F16P" order="2" role="product"/>
        <ParameterDescription key="FunctionParameter_821" name="AMP" order="3" role="modifier"/>
        <ParameterDescription key="FunctionParameter_824" name="F26BP" order="4" role="modifier"/>
        <ParameterDescription key="FunctionParameter_769" name="Vmax" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_668" name="gR" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_774" name="Kf6p" order="7" role="constant"/>
        <ParameterDescription key="FunctionParameter_816" name="Katp" order="8" role="constant"/>
        <ParameterDescription key="FunctionParameter_817" name="L0" order="9" role="constant"/>
        <ParameterDescription key="FunctionParameter_818" name="Ciatp" order="10" role="constant"/>
        <ParameterDescription key="FunctionParameter_819" name="Kiatp" order="11" role="constant"/>
        <ParameterDescription key="FunctionParameter_820" name="Camp" order="12" role="constant"/>
        <ParameterDescription key="FunctionParameter_822" name="Kamp" order="13" role="constant"/>
        <ParameterDescription key="FunctionParameter_823" name="Cf26" order="14" role="constant"/>
        <ParameterDescription key="FunctionParameter_825" name="Kf26" order="15" role="constant"/>
        <ParameterDescription key="FunctionParameter_826" name="Cf16" order="16" role="constant"/>
        <ParameterDescription key="FunctionParameter_828" name="Kf16" order="17" role="constant"/>
        <ParameterDescription key="FunctionParameter_829" name="Catp" order="18" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_109" name="PDC kinetics" type="UserDefined" reversible="false">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_109">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vmax*((A/Kpyr)^nH)/(1+(A/Kpyr)^nH)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_794" name="A" order="0" role="substrate"/>
        <ParameterDescription key="FunctionParameter_788" name="Vmax" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_809" name="Kpyr" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_806" name="nH" order="3" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_111" name="ATPase" type="UserDefined" reversible="false">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_111">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Katpase*ATP
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_693" name="ATP" order="0" role="substrate"/>
        <ParameterDescription key="FunctionParameter_766" name="Katpase" order="1" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_112" name="G3PDH kinetics" type="UserDefined" reversible="false">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_112">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vmax*((A/Kdhap)*(B/Knadh)-(P/Kdhap)*(Q/Knadh)*(1/Keq))/((1+A/Kdhap+P/Kglycerol)*(1+B/Knadh+Q/Knad))
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_846" name="A" order="0" role="substrate"/>
        <ParameterDescription key="FunctionParameter_873" name="B" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_877" name="P" order="2" role="product"/>
        <ParameterDescription key="FunctionParameter_890" name="Q" order="3" role="product"/>
        <ParameterDescription key="FunctionParameter_790" name="Vmax" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_871" name="Kdhap" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_875" name="Knadh" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_891" name="Keq" order="7" role="constant"/>
        <ParameterDescription key="FunctionParameter_892" name="Kglycerol" order="8" role="constant"/>
        <ParameterDescription key="FunctionParameter_893" name="Knad" order="9" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_113" name="Glycogen synthesis kinetics" type="UserDefined" reversible="false">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_113">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        KGLYCOGEN
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_802" name="KGLYCOGEN" order="0" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_114" name="Trehalose synthesis kinetics" type="UserDefined" reversible="false">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_114">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Ktrehalose
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_848" name="Ktrehalose" order="0" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_115" name="Succinate kinetics" type="UserDefined" reversible="false">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_115">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        k*A
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_870" name="A" order="0" role="substrate"/>
        <ParameterDescription key="FunctionParameter_835" name="k" order="1" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_125" name="HXT kinetics (forward part)" type="Function" reversible="false">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_125">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vmax*A/Kglc/(1+(A+B)/Kglc+Ki*A*B/Kglc^2)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_944" name="A" order="0" role="substrate"/>
        <ParameterDescription key="FunctionParameter_945" name="B" order="1" role="modifier"/>
        <ParameterDescription key="FunctionParameter_946" name="Vmax" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_947" name="Kglc" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_948" name="Ki" order="4" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_126" name="HXT kinetics (backward part)" type="Function" reversible="false">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_126">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vmax*B/Kglc/(1+(A+B)/Kglc+Ki*A*B/Kglc^2)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_953" name="A" order="0" role="modifier"/>
        <ParameterDescription key="FunctionParameter_952" name="B" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_951" name="Vmax" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_950" name="Kglc" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_949" name="Ki" order="4" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_127" name="HK kinetics (forward part)" type="Function" reversible="false">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_127">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vmax*(A*B/(Kglc*Katp))/((1+A/Kglc+P/Kg6p)*(1+B/Katp+Q/Kadp))
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_964" name="A" order="0" role="substrate"/>
        <ParameterDescription key="FunctionParameter_965" name="B" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_966" name="P" order="2" role="modifier"/>
        <ParameterDescription key="FunctionParameter_967" name="Q" order="3" role="modifier"/>
        <ParameterDescription key="FunctionParameter_968" name="Vmax" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_969" name="Kglc" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_970" name="Katp" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_972" name="Kg6p" order="7" role="constant"/>
        <ParameterDescription key="FunctionParameter_973" name="Kadp" order="8" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_128" name="HK kinetics (backward part)" type="Function" reversible="false">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_128">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vmax*(P*Q/(Kglc*Katp*Keq))/((1+A/Kglc+P/Kg6p)*(1+B/Katp+Q/Kadp))
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_982" name="A" order="0" role="modifier"/>
        <ParameterDescription key="FunctionParameter_981" name="B" order="1" role="modifier"/>
        <ParameterDescription key="FunctionParameter_980" name="P" order="2" role="substrate"/>
        <ParameterDescription key="FunctionParameter_979" name="Q" order="3" role="substrate"/>
        <ParameterDescription key="FunctionParameter_978" name="Vmax" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_977" name="Kglc" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_976" name="Katp" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_975" name="Keq" order="7" role="constant"/>
        <ParameterDescription key="FunctionParameter_974" name="Kg6p" order="8" role="constant"/>
        <ParameterDescription key="FunctionParameter_971" name="Kadp" order="9" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_129" name="PGI kinetics (forward part)" type="Function" reversible="false">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_129">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vmax*(A/Kg6p)/(1+A/Kg6p+P/Kf6p)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_1002" name="A" order="0" role="substrate"/>
        <ParameterDescription key="FunctionParameter_1003" name="P" order="1" role="modifier"/>
        <ParameterDescription key="FunctionParameter_1004" name="Vmax" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_1005" name="Kg6p" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_1007" name="Kf6p" order="4" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_130" name="PGI kinetics (backward part)" type="Function" reversible="false">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_130">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vmax*(P/(Kg6p*Keq))/(1+A/Kg6p+P/Kf6p)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_1078" name="A" order="0" role="modifier"/>
        <ParameterDescription key="FunctionParameter_1011" name="P" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_1010" name="Vmax" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_1009" name="Kg6p" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_1008" name="Keq" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_1006" name="Kf6p" order="5" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_131" name="ALD kinetics (forward part)" type="Function" reversible="false">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_131">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vmax*(A/Kf16bp)/(1+A/Kf16bp+P/Kdhap+Q/Kgap+A*Q/(Kf16bp*Kigap)+P*Q/(Kdhap*Kgap))
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_1090" name="A" order="0" role="substrate"/>
        <ParameterDescription key="FunctionParameter_1091" name="P" order="1" role="modifier"/>
        <ParameterDescription key="FunctionParameter_1092" name="Q" order="2" role="modifier"/>
        <ParameterDescription key="FunctionParameter_1093" name="Vmax" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_1094" name="Kf16bp" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_1096" name="Kdhap" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_1097" name="Kgap" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_1098" name="Kigap" order="7" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_132" name="ALD kinetics (backward part)" type="Function" reversible="false">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_132">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vmax*(P*Q/(Kf16bp*Keq))/(1+A/Kf16bp+P/Kdhap+Q/Kgap+A*Q/(Kf16bp*Kigap)+P*Q/(Kdhap*Kgap))
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_1106" name="A" order="0" role="modifier"/>
        <ParameterDescription key="FunctionParameter_1105" name="P" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_1104" name="Q" order="2" role="substrate"/>
        <ParameterDescription key="FunctionParameter_1103" name="Vmax" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_1102" name="Kf16bp" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_1101" name="Keq" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_1100" name="Kdhap" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_1099" name="Kgap" order="7" role="constant"/>
        <ParameterDescription key="FunctionParameter_1095" name="Kigap" order="8" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_133" name="GAPDH kinetics (forward part)" type="Function" reversible="false">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_133">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        C*(Vmaxf*A*B/(Kgap*Knad))/((1+A/Kgap+P/Kbpg)*(1+B/Knad+Q/Knadh))
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_1128" name="A" order="0" role="substrate"/>
        <ParameterDescription key="FunctionParameter_1129" name="B" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_1130" name="P" order="2" role="modifier"/>
        <ParameterDescription key="FunctionParameter_1131" name="Q" order="3" role="modifier"/>
        <ParameterDescription key="FunctionParameter_1132" name="C" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_1133" name="Vmaxf" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_1134" name="Kgap" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_1135" name="Knad" order="7" role="constant"/>
        <ParameterDescription key="FunctionParameter_1137" name="Kbpg" order="8" role="constant"/>
        <ParameterDescription key="FunctionParameter_1138" name="Knadh" order="9" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_134" name="GAPDH kinetics (backward part)" type="Function" reversible="false">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_134">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        C*(Vmaxr*P*Q/(Kbpg*Knadh))/((1+A/Kgap+P/Kbpg)*(1+B/Knad+Q/Knadh))
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_1148" name="A" order="0" role="modifier"/>
        <ParameterDescription key="FunctionParameter_1147" name="B" order="1" role="modifier"/>
        <ParameterDescription key="FunctionParameter_1146" name="P" order="2" role="substrate"/>
        <ParameterDescription key="FunctionParameter_1145" name="Q" order="3" role="substrate"/>
        <ParameterDescription key="FunctionParameter_1144" name="C" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_1142" name="Kgap" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_1141" name="Knad" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_1140" name="Vmaxr" order="7" role="constant"/>
        <ParameterDescription key="FunctionParameter_1139" name="Kbpg" order="8" role="constant"/>
        <ParameterDescription key="FunctionParameter_1136" name="Knadh" order="9" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_135" name="PGK kinetics (forward part)" type="Function" reversible="false">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_135">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vmax*(Keq*A*B/(Kp3g*Katp))/((1+A/Kbpg+P/Kp3g)*(1+B/Kadp+Q/Katp))
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_1168" name="A" order="0" role="substrate"/>
        <ParameterDescription key="FunctionParameter_1169" name="B" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_1170" name="P" order="2" role="modifier"/>
        <ParameterDescription key="FunctionParameter_1171" name="Q" order="3" role="modifier"/>
        <ParameterDescription key="FunctionParameter_1172" name="Vmax" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_1173" name="Keq" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_1174" name="Kp3g" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_1175" name="Katp" order="7" role="constant"/>
        <ParameterDescription key="FunctionParameter_1176" name="Kbpg" order="8" role="constant"/>
        <ParameterDescription key="FunctionParameter_1177" name="Kadp" order="9" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_136" name="PGK kinetics (backward part)" type="Function" reversible="false">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_136">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vmax*(P*Q/(Kp3g*Katp))/((1+A/Kbpg+P/Kp3g)*(1+B/Kadp+Q/Katp))
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_1187" name="A" order="0" role="modifier"/>
        <ParameterDescription key="FunctionParameter_1186" name="B" order="1" role="modifier"/>
        <ParameterDescription key="FunctionParameter_1185" name="P" order="2" role="substrate"/>
        <ParameterDescription key="FunctionParameter_1184" name="Q" order="3" role="substrate"/>
        <ParameterDescription key="FunctionParameter_1183" name="Vmax" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_1181" name="Kp3g" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_1180" name="Katp" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_1179" name="Kbpg" order="7" role="constant"/>
        <ParameterDescription key="FunctionParameter_1178" name="Kadp" order="8" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_137" name="PGM kinetics (forward part)" type="Function" reversible="false">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_137">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vmax*(A/Kp3g)/(1+A/Kp3g+P/Kp2g)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_1206" name="A" order="0" role="substrate"/>
        <ParameterDescription key="FunctionParameter_1207" name="P" order="1" role="modifier"/>
        <ParameterDescription key="FunctionParameter_1208" name="Vmax" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_1209" name="Kp3g" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_1211" name="Kp2g" order="4" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_138" name="PGM kinetics (backward part)" type="Function" reversible="false">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_138">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vmax*(P/(Kp3g*Keq))/(1+A/Kp3g+P/Kp2g)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_1216" name="A" order="0" role="modifier"/>
        <ParameterDescription key="FunctionParameter_1215" name="P" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_1214" name="Vmax" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_1213" name="Kp3g" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_1212" name="Keq" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_1210" name="Kp2g" order="5" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_139" name="ENO kinetics (forward part)" type="Function" reversible="false">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_139">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vmax*(A/Kp2g)/(1+A/Kp2g+P/Kpep)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_1228" name="A" order="0" role="substrate"/>
        <ParameterDescription key="FunctionParameter_1229" name="P" order="1" role="modifier"/>
        <ParameterDescription key="FunctionParameter_1230" name="Vmax" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_1231" name="Kp2g" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_1233" name="Kpep" order="4" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_140" name="ENO kinetics (backward part)" type="Function" reversible="false">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_140">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vmax*(P/(Kp2g*Keq))/(1+A/Kp2g+P/Kpep)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_1238" name="A" order="0" role="modifier"/>
        <ParameterDescription key="FunctionParameter_1237" name="P" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_1236" name="Vmax" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_1235" name="Kp2g" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_1234" name="Keq" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_1232" name="Kpep" order="5" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_141" name="PYK kinetics (forward part)" type="Function" reversible="false">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_141">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vmax*(A*B/(Kpep*Kadp))/((1+A/Kpep+P/Kpyr)*(1+B/Kadp+Q/Katp))
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_1250" name="A" order="0" role="substrate"/>
        <ParameterDescription key="FunctionParameter_1251" name="B" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_1252" name="P" order="2" role="modifier"/>
        <ParameterDescription key="FunctionParameter_1253" name="Q" order="3" role="modifier"/>
        <ParameterDescription key="FunctionParameter_1254" name="Vmax" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_1255" name="Kpep" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_1256" name="Kadp" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_1258" name="Kpyr" order="7" role="constant"/>
        <ParameterDescription key="FunctionParameter_1259" name="Katp" order="8" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_142" name="PYK kinetics (backward part)" type="Function" reversible="false">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_142">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vmax*(P*Q/(Kpep*Kadp*Keq))/((1+A/Kpep+P/Kpyr)*(1+B/Kadp+Q/Katp))
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_1268" name="A" order="0" role="modifier"/>
        <ParameterDescription key="FunctionParameter_1267" name="B" order="1" role="modifier"/>
        <ParameterDescription key="FunctionParameter_1266" name="P" order="2" role="substrate"/>
        <ParameterDescription key="FunctionParameter_1265" name="Q" order="3" role="substrate"/>
        <ParameterDescription key="FunctionParameter_1264" name="Vmax" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_1263" name="Kpep" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_1262" name="Kadp" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_1261" name="Keq" order="7" role="constant"/>
        <ParameterDescription key="FunctionParameter_1260" name="Kpyr" order="8" role="constant"/>
        <ParameterDescription key="FunctionParameter_1257" name="Katp" order="9" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_143" name="ADH kinetics (forward part)" type="Function" reversible="false">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_143">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vmax*(A*B/(Ketoh*Kinad))/(1+B/Kinad+A*Knad/(Kinad*Ketoh)+P*Knadh/(Kinadh*Kacald)+Q/Kinadh+A*B/(Kinad*Ketoh)+B*P*Knadh/(Kinad*Kinadh*Kacald)+A*Q*Knad/(Kinad*Kinadh*Ketoh)+P*Q/(Kacald*Kinadh)+A*B*P/(Kinad*Kiacald*Ketoh)+A*P*Q/(Kietoh*Kinadh*Kacald))
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_1288" name="A" order="0" role="substrate"/>
        <ParameterDescription key="FunctionParameter_1289" name="B" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_1290" name="P" order="2" role="modifier"/>
        <ParameterDescription key="FunctionParameter_1291" name="Q" order="3" role="modifier"/>
        <ParameterDescription key="FunctionParameter_1292" name="Vmax" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_1293" name="Ketoh" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_1294" name="Kinad" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_1296" name="Knad" order="7" role="constant"/>
        <ParameterDescription key="FunctionParameter_1297" name="Knadh" order="8" role="constant"/>
        <ParameterDescription key="FunctionParameter_1298" name="Kinadh" order="9" role="constant"/>
        <ParameterDescription key="FunctionParameter_1299" name="Kacald" order="10" role="constant"/>
        <ParameterDescription key="FunctionParameter_1300" name="Kiacald" order="11" role="constant"/>
        <ParameterDescription key="FunctionParameter_1301" name="Kietoh" order="12" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_144" name="ADH kinetics (backward part)" type="Function" reversible="false">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_144">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vmax*(P*Q/(Ketoh*Kinad*Keq))/(1+B/Kinad+A*Knad/(Kinad*Ketoh)+P*Knadh/(Kinadh*Kacald)+Q/Kinadh+A*B/(Kinad*Ketoh)+B*P*Knadh/(Kinad*Kinadh*Kacald)+A*Q*Knad/(Kinad*Kinadh*Ketoh)+P*Q/(Kacald*Kinadh)+A*B*P/(Kinad*Kiacald*Ketoh)+A*P*Q/(Kietoh*Kinadh*Kacald))
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_1314" name="A" order="0" role="modifier"/>
        <ParameterDescription key="FunctionParameter_1313" name="B" order="1" role="modifier"/>
        <ParameterDescription key="FunctionParameter_1312" name="P" order="2" role="substrate"/>
        <ParameterDescription key="FunctionParameter_1311" name="Q" order="3" role="substrate"/>
        <ParameterDescription key="FunctionParameter_1310" name="Vmax" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_1309" name="Ketoh" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_1308" name="Kinad" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_1307" name="Keq" order="7" role="constant"/>
        <ParameterDescription key="FunctionParameter_1306" name="Knad" order="8" role="constant"/>
        <ParameterDescription key="FunctionParameter_1305" name="Knadh" order="9" role="constant"/>
        <ParameterDescription key="FunctionParameter_1304" name="Kinadh" order="10" role="constant"/>
        <ParameterDescription key="FunctionParameter_1303" name="Kacald" order="11" role="constant"/>
        <ParameterDescription key="FunctionParameter_1302" name="Kiacald" order="12" role="constant"/>
        <ParameterDescription key="FunctionParameter_1295" name="Kietoh" order="13" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
  </ListOfFunctions>
  <Model key="Model_0" name="Yeast glycolysis model of Pritchard and Kell" simulationType="time" timeUnit="min" volumeUnit="ml" areaUnit="m²" lengthUnit="m" quantityUnit="mmol" type="deterministic" avogadroConstant="6.0221407599999999e+23">
    <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
   xmlns:vCard="http://www.w3.org/2001/vcard-rdf/3.0#">
  <rdf:Description rdf:about="#Model_0">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2026-07-20T08:49:20Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
    <dcterms:creator>
      <rdf:Description>
        <vCard:EMAIL>frank.bergmann@bioquant.uni-heidelberg.de</vCard:EMAIL>
        <vCard:N>
          <rdf:Description>
            <vCard:Family>Bergmann</vCard:Family>
            <vCard:Given>Frank T</vCard:Given>
          </rdf:Description>
        </vCard:N>
        <vCard:ORG>
          <rdf:Description>
            <vCard:Orgname>Heidelberg University</vCard:Orgname>
          </rdf:Description>
        </vCard:ORG>
      </rdf:Description>
    </dcterms:creator>
  </rdf:Description>
</rdf:RDF>

    </MiriamAnnotation>
    <Comment>
      From Pritchard and Kell (2002) Eur. J. Biochem. , modified from Teusink et al. 
(2000) Eur J Biochem 267, 5313-5329. This version uses the Vmaxes found by 
the best fit (R1) of Table 1 of the Pritchard and Kell paper, and simulates a decrease of external glucose  concentration from 100 to 2 mM

(More model files at http://users.aber.ac.uk/lep/models.shtml)

    </Comment>
    <ListOfCompartments>
      <Compartment key="Compartment_0" name="compartment" simulationType="fixed" dimensionality="3" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Compartment_0">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Compartment>
    </ListOfCompartments>
    <ListOfMetabolites>
      <Metabolite key="Metabolite_4" name="GLCo" simulationType="fixed" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_4">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_5" name="GLCi" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_5">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_16" name="ATP" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_16">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_17" name="G6P" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_17">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_18" name="ADP" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_18">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_19" name="F6P" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_19">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_20" name="F16bP" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_20">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_21" name="AMP" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_21">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_28" name="F26bP" simulationType="fixed" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_28">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_27" name="DHAP" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_27">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_26" name="GAP" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_26">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_25" name="NAD" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_25">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_24" name="BPG" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_24">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_23" name="NADH" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_23">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_22" name="P3G" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_22">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_11" name="P2G" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_11">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_10" name="PEP" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_10">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_9" name="PYR" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_9">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_8" name="AcAld" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_8">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_7" name="CO2" simulationType="fixed" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_7">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_6" name="EtOH" simulationType="fixed" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_6">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_3" name="Glycerol" simulationType="fixed" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_3">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_2" name="Glycogen" simulationType="fixed" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_2">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_1" name="Trehalose" simulationType="fixed" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_1">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_0" name="Succinate" simulationType="fixed" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_0">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
    </ListOfMetabolites>
    <ListOfReactions>
      <Reaction key="Reaction_27" name="PFK" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_27">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_19" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_16" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_20" stoichiometry="1"/>
          <Product metabolite="Metabolite_18" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_21" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_28" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_33" name="Vmax" value="110"/>
          <Constant key="Parameter_32" name="gR" value="5.12"/>
          <Constant key="Parameter_31" name="Kf6p" value="0.1"/>
          <Constant key="Parameter_30" name="Katp" value="0.71"/>
          <Constant key="Parameter_29" name="L0" value="0.66"/>
          <Constant key="Parameter_28" name="Ciatp" value="100"/>
          <Constant key="Parameter_27" name="Kiatp" value="0.65"/>
          <Constant key="Parameter_26" name="Camp" value="0.0845"/>
          <Constant key="Parameter_25" name="Kamp" value="0.0995"/>
          <Constant key="Parameter_24" name="Cf26" value="0.0174"/>
          <Constant key="Parameter_23" name="Kf26" value="0.000682"/>
          <Constant key="Parameter_22" name="Cf16" value="0.397"/>
          <Constant key="Parameter_3" name="Kf16" value="0.111"/>
          <Constant key="Parameter_1" name="Catp" value="3"/>
        </ListOfConstants>
        <KineticLaw function="Function_102" unitType="Default" scalingCompartment="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Compartments[compartment]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_772">
              <SourceParameter reference="Metabolite_19"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_815">
              <SourceParameter reference="Metabolite_16"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_827">
              <SourceParameter reference="Metabolite_20"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_821">
              <SourceParameter reference="Metabolite_21"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_824">
              <SourceParameter reference="Metabolite_28"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_769">
              <SourceParameter reference="Parameter_33"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_668">
              <SourceParameter reference="Parameter_32"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_774">
              <SourceParameter reference="Parameter_31"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_816">
              <SourceParameter reference="Parameter_30"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_817">
              <SourceParameter reference="Parameter_29"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_818">
              <SourceParameter reference="Parameter_28"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_819">
              <SourceParameter reference="Parameter_27"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_820">
              <SourceParameter reference="Parameter_26"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_822">
              <SourceParameter reference="Parameter_25"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_823">
              <SourceParameter reference="Parameter_24"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_825">
              <SourceParameter reference="Parameter_23"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_826">
              <SourceParameter reference="Parameter_22"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_828">
              <SourceParameter reference="Parameter_3"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_829">
              <SourceParameter reference="Parameter_1"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_39" name="PDC" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_39">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_9" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_8" stoichiometry="1"/>
          <Product metabolite="Metabolite_7" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_0" name="Vmax" value="857.8"/>
          <Constant key="Parameter_2" name="Kpyr" value="4.33"/>
          <Constant key="Parameter_5" name="nH" value="1.9"/>
        </ListOfConstants>
        <KineticLaw function="Function_109" unitType="Default" scalingCompartment="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Compartments[compartment]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_794">
              <SourceParameter reference="Metabolite_9"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_788">
              <SourceParameter reference="Parameter_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_809">
              <SourceParameter reference="Parameter_2"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_806">
              <SourceParameter reference="Parameter_5"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_32" name="ATPase" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_32">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_16" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_18" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_4" name="Katpase" value="39.5"/>
        </ListOfConstants>
        <KineticLaw function="Function_111" unitType="Default" scalingCompartment="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Compartments[compartment]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_693">
              <SourceParameter reference="Metabolite_16"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_766">
              <SourceParameter reference="Parameter_4"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_34" name="G3PDH" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_34">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_27" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_23" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_3" stoichiometry="1"/>
          <Product metabolite="Metabolite_25" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_7" name="Vmax" value="47.11"/>
          <Constant key="Parameter_6" name="Kdhap" value="0.4"/>
          <Constant key="Parameter_9" name="Knadh" value="0.023"/>
          <Constant key="Parameter_8" name="Keq" value="4300"/>
          <Constant key="Parameter_11" name="Kglycerol" value="1"/>
          <Constant key="Parameter_10" name="Knad" value="0.93"/>
        </ListOfConstants>
        <KineticLaw function="Function_112" unitType="Default" scalingCompartment="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Compartments[compartment]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_846">
              <SourceParameter reference="Metabolite_27"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_873">
              <SourceParameter reference="Metabolite_23"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_877">
              <SourceParameter reference="Metabolite_3"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_890">
              <SourceParameter reference="Metabolite_25"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_790">
              <SourceParameter reference="Parameter_7"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_871">
              <SourceParameter reference="Parameter_6"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_875">
              <SourceParameter reference="Parameter_9"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_891">
              <SourceParameter reference="Parameter_8"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_892">
              <SourceParameter reference="Parameter_11"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_893">
              <SourceParameter reference="Parameter_10"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_35" name="Glycogen Branch" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_35">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_17" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_16" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_18" stoichiometry="1"/>
          <Product metabolite="Metabolite_2" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_13" name="KGLYCOGEN" value="6"/>
        </ListOfConstants>
        <KineticLaw function="Function_113" unitType="Default" scalingCompartment="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Compartments[compartment]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_802">
              <SourceParameter reference="Parameter_13"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_4" name="Trehalose Branch" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_4">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_17" stoichiometry="2"/>
          <Substrate metabolite="Metabolite_16" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_18" stoichiometry="1"/>
          <Product metabolite="Metabolite_1" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_12" name="Ktrehalose" value="2.4"/>
        </ListOfConstants>
        <KineticLaw function="Function_114" unitType="Default" scalingCompartment="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Compartments[compartment]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_848">
              <SourceParameter reference="Parameter_12"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_5" name="Succinate Branch" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_5">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_8" stoichiometry="2"/>
          <Substrate metabolite="Metabolite_25" stoichiometry="3"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_0" stoichiometry="1"/>
          <Product metabolite="Metabolite_23" stoichiometry="3"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_15" name="k" value="21.4"/>
        </ListOfConstants>
        <KineticLaw function="Function_115" unitType="Default" scalingCompartment="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Compartments[compartment]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_870">
              <SourceParameter reference="Metabolite_8"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_835">
              <SourceParameter reference="Parameter_15"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_37" name="HXT (forward)" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_37">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_4" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_5" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_5" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_14" name="Vmax" value="97.24"/>
          <Constant key="Parameter_17" name="Kglc" value="1.1918"/>
          <Constant key="Parameter_16" name="Ki" value="0.91"/>
        </ListOfConstants>
        <KineticLaw function="Function_125" unitType="Default" scalingCompartment="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Compartments[compartment]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_944">
              <SourceParameter reference="Metabolite_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_945">
              <SourceParameter reference="Metabolite_5"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_946">
              <SourceParameter reference="Parameter_14"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_947">
              <SourceParameter reference="Parameter_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_948">
              <SourceParameter reference="Parameter_16"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_36" name="HXT (backward)" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_36">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_5" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_4" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_4" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_19" name="Vmax" value="97.24"/>
          <Constant key="Parameter_18" name="Kglc" value="1.1918"/>
          <Constant key="Parameter_21" name="Ki" value="0.91"/>
        </ListOfConstants>
        <KineticLaw function="Function_126" unitType="Default" scalingCompartment="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Compartments[compartment]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_953">
              <SourceParameter reference="Metabolite_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_952">
              <SourceParameter reference="Metabolite_5"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_951">
              <SourceParameter reference="Parameter_19"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_950">
              <SourceParameter reference="Parameter_18"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_949">
              <SourceParameter reference="Parameter_21"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_10" name="HK (forward)" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_10">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_5" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_16" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_17" stoichiometry="1"/>
          <Product metabolite="Metabolite_18" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_17" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_18" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_20" name="Vmax" value="236.7"/>
          <Constant key="Parameter_34" name="Kglc" value="0.08"/>
          <Constant key="Parameter_35" name="Katp" value="0.15"/>
          <Constant key="Parameter_36" name="Kg6p" value="30"/>
          <Constant key="Parameter_37" name="Kadp" value="0.23"/>
        </ListOfConstants>
        <KineticLaw function="Function_127" unitType="Default" scalingCompartment="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Compartments[compartment]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_964">
              <SourceParameter reference="Metabolite_5"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_965">
              <SourceParameter reference="Metabolite_16"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_966">
              <SourceParameter reference="Metabolite_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_967">
              <SourceParameter reference="Metabolite_18"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_968">
              <SourceParameter reference="Parameter_20"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_969">
              <SourceParameter reference="Parameter_34"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_970">
              <SourceParameter reference="Parameter_35"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_972">
              <SourceParameter reference="Parameter_36"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_973">
              <SourceParameter reference="Parameter_37"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_11" name="HK (backward)" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_11">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_17" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_18" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_5" stoichiometry="1"/>
          <Product metabolite="Metabolite_16" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_5" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_16" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_38" name="Vmax" value="236.7"/>
          <Constant key="Parameter_39" name="Kglc" value="0.08"/>
          <Constant key="Parameter_40" name="Katp" value="0.15"/>
          <Constant key="Parameter_41" name="Keq" value="2000"/>
          <Constant key="Parameter_42" name="Kg6p" value="30"/>
          <Constant key="Parameter_43" name="Kadp" value="0.23"/>
        </ListOfConstants>
        <KineticLaw function="Function_128" unitType="Default" scalingCompartment="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Compartments[compartment]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_982">
              <SourceParameter reference="Metabolite_5"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_981">
              <SourceParameter reference="Metabolite_16"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_980">
              <SourceParameter reference="Metabolite_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_979">
              <SourceParameter reference="Metabolite_18"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_978">
              <SourceParameter reference="Parameter_38"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_977">
              <SourceParameter reference="Parameter_39"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_976">
              <SourceParameter reference="Parameter_40"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_975">
              <SourceParameter reference="Parameter_41"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_974">
              <SourceParameter reference="Parameter_42"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_971">
              <SourceParameter reference="Parameter_43"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_12" name="PGI (forward)" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_12">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_17" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_19" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_19" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_44" name="Vmax" value="1056"/>
          <Constant key="Parameter_45" name="Kg6p" value="1.4"/>
          <Constant key="Parameter_46" name="Kf6p" value="0.3"/>
        </ListOfConstants>
        <KineticLaw function="Function_129" unitType="Default" scalingCompartment="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Compartments[compartment]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_1002">
              <SourceParameter reference="Metabolite_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1003">
              <SourceParameter reference="Metabolite_19"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1004">
              <SourceParameter reference="Parameter_44"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1005">
              <SourceParameter reference="Parameter_45"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1007">
              <SourceParameter reference="Parameter_46"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_13" name="PGI (backward)" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_13">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_19" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_17" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_17" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_47" name="Vmax" value="1056"/>
          <Constant key="Parameter_48" name="Kg6p" value="1.4"/>
          <Constant key="Parameter_49" name="Keq" value="0.29"/>
          <Constant key="Parameter_50" name="Kf6p" value="0.3"/>
        </ListOfConstants>
        <KineticLaw function="Function_130" unitType="Default" scalingCompartment="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Compartments[compartment]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_1078">
              <SourceParameter reference="Metabolite_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1011">
              <SourceParameter reference="Metabolite_19"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1010">
              <SourceParameter reference="Parameter_47"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1009">
              <SourceParameter reference="Parameter_48"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1008">
              <SourceParameter reference="Parameter_49"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1006">
              <SourceParameter reference="Parameter_50"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_20" name="ALD (forward)" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_20">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_20" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_27" stoichiometry="1"/>
          <Product metabolite="Metabolite_26" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_27" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_26" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_51" name="Vmax" value="94.69"/>
          <Constant key="Parameter_52" name="Kf16bp" value="0.3"/>
          <Constant key="Parameter_53" name="Kdhap" value="2"/>
          <Constant key="Parameter_54" name="Kgap" value="2.4"/>
          <Constant key="Parameter_55" name="Kigap" value="10"/>
        </ListOfConstants>
        <KineticLaw function="Function_131" unitType="Default" scalingCompartment="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Compartments[compartment]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_1090">
              <SourceParameter reference="Metabolite_20"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1091">
              <SourceParameter reference="Metabolite_27"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1092">
              <SourceParameter reference="Metabolite_26"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1093">
              <SourceParameter reference="Parameter_51"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1094">
              <SourceParameter reference="Parameter_52"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1096">
              <SourceParameter reference="Parameter_53"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1097">
              <SourceParameter reference="Parameter_54"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1098">
              <SourceParameter reference="Parameter_55"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_19" name="ALD (backward)" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_19">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_27" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_26" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_20" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_20" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_56" name="Vmax" value="94.69"/>
          <Constant key="Parameter_57" name="Kf16bp" value="0.3"/>
          <Constant key="Parameter_58" name="Keq" value="0.069"/>
          <Constant key="Parameter_59" name="Kdhap" value="2"/>
          <Constant key="Parameter_60" name="Kgap" value="2.4"/>
          <Constant key="Parameter_61" name="Kigap" value="10"/>
        </ListOfConstants>
        <KineticLaw function="Function_132" unitType="Default" scalingCompartment="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Compartments[compartment]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_1106">
              <SourceParameter reference="Metabolite_20"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1105">
              <SourceParameter reference="Metabolite_27"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1104">
              <SourceParameter reference="Metabolite_26"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1103">
              <SourceParameter reference="Parameter_56"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1102">
              <SourceParameter reference="Parameter_57"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1101">
              <SourceParameter reference="Parameter_58"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1100">
              <SourceParameter reference="Parameter_59"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1099">
              <SourceParameter reference="Parameter_60"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1095">
              <SourceParameter reference="Parameter_61"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_18" name="TPI (forward)" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_18">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_27" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_26" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_62" name="k1" value="450000"/>
        </ListOfConstants>
        <KineticLaw function="Function_13" unitType="Default" scalingCompartment="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Compartments[compartment]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_80">
              <SourceParameter reference="Parameter_62"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_81">
              <SourceParameter reference="Metabolite_27"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_17" name="TPI (backward)" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_17">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_26" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_27" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_63" name="k1" value="1e+07"/>
        </ListOfConstants>
        <KineticLaw function="Function_13" unitType="Default" scalingCompartment="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Compartments[compartment]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_80">
              <SourceParameter reference="Parameter_63"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_81">
              <SourceParameter reference="Metabolite_26"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_16" name="GAPDH (forward)" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_16">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_26" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_25" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_24" stoichiometry="1"/>
          <Product metabolite="Metabolite_23" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_24" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_23" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_64" name="C" value="1"/>
          <Constant key="Parameter_65" name="Vmaxf" value="1152"/>
          <Constant key="Parameter_66" name="Kgap" value="0.21"/>
          <Constant key="Parameter_67" name="Knad" value="0.09"/>
          <Constant key="Parameter_68" name="Kbpg" value="0.0098"/>
          <Constant key="Parameter_69" name="Knadh" value="0.06"/>
        </ListOfConstants>
        <KineticLaw function="Function_133" unitType="Default" scalingCompartment="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Compartments[compartment]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_1128">
              <SourceParameter reference="Metabolite_26"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1129">
              <SourceParameter reference="Metabolite_25"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1130">
              <SourceParameter reference="Metabolite_24"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1131">
              <SourceParameter reference="Metabolite_23"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1132">
              <SourceParameter reference="Parameter_64"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1133">
              <SourceParameter reference="Parameter_65"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1134">
              <SourceParameter reference="Parameter_66"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1135">
              <SourceParameter reference="Parameter_67"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1137">
              <SourceParameter reference="Parameter_68"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1138">
              <SourceParameter reference="Parameter_69"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_15" name="GAPDH (backward)" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_15">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_24" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_23" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_26" stoichiometry="1"/>
          <Product metabolite="Metabolite_25" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_26" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_25" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_70" name="C" value="1"/>
          <Constant key="Parameter_71" name="Kgap" value="0.21"/>
          <Constant key="Parameter_72" name="Knad" value="0.09"/>
          <Constant key="Parameter_73" name="Vmaxr" value="6719"/>
          <Constant key="Parameter_74" name="Kbpg" value="0.0098"/>
          <Constant key="Parameter_75" name="Knadh" value="0.06"/>
        </ListOfConstants>
        <KineticLaw function="Function_134" unitType="Default" scalingCompartment="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Compartments[compartment]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_1148">
              <SourceParameter reference="Metabolite_26"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1147">
              <SourceParameter reference="Metabolite_25"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1146">
              <SourceParameter reference="Metabolite_24"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1145">
              <SourceParameter reference="Metabolite_23"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1144">
              <SourceParameter reference="Parameter_70"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1142">
              <SourceParameter reference="Parameter_71"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1141">
              <SourceParameter reference="Parameter_72"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1140">
              <SourceParameter reference="Parameter_73"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1139">
              <SourceParameter reference="Parameter_74"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1136">
              <SourceParameter reference="Parameter_75"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_14" name="PGK (forward)" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_14">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_24" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_18" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_22" stoichiometry="1"/>
          <Product metabolite="Metabolite_16" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_22" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_16" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_76" name="Vmax" value="1288"/>
          <Constant key="Parameter_77" name="Keq" value="3200"/>
          <Constant key="Parameter_78" name="Kp3g" value="0.53"/>
          <Constant key="Parameter_79" name="Katp" value="0.3"/>
          <Constant key="Parameter_80" name="Kbpg" value="0.003"/>
          <Constant key="Parameter_81" name="Kadp" value="0.2"/>
        </ListOfConstants>
        <KineticLaw function="Function_135" unitType="Default" scalingCompartment="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Compartments[compartment]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_1168">
              <SourceParameter reference="Metabolite_24"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1169">
              <SourceParameter reference="Metabolite_18"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1170">
              <SourceParameter reference="Metabolite_22"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1171">
              <SourceParameter reference="Metabolite_16"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1172">
              <SourceParameter reference="Parameter_76"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1173">
              <SourceParameter reference="Parameter_77"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1174">
              <SourceParameter reference="Parameter_78"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1175">
              <SourceParameter reference="Parameter_79"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1176">
              <SourceParameter reference="Parameter_80"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1177">
              <SourceParameter reference="Parameter_81"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_0" name="PGK (backward)" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_0">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_22" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_16" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_24" stoichiometry="1"/>
          <Product metabolite="Metabolite_18" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_24" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_18" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_82" name="Vmax" value="1288"/>
          <Constant key="Parameter_83" name="Kp3g" value="0.53"/>
          <Constant key="Parameter_84" name="Katp" value="0.3"/>
          <Constant key="Parameter_85" name="Kbpg" value="0.003"/>
          <Constant key="Parameter_86" name="Kadp" value="0.2"/>
        </ListOfConstants>
        <KineticLaw function="Function_136" unitType="Default" scalingCompartment="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Compartments[compartment]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_1187">
              <SourceParameter reference="Metabolite_24"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1186">
              <SourceParameter reference="Metabolite_18"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1185">
              <SourceParameter reference="Metabolite_22"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1184">
              <SourceParameter reference="Metabolite_16"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1183">
              <SourceParameter reference="Parameter_82"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1181">
              <SourceParameter reference="Parameter_83"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1180">
              <SourceParameter reference="Parameter_84"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1179">
              <SourceParameter reference="Parameter_85"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1178">
              <SourceParameter reference="Parameter_86"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1" name="PGM (forward)" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_1">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_22" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_11" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_11" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_87" name="Vmax" value="2585"/>
          <Constant key="Parameter_88" name="Kp3g" value="1.2"/>
          <Constant key="Parameter_89" name="Kp2g" value="0.08"/>
        </ListOfConstants>
        <KineticLaw function="Function_137" unitType="Default" scalingCompartment="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Compartments[compartment]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_1206">
              <SourceParameter reference="Metabolite_22"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1207">
              <SourceParameter reference="Metabolite_11"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1208">
              <SourceParameter reference="Parameter_87"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1209">
              <SourceParameter reference="Parameter_88"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1211">
              <SourceParameter reference="Parameter_89"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_2" name="PGM (backward)" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_2">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_11" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_22" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_22" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_90" name="Vmax" value="2585"/>
          <Constant key="Parameter_91" name="Kp3g" value="1.2"/>
          <Constant key="Parameter_92" name="Keq" value="0.19"/>
          <Constant key="Parameter_93" name="Kp2g" value="0.08"/>
        </ListOfConstants>
        <KineticLaw function="Function_138" unitType="Default" scalingCompartment="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Compartments[compartment]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_1216">
              <SourceParameter reference="Metabolite_22"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1215">
              <SourceParameter reference="Metabolite_11"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1214">
              <SourceParameter reference="Parameter_90"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1213">
              <SourceParameter reference="Parameter_91"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1212">
              <SourceParameter reference="Parameter_92"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1210">
              <SourceParameter reference="Parameter_93"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_3" name="ENO (forward)" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_3">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_11" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_10" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_10" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_94" name="Vmax" value="201.6"/>
          <Constant key="Parameter_95" name="Kp2g" value="0.04"/>
          <Constant key="Parameter_96" name="Kpep" value="0.5"/>
        </ListOfConstants>
        <KineticLaw function="Function_139" unitType="Default" scalingCompartment="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Compartments[compartment]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_1228">
              <SourceParameter reference="Metabolite_11"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1229">
              <SourceParameter reference="Metabolite_10"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1230">
              <SourceParameter reference="Parameter_94"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1231">
              <SourceParameter reference="Parameter_95"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1233">
              <SourceParameter reference="Parameter_96"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_6" name="ENO (backward)" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_6">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_10" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_11" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_11" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_97" name="Vmax" value="201.6"/>
          <Constant key="Parameter_98" name="Kp2g" value="0.04"/>
          <Constant key="Parameter_99" name="Keq" value="6.7"/>
          <Constant key="Parameter_100" name="Kpep" value="0.5"/>
        </ListOfConstants>
        <KineticLaw function="Function_140" unitType="Default" scalingCompartment="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Compartments[compartment]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_1238">
              <SourceParameter reference="Metabolite_11"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1237">
              <SourceParameter reference="Metabolite_10"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1236">
              <SourceParameter reference="Parameter_97"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1235">
              <SourceParameter reference="Parameter_98"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1234">
              <SourceParameter reference="Parameter_99"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1232">
              <SourceParameter reference="Parameter_100"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_7" name="PYK (forward)" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_7">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_10" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_18" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_9" stoichiometry="1"/>
          <Product metabolite="Metabolite_16" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_9" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_16" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_101" name="Vmax" value="1000"/>
          <Constant key="Parameter_102" name="Kpep" value="0.14"/>
          <Constant key="Parameter_103" name="Kadp" value="0.53"/>
          <Constant key="Parameter_104" name="Kpyr" value="21"/>
          <Constant key="Parameter_105" name="Katp" value="1.5"/>
        </ListOfConstants>
        <KineticLaw function="Function_141" unitType="Default" scalingCompartment="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Compartments[compartment]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_1250">
              <SourceParameter reference="Metabolite_10"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1251">
              <SourceParameter reference="Metabolite_18"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1252">
              <SourceParameter reference="Metabolite_9"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1253">
              <SourceParameter reference="Metabolite_16"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1254">
              <SourceParameter reference="Parameter_101"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1255">
              <SourceParameter reference="Parameter_102"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1256">
              <SourceParameter reference="Parameter_103"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1258">
              <SourceParameter reference="Parameter_104"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1259">
              <SourceParameter reference="Parameter_105"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_8" name="PYK (backward)" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_8">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_9" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_16" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_10" stoichiometry="1"/>
          <Product metabolite="Metabolite_18" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_10" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_18" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_106" name="Vmax" value="1000"/>
          <Constant key="Parameter_107" name="Kpep" value="0.14"/>
          <Constant key="Parameter_108" name="Kadp" value="0.53"/>
          <Constant key="Parameter_109" name="Keq" value="6500"/>
          <Constant key="Parameter_110" name="Kpyr" value="21"/>
          <Constant key="Parameter_111" name="Katp" value="1.5"/>
        </ListOfConstants>
        <KineticLaw function="Function_142" unitType="Default" scalingCompartment="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Compartments[compartment]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_1268">
              <SourceParameter reference="Metabolite_10"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1267">
              <SourceParameter reference="Metabolite_18"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1266">
              <SourceParameter reference="Metabolite_9"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1265">
              <SourceParameter reference="Metabolite_16"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1264">
              <SourceParameter reference="Parameter_106"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1263">
              <SourceParameter reference="Parameter_107"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1262">
              <SourceParameter reference="Parameter_108"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1261">
              <SourceParameter reference="Parameter_109"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1260">
              <SourceParameter reference="Parameter_110"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1257">
              <SourceParameter reference="Parameter_111"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_9" name="ADH (forward)" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_9">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_6" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_25" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_8" stoichiometry="1"/>
          <Product metabolite="Metabolite_23" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_8" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_23" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_112" name="Vmax" value="209.5"/>
          <Constant key="Parameter_113" name="Ketoh" value="17"/>
          <Constant key="Parameter_114" name="Kinad" value="0.92"/>
          <Constant key="Parameter_115" name="Knad" value="0.17"/>
          <Constant key="Parameter_116" name="Knadh" value="0.11"/>
          <Constant key="Parameter_117" name="Kinadh" value="0.031"/>
          <Constant key="Parameter_118" name="Kacald" value="1.11"/>
          <Constant key="Parameter_119" name="Kiacald" value="1.1"/>
          <Constant key="Parameter_120" name="Kietoh" value="90"/>
        </ListOfConstants>
        <KineticLaw function="Function_143" unitType="Default" scalingCompartment="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Compartments[compartment]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_1288">
              <SourceParameter reference="Metabolite_6"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1289">
              <SourceParameter reference="Metabolite_25"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1290">
              <SourceParameter reference="Metabolite_8"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1291">
              <SourceParameter reference="Metabolite_23"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1292">
              <SourceParameter reference="Parameter_112"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1293">
              <SourceParameter reference="Parameter_113"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1294">
              <SourceParameter reference="Parameter_114"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1296">
              <SourceParameter reference="Parameter_115"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1297">
              <SourceParameter reference="Parameter_116"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1298">
              <SourceParameter reference="Parameter_117"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1299">
              <SourceParameter reference="Parameter_118"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1300">
              <SourceParameter reference="Parameter_119"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1301">
              <SourceParameter reference="Parameter_120"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_40" name="ADH (backward)" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_40">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_8" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_23" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_6" stoichiometry="1"/>
          <Product metabolite="Metabolite_25" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_6" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_25" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_121" name="Vmax" value="209.5"/>
          <Constant key="Parameter_122" name="Ketoh" value="17"/>
          <Constant key="Parameter_123" name="Kinad" value="0.92"/>
          <Constant key="Parameter_124" name="Keq" value="6.9e-05"/>
          <Constant key="Parameter_125" name="Knad" value="0.17"/>
          <Constant key="Parameter_126" name="Knadh" value="0.11"/>
          <Constant key="Parameter_127" name="Kinadh" value="0.031"/>
          <Constant key="Parameter_128" name="Kacald" value="1.11"/>
          <Constant key="Parameter_129" name="Kiacald" value="1.1"/>
          <Constant key="Parameter_130" name="Kietoh" value="90"/>
        </ListOfConstants>
        <KineticLaw function="Function_144" unitType="Default" scalingCompartment="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Compartments[compartment]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_1314">
              <SourceParameter reference="Metabolite_6"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1313">
              <SourceParameter reference="Metabolite_25"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1312">
              <SourceParameter reference="Metabolite_8"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1311">
              <SourceParameter reference="Metabolite_23"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1310">
              <SourceParameter reference="Parameter_121"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1309">
              <SourceParameter reference="Parameter_122"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1308">
              <SourceParameter reference="Parameter_123"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1307">
              <SourceParameter reference="Parameter_124"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1306">
              <SourceParameter reference="Parameter_125"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1305">
              <SourceParameter reference="Parameter_126"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1304">
              <SourceParameter reference="Parameter_127"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1303">
              <SourceParameter reference="Parameter_128"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1302">
              <SourceParameter reference="Parameter_129"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1295">
              <SourceParameter reference="Parameter_130"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_41" name="AK (forward)" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_41">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_18" stoichiometry="2"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_16" stoichiometry="1"/>
          <Product metabolite="Metabolite_21" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_131" name="k1" value="45"/>
        </ListOfConstants>
        <KineticLaw function="Function_13" unitType="Default" scalingCompartment="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Compartments[compartment]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_80">
              <SourceParameter reference="Parameter_131"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_81">
              <SourceParameter reference="Metabolite_18"/>
              <SourceParameter reference="Metabolite_18"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_42" name="AK (backward)" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_42">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_16" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_21" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_18" stoichiometry="2"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_132" name="k1" value="100"/>
        </ListOfConstants>
        <KineticLaw function="Function_13" unitType="Default" scalingCompartment="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Compartments[compartment]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_80">
              <SourceParameter reference="Parameter_132"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_81">
              <SourceParameter reference="Metabolite_16"/>
              <SourceParameter reference="Metabolite_21"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
    </ListOfReactions>
    <ListOfModelParameterSets activeSet="ModelParameterSet_0">
      <ModelParameterSet key="ModelParameterSet_0" name="Initial State">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelParameterSet_0">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell" value="0" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Compartments[compartment]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Compartments[compartment],Vector=Metabolites[GLCo]" value="1.204428152e+21" type="Species" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Compartments[compartment],Vector=Metabolites[GLCi]" value="5.8807548099884278e+19" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Compartments[compartment],Vector=Metabolites[ATP]" value="1.5206673031128102e+21" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Compartments[compartment],Vector=Metabolites[G6P]" value="1.6109468264427217e+21" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Compartments[compartment],Vector=Metabolites[ADP]" value="7.7203102717063502e+20" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Compartments[compartment],Vector=Metabolites[F6P]" value="3.7636958857947932e+20" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Compartments[compartment],Vector=Metabolites[F16bP]" value="3.7465669334010204e+21" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Compartments[compartment],Vector=Metabolites[AMP]" value="1.7637938131655383e+20" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Compartments[compartment],Vector=Metabolites[F26bP]" value="1.204428152e+19" type="Species" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Compartments[compartment],Vector=Metabolites[DHAP]" value="6.0471479945693404e+20" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Compartments[compartment],Vector=Metabolites[GAP]" value="2.7208584532125434e+19" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Compartments[compartment],Vector=Metabolites[NAD]" value="9.0530258018790841e+20" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Compartments[compartment],Vector=Metabolites[BPG]" value="4.4375559385044941e+17" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Compartments[compartment],Vector=Metabolites[NADH]" value="5.2217800652092269e+19" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Compartments[compartment],Vector=Metabolites[P3G]" value="5.3337410475265497e+20" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Compartments[compartment],Vector=Metabolites[P2G]" value="7.6900218676555137e+19" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Compartments[compartment],Vector=Metabolites[PEP]" value="3.8081136266956898e+19" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Compartments[compartment],Vector=Metabolites[PYR]" value="1.0932067470215735e+21" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Compartments[compartment],Vector=Metabolites[AcAld]" value="1.0727876469286763e+20" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Compartments[compartment],Vector=Metabolites[CO2]" value="6.0221407600000002e+20" type="Species" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Compartments[compartment],Vector=Metabolites[EtOH]" value="3.0110703800000002e+22" type="Species" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Compartments[compartment],Vector=Metabolites[Glycerol]" value="9.0332111399999996e+19" type="Species" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Compartments[compartment],Vector=Metabolites[Glycogen]" value="0" type="Species" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Compartments[compartment],Vector=Metabolites[Trehalose]" value="0" type="Species" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Compartments[compartment],Vector=Metabolites[Succinate]" value="0" type="Species" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[PFK]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[PFK],ParameterGroup=Parameters,Parameter=Vmax" value="110" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[PFK],ParameterGroup=Parameters,Parameter=gR" value="5.1200000000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[PFK],ParameterGroup=Parameters,Parameter=Kf6p" value="0.10000000000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[PFK],ParameterGroup=Parameters,Parameter=Katp" value="0.70999999999999996" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[PFK],ParameterGroup=Parameters,Parameter=L0" value="0.66000000000000003" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[PFK],ParameterGroup=Parameters,Parameter=Ciatp" value="100" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[PFK],ParameterGroup=Parameters,Parameter=Kiatp" value="0.65000000000000002" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[PFK],ParameterGroup=Parameters,Parameter=Camp" value="0.084500000000000006" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[PFK],ParameterGroup=Parameters,Parameter=Kamp" value="0.099500000000000005" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[PFK],ParameterGroup=Parameters,Parameter=Cf26" value="0.017399999999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[PFK],ParameterGroup=Parameters,Parameter=Kf26" value="0.00068199999999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[PFK],ParameterGroup=Parameters,Parameter=Cf16" value="0.39700000000000002" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[PFK],ParameterGroup=Parameters,Parameter=Kf16" value="0.111" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[PFK],ParameterGroup=Parameters,Parameter=Catp" value="3" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[PDC]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[PDC],ParameterGroup=Parameters,Parameter=Vmax" value="857.79999999999995" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[PDC],ParameterGroup=Parameters,Parameter=Kpyr" value="4.3300000000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[PDC],ParameterGroup=Parameters,Parameter=nH" value="1.8999999999999999" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[ATPase]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[ATPase],ParameterGroup=Parameters,Parameter=Katpase" value="39.5" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[G3PDH]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[G3PDH],ParameterGroup=Parameters,Parameter=Vmax" value="47.109999999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[G3PDH],ParameterGroup=Parameters,Parameter=Kdhap" value="0.40000000000000002" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[G3PDH],ParameterGroup=Parameters,Parameter=Knadh" value="0.023" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[G3PDH],ParameterGroup=Parameters,Parameter=Keq" value="4300" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[G3PDH],ParameterGroup=Parameters,Parameter=Kglycerol" value="1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[G3PDH],ParameterGroup=Parameters,Parameter=Knad" value="0.93000000000000005" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[Glycogen Branch]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[Glycogen Branch],ParameterGroup=Parameters,Parameter=KGLYCOGEN" value="6" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[Trehalose Branch]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[Trehalose Branch],ParameterGroup=Parameters,Parameter=Ktrehalose" value="2.3999999999999999" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[Succinate Branch]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[Succinate Branch],ParameterGroup=Parameters,Parameter=k" value="21.399999999999999" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[HXT (forward)]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[HXT (forward)],ParameterGroup=Parameters,Parameter=Vmax" value="97.239999999999995" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[HXT (forward)],ParameterGroup=Parameters,Parameter=Kglc" value="1.1918" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[HXT (forward)],ParameterGroup=Parameters,Parameter=Ki" value="0.91000000000000003" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[HXT (backward)]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[HXT (backward)],ParameterGroup=Parameters,Parameter=Vmax" value="97.239999999999995" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[HXT (backward)],ParameterGroup=Parameters,Parameter=Kglc" value="1.1918" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[HXT (backward)],ParameterGroup=Parameters,Parameter=Ki" value="0.91000000000000003" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[HK (forward)]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[HK (forward)],ParameterGroup=Parameters,Parameter=Vmax" value="236.69999999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[HK (forward)],ParameterGroup=Parameters,Parameter=Kglc" value="0.080000000000000002" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[HK (forward)],ParameterGroup=Parameters,Parameter=Katp" value="0.14999999999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[HK (forward)],ParameterGroup=Parameters,Parameter=Kg6p" value="30" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[HK (forward)],ParameterGroup=Parameters,Parameter=Kadp" value="0.23000000000000001" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[HK (backward)]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[HK (backward)],ParameterGroup=Parameters,Parameter=Vmax" value="236.69999999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[HK (backward)],ParameterGroup=Parameters,Parameter=Kglc" value="0.080000000000000002" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[HK (backward)],ParameterGroup=Parameters,Parameter=Katp" value="0.14999999999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[HK (backward)],ParameterGroup=Parameters,Parameter=Keq" value="2000" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[HK (backward)],ParameterGroup=Parameters,Parameter=Kg6p" value="30" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[HK (backward)],ParameterGroup=Parameters,Parameter=Kadp" value="0.23000000000000001" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[PGI (forward)]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[PGI (forward)],ParameterGroup=Parameters,Parameter=Vmax" value="1056" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[PGI (forward)],ParameterGroup=Parameters,Parameter=Kg6p" value="1.3999999999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[PGI (forward)],ParameterGroup=Parameters,Parameter=Kf6p" value="0.29999999999999999" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[PGI (backward)]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[PGI (backward)],ParameterGroup=Parameters,Parameter=Vmax" value="1056" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[PGI (backward)],ParameterGroup=Parameters,Parameter=Kg6p" value="1.3999999999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[PGI (backward)],ParameterGroup=Parameters,Parameter=Keq" value="0.28999999999999998" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[PGI (backward)],ParameterGroup=Parameters,Parameter=Kf6p" value="0.29999999999999999" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[ALD (forward)]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[ALD (forward)],ParameterGroup=Parameters,Parameter=Vmax" value="94.689999999999998" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[ALD (forward)],ParameterGroup=Parameters,Parameter=Kf16bp" value="0.29999999999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[ALD (forward)],ParameterGroup=Parameters,Parameter=Kdhap" value="2" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[ALD (forward)],ParameterGroup=Parameters,Parameter=Kgap" value="2.3999999999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[ALD (forward)],ParameterGroup=Parameters,Parameter=Kigap" value="10" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[ALD (backward)]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[ALD (backward)],ParameterGroup=Parameters,Parameter=Vmax" value="94.689999999999998" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[ALD (backward)],ParameterGroup=Parameters,Parameter=Kf16bp" value="0.29999999999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[ALD (backward)],ParameterGroup=Parameters,Parameter=Keq" value="0.069000000000000006" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[ALD (backward)],ParameterGroup=Parameters,Parameter=Kdhap" value="2" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[ALD (backward)],ParameterGroup=Parameters,Parameter=Kgap" value="2.3999999999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[ALD (backward)],ParameterGroup=Parameters,Parameter=Kigap" value="10" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[TPI (forward)]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[TPI (forward)],ParameterGroup=Parameters,Parameter=k1" value="450000" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[TPI (backward)]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[TPI (backward)],ParameterGroup=Parameters,Parameter=k1" value="10000000" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[GAPDH (forward)]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[GAPDH (forward)],ParameterGroup=Parameters,Parameter=C" value="1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[GAPDH (forward)],ParameterGroup=Parameters,Parameter=Vmaxf" value="1152" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[GAPDH (forward)],ParameterGroup=Parameters,Parameter=Kgap" value="0.20999999999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[GAPDH (forward)],ParameterGroup=Parameters,Parameter=Knad" value="0.089999999999999997" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[GAPDH (forward)],ParameterGroup=Parameters,Parameter=Kbpg" value="0.0097999999999999997" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[GAPDH (forward)],ParameterGroup=Parameters,Parameter=Knadh" value="0.059999999999999998" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[GAPDH (backward)]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[GAPDH (backward)],ParameterGroup=Parameters,Parameter=C" value="1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[GAPDH (backward)],ParameterGroup=Parameters,Parameter=Kgap" value="0.20999999999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[GAPDH (backward)],ParameterGroup=Parameters,Parameter=Knad" value="0.089999999999999997" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[GAPDH (backward)],ParameterGroup=Parameters,Parameter=Vmaxr" value="6719" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[GAPDH (backward)],ParameterGroup=Parameters,Parameter=Kbpg" value="0.0097999999999999997" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[GAPDH (backward)],ParameterGroup=Parameters,Parameter=Knadh" value="0.059999999999999998" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[PGK (forward)]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[PGK (forward)],ParameterGroup=Parameters,Parameter=Vmax" value="1288" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[PGK (forward)],ParameterGroup=Parameters,Parameter=Keq" value="3200" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[PGK (forward)],ParameterGroup=Parameters,Parameter=Kp3g" value="0.53000000000000003" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[PGK (forward)],ParameterGroup=Parameters,Parameter=Katp" value="0.29999999999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[PGK (forward)],ParameterGroup=Parameters,Parameter=Kbpg" value="0.0030000000000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[PGK (forward)],ParameterGroup=Parameters,Parameter=Kadp" value="0.20000000000000001" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[PGK (backward)]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[PGK (backward)],ParameterGroup=Parameters,Parameter=Vmax" value="1288" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[PGK (backward)],ParameterGroup=Parameters,Parameter=Kp3g" value="0.53000000000000003" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[PGK (backward)],ParameterGroup=Parameters,Parameter=Katp" value="0.29999999999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[PGK (backward)],ParameterGroup=Parameters,Parameter=Kbpg" value="0.0030000000000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[PGK (backward)],ParameterGroup=Parameters,Parameter=Kadp" value="0.20000000000000001" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[PGM (forward)]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[PGM (forward)],ParameterGroup=Parameters,Parameter=Vmax" value="2585" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[PGM (forward)],ParameterGroup=Parameters,Parameter=Kp3g" value="1.2" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[PGM (forward)],ParameterGroup=Parameters,Parameter=Kp2g" value="0.080000000000000002" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[PGM (backward)]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[PGM (backward)],ParameterGroup=Parameters,Parameter=Vmax" value="2585" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[PGM (backward)],ParameterGroup=Parameters,Parameter=Kp3g" value="1.2" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[PGM (backward)],ParameterGroup=Parameters,Parameter=Keq" value="0.19" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[PGM (backward)],ParameterGroup=Parameters,Parameter=Kp2g" value="0.080000000000000002" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[ENO (forward)]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[ENO (forward)],ParameterGroup=Parameters,Parameter=Vmax" value="201.59999999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[ENO (forward)],ParameterGroup=Parameters,Parameter=Kp2g" value="0.040000000000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[ENO (forward)],ParameterGroup=Parameters,Parameter=Kpep" value="0.5" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[ENO (backward)]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[ENO (backward)],ParameterGroup=Parameters,Parameter=Vmax" value="201.59999999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[ENO (backward)],ParameterGroup=Parameters,Parameter=Kp2g" value="0.040000000000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[ENO (backward)],ParameterGroup=Parameters,Parameter=Keq" value="6.7000000000000002" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[ENO (backward)],ParameterGroup=Parameters,Parameter=Kpep" value="0.5" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[PYK (forward)]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[PYK (forward)],ParameterGroup=Parameters,Parameter=Vmax" value="1000" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[PYK (forward)],ParameterGroup=Parameters,Parameter=Kpep" value="0.14000000000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[PYK (forward)],ParameterGroup=Parameters,Parameter=Kadp" value="0.53000000000000003" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[PYK (forward)],ParameterGroup=Parameters,Parameter=Kpyr" value="21" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[PYK (forward)],ParameterGroup=Parameters,Parameter=Katp" value="1.5" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[PYK (backward)]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[PYK (backward)],ParameterGroup=Parameters,Parameter=Vmax" value="1000" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[PYK (backward)],ParameterGroup=Parameters,Parameter=Kpep" value="0.14000000000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[PYK (backward)],ParameterGroup=Parameters,Parameter=Kadp" value="0.53000000000000003" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[PYK (backward)],ParameterGroup=Parameters,Parameter=Keq" value="6500" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[PYK (backward)],ParameterGroup=Parameters,Parameter=Kpyr" value="21" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[PYK (backward)],ParameterGroup=Parameters,Parameter=Katp" value="1.5" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[ADH (forward)]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[ADH (forward)],ParameterGroup=Parameters,Parameter=Vmax" value="209.5" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[ADH (forward)],ParameterGroup=Parameters,Parameter=Ketoh" value="17" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[ADH (forward)],ParameterGroup=Parameters,Parameter=Kinad" value="0.92000000000000004" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[ADH (forward)],ParameterGroup=Parameters,Parameter=Knad" value="0.17000000000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[ADH (forward)],ParameterGroup=Parameters,Parameter=Knadh" value="0.11" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[ADH (forward)],ParameterGroup=Parameters,Parameter=Kinadh" value="0.031" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[ADH (forward)],ParameterGroup=Parameters,Parameter=Kacald" value="1.1100000000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[ADH (forward)],ParameterGroup=Parameters,Parameter=Kiacald" value="1.1000000000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[ADH (forward)],ParameterGroup=Parameters,Parameter=Kietoh" value="90" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[ADH (backward)]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[ADH (backward)],ParameterGroup=Parameters,Parameter=Vmax" value="209.5" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[ADH (backward)],ParameterGroup=Parameters,Parameter=Ketoh" value="17" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[ADH (backward)],ParameterGroup=Parameters,Parameter=Kinad" value="0.92000000000000004" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[ADH (backward)],ParameterGroup=Parameters,Parameter=Keq" value="6.8999999999999997e-05" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[ADH (backward)],ParameterGroup=Parameters,Parameter=Knad" value="0.17000000000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[ADH (backward)],ParameterGroup=Parameters,Parameter=Knadh" value="0.11" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[ADH (backward)],ParameterGroup=Parameters,Parameter=Kinadh" value="0.031" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[ADH (backward)],ParameterGroup=Parameters,Parameter=Kacald" value="1.1100000000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[ADH (backward)],ParameterGroup=Parameters,Parameter=Kiacald" value="1.1000000000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[ADH (backward)],ParameterGroup=Parameters,Parameter=Kietoh" value="90" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[AK (forward)]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[AK (forward)],ParameterGroup=Parameters,Parameter=k1" value="45" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[AK (backward)]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Yeast glycolysis model of Pritchard and Kell,Vector=Reactions[AK (backward)],ParameterGroup=Parameters,Parameter=k1" value="100" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
    </ListOfModelParameterSets>
    <StateTemplate>
      <StateTemplateVariable objectReference="Model_0"/>
      <StateTemplateVariable objectReference="Metabolite_18"/>
      <StateTemplateVariable objectReference="Metabolite_25"/>
      <StateTemplateVariable objectReference="Metabolite_17"/>
      <StateTemplateVariable objectReference="Metabolite_8"/>
      <StateTemplateVariable objectReference="Metabolite_26"/>
      <StateTemplateVariable objectReference="Metabolite_27"/>
      <StateTemplateVariable objectReference="Metabolite_11"/>
      <StateTemplateVariable objectReference="Metabolite_5"/>
      <StateTemplateVariable objectReference="Metabolite_24"/>
      <StateTemplateVariable objectReference="Metabolite_10"/>
      <StateTemplateVariable objectReference="Metabolite_19"/>
      <StateTemplateVariable objectReference="Metabolite_9"/>
      <StateTemplateVariable objectReference="Metabolite_22"/>
      <StateTemplateVariable objectReference="Metabolite_20"/>
      <StateTemplateVariable objectReference="Metabolite_21"/>
      <StateTemplateVariable objectReference="Metabolite_16"/>
      <StateTemplateVariable objectReference="Metabolite_23"/>
      <StateTemplateVariable objectReference="Metabolite_4"/>
      <StateTemplateVariable objectReference="Metabolite_28"/>
      <StateTemplateVariable objectReference="Metabolite_7"/>
      <StateTemplateVariable objectReference="Metabolite_6"/>
      <StateTemplateVariable objectReference="Metabolite_3"/>
      <StateTemplateVariable objectReference="Metabolite_2"/>
      <StateTemplateVariable objectReference="Metabolite_1"/>
      <StateTemplateVariable objectReference="Metabolite_0"/>
      <StateTemplateVariable objectReference="Compartment_0"/>
    </StateTemplate>
    <InitialState type="initialState">
      0 7.7203102717063502e+20 9.0530258018790841e+20 1.6109468264427217e+21 1.0727876469286763e+20 2.7208584532125434e+19 6.0471479945693404e+20 7.6900218676555137e+19 5.8807548099884278e+19 4.4375559385044941e+17 3.8081136266956898e+19 3.7636958857947932e+20 1.0932067470215735e+21 5.3337410475265497e+20 3.7465669334010204e+21 1.7637938131655383e+20 1.5206673031128102e+21 5.2217800652092269e+19 1.204428152e+21 1.204428152e+19 6.0221407600000002e+20 3.0110703800000002e+22 9.0332111399999996e+19 0 0 0 1 
    </InitialState>
  </Model>
  <ListOfTasks>
    <Task key="Task_2" name="Steady-State" type="steadyState" scheduled="true" updateModel="false">
      <Report reference="Report_22" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="JacobianRequested" type="bool" value="1"/>
        <Parameter name="StabilityAnalysisRequested" type="bool" value="1"/>
      </Problem>
      <Method name="Enhanced Newton" type="EnhancedNewton">
        <Parameter name="Resolution" type="unsignedFloat" value="1.0000000000000001e-09"/>
        <Parameter name="Derivation Factor" type="unsignedFloat" value="0.001"/>
        <Parameter name="Use Newton" type="bool" value="0"/>
        <Parameter name="Use Integration" type="bool" value="1"/>
        <Parameter name="Use Back Integration" type="bool" value="1"/>
        <Parameter name="Accept Negative Concentrations" type="bool" value="0"/>
        <Parameter name="Iteration Limit" type="unsignedInteger" value="50"/>
        <Parameter name="Maximum duration for forward integration" type="unsignedFloat" value="1000000000"/>
        <Parameter name="Maximum duration for backward integration" type="unsignedFloat" value="1000000"/>
        <Parameter name="Target Criterion" type="string" value="Distance and Rate"/>
      </Method>
    </Task>
    <Task key="Task_10" name="Time-Course" type="timeCourse" scheduled="true" updateModel="false">
      <Report reference="Report_10" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="AutomaticStepSize" type="bool" value="0"/>
        <Parameter name="StepNumber" type="unsignedInteger" value="100"/>
        <Parameter name="StepSize" type="float" value="0.02"/>
        <Parameter name="Duration" type="float" value="2"/>
        <Parameter name="TimeSeriesRequested" type="bool" value="1"/>
        <Parameter name="OutputStartTime" type="float" value="0"/>
        <Parameter name="Output Event" type="bool" value="0"/>
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
    <Task key="Task_9" name="Scan" type="scan" scheduled="false" updateModel="false">
      <Problem>
        <Parameter name="Subtask" type="unsignedInteger" value="1"/>
        <ParameterGroup name="ScanItems">
        </ParameterGroup>
        <Parameter name="Subtask Output" type="string" value="subTaskDuring"/>
        <Parameter name="Adjust initial conditions" type="bool" value="0"/>
        <Parameter name="Continue on Error" type="bool" value="0"/>
      </Problem>
      <Method name="Scan Framework" type="ScanFramework">
      </Method>
    </Task>
    <Task key="Task_14" name="Elementary Flux Modes" type="fluxMode" scheduled="false" updateModel="false">
      <Report reference="Report_9" target="" append="1" confirmOverwrite="1"/>
      <Problem>
      </Problem>
      <Method name="EFM Algorithm" type="EFMAlgorithm">
      </Method>
    </Task>
    <Task key="Task_0" name="Optimization" type="optimization" scheduled="false" updateModel="false">
      <Report reference="Report_8" target="" append="1" confirmOverwrite="1"/>
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
        <Parameter name="DisplayPoplations" type="bool" value="0"/>
      </Problem>
      <Method name="Random Search" type="RandomSearch">
        <Parameter name="Log Verbosity" type="unsignedInteger" value="0"/>
        <Parameter name="Number of Iterations" type="unsignedInteger" value="100000"/>
        <Parameter name="Random Number Generator" type="unsignedInteger" value="1"/>
        <Parameter name="Seed" type="unsignedInteger" value="0"/>
      </Method>
    </Task>
    <Task key="Task_8" name="Parameter Estimation" type="parameterFitting" scheduled="false" updateModel="false">
      <Report reference="Report_7" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="Maximize" type="bool" value="0"/>
        <Parameter name="Randomize Start Values" type="bool" value="0"/>
        <Parameter name="Calculate Statistics" type="bool" value="1"/>
        <ParameterGroup name="OptimizationItemList">
        </ParameterGroup>
        <ParameterGroup name="OptimizationConstraintList">
        </ParameterGroup>
        <Parameter name="DisplayPoplations" type="bool" value="0"/>
        <Parameter name="Steady-State" type="cn" value="CN=Root,Vector=TaskList[Steady-State]"/>
        <Parameter name="Time-Course" type="cn" value="CN=Root,Vector=TaskList[Time-Course]"/>
        <Parameter name="Create Parameter Sets" type="bool" value="0"/>
        <Parameter name="Use Time Sens" type="bool" value="0"/>
        <Parameter name="Time-Sens" type="cn" value=""/>
        <ParameterGroup name="Experiment Set">
        </ParameterGroup>
        <ParameterGroup name="Validation Set">
          <Parameter name="Weight" type="unsignedFloat" value="1"/>
          <Parameter name="Threshold" type="unsignedInteger" value="5"/>
        </ParameterGroup>
      </Problem>
      <Method name="Evolutionary Programming" type="EvolutionaryProgram">
        <Parameter name="Log Verbosity" type="unsignedInteger" value="0"/>
        <Parameter name="Number of Generations" type="unsignedInteger" value="200"/>
        <Parameter name="Population Size" type="unsignedInteger" value="20"/>
        <Parameter name="Random Number Generator" type="unsignedInteger" value="1"/>
        <Parameter name="Seed" type="unsignedInteger" value="0"/>
        <Parameter name="Stop after # Stalled Generations" type="unsignedInteger" value="0"/>
      </Method>
    </Task>
    <Task key="Task_7" name="Metabolic Control Analysis" type="metabolicControlAnalysis" scheduled="false" updateModel="false">
      <Report reference="Report_6" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="Steady-State" type="key" value="Task_2"/>
      </Problem>
      <Method name="MCA Method (Reder)" type="MCAMethod(Reder)">
        <Parameter name="Modulation Factor" type="unsignedFloat" value="1.0000000000000001e-09"/>
        <Parameter name="Use Reder" type="bool" value="1"/>
        <Parameter name="Use Smallbone" type="bool" value="1"/>
      </Method>
    </Task>
    <Task key="Task_6" name="Lyapunov Exponents" type="lyapunovExponents" scheduled="false" updateModel="false">
      <Report reference="Report_5" target="" append="1" confirmOverwrite="1"/>
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
    <Task key="Task_5" name="Time Scale Separation Analysis" type="timeScaleSeparationAnalysis" scheduled="false" updateModel="false">
      <Report reference="Report_4" target="" append="1" confirmOverwrite="1"/>
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
    <Task key="Task_17" name="Sensitivities" type="sensitivities" scheduled="false" updateModel="false">
      <Report reference="Report_3" target="" append="1" confirmOverwrite="1"/>
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
    <Task key="Task_31" name="Moieties" type="moieties" scheduled="false" updateModel="false">
      <Report reference="Report_2" target="" append="1" confirmOverwrite="1"/>
      <Problem>
      </Problem>
      <Method name="Householder Reduction" type="Householder">
      </Method>
    </Task>
    <Task key="Task_16" name="Cross Section" type="crosssection" scheduled="false" updateModel="false">
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
        <Parameter name="ConvergenceTolerance" type="float" value="9.9999999999999995e-07"/>
        <Parameter name="Threshold" type="float" value="0"/>
        <Parameter name="DelayOutputUntilConvergence" type="bool" value="0"/>
        <Parameter name="OutputConvergenceTolerance" type="float" value="9.9999999999999995e-07"/>
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
    <Task key="Task_15" name="Linear Noise Approximation" type="linearNoiseApproximation" scheduled="false" updateModel="false">
      <Report reference="Report_1" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="Steady-State" type="key" value="Task_2"/>
      </Problem>
      <Method name="Linear Noise Approximation" type="LinearNoiseApproximation">
      </Method>
    </Task>
    <Task key="Task_4" name="Time-Course Sensitivities" type="timeSensitivities" scheduled="false" updateModel="false">
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
    <Report key="Report_22" name="Steady-State" taskType="steadyState" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Footer>
        <Object cn="CN=Root,Vector=TaskList[Steady-State]"/>
      </Footer>
    </Report>
    <Report key="Report_10" name="Time-Course" taskType="timeCourse" separator="&#x09;" precision="6">
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
    <Report key="Report_9" name="Elementary Flux Modes" taskType="fluxMode" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Footer>
        <Object cn="CN=Root,Vector=TaskList[Elementary Flux Modes],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_8" name="Optimization" taskType="optimization" separator="&#x09;" precision="6">
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
    <Report key="Report_7" name="Parameter Estimation" taskType="parameterFitting" separator="&#x09;" precision="6">
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
    <Report key="Report_6" name="Metabolic Control Analysis" taskType="metabolicControlAnalysis" separator="&#x09;" precision="6">
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
    <Report key="Report_5" name="Lyapunov Exponents" taskType="lyapunovExponents" separator="&#x09;" precision="6">
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
    <Report key="Report_4" name="Time Scale Separation Analysis" taskType="timeScaleSeparationAnalysis" separator="&#x09;" precision="6">
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
    <Report key="Report_3" name="Sensitivities" taskType="sensitivities" separator="&#x09;" precision="6">
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
    <Report key="Report_2" name="Moieties" taskType="moieties" separator="&#x09;" precision="6">
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
    <Report key="Report_1" name="Linear Noise Approximation" taskType="linearNoiseApproximation" separator="&#x09;" precision="6">
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
  <GUI>
  </GUI>
  <ListOfUnitDefinitions>
    <UnitDefinition key="Unit_1" name="meter" symbol="m">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Unit_0">
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
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        s
      </Expression>
    </UnitDefinition>
    <UnitDefinition key="Unit_13" name="Avogadro" symbol="Avogadro">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Unit_12">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Avogadro
      </Expression>
    </UnitDefinition>
    <UnitDefinition key="Unit_17" name="item" symbol="#">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Unit_16">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        #
      </Expression>
    </UnitDefinition>
    <UnitDefinition key="Unit_35" name="liter" symbol="l">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Unit_34">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        0.001*m^3
      </Expression>
    </UnitDefinition>
    <UnitDefinition key="Unit_41" name="mole" symbol="mol">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Unit_40">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Avogadro*#
      </Expression>
    </UnitDefinition>
    <UnitDefinition key="Unit_65" name="minute" symbol="min">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Unit_64">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        60*s
      </Expression>
    </UnitDefinition>
  </ListOfUnitDefinitions>
</COPASI>
