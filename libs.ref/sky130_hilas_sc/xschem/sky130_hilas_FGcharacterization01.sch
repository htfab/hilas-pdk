v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 1360 -1420 1390 -1420 { lab=#net1}
N 1320 -1370 1320 -1360 { lab=GATE2}
N 1320 -1360 1360 -1360 { lab=GATE2}
N 1200 -1420 1360 -1420 { lab=#net1}
N 1320 -1360 1320 -1290 { lab=GATE2}
N 1470 -1370 1470 -1360 { lab=GATE1}
N 1470 -1360 1510 -1360 { lab=GATE1}
N 1650 -1360 1690 -1360 { lab=VTUN}
N 1650 -1370 1650 -1360 { lab=VTUN}
N 1690 -1370 1690 -1360 { lab=VTUN}
N 1500 -1360 1500 -1310 { lab=GATE1}
N 1470 -1420 1510 -1420 { lab=#net1}
N 1020 -1420 1200 -1420 { lab=#net1}
N 2380 -1580 2470 -1580 { lab=VINJ}
N 2200 -1580 2380 -1580 { lab=VINJ}
N 1890 -1580 2200 -1580 { lab=VINJ}
N 2240 -1550 2340 -1550 { lab=#net2}
N 2240 -1550 2240 -1520 { lab=#net2}
N 2200 -1520 2240 -1520 { lab=#net2}
N 2200 -1520 2200 -1480 { lab=#net2}
N 2380 -1520 2380 -1380 { lab=OUTPUT}
N 2380 -1430 2400 -1430 { lab=OUTPUT}
N 2380 -1280 2400 -1280 { lab=GND}
N 2380 -1380 2380 -1310 { lab=OUTPUT}
N 2200 -1480 2200 -1360 { lab=#net2}
N 2200 -1330 2230 -1330 { lab=GND}
N 1800 -1280 1830 -1280 { lab=GND}
N 1870 -1280 1930 -1280 { lab=#net3}
N 1890 -1310 1890 -1280 { lab=#net3}
N 1830 -1310 1890 -1310 { lab=#net3}
N 1830 -1340 1830 -1310 { lab=#net3}
N 1940 -1280 2340 -1280 { lab=#net3}
N 1950 -1330 1980 -1330 { lab=GND}
N 2020 -1330 2080 -1330 { lab=#net4}
N 2040 -1360 2040 -1330 { lab=#net4}
N 1980 -1360 2040 -1360 { lab=#net4}
N 1980 -1390 1980 -1360 { lab=#net4}
N 1930 -1280 1940 -1280 { lab=#net3}
N 2070 -1330 2160 -1330 { lab=#net4}
N 1830 -1390 1830 -1340 { lab=#net3}
N 1830 -1450 1980 -1450 { lab=#net5}
N 1900 -1580 1900 -1540 { lab=VINJ}
N 1900 -1480 1900 -1450 { lab=#net5}
N 1840 -1510 1860 -1510 { lab=VBIAS}
N 2020 -1420 2030 -1420 { lab=VBIAS}
N 1500 -1420 1790 -1420 { lab=#net1}
N 1640 -1580 1890 -1580 { lab=VINJ}
N 1640 -1580 1640 -1510 { lab=VINJ}
N 1600 -1510 1640 -1510 { lab=VINJ}
N 1690 -1390 1690 -1370 { lab=VTUN}
N 1560 -1510 1560 -1420 { lab=#net1}
N 1600 -1480 1600 -1460 { lab=SOURCE1}
N 1600 -1560 1600 -1540 { lab=DRAIN1}
N 1390 -1420 1470 -1420 { lab=#net1}
N 1210 -1360 1210 -1320 { lab=GATE3}
N 1110 -1360 1110 -1320 { lab=GATE4}
N 1020 -1360 1020 -1320 { lab=GATE5}
N 2380 -1550 2390 -1550 { lab=VINJ}
N 2390 -1580 2390 -1550 { lab=VINJ}
N 2180 -1550 2200 -1550 { lab=VINJ}
N 2180 -1580 2180 -1550 { lab=VINJ}
N 1900 -1510 1910 -1510 { lab=VINJ}
N 1910 -1580 1910 -1510 { lab=VINJ}
N 1830 -1420 1980 -1420 { lab=VINJ}
N 1960 -1420 1980 -1420 { lab=VINJ}
N 1960 -1580 1960 -1420 { lab=VINJ}
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 1880 -1510 0 0 {name=M3
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
C {sky130_fd_pr/cap_var_hvt.sym} 1360 -1390 0 0 {name=C1 model=cap_var_hvt W=0.5 L=0.5 VM=1 spiceprefix=X}
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 2000 -1420 0 1 {name=M5
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
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 1810 -1420 0 0 {name=M1
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
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 1580 -1510 0 0 {name=M2
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
C {sky130_fd_pr/cap_var_hvt.sym} 1510 -1390 0 0 {name=C3 model=cap_var_hvt W=0.5 L=0.5 VM=1 spiceprefix=X}
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 2220 -1550 0 1 {name=M4
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
C {sky130_fd_pr/cap_var_hvt.sym} 1650 -1390 0 1 {name=C4 model=cap_var_hvt W=0.5 L=0.5 VM=1 spiceprefix=X}
C {devices/ipin.sym} 1840 -1510 0 0 {name=Vbias lab=VBIAS}
C {devices/ipin.sym} 1600 -1560 0 0 {name=Drain1 lab=DRAIN1}
C {devices/ipin.sym} 1210 -1320 0 0 {name=Gate3 lab=GATE3}
C {devices/ipin.sym} 1320 -1320 0 0 {name=Gate2 lab=GATE2}
C {devices/iopin.sym} 1690 -1390 0 0 {name=Vtun lab=VTUN}
C {devices/iopin.sym} 1600 -1460 0 0 {name=Source1 lab=SOURCE1}
C {devices/iopin.sym} 2470 -1580 0 0 {name=Vinj lab=VINJ}
C {devices/iopin.sym} 1500 -1310 0 1 {name=Gate1 lab=GATE1}
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 2360 -1550 0 0 {name=M31
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
C {sky130_fd_pr/nfet_g5v0d10v5.sym} 2360 -1280 0 0 {name=M34
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
model=nfet_g5v0d10v5
spiceprefix=X
}
C {sky130_fd_pr/nfet_g5v0d10v5.sym} 1850 -1280 0 1 {name=M35
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
model=nfet_g5v0d10v5
spiceprefix=X
}
C {devices/gnd.sym} 2400 -1280 0 0 {name=l3 lab=GND}
C {devices/iopin.sym} 2400 -1430 0 0 {name=Output lab=OUTPUT}
C {devices/iopin.sym} 2030 -1420 0 0 {name=Vbias1 lab=VBIAS}
C {sky130_fd_pr/nfet_g5v0d10v5.sym} 2180 -1330 0 0 {name=M7
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
model=nfet_g5v0d10v5
spiceprefix=X
}
C {devices/gnd.sym} 2380 -1250 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} 2200 -1300 0 0 {name=l2 lab=GND}
C {devices/gnd.sym} 2230 -1330 0 0 {name=l7 lab=GND}
C {devices/gnd.sym} 1830 -1250 0 0 {name=l8 lab=GND}
C {devices/gnd.sym} 1800 -1280 0 0 {name=l9 lab=GND}
C {sky130_fd_pr/nfet_g5v0d10v5.sym} 2000 -1330 0 1 {name=M8
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
model=nfet_g5v0d10v5
spiceprefix=X
}
C {devices/gnd.sym} 1980 -1300 0 0 {name=l10 lab=GND}
C {devices/gnd.sym} 1950 -1330 0 0 {name=l11 lab=GND}
C {devices/capa.sym} 1210 -1390 0 0 {name=C2
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {devices/capa.sym} 1110 -1390 0 0 {name=C5
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {devices/capa.sym} 1020 -1390 0 0 {name=C6
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {devices/ipin.sym} 1110 -1320 0 0 {name=Gate4 lab=GATE4}
C {devices/ipin.sym} 1020 -1320 0 0 {name=Gate5 lab=GATE5}
