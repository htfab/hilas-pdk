v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 1030 -1170 1110 -1170 { lab=Drain1n}
N 1030 -1140 1050 -1140 { lab=GND}
N 1030 -1030 1050 -1030 { lab=GND}
N 950 -1140 990 -1140 { lab=Gate1n}
N 960 -1030 990 -1030 { lab=Gate2n}
N 1380 -1150 1420 -1150 { lab=Gate1p}
N 1380 -1030 1420 -1030 { lab=Gate2p}
N 1460 -1150 1510 -1150 { lab=Well}
N 1460 -1030 1490 -1030 { lab=Well}
N 1490 -1150 1490 -910 { lab=Well}
N 1030 -1060 1100 -1060 { lab=Drain2n}
N 1460 -1180 1540 -1180 { lab=Drain1p}
N 1460 -1060 1530 -1060 { lab=Drain2p}
N 1460 -1120 1540 -1120 { lab=Source1p}
N 1460 -1000 1530 -1000 { lab=Source2p}
N 1030 -1110 1110 -1110 { lab=Source1n}
N 1030 -1000 1110 -1000 { lab=Source2n}
C {devices/ipin.sym} 960 -1030 0 0 {name=Gate2n lab=Gate2n}
C {devices/iopin.sym} 1510 -1150 0 0 {name=Well lab=Well}
C {devices/iopin.sym} 1530 -1000 0 0 {name=Source2p lab=Source2p}
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
C {devices/gnd.sym} 1050 -1140 0 0 {name=l4 lab=GND}
C {devices/ipin.sym} 950 -1140 0 0 {name=Gate1n lab=Gate1n}
C {devices/iopin.sym} 1110 -1170 0 0 {name=Drain1n lab=Drain1n}
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
C {devices/gnd.sym} 1050 -1030 0 0 {name=l6 lab=GND}
C {devices/iopin.sym} 1100 -1060 0 0 {name=Drain2n lab=Drain2n}
C {devices/ipin.sym} 1380 -1030 0 0 {name=Gate2p lab=Gate2p}
C {devices/iopin.sym} 1540 -1120 0 0 {name=Source1p lab=Source1p}
C {devices/ipin.sym} 1380 -1150 0 0 {name=Gate1p lab=Gate1p}
C {devices/iopin.sym} 1540 -1180 0 0 {name=Drain1p lab=Drain1p}
C {devices/iopin.sym} 1530 -1060 0 0 {name=Drain2p lab=Drain2p}
C {devices/iopin.sym} 1100 -1000 0 0 {name=Source2n lab=Source2n}
C {devices/iopin.sym} 1110 -1110 0 0 {name=Source1n lab=Source1n}
