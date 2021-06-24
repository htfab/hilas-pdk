v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 1030 -1170 1110 -1170 { lab=NFET_DRAIN1}
N 1030 -1140 1050 -1140 { lab=VGND}
N 1040 -900 1060 -900 { lab=VGND}
N 1030 -1030 1050 -1030 { lab=VGND}
N 950 -1140 990 -1140 { lab=NFET_GATE1}
N 960 -1030 990 -1030 { lab=NFET_GATE2}
N 970 -900 1000 -900 { lab=NFET_GATE3}
N 1380 -1150 1420 -1150 { lab=PFET_GATE1}
N 1380 -1030 1420 -1030 { lab=PFET_GATE2}
N 1390 -910 1420 -910 { lab=PFET_GATE3}
N 1460 -1150 1510 -1150 { lab=WELL}
N 1460 -1030 1490 -1030 { lab=WELL}
N 1460 -910 1490 -910 { lab=WELL}
N 1490 -1150 1490 -910 { lab=WELL}
N 1040 -930 1100 -930 { lab=NFET_DRAIN3}
N 1030 -1060 1100 -1060 { lab=NFET_DRAIN2}
N 1460 -1180 1540 -1180 { lab=PFET_DRAIN1}
N 1460 -940 1530 -940 { lab=PFET_DRAIN3}
N 1460 -1060 1530 -1060 { lab=PFET_DRAIN2}
N 1460 -1120 1540 -1120 { lab=PFET_SOURCE1}
N 1460 -1000 1530 -1000 { lab=PFET_SOURCE2}
N 1460 -880 1530 -880 { lab=PFET_SOURCE3}
N 1030 -1110 1110 -1110 { lab=NFET_SOURCE1}
N 1030 -1000 1110 -1000 { lab=NFET_SOURCE2}
N 1040 -870 1100 -870 { lab=NFET_SOURCE3}
C {devices/ipin.sym} 960 -1030 0 0 {name=NFET_GATE2 lab=NFET_GATE2}
C {devices/iopin.sym} 1510 -1150 0 0 {name=WELL lab=WELL}
C {devices/iopin.sym} 1530 -1000 0 0 {name=PFET_SOURCE2 lab=PFET_SOURCE2}
C {sky130_fd_pr/pfet_01v8.sym} 1440 -1150 0 0 {name=M1
L=0.15
W=1
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} 1440 -910 0 0 {name=M2
L=0.15
W=1
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} 1010 -1140 0 0 {name=M3
L=0.15
W=1
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} 1020 -900 0 0 {name=M4
L=0.15
W=1
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {devices/gnd.sym} 1060 -900 0 0 {name=l2 lab=VGND}
C {devices/gnd.sym} 1050 -1140 0 0 {name=l4 lab=VGND}
C {devices/ipin.sym} 950 -1140 0 0 {name=NFET_GATE1 lab=NFET_GATE1}
C {devices/iopin.sym} 1110 -1170 0 0 {name=NFET_DRAIN1 lab=NFET_DRAIN1}
C {devices/iopin.sym} 1530 -880 0 0 {name=PFET_SOURCE3 lab=PFET_SOURCE3}
C {sky130_fd_pr/pfet_01v8.sym} 1440 -1030 0 0 {name=M7
L=0.15
W=1
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} 1010 -1030 0 0 {name=M10
L=0.15
W=1
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {devices/gnd.sym} 1050 -1030 0 0 {name=l6 lab=VGND}
C {devices/ipin.sym} 1390 -910 0 0 {name=PFET_GATE3 lab=PFET_GATE3}
C {devices/iopin.sym} 1100 -930 0 0 {name=NFET_DRAIN3 lab=NFET_DRAIN3}
C {devices/iopin.sym} 1100 -1060 0 0 {name=NFET_DRAIN2 lab=NFET_DRAIN2}
C {devices/ipin.sym} 1380 -1030 0 0 {name=PFET_GATE2 lab=PFET_GATE2}
C {devices/iopin.sym} 1540 -1120 0 0 {name=PFET_SOURCE1 lab=PFET_SOURCE1}
C {devices/ipin.sym} 1380 -1150 0 0 {name=PFET_GATE1 lab=PFET_GATE1}
C {devices/ipin.sym} 970 -900 0 0 {name=NFET_GATE3 lab=NFET_GATE3}
C {devices/iopin.sym} 1540 -1180 0 0 {name=PFET_DRAIN1 lab=PFET_DRAIN1}
C {devices/iopin.sym} 1530 -940 0 0 {name=PFET_DRAIN3 lab=PFET_DRAIN3}
C {devices/iopin.sym} 1530 -1060 0 0 {name=PFET_DRAIN2 lab=PFET_DRAIN2}
C {devices/iopin.sym} 1100 -1000 0 0 {name=NFET_SOURCE2 lab=NFET_SOURCE2}
C {devices/iopin.sym} 1100 -870 0 0 {name=NFET_SOURCE3 lab=NFET_SOURCE3}
C {devices/iopin.sym} 1110 -1110 0 0 {name=NFET_SOURCE1 lab=NFET_SOURCE1}
