v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 1030 -1170 1110 -1170 { lab=DRAIN1N}
N 1030 -1140 1050 -1140 { lab=GND}
N 950 -1140 990 -1140 { lab=GATE1N}
N 1030 -1110 1110 -1110 { lab=SOURCE1N}
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
C {devices/ipin.sym} 950 -1140 0 0 {name=Gate1n lab=GATE1N}
C {devices/iopin.sym} 1110 -1170 0 0 {name=Drain1n lab=DRAIN1N}
C {devices/iopin.sym} 1110 -1110 0 0 {name=Source1n lab=SOURCE1N}
