<Qucs Schematic 0.0.22>
<Properties>
  <View=0,0,800,800,1.5,0,0>
  <Grid=10,10,1>
  <DataSet=pFETLarge.dat>
  <DataDisplay=pFETLarge.dpl>
  <OpenDisplay=1>
  <Script=pFETLarge.m>
  <RunScript=0>
  <showFrame=0>
  <FrameText0=Title>
  <FrameText1=Drawn By:>
  <FrameText2=Date:>
  <FrameText3=Revision:>
</Properties>
<Symbol>
  <.PortSym 40 20 19 0>
  <.PortSym 40 60 1 0>
  <.PortSym 40 140 5 0>
  <.PortSym 40 180 7 0>
</Symbol>
<Components>
  <PMOS_SPICE M2 1 340 210 -26 34 0 0 "MOSP" 1 "" 0 "" 0 "" 0 "" 0>
  <Port Well1 1 400 210 4 12 1 2 "19" 1 "analog" 0 "v" 0 "" 0>
  <Port Gate1p 1 260 210 -23 12 0 0 "1" 1 "analog" 0 "v" 0 "" 0>
  <Port Drain1p 1 340 290 -23 12 0 0 "7" 1 "analog" 0 "v" 0 "" 0>
  <Port Source1p 1 340 150 -23 12 0 0 "5" 1 "analog" 0 "v" 0 "" 0>
</Components>
<Wires>
  <340 240 340 290 "" 0 0 0 "">
  <340 150 340 180 "" 0 0 0 "">
  <260 210 310 210 "" 0 0 0 "">
  <360 210 400 210 "" 0 0 0 "">
  <260 210 260 210 "Gate1p" 240 170 0 "">
  <340 150 340 150 "Source1p" 370 120 0 "">
  <340 290 340 290 "Drain1p" 360 290 0 "">
  <400 210 400 210 "Well" 420 170 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
</Paintings>
