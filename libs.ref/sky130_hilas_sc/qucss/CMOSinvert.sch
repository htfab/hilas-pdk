<Qucs Schematic 0.0.22>
<Properties>
  <View=0,0,958,800,2.25,536,497>
  <Grid=10,10,1>
  <DataSet=CMOSinvert.dat>
  <DataDisplay=CMOSinvert.dpl>
  <OpenDisplay=1>
  <Script=CMOSinvert.m>
  <RunScript=0>
  <showFrame=0>
  <FrameText0=Title>
  <FrameText1=Drawn By:>
  <FrameText2=Date:>
  <FrameText3=Revision:>
</Properties>
<Symbol>
</Symbol>
<Components>
  <GND * 1 450 500 0 0 0 0>
  <GND * 1 470 470 0 0 0 0>
  <GND * 1 530 360 0 0 0 0>
  <Vdc V1 1 530 330 18 -26 0 1 "5 V" 1>
  <Vdc V2 1 330 420 18 -26 0 1 "1 V" 1>
  <PMOS_SPICE M2 1 450 380 -26 34 0 0 "MOSP" 1 "" 0 "" 0 "" 0 "" 0>
  <NMOS_SPICE M1 1 450 470 -26 34 0 0 "MOSN" 1 "" 0 "" 0 "" 0 "" 0>
  <GND * 1 330 450 0 0 0 0>
  <SpiceModel SpiceModel2 1 550 580 -30 15 0 0 ".model MOSP PMOS level=8 version=3.3.0" 1 "" 0 "" 0 "" 0 "Line_5=" 0>
  <SpiceModel SpiceModel1 1 560 490 -30 15 0 0 ".model MOSN NMOS level=8 version=3.3.0" 1 "" 0 "" 0 "" 0 "Line_5=" 0>
  <.DC DC1 1 610 370 0 36 0 0 "26.85" 0 "0.001" 0 "1 pA" 0 "1 uV" 0 "no" 0 "150" 0 "no" 0 "none" 0 "CroutLU" 0>
  <C_SPICE C1 1 370 330 17 -26 0 1 "" 1 "" 0 "" 0 "" 0 "" 0>
</Components>
<Wires>
  <450 410 450 440 "" 0 0 0 "">
  <420 380 420 390 "" 0 0 0 "">
  <470 350 480 350 "" 0 0 0 "">
  <470 350 470 380 "" 0 0 0 "">
  <450 350 460 350 "" 0 0 0 "">
  <460 300 530 300 "" 0 0 0 "">
  <460 350 470 350 "" 0 0 0 "">
  <460 300 460 350 "" 0 0 0 "">
  <420 390 420 470 "" 0 0 0 "">
  <330 390 370 390 "" 0 0 0 "">
  <370 300 460 300 "" 0 0 0 "">
  <370 390 420 390 "" 0 0 0 "">
  <370 360 370 390 "" 0 0 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
</Paintings>
