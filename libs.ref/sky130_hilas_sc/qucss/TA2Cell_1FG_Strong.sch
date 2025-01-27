<Qucs Schematic 0.0.22>
<Properties>
  <View=0,0,1430,1002,0.632812,0,0>
  <Grid=10,10,1>
  <DataSet=2TA_1StrongInput.dat>
  <DataDisplay=2TA_1StrongInput.dpl>
  <OpenDisplay=1>
  <Script=2TA_1StrongInput.m>
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
  <.PortSym 40 300 10 0>
  <.PortSym 40 340 13 0>
  <.PortSym 40 380 8 0>
  <.PortSym 40 420 14 0>
  <.PortSym 40 460 5 0>
  <.PortSym 40 500 12 0>
  <.PortSym 40 540 7 0>
  <.PortSym 0 570 15 0>
  <.PortSym 30 670 16 0>
</Symbol>
<Components>
  <Port Vinj1 1 100 110 -23 12 0 0 "1" 1 "analog" 0 "v" 0 "" 0>
  <Port GateSel1 1 150 110 -23 12 0 0 "2" 1 "analog" 0 "v" 0 "" 0>
  <Port Gate1 1 200 110 -23 12 0 0 "3" 1 "analog" 0 "v" 0 "" 0>
  <Port Vdd1 1 280 110 -23 12 0 0 "4" 1 "analog" 0 "v" 0 "" 0>
  <Port GateSel2 1 450 110 -23 12 0 0 "6" 1 "analog" 0 "v" 0 "" 0>
  <Port Drain1 1 70 630 -23 12 0 0 "11" 1 "analog" 0 "v" 0 "" 0>
  <Port Drain2 1 70 360 -23 12 0 0 "9" 1 "analog" 0 "v" 0 "" 0>
  <GND * 1 1050 610 0 0 0 0>
  <GND * 1 1070 580 0 0 0 0>
  <GND * 1 920 580 0 0 0 0>
  <GND * 1 940 610 0 0 0 0>
  <GND * 1 1270 610 0 0 0 0>
  <GND * 1 1290 580 0 0 0 0>
  <GND * 1 1140 580 0 0 0 0>
  <GND * 1 1160 610 0 0 0 0>
  <Port Out1 1 1270 520 4 12 1 2 "10" 1 "analog" 0 "v" 0 "" 0>
  <GND * 1 960 330 0 0 0 0>
  <GND * 1 980 300 0 0 0 0>
  <GND * 1 830 300 0 0 0 0>
  <GND * 1 850 330 0 0 0 0>
  <GND * 1 1180 330 0 0 0 0>
  <GND * 1 1200 300 0 0 0 0>
  <GND * 1 1050 300 0 0 0 0>
  <GND * 1 1070 330 0 0 0 0>
  <Port Out2 1 1180 240 4 12 1 2 "13" 1 "analog" 0 "v" 0 "" 0>
  <GND * 1 450 740 0 0 0 0>
  <GND * 1 450 890 0 0 0 0>
  <GND * 1 740 740 0 0 0 0>
  <GND * 1 740 890 0 0 0 0>
  <Port Gate2 1 280 930 -23 12 0 0 "5" 1 "analog" 0 "v" 0 "" 0>
  <C_SPICE C3 1 630 500 17 -26 0 1 "10fF" 1 "" 0 "" 0 "" 0 "" 0>
  <C_SPICE C1 1 180 210 17 -26 0 1 "10fF" 1 "" 0 "" 0 "" 0 "" 0>
  <C_SPICE C2 1 180 480 17 -26 0 1 "10fF" 1 "" 0 "" 0 "" 0 "" 0>
  <PMOS_SPICE M23 1 960 160 0 34 1 2 "MOSP" 1 "" 0 "" 0 "" 0 "" 0>
  <PMOS_SPICE M24 1 1180 160 -26 34 0 0 "MOSP" 1 "" 0 "" 0 "" 0 "" 0>
  <PMOS_SPICE M3 1 120 170 0 34 1 2 "MOSP" 1 "" 0 "" 0 "" 0 "" 0>
  <PMOS_SPICE M2 1 120 260 0 34 1 2 "MOSP" 1 "" 0 "" 0 "" 0 "" 0>
  <PMOS_SPICE M8 1 120 440 0 34 1 2 "MOSP" 1 "" 0 "" 0 "" 0 "" 0>
  <PMOS_SPICE M7 1 120 530 0 34 1 2 "MOSP" 1 "" 0 "" 0 "" 0 "" 0>
  <PMOS_SPICE M6 1 240 530 -26 34 0 0 "MOSP" 1 "" 0 "" 0 "" 0 "" 0>
  <PMOS_SPICE M12 1 710 530 -26 34 0 0 "MOSP" 1 "" 0 "" 0 "" 0 "" 0>
  <PMOS_SPICE M11 1 710 260 -26 34 0 0 "MOSP" 1 "" 0 "" 0 "" 0 "" 0>
  <NMOS_SPICE M20 1 850 300 0 34 1 2 "MOSN" 1 "" 0 "" 0 "" 0 "" 0>
  <PMOS_SPICE M17 1 1050 440 0 34 1 2 "MOSP" 1 "" 0 "" 0 "" 0 "" 0>
  <PMOS_SPICE M18 1 1270 440 -26 34 0 0 "MOSP" 1 "" 0 "" 0 "" 0 "" 0>
  <NMOS_SPICE M13 1 1050 580 -26 34 0 0 "MOSN" 1 "" 0 "" 0 "" 0 "" 0>
  <NMOS_SPICE M16 1 1160 580 0 34 1 2 "MOSN" 1 "" 0 "" 0 "" 0 "" 0>
  <NMOS_SPICE M15 1 1270 580 -26 34 0 0 "MOSN" 1 "" 0 "" 0 "" 0 "" 0>
  <PMOS_SPICE M26 1 860 580 0 34 1 2 "MOSN" 1 "" 0 "" 0 "" 0 "" 0>
  <NMOS_SPICE M14 1 940 580 0 34 1 2 "MOSN" 1 "" 0 "" 0 "" 0 "" 0>
  <PMOS_SPICE M25 1 820 580 -26 34 0 0 "MOSN" 1 "" 0 "" 0 "" 0 "" 0>
  <NMOS_SPICE M21 1 1180 300 -26 34 0 0 "MOSN" 1 "" 0 "" 0 "" 0 "" 0>
  <NMOS_SPICE M22 1 1070 300 0 34 1 2 "MOSN" 1 "" 0 "" 0 "" 0 "" 0>
  <NMOS_SPICE M19 1 960 300 -26 34 0 0 "MOSN" 1 "" 0 "" 0 "" 0 "" 0>
  <PMOS_SPICE M9 1 420 530 0 34 1 2 "MOSP" 1 "" 0 "" 0 "" 0 "" 0>
  <PMOS_SPICE M10 1 420 440 0 34 1 2 "MOSP" 1 "" 0 "" 0 "" 0 "" 0>
  <PMOS_SPICE M4 1 420 260 0 34 1 2 "MOSP" 1 "" 0 "" 0 "" 0 "" 0>
  <PMOS_SPICE M5 1 420 170 0 34 1 2 "MOSP" 1 "" 0 "" 0 "" 0 "" 0>
  <PMOS_SPICE M1 1 240 260 -26 34 0 0 "MOSP" 1 "" 0 "" 0 "" 0 "" 0>
  <NMOS_SPICE M27 1 470 740 0 34 1 2 "MOSN" 1 "" 0 "" 0 "" 0 "" 0>
  <NMOS_SPICE M28 1 470 890 0 34 1 2 "MOSN" 1 "" 0 "" 0 "" 0 "" 0>
  <PMOS_SPICE M34 1 630 890 -26 34 0 0 "MOSP" 1 "" 0 "" 0 "" 0 "" 0>
  <NMOS_SPICE M33 1 760 890 0 34 1 2 "MOSN" 1 "" 0 "" 0 "" 0 "" 0>
  <NMOS_SPICE M31 1 760 740 0 34 1 2 "MOSN" 1 "" 0 "" 0 "" 0 "" 0>
  <PMOS_SPICE M29 1 340 740 -26 34 0 0 "MOSP" 1 "" 0 "" 0 "" 0 "" 0>
  <PMOS_SPICE M30 1 340 890 -26 34 0 0 "MOSP" 1 "" 0 "" 0 "" 0 "" 0>
  <PMOS_SPICE M32 1 630 740 -26 34 0 0 "MOSP" 1 "" 0 "" 0 "" 0 "" 0>
  <Port Vin21 1 790 580 -23 12 0 0 "8" 1 "analog" 0 "v" 0 "" 0>
  <Port Vin22 1 890 580 4 12 1 2 "14" 1 "analog" 0 "v" 0 "" 0>
  <Port Vin11 1 470 680 4 12 1 2 "12" 1 "analog" 0 "v" 0 "" 0>
  <Port Vin12 1 800 710 4 12 1 2 "7" 1 "analog" 0 "v" 0 "" 0>
  <Port Prog 1 870 890 4 12 1 2 "15" 1 "analog" 0 "v" 0 "" 0>
  <Port Run 1 870 790 4 12 1 2 "16" 1 "analog" 0 "v" 0 "" 0>
  <C_SPICE C4 1 480 210 17 -26 0 1 "10fF" 1 "" 0 "" 0 "" 0 "" 0>
</Components>
<Wires>
  <100 170 100 260 "" 0 0 0 "">
  <150 260 180 260 "" 0 0 0 "">
  <180 260 210 260 "" 0 0 0 "">
  <180 240 180 260 "" 0 0 0 "">
  <100 140 120 140 "" 0 0 0 "">
  <100 140 100 170 "" 0 0 0 "">
  <120 200 120 230 "" 0 0 0 "">
  <120 290 120 360 "" 0 0 0 "">
  <260 260 260 320 "" 0 0 0 "">
  <100 320 260 320 "" 0 0 0 "">
  <100 260 100 320 "" 0 0 0 "">
  <100 110 100 140 "" 0 0 0 "">
  <150 110 150 170 "" 0 0 0 "">
  <200 110 200 180 "" 0 0 0 "">
  <180 180 200 180 "" 0 0 0 "">
  <280 110 280 230 "" 0 0 0 "">
  <240 230 280 230 "" 0 0 0 "">
  <400 170 400 260 "" 0 0 0 "">
  <450 260 480 260 "" 0 0 0 "">
  <480 240 480 260 "" 0 0 0 "">
  <400 140 420 140 "" 0 0 0 "">
  <400 140 400 170 "" 0 0 0 "">
  <420 200 420 230 "" 0 0 0 "">
  <420 290 420 360 "" 0 0 0 "">
  <450 110 450 170 "" 0 0 0 "">
  <120 360 420 360 "" 0 0 0 "">
  <100 440 100 530 "" 0 0 0 "">
  <150 530 180 530 "" 0 0 0 "">
  <180 530 210 530 "" 0 0 0 "">
  <180 510 180 530 "" 0 0 0 "">
  <100 410 120 410 "" 0 0 0 "">
  <100 410 100 440 "" 0 0 0 "">
  <120 470 120 500 "" 0 0 0 "">
  <120 560 120 630 "" 0 0 0 "">
  <70 630 120 630 "" 0 0 0 "">
  <260 530 260 590 "" 0 0 0 "">
  <100 590 260 590 "" 0 0 0 "">
  <100 530 100 590 "" 0 0 0 "">
  <100 320 100 410 "" 0 0 0 "">
  <200 180 200 450 "" 0 0 0 "">
  <180 450 200 450 "" 0 0 0 "">
  <280 230 280 500 "" 0 0 0 "">
  <240 500 280 500 "" 0 0 0 "">
  <400 440 400 530 "" 0 0 0 "">
  <450 530 630 530 "" 0 0 0 "">
  <400 410 420 410 "" 0 0 0 "">
  <400 410 400 440 "" 0 0 0 "">
  <420 470 420 500 "" 0 0 0 "">
  <420 560 420 630 "" 0 0 0 "">
  <400 260 400 320 "" 0 0 0 "">
  <120 630 420 630 "" 0 0 0 "">
  <400 90 400 140 "" 0 0 0 "">
  <100 90 400 90 "" 0 0 0 "">
  <100 90 100 110 "" 0 0 0 "">
  <70 360 120 360 "" 0 0 0 "">
  <400 320 400 410 "" 0 0 0 "">
  <280 70 280 110 "" 0 0 0 "">
  <280 70 1200 70 "Vdd" 340 30 76 "">
  <400 530 400 590 "" 0 0 0 "">
  <400 590 730 590 "" 0 0 0 "">
  <400 320 730 320 "" 0 0 0 "">
  <240 290 240 340 "" 0 0 0 "">
  <240 340 710 340 "" 0 0 0 "">
  <240 560 240 610 "" 0 0 0 "">
  <240 610 820 610 "" 0 0 0 "">
  <480 260 680 260 "" 0 0 0 "">
  <710 290 710 340 "" 0 0 0 "">
  <730 260 730 320 "" 0 0 0 "">
  <730 530 730 590 "" 0 0 0 "">
  <940 550 980 550 "" 0 0 0 "">
  <980 550 980 580 "" 0 0 0 "">
  <970 580 980 580 "" 0 0 0 "">
  <980 580 1020 580 "" 0 0 0 "">
  <1160 550 1200 550 "" 0 0 0 "">
  <1200 550 1200 580 "" 0 0 0 "">
  <1190 580 1200 580 "" 0 0 0 "">
  <1200 580 1240 580 "" 0 0 0 "">
  <1050 470 1050 550 "" 0 0 0 "">
  <1030 410 1030 440 "" 0 0 0 "">
  <1030 410 1050 410 "" 0 0 0 "">
  <1050 470 1100 470 "" 0 0 0 "">
  <1080 440 1100 440 "" 0 0 0 "">
  <1100 440 1100 470 "" 0 0 0 "">
  <1100 440 1240 440 "" 0 0 0 "">
  <1050 410 1270 410 "" 0 0 0 "">
  <1290 410 1290 440 "" 0 0 0 "">
  <1270 410 1290 410 "" 0 0 0 "">
  <1270 470 1270 520 "" 0 0 0 "">
  <1270 520 1270 550 "" 0 0 0 "">
  <710 340 710 500 "" 0 0 0 "">
  <850 270 890 270 "" 0 0 0 "">
  <890 270 890 300 "" 0 0 0 "">
  <880 300 890 300 "" 0 0 0 "">
  <890 300 930 300 "" 0 0 0 "">
  <1070 270 1110 270 "" 0 0 0 "">
  <1110 270 1110 300 "" 0 0 0 "">
  <1100 300 1110 300 "" 0 0 0 "">
  <1110 300 1150 300 "" 0 0 0 "">
  <850 230 850 270 "" 0 0 0 "">
  <710 230 850 230 "" 0 0 0 "">
  <960 190 960 270 "" 0 0 0 "">
  <940 130 940 160 "" 0 0 0 "">
  <940 130 960 130 "" 0 0 0 "">
  <960 190 1010 190 "" 0 0 0 "">
  <990 160 1010 160 "" 0 0 0 "">
  <1010 160 1010 190 "" 0 0 0 "">
  <1010 160 1150 160 "" 0 0 0 "">
  <960 130 1180 130 "" 0 0 0 "">
  <1200 130 1200 160 "" 0 0 0 "">
  <1180 130 1200 130 "" 0 0 0 "">
  <1180 190 1180 240 "" 0 0 0 "">
  <1180 240 1180 270 "" 0 0 0 "">
  <1160 540 1160 550 "" 0 0 0 "">
  <710 550 710 560 "" 0 0 0 "">
  <710 600 770 600 "" 0 0 0 "">
  <710 560 710 600 "" 0 0 0 "">
  <1070 240 1070 270 "" 0 0 0 "">
  <770 240 1070 240 "" 0 0 0 "">
  <770 240 770 600 "" 0 0 0 "">
  <860 550 940 550 "" 0 0 0 "">
  <820 540 1160 540 "" 0 0 0 "">
  <820 540 820 550 "" 0 0 0 "">
  <820 610 860 610 "" 0 0 0 "">
  <1200 70 1200 130 "" 0 0 0 "">
  <1270 130 1270 410 "" 0 0 0 "">
  <1200 130 1270 130 "" 0 0 0 "">
  <360 740 360 890 "" 0 0 0 "">
  <340 710 470 710 "Vin11" 380 680 78 "">
  <340 920 470 920 "" 0 0 0 "">
  <340 770 340 820 "" 0 0 0 "">
  <470 770 470 820 "" 0 0 0 "">
  <340 820 340 860 "" 0 0 0 "">
  <470 820 470 860 "" 0 0 0 "">
  <340 820 470 820 "" 0 0 0 "">
  <650 740 650 890 "" 0 0 0 "">
  <630 710 760 710 "Vin12" 670 680 89 "">
  <630 920 760 920 "" 0 0 0 "">
  <630 770 630 820 "" 0 0 0 "">
  <760 770 760 820 "" 0 0 0 "">
  <630 820 630 860 "" 0 0 0 "">
  <760 820 760 860 "" 0 0 0 "">
  <630 820 760 820 "" 0 0 0 "">
  <470 920 630 920 "" 0 0 0 "">
  <250 920 280 920 "" 0 0 0 "">
  <280 920 340 920 "" 0 0 0 "">
  <280 920 280 930 "" 0 0 0 "">
  <760 710 800 710 "" 0 0 0 "">
  <470 680 470 710 "" 0 0 0 "">
  <630 530 680 530 "" 0 0 0 "">
  <630 510 630 530 "" 0 0 0 "">
  <630 460 630 470 "" 0 0 0 "">
  <480 180 530 180 "" 0 0 0 "">
  <530 180 530 820 "" 0 0 0 "">
  <470 820 530 820 "" 0 0 0 "">
  <600 840 600 890 "" 0 0 0 "">
  <600 840 790 840 "" 0 0 0 "">
  <790 740 790 790 "" 0 0 0 "">
  <790 890 810 890 "" 0 0 0 "">
  <500 740 500 840 "" 0 0 0 "">
  <500 850 500 890 "" 0 0 0 "">
  <810 850 810 890 "" 0 0 0 "">
  <500 850 580 850 "" 0 0 0 "">
  <790 790 790 840 "" 0 0 0 "">
  <790 790 870 790 "Run" 890 750 59 "">
  <500 840 600 840 "" 0 0 0 "">
  <280 890 310 890 "" 0 0 0 "">
  <280 840 500 840 "" 0 0 0 "">
  <280 840 280 890 "" 0 0 0 "">
  <310 850 500 850 "" 0 0 0 "">
  <310 740 310 850 "" 0 0 0 "">
  <550 820 630 820 "" 0 0 0 "">
  <550 470 630 470 "" 0 0 0 "">
  <550 470 550 820 "" 0 0 0 "">
  <580 850 810 850 "" 0 0 0 "">
  <580 740 580 850 "" 0 0 0 "">
  <580 740 600 740 "" 0 0 0 "">
  <810 890 870 890 "Prog" 900 860 35 "">
  <150 440 160 440 "" 0 0 0 "">
  <160 170 160 440 "" 0 0 0 "">
  <150 170 160 170 "" 0 0 0 "">
  <450 440 460 440 "" 0 0 0 "">
  <460 170 460 440 "" 0 0 0 "">
  <450 170 460 170 "" 0 0 0 "">
  <150 110 150 110 "GateSel1" 150 40 0 "">
  <200 110 200 110 "Gate1" 250 20 0 "">
  <450 110 450 110 "GateSel2" 480 80 0 "">
  <70 630 70 630 "Drain1" 20 580 0 "">
  <70 360 70 360 "Drain2" 20 310 0 "">
  <1270 520 1270 520 "Out1" 1350 500 0 "">
  <1180 240 1180 240 "Out2" 1310 220 0 "">
  <890 580 890 580 "Vin22" 930 470 0 "">
  <790 580 790 580 "Vin21" 820 480 0 "">
  <100 90 100 90 "Vinj" 90 40 0 "">
  <250 920 250 920 "Gate2" 200 870 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
</Paintings>
