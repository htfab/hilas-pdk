<Qucs Schematic 0.0.22>
<Properties>
  <View=0,0,800,800,1.6875,0,115>
  <Grid=10,10,1>
  <DataSet=Trans4small.dat>
  <DataDisplay=Trans4small.dpl>
  <OpenDisplay=1>
  <Script=Trans4small.m>
  <RunScript=0>
  <showFrame=0>
  <FrameText0=Title>
  <FrameText1=Drawn By:>
  <FrameText2=Date:>
  <FrameText3=Revision:>
</Properties>
<Symbol>
  <.PortSym 40 20 1 0>
  <.PortSym 40 60 2 0>
  <.PortSym 40 100 3 0>
  <.PortSym 40 140 4 0>
  <.PortSym 40 180 5 0>
  <.PortSym 40 220 6 0>
  <.PortSym 40 260 7 0>
  <.PortSym 40 300 8 0>
  <.PortSym 40 340 9 0>
  <.PortSym 40 380 10 0>
  <.PortSym 40 420 11 0>
  <.PortSym 40 460 12 0>
  <.PortSym 40 500 13 0>
  <.PortSym 40 540 14 0>
  <.PortSym 40 580 15 0>
  <.PortSym 40 620 16 0>
  <.PortSym 40 660 17 0>
  <.PortSym 40 700 18 0>
  <.PortSym 40 740 19 0>
</Symbol>
<Components>
  <Port Well 1 630 140 4 12 1 2 "19" 1 "analog" 0 "v" 0 "" 0>
  <GND * 1 270 430 0 0 0 0>
  <GND * 1 420 430 0 0 0 0>
  <GND * 1 580 430 0 0 0 0>
  <PMOS_SPICE M4 1 400 210 -26 34 0 0 "MOSP" 1 "" 0 "" 0 "" 0 "" 0>
  <PMOS_SPICE M6 1 560 210 -26 34 0 0 "MOSP" 1 "" 0 "" 0 "" 0 "" 0>
  <NMOS_SPICE M5 1 560 430 -26 34 0 0 "MOSN" 1 "" 0 "" 0 "" 0 "" 0>
  <NMOS_SPICE M3 1 400 430 -26 34 0 0 "MOSN" 1 "" 0 "" 0 "" 0 "" 0>
  <NMOS_SPICE M1 1 250 430 -26 34 0 0 "MOSN" 1 "" 0 "" 0 "" 0 "" 0>
  <Port Source1p 1 250 150 -23 12 0 0 "5" 1 "analog" 0 "v" 0 "" 0>
  <Port Source2p 1 400 150 -23 12 0 0 "4" 1 "analog" 0 "v" 0 "" 0>
  <Port Source3p 1 560 150 -23 12 0 0 "6" 1 "analog" 0 "v" 0 "" 0>
  <Port Drain1p 1 250 290 -23 12 0 0 "7" 1 "analog" 0 "v" 0 "" 0>
  <Port Drain2p 1 400 290 -23 12 0 0 "8" 1 "analog" 0 "v" 0 "" 0>
  <Port Drain3p 1 560 290 -23 12 0 0 "9" 1 "analog" 0 "v" 0 "" 0>
  <Port Drain1n 1 250 360 -23 12 0 0 "10" 1 "analog" 0 "v" 0 "" 0>
  <Port Drain2n 1 400 360 -23 12 0 0 "11" 1 "analog" 0 "v" 0 "" 0>
  <Port Drain3n 1 560 360 -23 12 0 0 "12" 1 "analog" 0 "v" 0 "" 0>
  <Port Source1n 1 250 510 -23 12 0 0 "18" 1 "analog" 0 "v" 0 "" 0>
  <Port Source3n 1 560 510 -23 12 0 0 "16" 1 "analog" 0 "v" 0 "" 0>
  <PMOS_SPICE M2 1 250 210 -26 34 0 0 "MOSP" 1 "" 0 "" 0 "" 0 "" 0>
  <Port Gate1p 1 170 210 -23 12 0 0 "1" 1 "analog" 0 "v" 0 "" 0>
  <Port Gate2p 1 330 210 -23 12 0 0 "2" 1 "analog" 0 "v" 0 "" 0>
  <Port Gate3p 1 480 210 -23 12 0 0 "3" 1 "analog" 0 "v" 0 "" 0>
  <Port Gate3n 1 490 430 -23 12 0 0 "15" 1 "analog" 0 "v" 0 "" 0>
  <Port Gate2n 1 330 430 -23 12 0 0 "14" 1 "analog" 0 "v" 0 "" 0>
  <Port Gate1n 1 180 430 -23 12 0 0 "13" 1 "analog" 0 "v" 0 "" 0>
  <Port Source2n 1 400 510 -23 12 0 0 "17" 1 "analog" 0 "v" 0 "" 0>
</Components>
<Wires>
  <420 140 580 140 "" 0 0 0 "">
  <420 140 420 210 "" 0 0 0 "">
  <580 140 630 140 "" 0 0 0 "">
  <580 140 580 210 "" 0 0 0 "">
  <400 150 400 180 "" 0 0 0 "">
  <560 150 560 180 "" 0 0 0 "">
  <400 240 400 290 "" 0 0 0 "">
  <560 240 560 290 "" 0 0 0 "">
  <250 460 250 510 "" 0 0 0 "">
  <400 460 400 510 "" 0 0 0 "">
  <560 460 560 510 "" 0 0 0 "">
  <560 360 560 400 "" 0 0 0 "">
  <400 360 400 400 "" 0 0 0 "">
  <270 140 420 140 "" 0 0 0 "">
  <270 140 270 210 "" 0 0 0 "">
  <250 240 250 290 "" 0 0 0 "">
  <250 150 250 180 "" 0 0 0 "">
  <330 210 370 210 "" 0 0 0 "">
  <170 210 220 210 "" 0 0 0 "">
  <480 210 530 210 "" 0 0 0 "">
  <490 430 530 430 "" 0 0 0 "">
  <330 430 370 430 "" 0 0 0 "">
  <180 430 220 430 "" 0 0 0 "">
  <250 360 250 400 "" 0 0 0 "">
  <400 510 400 510 "Source2n" 420 560 0 "">
  <630 140 630 140 "Well" 660 110 0 "">
  <250 510 250 510 "Source1n" 260 560 0 "">
  <560 510 560 510 "Source3n" 580 560 0 "">
  <250 150 250 150 "Source1p" 250 100 0 "">
  <400 150 400 150 "Source2p" 390 100 0 "">
  <560 150 560 150 "Source3p" 550 100 0 "">
  <250 290 250 290 "Drain1p" 270 290 0 "">
  <400 290 400 290 "Drain2p" 430 290 0 "">
  <560 290 560 290 "Drain3p" 580 290 0 "">
  <250 360 250 360 "Drain1n" 270 340 0 "">
  <400 360 400 360 "Drain2n" 430 340 0 "">
  <560 360 560 360 "Drain3n" 590 340 0 "">
  <170 210 170 210 "Gate1p" 150 170 0 "">
  <330 210 330 210 "Gate2p" 320 170 0 "">
  <480 210 480 210 "Gate3p" 470 170 0 "">
  <490 430 490 430 "Gate3n" 460 390 0 "">
  <330 430 330 430 "Gate2n" 310 390 0 "">
  <180 430 180 430 "Gate1n" 160 390 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
</Paintings>
