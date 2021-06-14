<Qucs Schematic 0.0.22>
<Properties>
  <View=0,0,800,800,1,0,0>
  <Grid=10,10,1>
  <DataSet=pFET_medium01.dat>
  <DataDisplay=pFET_medium01.dpl>
  <OpenDisplay=1>
  <Script=pFET_medium01.m>
  <RunScript=0>
  <showFrame=0>
  <FrameText0=Title>
  <FrameText1=Drawn By:>
  <FrameText2=Date:>
  <FrameText3=Revision:>
</Properties>
<Symbol>
  <.PortSym 40 20 1 0>
  <.PortSym 40 60 4 0>
  <.PortSym 40 100 2 0>
  <.PortSym 40 140 3 0>
</Symbol>
<Components>
  <PMOS_SPICE M1 1 500 190 -26 34 0 0 "" 1 "" 0 "" 0 "" 0 "" 0>
  <Port Source 1 500 80 -23 12 0 0 "1" 1 "analog" 0 "v" 0 "" 0>
  <Port Gate 1 390 190 -23 12 0 0 "4" 1 "analog" 0 "v" 0 "" 0>
  <Port Drain 1 500 290 -23 12 0 0 "2" 1 "analog" 0 "v" 0 "" 0>
  <Port Well 1 570 150 -23 12 0 0 "3" 1 "analog" 0 "v" 0 "" 0>
</Components>
<Wires>
  <390 190 470 190 "Gate" 440 160 18 "">
  <500 220 500 290 "" 0 0 0 "">
  <500 80 500 160 "" 0 0 0 "">
  <520 190 570 190 "" 0 0 0 "">
  <570 150 570 190 "" 0 0 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
</Paintings>
