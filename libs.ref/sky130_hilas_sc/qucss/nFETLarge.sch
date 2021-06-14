<Qucs Schematic 0.0.22>
<Properties>
  <View=0,0,800,800,2.25,415,498>
  <Grid=10,10,1>
  <DataSet=nFETLarge.dat>
  <DataDisplay=nFETLarge.dpl>
  <OpenDisplay=1>
  <Script=nFETLarge.m>
  <RunScript=0>
  <showFrame=0>
  <FrameText0=Title>
  <FrameText1=Drawn By:>
  <FrameText2=Date:>
  <FrameText3=Revision:>
</Properties>
<Symbol>
  <.PortSym 40 20 10 0>
  <.PortSym 40 60 18 0>
  <.PortSym 40 140 13 0>
</Symbol>
<Components>
  <GND * 1 650 390 0 0 0 0>
  <NMOS_SPICE M1 1 630 390 -26 34 0 0 "MOSN" 1 "" 0 "" 0 "" 0 "" 0>
  <Port Source1n 1 630 470 -23 12 0 0 "18" 1 "analog" 0 "v" 0 "" 0>
  <Port Gate1n 1 560 390 -23 12 0 0 "13" 1 "analog" 0 "v" 0 "" 0>
  <Port Drain1n 1 630 320 -23 12 0 0 "10" 1 "analog" 0 "v" 0 "" 0>
</Components>
<Wires>
  <630 420 630 470 "" 0 0 0 "">
  <560 390 600 390 "" 0 0 0 "">
  <630 320 630 360 "" 0 0 0 "">
  <630 320 630 320 "Drain1n" 650 300 0 "">
  <630 470 630 470 "Source1n" 640 520 0 "">
  <560 390 560 390 "Gate1n" 540 350 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
</Paintings>
