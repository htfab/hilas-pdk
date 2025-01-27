<Qucs Schematic 0.0.22>
<Properties>
  <View=140,60,1455,842,0.632812,0,0>
  <Grid=10,10,1>
  <DataSet=2TA_1WeakInput.dat>
  <DataDisplay=2TA_1WeakInput.dpl>
  <OpenDisplay=1>
  <Script=2TA_1WeakInput.m>
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
  <.PortSym 40 180 6 0>
  <.PortSym 40 220 11 0>
  <.PortSym 40 260 9 0>
  <.PortSym 40 340 12 0>
  <.PortSym 40 380 8 0>
  <.PortSym 40 420 5 0>
  <.PortSym 0 450 10 0>
  <.PortSym 0 490 13 0>
  <.PortSym 0 520 14 0>
  <.PortSym 30 550 10f 0>
</Symbol>
<Components>
  <Port Vinj1 1 280 120 -23 12 0 0 "1" 1 "analog" 0 "v" 0 "" 0>
  <Port GateSel1 1 330 120 -23 12 0 0 "2" 1 "analog" 0 "v" 0 "" 0>
  <Port Gate1 1 380 120 -23 12 0 0 "3" 1 "analog" 0 "v" 0 "" 0>
  <Port Vdd 1 460 120 -23 12 0 0 "4" 1 "analog" 0 "v" 0 "" 0>
  <Port GateSel2 1 630 120 -23 12 0 0 "6" 1 "analog" 0 "v" 0 "" 0>
  <Port Drain1 1 250 640 -23 12 0 0 "11" 1 "analog" 0 "v" 0 "" 0>
  <Port Drain2 1 250 370 -23 12 0 0 "9" 1 "analog" 0 "v" 0 "" 0>
  <Port Vin21 1 660 460 4 12 1 2 "12" 1 "analog" 0 "v" 0 "" 0>
  <Port Gate2 1 740 140 -23 12 0 0 "5" 1 "analog" 0 "v" 0 "" 0>
  <GND * 1 1130 620 0 0 0 0>
  <GND * 1 1150 590 0 0 0 0>
  <GND * 1 1000 590 0 0 0 0>
  <GND * 1 1020 620 0 0 0 0>
  <GND * 1 1350 620 0 0 0 0>
  <GND * 1 1370 590 0 0 0 0>
  <GND * 1 1220 590 0 0 0 0>
  <GND * 1 1240 620 0 0 0 0>
  <Port Out1 1 1350 530 4 12 1 2 "10" 1 "analog" 0 "v" 0 "" 0>
  <GND * 1 1040 340 0 0 0 0>
  <GND * 1 1060 310 0 0 0 0>
  <GND * 1 910 310 0 0 0 0>
  <GND * 1 930 340 0 0 0 0>
  <GND * 1 1260 340 0 0 0 0>
  <GND * 1 1280 310 0 0 0 0>
  <GND * 1 1130 310 0 0 0 0>
  <GND * 1 1150 340 0 0 0 0>
  <Port Out2 1 1260 250 4 12 1 2 "13" 1 "analog" 0 "v" 0 "" 0>
  <C_SPICE C1 1 360 220 17 -26 0 1 "10f" 1 "" 0 "" 0 "" 0 "" 0>
  <C_SPICE C6 1 740 240 17 -26 0 1 "10f" 1 "" 0 "" 0 "" 0 "" 0>
  <C_SPICE C7 1 740 510 17 -26 0 1 "10f" 1 "" 0 "" 0 "" 0 "" 0>
  <C_SPICE C3 1 360 490 17 -26 0 1 "10f" 1 "" 0 "" 0 "" 0 "" 0>
  <C_SPICE C4 1 660 490 17 -26 0 1 "10f" 1 "" 0 "" 0 "" 0 "" 0>
  <PMOS_SPICE M24 1 1260 170 -26 34 0 0 "MOSP" 1 "" 0 "" 0 "" 0 "" 0>
  <PMOS_SPICE M23 1 1040 170 0 34 1 2 "MOSP" 1 "" 0 "" 0 "" 0 "" 0>
  <PMOS_SPICE M16 1 1350 450 -26 34 0 0 "MOSP" 1 "" 0 "" 0 "" 0 "" 0>
  <PMOS_SPICE M15 1 1130 450 0 34 1 2 "MOSP" 1 "" 0 "" 0 "" 0 "" 0>
  <NMOS_SPICE M19 1 1040 310 -26 34 0 0 "MOSN" 1 "" 0 "" 0 "" 0 "" 0>
  <NMOS_SPICE M21 1 1260 310 -26 34 0 0 "MOSN" 1 "" 0 "" 0 "" 0 "" 0>
  <NMOS_SPICE M22 1 1150 310 0 34 1 2 "MOSN" 1 "" 0 "" 0 "" 0 "" 0>
  <NMOS_SPICE M20 1 930 310 0 34 1 2 "MOSN" 1 "" 0 "" 0 "" 0 "" 0>
  <NMOS_SPICE M17 1 1350 590 -26 34 0 0 "MOSN" 1 "" 0 "" 0 "" 0 "" 0>
  <NMOS_SPICE M18 1 1240 590 0 34 1 2 "MOSN" 1 "" 0 "" 0 "" 0 "" 0>
  <NMOS_SPICE M13 1 1130 590 -26 34 0 0 "MOSN" 1 "" 0 "" 0 "" 0 "" 0>
  <NMOS_SPICE M14 1 1020 590 0 34 1 2 "MOSN" 1 "" 0 "" 0 "" 0 "" 0>
  <PMOS_SPICE M26 1 940 590 0 34 1 2 "MOSN" 1 "" 0 "" 0 "" 0 "" 0>
  <PMOS_SPICE M25 1 900 590 -26 34 0 0 "MOSN" 1 "" 0 "" 0 "" 0 "" 0>
  <PMOS_SPICE M10 1 790 540 -26 34 0 0 "MOSP" 1 "" 0 "" 0 "" 0 "" 0>
  <PMOS_SPICE M11 1 600 540 0 34 1 2 "MOSP" 1 "" 0 "" 0 "" 0 "" 0>
  <PMOS_SPICE M12 1 600 450 0 34 1 2 "MOSP" 1 "" 0 "" 0 "" 0 "" 0>
  <PMOS_SPICE M4 1 790 270 -26 34 0 0 "MOSP" 1 "" 0 "" 0 "" 0 "" 0>
  <PMOS_SPICE M5 1 600 270 0 34 1 2 "MOSP" 1 "" 0 "" 0 "" 0 "" 0>
  <PMOS_SPICE M6 1 600 180 0 34 1 2 "MOSP" 1 "" 0 "" 0 "" 0 "" 0>
  <PMOS_SPICE M7 1 420 540 -26 34 0 0 "MOSP" 1 "" 0 "" 0 "" 0 "" 0>
  <PMOS_SPICE M8 1 300 540 0 34 1 2 "MOSP" 1 "" 0 "" 0 "" 0 "" 0>
  <PMOS_SPICE M9 1 300 450 0 34 1 2 "MOSP" 1 "" 0 "" 0 "" 0 "" 0>
  <PMOS_SPICE M1 1 420 270 -26 34 0 0 "MOSP" 1 "" 0 "" 0 "" 0 "" 0>
  <PMOS_SPICE M2 1 300 270 0 34 1 2 "MOSP" 1 "" 0 "" 0 "" 0 "" 0>
  <PMOS_SPICE M3 1 300 180 0 34 1 2 "MOSP" 1 "" 0 "" 0 "" 0 "" 0>
  <C_SPICE C5 1 660 220 17 -26 0 1 "10f" 1 "" 0 "" 0 "" 0 "" 0>
  <Port Vin22 1 660 170 4 12 1 2 "10f" 1 "analog" 0 "v" 0 "" 0>
  <Port Vin12 1 870 590 -23 12 0 0 "8" 1 "analog" 0 "v" 0 "" 0>
  <Port Vin11 1 970 590 4 12 1 2 "14" 1 "analog" 0 "v" 0 "" 0>
</Components>
<Wires>
  <280 180 280 270 "" 0 0 0 "">
  <330 270 360 270 "" 0 0 0 "">
  <360 270 390 270 "" 0 0 0 "">
  <360 250 360 270 "" 0 0 0 "">
  <280 150 300 150 "" 0 0 0 "">
  <280 150 280 180 "" 0 0 0 "">
  <300 210 300 240 "" 0 0 0 "">
  <300 300 300 370 "" 0 0 0 "">
  <420 300 420 350 "" 0 0 0 "">
  <440 270 440 330 "" 0 0 0 "">
  <280 330 440 330 "" 0 0 0 "">
  <280 270 280 330 "" 0 0 0 "">
  <280 120 280 150 "" 0 0 0 "">
  <330 180 330 270 "" 0 0 0 "">
  <330 120 330 180 "" 0 0 0 "">
  <380 120 380 190 "" 0 0 0 "">
  <360 190 380 190 "" 0 0 0 "">
  <460 120 460 240 "" 0 0 0 "">
  <420 240 460 240 "" 0 0 0 "">
  <580 180 580 270 "" 0 0 0 "">
  <630 270 660 270 "" 0 0 0 "">
  <660 250 660 270 "" 0 0 0 "">
  <580 150 600 150 "" 0 0 0 "">
  <580 150 580 180 "" 0 0 0 "">
  <600 210 600 240 "" 0 0 0 "">
  <600 300 600 370 "" 0 0 0 "">
  <580 270 580 330 "" 0 0 0 "">
  <630 180 630 270 "" 0 0 0 "">
  <630 120 630 180 "" 0 0 0 "">
  <300 370 600 370 "" 0 0 0 "">
  <280 450 280 540 "" 0 0 0 "">
  <330 540 360 540 "" 0 0 0 "">
  <360 540 390 540 "" 0 0 0 "">
  <360 520 360 540 "" 0 0 0 "">
  <280 420 300 420 "" 0 0 0 "">
  <280 420 280 450 "" 0 0 0 "">
  <300 480 300 510 "" 0 0 0 "">
  <300 570 300 640 "" 0 0 0 "">
  <250 640 300 640 "Drain1" 190 590 4 "">
  <420 570 420 620 "" 0 0 0 "">
  <440 540 440 600 "" 0 0 0 "">
  <280 600 440 600 "" 0 0 0 "">
  <280 540 280 600 "" 0 0 0 "">
  <280 330 280 420 "" 0 0 0 "">
  <330 450 330 540 "" 0 0 0 "">
  <330 270 330 450 "" 0 0 0 "">
  <380 190 380 460 "" 0 0 0 "">
  <360 460 380 460 "" 0 0 0 "">
  <460 240 460 510 "" 0 0 0 "">
  <420 510 460 510 "" 0 0 0 "">
  <580 450 580 540 "" 0 0 0 "">
  <630 540 660 540 "" 0 0 0 "">
  <660 520 660 540 "" 0 0 0 "">
  <580 420 600 420 "" 0 0 0 "">
  <580 420 580 450 "" 0 0 0 "">
  <600 480 600 510 "" 0 0 0 "">
  <600 570 600 640 "" 0 0 0 "">
  <580 330 580 420 "" 0 0 0 "">
  <630 450 630 540 "" 0 0 0 "">
  <630 270 630 450 "" 0 0 0 "">
  <300 640 600 640 "" 0 0 0 "">
  <580 100 580 150 "" 0 0 0 "">
  <280 100 580 100 "" 0 0 0 "">
  <280 100 280 120 "" 0 0 0 "">
  <250 370 300 370 "" 0 0 0 "">
  <580 540 580 600 "" 0 0 0 "">
  <580 600 810 600 "" 0 0 0 "">
  <580 330 810 330 "" 0 0 0 "">
  <660 540 740 540 "" 0 0 0 "">
  <660 270 740 270 "" 0 0 0 "">
  <420 350 790 350 "" 0 0 0 "">
  <790 300 790 350 "" 0 0 0 "">
  <810 270 810 330 "" 0 0 0 "">
  <810 540 810 600 "" 0 0 0 "">
  <740 270 760 270 "" 0 0 0 "">
  <740 540 760 540 "" 0 0 0 "">
  <740 140 740 200 "" 0 0 0 "">
  <740 370 740 480 "" 0 0 0 "">
  <720 370 740 370 "" 0 0 0 "">
  <720 200 720 370 "" 0 0 0 "">
  <740 200 740 210 "" 0 0 0 "">
  <720 200 740 200 "" 0 0 0 "">
  <1020 560 1060 560 "" 0 0 0 "">
  <1060 560 1060 590 "" 0 0 0 "">
  <1050 590 1060 590 "" 0 0 0 "">
  <1060 590 1100 590 "" 0 0 0 "">
  <1240 560 1280 560 "" 0 0 0 "">
  <1280 560 1280 590 "" 0 0 0 "">
  <1270 590 1280 590 "" 0 0 0 "">
  <1280 590 1320 590 "" 0 0 0 "">
  <1130 480 1130 560 "" 0 0 0 "">
  <1110 420 1110 450 "" 0 0 0 "">
  <1110 420 1130 420 "" 0 0 0 "">
  <1130 480 1180 480 "" 0 0 0 "">
  <1160 450 1180 450 "" 0 0 0 "">
  <1180 450 1180 480 "" 0 0 0 "">
  <1180 450 1320 450 "" 0 0 0 "">
  <1130 420 1350 420 "" 0 0 0 "">
  <1370 420 1370 450 "" 0 0 0 "">
  <1350 420 1370 420 "" 0 0 0 "">
  <1350 480 1350 530 "" 0 0 0 "">
  <1350 530 1350 560 "" 0 0 0 "">
  <790 350 790 510 "" 0 0 0 "">
  <930 280 970 280 "" 0 0 0 "">
  <970 280 970 310 "" 0 0 0 "">
  <960 310 970 310 "" 0 0 0 "">
  <970 310 1010 310 "" 0 0 0 "">
  <1150 280 1190 280 "" 0 0 0 "">
  <1190 280 1190 310 "" 0 0 0 "">
  <1180 310 1190 310 "" 0 0 0 "">
  <1190 310 1230 310 "" 0 0 0 "">
  <930 240 930 280 "" 0 0 0 "">
  <790 240 930 240 "" 0 0 0 "">
  <1040 200 1040 280 "" 0 0 0 "">
  <1020 140 1020 170 "" 0 0 0 "">
  <1020 140 1040 140 "" 0 0 0 "">
  <1040 200 1090 200 "" 0 0 0 "">
  <1070 170 1090 170 "" 0 0 0 "">
  <1090 170 1090 200 "" 0 0 0 "">
  <1090 170 1230 170 "" 0 0 0 "">
  <1040 140 1260 140 "" 0 0 0 "">
  <1280 140 1280 170 "" 0 0 0 "">
  <1260 140 1280 140 "" 0 0 0 "">
  <1260 200 1260 250 "" 0 0 0 "">
  <1260 250 1260 280 "" 0 0 0 "">
  <670 200 670 210 "" 0 0 0 "">
  <1240 550 1240 560 "" 0 0 0 "">
  <790 560 790 570 "" 0 0 0 "">
  <790 610 850 610 "" 0 0 0 "">
  <790 570 790 610 "" 0 0 0 "">
  <1150 250 1150 280 "" 0 0 0 "">
  <850 250 1150 250 "" 0 0 0 "">
  <850 250 850 610 "" 0 0 0 "">
  <420 620 900 620 "" 0 0 0 "">
  <940 560 1020 560 "" 0 0 0 "">
  <900 550 1240 550 "" 0 0 0 "">
  <900 550 900 560 "" 0 0 0 "">
  <900 620 940 620 "" 0 0 0 "">
  <660 170 660 190 "" 0 0 0 "">
  <460 80 460 120 "" 0 0 0 "">
  <460 80 1280 80 "" 0 0 0 "">
  <1280 80 1280 140 "" 0 0 0 "">
  <1350 140 1350 420 "" 0 0 0 "">
  <1280 140 1350 140 "" 0 0 0 "">
  <330 120 330 120 "GateSel1" 260 70 0 "">
  <380 120 380 120 "Gate1" 390 70 0 "">
  <460 120 460 120 "Vdd" 490 110 0 "">
  <630 120 630 120 "GateSel2" 660 90 0 "">
  <250 370 250 370 "Drain2" 190 320 0 "">
  <660 460 660 460 "Vin21" 660 410 0 "">
  <740 140 740 140 "Gate2" 770 110 0 "">
  <1350 530 1350 530 "Out1" 1410 490 0 "">
  <1260 250 1260 250 "Out2" 1390 230 0 "">
  <870 590 870 590 "Vin12" 890 500 0 "">
  <970 590 970 590 "Vin11" 990 510 0 "">
  <660 170 660 170 "Vin22" 670 120 0 "">
  <280 100 280 100 "Vinj" 210 70 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
</Paintings>
