v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 1260 -1370 1300 -1370 { lab=GATE1}
N 1140 -1370 1180 -1370 { lab=VTUN}
N 1140 -1380 1140 -1370 { lab=VTUN}
N 1110 -1430 1330 -1430 { lab=#net1}
N 1070 -1480 1070 -1460 { lab=#net2}
N 1370 -1400 1370 -1320 { lab=ROW2}
N 1180 -1370 1180 -1300 { lab=VTUN}
N 1070 -1400 1070 -1340 { lab=DRAIN2}
N 1000 -1430 1000 -1300 { lab=VINJ}
N 1260 -1630 1300 -1630 { lab=GATE1}
N 1140 -1630 1180 -1630 { lab=VTUN}
N 1140 -1640 1140 -1630 { lab=VTUN}
N 1110 -1690 1330 -1690 { lab=#net3}
N 1070 -1740 1070 -1720 { lab=#net4}
N 1370 -1660 1370 -1580 { lab=ROW1}
N 1370 -1720 1410 -1720 { lab=COMMONSOURCE}
N 1260 -1630 1260 -1370 { lab=GATE1}
N 1180 -1640 1180 -1630 { lab=VTUN}
N 1180 -1630 1180 -1370 { lab=VTUN}
N 1030 -1820 1030 -1300 { lab=COLSEL1}
N 1070 -1660 1070 -1600 { lab=DRAIN1}
N 1000 -1610 1000 -1540 { lab=VINJ}
N 1000 -1690 1070 -1690 { lab=VINJ}
N 1070 -1770 1080 -1770 { lab=VINJ}
N 1080 -1800 1080 -1770 { lab=VINJ}
N 1000 -1430 1080 -1430 { lab=VINJ}
N 1070 -1510 1080 -1510 { lab=VINJ}
N 1080 -1540 1080 -1510 { lab=VINJ}
N 1370 -1430 1390 -1430 { lab=VINJ}
N 1370 -1690 1390 -1690 { lab=VINJ}
N 1390 -1690 1390 -1610 { lab=VINJ}
N 1000 -1610 1390 -1610 { lab=VINJ}
N 1000 -1880 1000 -1800 { lab=VINJ}
N 1370 -1320 1470 -1320 { lab=ROW2}
N 1160 -1770 1160 -1750 { lab=VIN11}
N 1120 -1540 1120 -1490 { lab=VIN12}
N 1410 -1790 1410 -1720 { lab=COMMONSOURCE}
N 1410 -1720 1410 -1460 { lab=COMMONSOURCE}
N 1370 -1460 1410 -1460 { lab=COMMONSOURCE}
N 1390 -1610 1390 -1430 { lab=VINJ}
N 1370 -1580 1470 -1580 { lab=ROW1}
N 1610 -1450 1610 -1420 { lab=VGND}
N 1610 -1450 1650 -1450 { lab=VGND}
N 1260 -1820 1260 -1630 { lab=GATE1}
N 1000 -1800 1000 -1690 { lab=VINJ}
N 1000 -1540 1000 -1430 { lab=VINJ}
N 1000 -1690 1000 -1610 { lab=VINJ}
N 1000 -1540 1080 -1540 { lab=VINJ}
N 1000 -1800 1080 -1800 { lab=VINJ}
N 880 -1340 1070 -1340 { lab=DRAIN2}
N 880 -1600 1070 -1600 { lab=DRAIN1}
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 1350 -1430 0 0 {name=M3
L=0.5
W=1
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_g5v0d10v5
spiceprefix=X
}
C {sky130_fd_pr/cap_var_hvt.sym} 1300 -1400 0 0 {name=C1 model=cap_var_hvt W=0.5 L=0.5 VM=1 spiceprefix=X}
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 1090 -1430 0 1 {name=M5
L=0.5
W=1
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_g5v0d10v5
spiceprefix=X
}
C {sky130_fd_pr/cap_var_hvt.sym} 1140 -1400 0 1 {name=C2 model=cap_var_hvt W=0.5 L=0.5 VM=1 spiceprefix=X}
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 1050 -1510 0 0 {name=M1
L=0.5
W=1
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_g5v0d10v5
spiceprefix=X
}
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 1350 -1690 0 0 {name=M2
L=0.5
W=1
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_g5v0d10v5
spiceprefix=X
}
C {sky130_fd_pr/cap_var_hvt.sym} 1300 -1660 0 0 {name=C3 model=cap_var_hvt W=0.5 L=0.5 VM=1 spiceprefix=X}
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 1090 -1690 0 1 {name=M4
L=0.5
W=1
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_g5v0d10v5
spiceprefix=X
}
C {sky130_fd_pr/cap_var_hvt.sym} 1140 -1660 0 1 {name=C4 model=cap_var_hvt W=0.5 L=0.5 VM=1 spiceprefix=X}
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 1050 -1770 0 0 {name=M6
L=0.5
W=1
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_g5v0d10v5
spiceprefix=X
}
C {devices} 980 -1480 0 0 {}
C {devices/ipin.sym} 880 -1600 0 0 {name=DRAIN1 lab=DRAIN1}
C {devices/ipin.sym} 880 -1340 0 0 {name=DRAIN2 lab=DRAIN2}
C {devices/iopin.sym} 1260 -1820 0 0 {name=GATE1 lab=GATE1}
C {devices/iopin.sym} 1180 -1300 0 0 {name=VTUN lab=VTUN}
C {devices/iopin.sym} 1030 -1820 0 0 {name=COLSEL1 lab=COLSEL1}
C {devices/iopin.sym} 1000 -1880 0 0 {name=VINJ lab=VINJ}
C {devices/iopin.sym} 1410 -1790 0 0 {name=COMMONSOURCE lab=COMMONSOURCE}
C {devices/iopin.sym} 1470 -1580 0 0 {name=ROW1 lab=ROW1}
C {devices/iopin.sym} 1470 -1320 0 0 {name=ROW2 lab=ROW2}
C {devices/iopin.sym} 1160 -1770 0 0 {name=VIN11 lab=VIN11}
C {devices/iopin.sym} 1120 -1540 0 0 {name=VIN12 lab=VIN12}
C {devices/capa.sym} 1120 -1460 0 0 {name=C9
value=10f
}
C {devices/capa.sym} 1160 -1720 0 0 {name=C10
value=10f
}
C {devices/gnd.sym} 1610 -1420 0 0 {name=l199 lab=VGND}
C {devices/iopin.sym} 1640 -1450 0 0 {name=p199 lab=VGND}
