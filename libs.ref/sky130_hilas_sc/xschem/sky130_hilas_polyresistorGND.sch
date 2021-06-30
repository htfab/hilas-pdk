v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 1060 -1260 1140 -1260 {lab=#net1}
N 1050 -1180 1050 -1140 { lab=VGND}
N 1050 -1190 1050 -1180 { lab=VGND}
N 1050 -1260 1050 -1250 { lab=#net1}
N 1050 -1260 1060 -1260 { lab=#net1}
C {devices/gnd.sym} 1050 -1140 0 0 {name=l4 lab=VGND}
C {devices/iopin.sym} 1140 -1260 0 0 {name=OUTPUT lab=OUTPUT}
C {devices/res.sym} 1050 -1220 0 0 {name=R1
value=100k
footprint=1206
device=resistor
m=1}
