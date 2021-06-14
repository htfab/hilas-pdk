<Qucs Schematic 0.0.22>
<Properties>
  <View=0,0,935,800,1.5,17,182>
  <Grid=10,10,1>
  <DataSet=Trans2med.dat>
  <DataDisplay=Trans2med.dpl>
  <OpenDisplay=1>
  <Script=Trans2med.m>
  <RunScript=0>
  <showFrame=0>
  <FrameText0=Title>
  <FrameText1=Drawn By:>
  <FrameText2=Date:>
  <FrameText3=Revision:>
</Properties>
<Symbol>
  <.PortSym 40 20 5 0>
  <.PortSym 40 60 4 0>
  <.PortSym 40 100 7 0>
  <.PortSym 40 140 8 0>
  <.PortSym 40 180 10 0>
  <.PortSym 40 220 11 0>
  <.PortSym 40 260 18 0>
  <.PortSym 40 300 17 0>
  <.PortSym 40 340 1 0>
  <.PortSym 40 380 2 0>
  <.PortSym 40 420 14 0>
  <.PortSym 40 460 13 0>
  <.PortSym 40 500 19 0>
</Symbol>
<Components>
  <GND * 1 470 540 0 0 0 0>
  <GND * 1 620 540 0 0 0 0>
  <PMOS_SPICE M1 1 600 320 -26 34 0 0 "MOSP" 1 "" 0 "" 0 "" 0 "" 0>
  <NMOS_SPICE M4 1 600 540 -26 34 0 0 "MOSN" 1 "" 0 "" 0 "" 0 "" 0>
  <NMOS_SPICE M5 1 450 540 -26 34 0 0 "MOSN" 1 "" 0 "" 0 "" 0 "" 0>
  <PMOS_SPICE M6 1 450 320 -26 34 0 0 "MOSP" 1 "" 0 "" 0 "" 0 "" 0>
  <Port Well1 1 660 250 4 12 1 2 "19" 1 "analog" 0 "v" 0 "" 0>
  <Port Source1n 1 450 620 -23 12 0 0 "18" 1 "analog" 0 "v" 0 "" 0>
  <Port Source2n 1 600 620 -23 12 0 0 "17" 1 "analog" 0 "v" 0 "" 0>
  <Port Gate1n 1 380 540 -23 12 0 0 "13" 1 "analog" 0 "v" 0 "" 0>
  <Port Gate2n 1 530 540 -23 12 0 0 "14" 1 "analog" 0 "v" 0 "" 0>
  <Port Drain2n 1 600 470 -23 12 0 0 "11" 1 "analog" 0 "v" 0 "" 0>
  <Port Drain1n 1 450 470 -23 12 0 0 "10" 1 "analog" 0 "v" 0 "" 0>
  <Port Gate1p 1 370 320 -23 12 0 0 "1" 1 "analog" 0 "v" 0 "" 0>
  <Port Gate2p 1 530 320 -23 12 0 0 "2" 1 "analog" 0 "v" 0 "" 0>
  <Port Source2p 1 600 260 -23 12 0 0 "4" 1 "analog" 0 "v" 0 "" 0>
  <Port Source1p 1 450 260 -23 12 0 0 "5" 1 "analog" 0 "v" 0 "" 0>
  <Port Drain2p 1 600 400 -23 12 0 0 "8" 1 "analog" 0 "v" 0 "" 0>
  <Port Drain1p 1 450 400 -23 12 0 0 "7" 1 "analog" 0 "v" 0 "" 0>
</Components>
<Wires>
  <620 250 620 320 "" 0 0 0 "">
  <600 260 600 290 "" 0 0 0 "">
  <600 350 600 400 "" 0 0 0 "">
  <450 570 450 620 "" 0 0 0 "">
  <600 570 600 620 "" 0 0 0 "">
  <600 470 600 510 "" 0 0 0 "">
  <470 250 620 250 "" 0 0 0 "">
  <470 250 470 320 "" 0 0 0 "">
  <450 350 450 400 "" 0 0 0 "">
  <450 260 450 290 "" 0 0 0 "">
  <530 320 570 320 "" 0 0 0 "">
  <370 320 420 320 "" 0 0 0 "">
  <530 540 570 540 "" 0 0 0 "">
  <380 540 420 540 "" 0 0 0 "">
  <450 470 450 510 "" 0 0 0 "">
  <620 250 660 250 "" 0 0 0 "">
  <450 400 450 400 "Drain1p" 470 400 0 "">
  <600 400 600 400 "Drain2p" 630 400 0 "">
  <450 470 450 470 "Drain1n" 470 450 0 "">
  <600 470 600 470 "Drain2n" 630 450 0 "">
  <450 620 450 620 "Source1n" 460 670 0 "">
  <600 620 600 620 "Source2n" 620 670 0 "">
  <370 320 370 320 "Gate1p" 350 280 0 "">
  <530 320 530 320 "Gate2p" 520 280 0 "">
  <530 540 530 540 "Gate2n" 510 500 0 "">
  <380 540 380 540 "Gate1n" 360 500 0 "">
  <660 250 660 250 "Well" 650 210 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
</Paintings>
