v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 1030 -1170 1110 -1170 { lab=DRAIN1N}
N 1030 -1140 1050 -1140 { lab=VGND}
N 1040 -900 1060 -900 { lab=VGND}
N 1030 -1030 1050 -1030 { lab=VGND}
N 950 -1140 990 -1140 { lab=GATE1N}
N 960 -1030 990 -1030 { lab=GATE2N}
N 970 -900 1000 -900 { lab=GATE3N}
N 1380 -1150 1420 -1150 { lab=GATE1P}
N 1380 -1030 1420 -1030 { lab=GATE2P}
N 1390 -910 1420 -910 { lab=GATE3P}
N 1460 -1150 1510 -1150 { lab=WELL}
N 1460 -1030 1490 -1030 { lab=WELL}
N 1460 -910 1490 -910 { lab=WELL}
N 1490 -1150 1490 -910 { lab=WELL}
N 1040 -930 1100 -930 { lab=DRAIN3N}
N 1030 -1060 1100 -1060 { lab=DRAIN2N}
N 1460 -1180 1540 -1180 { lab=DRAIN1P}
N 1460 -940 1530 -940 { lab=DRAIN3P}
N 1460 -1060 1530 -1060 { lab=DRAIN2P}
N 1460 -1120 1540 -1120 { lab=SOURCE1P}
N 1460 -1000 1530 -1000 { lab=SOURCE2P}
N 1460 -880 1530 -880 { lab=SOURCE3P}
N 1030 -1110 1110 -1110 { lab=SOURCE1N}
N 1030 -1000 1110 -1000 { lab=SOURCE2N}
N 1040 -870 1100 -870 { lab=SOURCE3N}
C {devices/ipin.sym} 960 -1030 0 0 {name=Gate2n lab=GATE2N}
C {devices/iopin.sym} 1510 -1150 0 0 {name=Well lab=WELL}
C {devices/iopin.sym} 1530 -1000 0 0 {name=Source2p lab=SOURCE2P}
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
C {devices/ipin.sym} 950 -1140 0 0 {name=Gate1n lab=GATE1N}
C {devices/iopin.sym} 1110 -1170 0 0 {name=Drain1n lab=DRAIN1N}
C {devices/iopin.sym} 1530 -880 0 0 {name=Source3p lab=SOURCE3P}
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
C {devices/ipin.sym} 1390 -910 0 0 {name=Gate3p lab=GATE3P}
C {devices/iopin.sym} 1100 -930 0 0 {name=Drain3n lab=DRAIN3N}
C {devices/iopin.sym} 1100 -1060 0 0 {name=Drain2n lab=DRAIN2N}
C {devices/ipin.sym} 1380 -1030 0 0 {name=Gate2p lab=GATE2P}
C {devices/iopin.sym} 1540 -1120 0 0 {name=Source1p lab=SOURCE1P}
C {devices/ipin.sym} 1380 -1150 0 0 {name=Gate1p lab=GATE1P}
C {devices/ipin.sym} 970 -900 0 0 {name=Gate3n lab=GATE3N}
C {devices/iopin.sym} 1540 -1180 0 0 {name=Drain1p lab=DRAIN1P}
C {devices/iopin.sym} 1530 -940 0 0 {name=Drain3p lab=DRAIN3P}
C {devices/iopin.sym} 1530 -1060 0 0 {name=Drain2p lab=DRAIN2P}
C {devices/iopin.sym} 1100 -1000 0 0 {name=Source2n lab=SOURCE2N}
C {devices/iopin.sym} 1100 -870 0 0 {name=Source3n lab=SOURCE3N}
C {devices/iopin.sym} 1110 -1110 0 0 {name=Source1n lab=SOURCE1N}
