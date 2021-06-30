v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 1250 -1170 1330 -1170 {lab=OUTPUT}
N 1210 -1170 1250 -1170 {lab=INPUT}
N 1250 -1170 1250 -1150 { lab=INPUT}
N 1250 -1260 1250 -1230 { lab=VINJ}
N 1250 -1090 1250 -1070 { lab=VGND}
N 1250 -1080 1310 -1080 { lab=VGND}
C {devices/gnd.sym} 1250 -1070 0 0 {name=l4 lab=VGND}
C {devices/ipin.sym} 1210 -1170 0 0 {name=INPUT lab=INPUT}
C {devices/iopin.sym} 1250 -1260 0 0 {name=VINJ lab=VINJ}
C {sky130_fd_pr/diode.sym} 1250 -1200 0 0 {name=D1
model=diode_pw2nd_05v5
area=1
}
C {sky130_fd_pr/diode.sym} 1250 -1120 0 0 {name=D2
model=diode_pw2nd_05v5
area=1
}
C {devices/iopin.sym} 1330 -1170 0 0 {name=OUTPUT lab=OUTPUT}
C {devices/iopin.sym} 1300 -1080 0 0 {name=p1 lab=VGND}
