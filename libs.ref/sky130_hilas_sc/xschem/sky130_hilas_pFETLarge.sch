v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 1380 -1150 1420 -1150 { lab=GATE}
N 1460 -1150 1510 -1150 { lab=WELL}
N 1460 -1180 1540 -1180 { lab=DRAIN}
N 1460 -1120 1540 -1120 { lab=SOURCE}
C {devices/iopin.sym} 1510 -1150 0 0 {name=WELL lab=WELL}
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
C {devices/iopin.sym} 1540 -1120 0 0 {name=SOURCE lab=SOURCE}
C {devices/ipin.sym} 1380 -1150 0 0 {name=GATE lab=GATE}
C {devices/iopin.sym} 1540 -1180 0 0 {name=DRAIN lab=DRAIN}
