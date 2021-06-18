module TopLevelTestStructure (
  inout wire Vtun,
  inout wire Vinj,
  inout wire GateNFET1,
  inout wire CharOutput,
  inout wire DrainInject,
  inout wire VrefChar,
  inout wire Cap3,
  inout wire Cap2,
  inout wire GateAndCap1,
  inout wire GeneralGate01,
  inout wire GeneralGate02,
  inout wire OutputTA1,
  inout wire Vdd,
  inout wire Gate1,
  inout wire ColSel1,
  inout wire Gate2,
  inout wire ColSel2,
  inout wire Drain1p,
  inout wire Drain1n,
  inout wire Drain2p,
  inout wire Drain2n,
  inout wire Drain3p,
  inout wire Drain3n,
  inout wire Drain4p,
  inout wire Drain4n,
  inout wire Drain5p,
  inout wire Drain5n,
  inout wire Drain6p,
  inout wire Drain6n,
  inout wire SourceN,
  inout wire SourceP,
  inout wire Well,
  inout wire Run,
  inout wire Prog,
  inout wire DrainOut,
  inout wire WTAIn2,
  inout wire WTAIn1,
  inout wire WTAIn3,
  inout wire WTAIn4,
  inout wire RowTerm2,
  inout wire Column1,
  inout wire Column2,
  inout wire DacOutput,
  inout wire WTAOutput1,
  inout wire WTAOutput2,
  inout wire WTAOutput3,
  inout wire WTAOutput4
);

wire net4  ;
wire net16  ;
wire net18  ;
wire net1  ;
wire net11  ;
wire net5  ;
wire net15  ;
wire net2  ;
wire net8  ;
wire net10  ;
wire net13  ;
wire net6  ;
wire net14  ;
wire net3  ;
wire net9  ;
wire net17  ;
wire GND  ;
wire net12  ;
wire net7  ;

swc4x2
x1 ( 
 .Vinj( Vinj ),
 .Vtun( Vtun ),
 .ColSel2( ColSel2 ),
 .ColSel1( ColSel1 ),
 .Col2( Column2 ),
 .Gate2( Gate2 ),
 .Gate1( Gate1 ),
 .Col1( Column1 ),
 .Drain1( net2 ),
 .Row1( __UNCONNECTED_PIN__0 ),
 .Drain2( net5 ),
 .Row2( RowTerm2 ),
 .Drain3( net4 ),
 .Row3( __UNCONNECTED_PIN__1 ),
 .Drain4( net3 ),
 .Row4( __UNCONNECTED_PIN__2 )
);


drainSelect01
x2 ( 
 .Vinj( Vinj ),
 .SelectDrain( DrainOut ),
 .Select1( __UNCONNECTED_PIN__3 ),
 .Drain1( net2 ),
 .Select2( __UNCONNECTED_PIN__4 ),
 .Drain2( net5 ),
 .Select3( __UNCONNECTED_PIN__5 ),
 .Drain3( net4 ),
 .Select4( __UNCONNECTED_PIN__6 ),
 .Drain4( net3 )
);


WTA4input
x3 ( 
 .Vinj( Vinj ),
 .Vtun( Vtun ),
 .ColSel1( ColSel1 ),
 .Vdd( Vdd ),
 .Gate1( Gate1 ),
 .WTAMiddleNode( net1 ),
 .WTAOut1( WTAOutput1 ),
 .WTAIn1( WTAIn1 ),
 .Drain1( net6 ),
 .WTAOut2( WTAOutput2 ),
 .WTAIn2( WTAIn2 ),
 .Drain2( net9 ),
 .WTAOut3( WTAOutput3 ),
 .WTAIn3( WTAIn3 ),
 .Drain3( net8 ),
 .WTAOut4( WTAOutput4 ),
 .WTAIn4( WTAIn4 ),
 .Drain4( net7 )
);


TA2Cell_1FG_Strong
x4 ( 
 .Vinj( Vinj ),
 .Vtun( Vtun ),
 .ColSel1( ColSel1 ),
 .Vdd( net14 ),
 .Gate1( Gate1 ),
 .ColSel2( ColSel2 ),
 .Output1( net17 ),
 .Drain1( net12 ),
 .Vin22( GeneralGate01 ),
 .Output2( net18 ),
 .Vin21( GeneralGate02 ),
 .Drain2( net13 ),
 .Vin11( GeneralGate02 ),
 .Vin12( GeneralGate01 ),
 .Prog( Prog ),
 .Run( Run ),
 .Gate2( Gate2 )
);


TA2Cell_1FG
x6 ( 
 .Vinj( Vinj ),
 .Vtun( Vtun ),
 .ColSel1( ColSel1 ),
 .Vdd( net14 ),
 .Gate1( Gate1 ),
 .Gate2( Gate2 ),
 .ColSel2( ColSel2 ),
 .Vin11( GeneralGate02 ),
 .Output1( net16 ),
 .Drain1( net11 ),
 .Vin12( GeneralGate01 ),
 .Vin22( GeneralGate01 ),
 .Output2( net15 ),
 .Vin21( GeneralGate02 ),
 .Drain2( net10 )
);


Tgate4Single01
x7 ( 
 .Vdd( net14 ),
 .Out1( OutputTA1 ),
 .Select1( __UNCONNECTED_PIN__7 ),
 .Node1_1( net17 ),
 .Out2( OutputTA1 ),
 .Select2( __UNCONNECTED_PIN__8 ),
 .Node1_2( net18 ),
 .Out3( OutputTA1 ),
 .Select3( __UNCONNECTED_PIN__9 ),
 .Node1_3( net16 ),
 .Out4( OutputTA1 ),
 .Select4( __UNCONNECTED_PIN__10 ),
 .Node1_4( net15 )
);


Trans2med
x8 ( 
 .Drain1p( Drain4p ),
 .Drain1n( Drain4n ),
 .Well( Well ),
 .Gate1p( GateAndCap1 ),
 .Gate1n( GateAndCap1 ),
 .Source1p( SourceP ),
 .Source1n( SourceN ),
 .Drain2n( Drain5p ),
 .Drain2p( Drain5n ),
 .Gate2p( GateAndCap1 ),
 .Gate2n( GateAndCap1 ),
 .Source2n( SourceN ),
 .Source2p( SourceP )
);


Trans4small
x9 ( 
 .Drain1p( Drain1p ),
 .Drain1n( Drain1n ),
 .Gate1p( GateAndCap1 ),
 .Well( Well ),
 .Gate1n( GateAndCap1 ),
 .Source1p( SourceP ),
 .Source1n( SourceN ),
 .Drain2p( Drain2p ),
 .Drain2n( Drain2n ),
 .Gate2n( GateAndCap1 ),
 .Gate2p( GateAndCap1 ),
 .Source2p( SourceP ),
 .Source2n( SourceN ),
 .Drain3p( Drain3p ),
 .Drain3n( Drain3n ),
 .Gate3p( GateAndCap1 ),
 .Gate3n( GateAndCap1 ),
 .Source3p( SourceP ),
 .Source3n( SourceN )
);


nFETLarge
x10 ( 
 .Drain1n( Drain6n ),
 .Gate1n( GateAndCap1 ),
 .Source1n( SourceN )
);


pFETLarge
x11 ( 
 .Drain1p( Drain6p ),
 .Gate1p( GateAndCap1 ),
 .Well( Well ),
 .Source1p( SourceP )
);


FGcharacterization01
x12 ( 
 .Vinj( Vinj ),
 .Drain1( DrainInject ),
 .Vref( VrefChar ),
 .Source1( Vinj ),
 .Output( CharOutput ),
 .Vbias( GateNFET1 ),
 .Vtun( Vtun ),
 .Gate5( Cap3 ),
 .Gate4( Cap2 ),
 .Gate2( GateAndCap1 ),
 .Gate3( GeneralGate02 ),
 .Gate1( GeneralGate01 )
);


DAC5bit01
x14 ( 
 .A4( GeneralGate01 ),
 .A0( GeneralGate02 ),
 .A3( GateAndCap1 ),
 .A2( Cap2 ),
 .A1( Cap3 ),
 .Vdd( Vdd ),
 .Out( DacOutput )
);


drainSelect01
x16 ( 
 .Vinj( Vinj ),
 .SelectDrain( DrainOut ),
 .Select1( __UNCONNECTED_PIN__11 ),
 .Drain1( net6 ),
 .Select2( __UNCONNECTED_PIN__12 ),
 .Drain2( net9 ),
 .Select3( __UNCONNECTED_PIN__13 ),
 .Drain3( net8 ),
 .Select4( __UNCONNECTED_PIN__14 ),
 .Drain4( net7 )
);


nFETLarge
x17 ( 
 .Drain1n( net1 ),
 .Gate1n( GateNFET1 ),
 .Source1n( GND )
);


drainSelect01
x18 ( 
 .Vinj( Vinj ),
 .SelectDrain( DrainOut ),
 .Select1( __UNCONNECTED_PIN__15 ),
 .Drain1( net12 ),
 .Select2( __UNCONNECTED_PIN__16 ),
 .Drain2( net13 ),
 .Select3( __UNCONNECTED_PIN__17 ),
 .Drain3( net11 ),
 .Select4( __UNCONNECTED_PIN__18 ),
 .Drain4( net10 )
);

endmodule

// expanding   symbol:  swc4x2.sym # of pins=16
// sym_path: /home/ubuntu/.xschem/xschem_library/xschem_sky130/swc4x2.sym
// sch_path: /home/ubuntu/.xschem/xschem_library/xschem_sky130/swc4x2.sch
module swc4x2 (
  inout wire Vinj,
  inout wire Vtun,
  inout wire ColSel2,
  inout wire ColSel1,
  inout wire Col2,
  inout wire Gate2,
  inout wire Gate1,
  inout wire Col1,
  input wire Drain1,
  input wire Row1,
  input wire Drain2,
  input wire Row2,
  input wire Drain3,
  input wire Row3,
  input wire Drain4,
  input wire Row4
);

wire net4  ;
wire net16  ;
wire net1  ;
wire net11  ;
wire net5  ;
wire net15  ;
wire net2  ;
wire net8  ;
wire net10  ;
wire net13  ;
wire net6  ;
wire net14  ;
wire net3  ;
wire net9  ;
wire net12  ;
wire net7  ;


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M3 ( 
 .D( Row4 ),
 .G( net1 ),
 .S( Col1 ),
 .B( Vinj )
);


cap_var_hvt
#(
.model ( cap_var_hvt ) ,
.W ( 0.5 ) ,
.L ( 0.5 ) ,
.VM ( 1 ) ,
.spiceprefix ( X )
)
C1 ( 
 .c0( net1 ),
 .c1( Gate1 ),
 .b( Gate1 )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M5 ( 
 .D( Drain4 ),
 .G( net1 ),
 .S( net2 ),
 .B( Vinj )
);


cap_var_hvt
#(
.model ( cap_var_hvt ) ,
.W ( 0.5 ) ,
.L ( 0.5 ) ,
.VM ( 1 ) ,
.spiceprefix ( X )
)
C2 ( 
 .c0( net1 ),
 .c1( Vtun ),
 .b( Vtun )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M1 ( 
 .D( net2 ),
 .G( ColSel1 ),
 .S( Vinj ),
 .B( Vinj )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M2 ( 
 .D( Row3 ),
 .G( net3 ),
 .S( Col1 ),
 .B( Vinj )
);


cap_var_hvt
#(
.model ( cap_var_hvt ) ,
.W ( 0.5 ) ,
.L ( 0.5 ) ,
.VM ( 1 ) ,
.spiceprefix ( X )
)
C3 ( 
 .c0( net3 ),
 .c1( Gate1 ),
 .b( Gate1 )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M4 ( 
 .D( Drain3 ),
 .G( net3 ),
 .S( net4 ),
 .B( Vinj )
);


cap_var_hvt
#(
.model ( cap_var_hvt ) ,
.W ( 0.5 ) ,
.L ( 0.5 ) ,
.VM ( 1 ) ,
.spiceprefix ( X )
)
C4 ( 
 .c0( net3 ),
 .c1( Vtun ),
 .b( Vtun )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M6 ( 
 .D( net4 ),
 .G( ColSel1 ),
 .S( Vinj ),
 .B( Vinj )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M7 ( 
 .D( Row2 ),
 .G( net5 ),
 .S( Col1 ),
 .B( Vinj )
);


cap_var_hvt
#(
.model ( cap_var_hvt ) ,
.W ( 0.5 ) ,
.L ( 0.5 ) ,
.VM ( 1 ) ,
.spiceprefix ( X )
)
C5 ( 
 .c0( net5 ),
 .c1( Gate1 ),
 .b( Gate1 )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M8 ( 
 .D( Drain2 ),
 .G( net5 ),
 .S( net6 ),
 .B( Vinj )
);


cap_var_hvt
#(
.model ( cap_var_hvt ) ,
.W ( 0.5 ) ,
.L ( 0.5 ) ,
.VM ( 1 ) ,
.spiceprefix ( X )
)
C6 ( 
 .c0( net5 ),
 .c1( Vtun ),
 .b( Vtun )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M9 ( 
 .D( net6 ),
 .G( ColSel1 ),
 .S( Vinj ),
 .B( Vinj )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M10 ( 
 .D( Row1 ),
 .G( net7 ),
 .S( Col1 ),
 .B( Vinj )
);


cap_var_hvt
#(
.model ( cap_var_hvt ) ,
.W ( 0.5 ) ,
.L ( 0.5 ) ,
.VM ( 1 ) ,
.spiceprefix ( X )
)
C7 ( 
 .c0( net7 ),
 .c1( Gate1 ),
 .b( Gate1 )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M11 ( 
 .D( Drain1 ),
 .G( net7 ),
 .S( net8 ),
 .B( Vinj )
);


cap_var_hvt
#(
.model ( cap_var_hvt ) ,
.W ( 0.5 ) ,
.L ( 0.5 ) ,
.VM ( 1 ) ,
.spiceprefix ( X )
)
C8 ( 
 .c0( net7 ),
 .c1( Vtun ),
 .b( Vtun )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M12 ( 
 .D( net8 ),
 .G( ColSel1 ),
 .S( Vinj ),
 .B( Vinj )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M13 ( 
 .D( Row4 ),
 .G( net9 ),
 .S( Col2 ),
 .B( Vinj )
);


cap_var_hvt
#(
.model ( cap_var_hvt ) ,
.W ( 0.5 ) ,
.L ( 0.5 ) ,
.VM ( 1 ) ,
.spiceprefix ( X )
)
C9 ( 
 .c0( net9 ),
 .c1( Gate2 ),
 .b( Gate2 )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M14 ( 
 .D( Drain4 ),
 .G( net9 ),
 .S( net10 ),
 .B( Vinj )
);


cap_var_hvt
#(
.model ( cap_var_hvt ) ,
.W ( 0.5 ) ,
.L ( 0.5 ) ,
.VM ( 1 ) ,
.spiceprefix ( X )
)
C10 ( 
 .c0( net9 ),
 .c1( Vtun ),
 .b( Vtun )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M15 ( 
 .D( net10 ),
 .G( ColSel2 ),
 .S( Vinj ),
 .B( Vinj )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M16 ( 
 .D( Row3 ),
 .G( net11 ),
 .S( Col2 ),
 .B( Vinj )
);


cap_var_hvt
#(
.model ( cap_var_hvt ) ,
.W ( 0.5 ) ,
.L ( 0.5 ) ,
.VM ( 1 ) ,
.spiceprefix ( X )
)
C11 ( 
 .c0( net11 ),
 .c1( Gate2 ),
 .b( Gate2 )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M17 ( 
 .D( Drain3 ),
 .G( net11 ),
 .S( net12 ),
 .B( Vinj )
);


cap_var_hvt
#(
.model ( cap_var_hvt ) ,
.W ( 0.5 ) ,
.L ( 0.5 ) ,
.VM ( 1 ) ,
.spiceprefix ( X )
)
C12 ( 
 .c0( net11 ),
 .c1( Vtun ),
 .b( Vtun )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M18 ( 
 .D( net12 ),
 .G( ColSel2 ),
 .S( Vinj ),
 .B( Vinj )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M19 ( 
 .D( Row2 ),
 .G( net13 ),
 .S( Col2 ),
 .B( Vinj )
);


cap_var_hvt
#(
.model ( cap_var_hvt ) ,
.W ( 0.5 ) ,
.L ( 0.5 ) ,
.VM ( 1 ) ,
.spiceprefix ( X )
)
C13 ( 
 .c0( net13 ),
 .c1( Gate2 ),
 .b( Gate2 )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M20 ( 
 .D( Drain2 ),
 .G( net13 ),
 .S( net14 ),
 .B( Vinj )
);


cap_var_hvt
#(
.model ( cap_var_hvt ) ,
.W ( 0.5 ) ,
.L ( 0.5 ) ,
.VM ( 1 ) ,
.spiceprefix ( X )
)
C14 ( 
 .c0( net13 ),
 .c1( Vtun ),
 .b( Vtun )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M21 ( 
 .D( net14 ),
 .G( ColSel2 ),
 .S( Vinj ),
 .B( Vinj )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M22 ( 
 .D( Row1 ),
 .G( net15 ),
 .S( Col2 ),
 .B( Vinj )
);


cap_var_hvt
#(
.model ( cap_var_hvt ) ,
.W ( 0.5 ) ,
.L ( 0.5 ) ,
.VM ( 1 ) ,
.spiceprefix ( X )
)
C15 ( 
 .c0( net15 ),
 .c1( Gate2 ),
 .b( Gate2 )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M23 ( 
 .D( Drain1 ),
 .G( net15 ),
 .S( net16 ),
 .B( Vinj )
);


cap_var_hvt
#(
.model ( cap_var_hvt ) ,
.W ( 0.5 ) ,
.L ( 0.5 ) ,
.VM ( 1 ) ,
.spiceprefix ( X )
)
C16 ( 
 .c0( net15 ),
 .c1( Vtun ),
 .b( Vtun )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M24 ( 
 .D( net16 ),
 .G( ColSel2 ),
 .S( Vinj ),
 .B( Vinj )
);

endmodule

// expanding   symbol:  drainSelect01.sym # of pins=10
// sym_path: /home/ubuntu/.xschem/xschem_library/xschem_sky130/drainSelect01.sym
// sch_path: /home/ubuntu/.xschem/xschem_library/xschem_sky130/drainSelect01.sch
module drainSelect01 (
  input wire Vinj,
  inout wire SelectDrain,
  input wire Select1,
  inout wire Drain1,
  input wire Select2,
  inout wire Drain2,
  input wire Select3,
  inout wire Drain3,
  input wire Select4,
  inout wire Drain4
);

wire net4  ;
wire net1  ;
wire net2  ;
wire net3  ;
wire GND  ;


nfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( nfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M15 ( 
 .S( net1 ),
 .G( Select1 ),
 .S( GND ),
 .B( GND )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M17 ( 
 .D( Drain1 ),
 .G( Select1 ),
 .S( SelectDrain ),
 .B( Vinj )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M30 ( 
 .D( Vinj ),
 .G( net1 ),
 .S( Drain1 ),
 .B( Vinj )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M31 ( 
 .D( net1 ),
 .G( Select1 ),
 .S( Vinj ),
 .B( Vinj )
);


nfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( nfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M35 ( 
 .S( SelectDrain ),
 .G( net1 ),
 .S( Drain1 ),
 .B( GND )
);


nfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( nfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M1 ( 
 .S( net2 ),
 .G( Select2 ),
 .S( GND ),
 .B( GND )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M2 ( 
 .D( Drain2 ),
 .G( Select2 ),
 .S( SelectDrain ),
 .B( Vinj )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M3 ( 
 .D( Vinj ),
 .G( net2 ),
 .S( Drain2 ),
 .B( Vinj )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M4 ( 
 .D( net2 ),
 .G( Select2 ),
 .S( Vinj ),
 .B( Vinj )
);


nfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( nfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M5 ( 
 .S( SelectDrain ),
 .G( net2 ),
 .S( Drain2 ),
 .B( GND )
);


nfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( nfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M6 ( 
 .S( net3 ),
 .G( Select3 ),
 .S( GND ),
 .B( GND )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M7 ( 
 .D( Drain3 ),
 .G( Select3 ),
 .S( SelectDrain ),
 .B( Vinj )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M8 ( 
 .D( Vinj ),
 .G( net3 ),
 .S( Drain3 ),
 .B( Vinj )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M9 ( 
 .D( net3 ),
 .G( Select3 ),
 .S( Vinj ),
 .B( Vinj )
);


nfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( nfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M10 ( 
 .S( SelectDrain ),
 .G( net3 ),
 .S( Drain3 ),
 .B( GND )
);


nfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( nfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M11 ( 
 .S( net4 ),
 .G( Select4 ),
 .S( GND ),
 .B( GND )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M12 ( 
 .D( Drain4 ),
 .G( Select4 ),
 .S( SelectDrain ),
 .B( Vinj )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M13 ( 
 .D( Vinj ),
 .G( net4 ),
 .S( Drain4 ),
 .B( Vinj )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M14 ( 
 .D( net4 ),
 .G( Select4 ),
 .S( Vinj ),
 .B( Vinj )
);


nfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( nfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M16 ( 
 .S( SelectDrain ),
 .G( net4 ),
 .S( Drain4 ),
 .B( GND )
);

endmodule

// expanding   symbol:  WTA4input.sym # of pins=18
// sym_path: /home/ubuntu/.xschem/xschem_library/xschem_sky130/WTA4input.sym
// sch_path: /home/ubuntu/.xschem/xschem_library/xschem_sky130/WTA4input.sch
module WTA4input (
  inout wire Vinj,
  inout wire Vtun,
  inout wire ColSel1,
  inout wire Vdd,
  inout wire Gate1,
  inout wire WTAMiddleNode,
  inout wire WTAOut1,
  input wire WTAIn1,
  input wire Drain1,
  inout wire WTAOut2,
  input wire WTAIn2,
  input wire Drain2,
  inout wire WTAOut3,
  input wire WTAIn3,
  input wire Drain3,
  inout wire WTAOut4,
  input wire WTAIn4,
  input wire Drain4
);

wire net4  ;
wire net1  ;
wire net5  ;
wire net2  ;
wire net8  ;
wire net6  ;
wire net3  ;
wire GND  ;
wire net7  ;


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M3 ( 
 .D( WTAOut4 ),
 .G( net1 ),
 .S( Vdd ),
 .B( Vinj )
);


cap_var_hvt
#(
.model ( cap_var_hvt ) ,
.W ( 0.5 ) ,
.L ( 0.5 ) ,
.VM ( 1 ) ,
.spiceprefix ( X )
)
C1 ( 
 .c0( net1 ),
 .c1( Gate1 ),
 .b( Gate1 )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M5 ( 
 .D( Drain4 ),
 .G( net1 ),
 .S( net2 ),
 .B( Vinj )
);


cap_var_hvt
#(
.model ( cap_var_hvt ) ,
.W ( 0.5 ) ,
.L ( 0.5 ) ,
.VM ( 1 ) ,
.spiceprefix ( X )
)
C2 ( 
 .c0( net1 ),
 .c1( Vtun ),
 .b( Vtun )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M1 ( 
 .D( net2 ),
 .G( ColSel1 ),
 .S( Vinj ),
 .B( Vinj )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M2 ( 
 .D( WTAOut3 ),
 .G( net3 ),
 .S( Vdd ),
 .B( Vinj )
);


cap_var_hvt
#(
.model ( cap_var_hvt ) ,
.W ( 0.5 ) ,
.L ( 0.5 ) ,
.VM ( 1 ) ,
.spiceprefix ( X )
)
C3 ( 
 .c0( net3 ),
 .c1( Gate1 ),
 .b( Gate1 )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M4 ( 
 .D( Drain3 ),
 .G( net3 ),
 .S( net4 ),
 .B( Vinj )
);


cap_var_hvt
#(
.model ( cap_var_hvt ) ,
.W ( 0.5 ) ,
.L ( 0.5 ) ,
.VM ( 1 ) ,
.spiceprefix ( X )
)
C4 ( 
 .c0( net3 ),
 .c1( Vtun ),
 .b( Vtun )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M6 ( 
 .D( net4 ),
 .G( ColSel1 ),
 .S( Vinj ),
 .B( Vinj )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M7 ( 
 .D( WTAOut2 ),
 .G( net5 ),
 .S( Vdd ),
 .B( Vinj )
);


cap_var_hvt
#(
.model ( cap_var_hvt ) ,
.W ( 0.5 ) ,
.L ( 0.5 ) ,
.VM ( 1 ) ,
.spiceprefix ( X )
)
C5 ( 
 .c0( net5 ),
 .c1( Gate1 ),
 .b( Gate1 )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M8 ( 
 .D( Drain2 ),
 .G( net5 ),
 .S( net6 ),
 .B( Vinj )
);


cap_var_hvt
#(
.model ( cap_var_hvt ) ,
.W ( 0.5 ) ,
.L ( 0.5 ) ,
.VM ( 1 ) ,
.spiceprefix ( X )
)
C6 ( 
 .c0( net5 ),
 .c1( Vtun ),
 .b( Vtun )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M9 ( 
 .D( net6 ),
 .G( ColSel1 ),
 .S( Vinj ),
 .B( Vinj )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M10 ( 
 .D( WTAOut1 ),
 .G( net7 ),
 .S( Vdd ),
 .B( Vinj )
);


cap_var_hvt
#(
.model ( cap_var_hvt ) ,
.W ( 0.5 ) ,
.L ( 0.5 ) ,
.VM ( 1 ) ,
.spiceprefix ( X )
)
C7 ( 
 .c0( net7 ),
 .c1( Gate1 ),
 .b( Gate1 )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M11 ( 
 .D( Drain1 ),
 .G( net7 ),
 .S( net8 ),
 .B( Vinj )
);


cap_var_hvt
#(
.model ( cap_var_hvt ) ,
.W ( 0.5 ) ,
.L ( 0.5 ) ,
.VM ( 1 ) ,
.spiceprefix ( X )
)
C8 ( 
 .c0( net7 ),
 .c1( Vtun ),
 .b( Vtun )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M12 ( 
 .D( net8 ),
 .G( ColSel1 ),
 .S( Vinj ),
 .B( Vinj )
);


nfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( nfet_01v8 ) ,
.spiceprefix ( X )
)
M13 ( 
 .D( WTAOut1 ),
 .G( WTAIn1 ),
 .S( WTAMiddleNode ),
 .B( GND )
);


nfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( nfet_01v8 ) ,
.spiceprefix ( X )
)
M14 ( 
 .D( WTAIn1 ),
 .G( WTAMiddleNode ),
 .S( GND ),
 .B( GND )
);


nfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( nfet_01v8 ) ,
.spiceprefix ( X )
)
M15 ( 
 .D( WTAOut2 ),
 .G( WTAIn2 ),
 .S( WTAMiddleNode ),
 .B( GND )
);


nfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( nfet_01v8 ) ,
.spiceprefix ( X )
)
M16 ( 
 .D( WTAIn2 ),
 .G( WTAMiddleNode ),
 .S( GND ),
 .B( GND )
);


nfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( nfet_01v8 ) ,
.spiceprefix ( X )
)
M17 ( 
 .D( WTAOut3 ),
 .G( WTAIn3 ),
 .S( WTAMiddleNode ),
 .B( GND )
);


nfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( nfet_01v8 ) ,
.spiceprefix ( X )
)
M18 ( 
 .D( WTAIn3 ),
 .G( WTAMiddleNode ),
 .S( GND ),
 .B( GND )
);


nfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( nfet_01v8 ) ,
.spiceprefix ( X )
)
M19 ( 
 .D( WTAOut4 ),
 .G( WTAIn4 ),
 .S( WTAMiddleNode ),
 .B( GND )
);


nfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( nfet_01v8 ) ,
.spiceprefix ( X )
)
M20 ( 
 .D( WTAIn4 ),
 .G( WTAMiddleNode ),
 .S( GND ),
 .B( GND )
);

endmodule

// expanding   symbol:  TA2Cell_1FG_Strong.sym # of pins=17
// sym_path: /home/ubuntu/.xschem/xschem_library/xschem_sky130/TA2Cell_1FG_Strong.sym
// sch_path: /home/ubuntu/.xschem/xschem_library/xschem_sky130/TA2Cell_1FG_Strong.sch
module TA2Cell_1FG_Strong (
  inout wire Vinj,
  inout wire Vtun,
  inout wire ColSel1,
  inout wire Vdd,
  inout wire Gate1,
  inout wire ColSel2,
  inout wire Output1,
  input wire Drain1,
  inout wire Vin22,
  inout wire Output2,
  inout wire Vin21,
  input wire Drain2,
  inout wire Vin11,
  inout wire Vin12,
  input wire Prog,
  input wire Run,
  inout wire Gate2
);

wire net4  ;
wire net16  ;
wire net18  ;
wire net1  ;
wire net11  ;
wire net5  ;
wire net15  ;
wire net2  ;
wire net8  ;
wire net10  ;
wire net13  ;
wire net6  ;
wire net14  ;
wire net3  ;
wire net9  ;
wire net17  ;
wire GND  ;
wire net12  ;
wire net7  ;


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M3 ( 
 .D( net4 ),
 .G( net1 ),
 .S( net8 ),
 .B( Vinj )
);


cap_var_hvt
#(
.model ( cap_var_hvt ) ,
.W ( 0.5 ) ,
.L ( 0.5 ) ,
.VM ( 1 ) ,
.spiceprefix ( X )
)
C1 ( 
 .c0( net1 ),
 .c1( net2 ),
 .b( net2 )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M5 ( 
 .D( Drain2 ),
 .G( net1 ),
 .S( net3 ),
 .B( Vinj )
);


cap_var_hvt
#(
.model ( cap_var_hvt ) ,
.W ( 0.5 ) ,
.L ( 0.5 ) ,
.VM ( 1 ) ,
.spiceprefix ( X )
)
C2 ( 
 .c0( net1 ),
 .c1( Vtun ),
 .b( Vtun )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M1 ( 
 .D( net3 ),
 .G( ColSel2 ),
 .S( Vinj ),
 .B( Vinj )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M2 ( 
 .D( net8 ),
 .G( net5 ),
 .S( net9 ),
 .B( Vinj )
);


cap_var_hvt
#(
.model ( cap_var_hvt ) ,
.W ( 0.5 ) ,
.L ( 0.5 ) ,
.VM ( 1 ) ,
.spiceprefix ( X )
)
C3 ( 
 .c0( net5 ),
 .c1( net6 ),
 .b( net6 )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M4 ( 
 .D( Drain1 ),
 .G( net5 ),
 .S( net7 ),
 .B( Vinj )
);


cap_var_hvt
#(
.model ( cap_var_hvt ) ,
.W ( 0.5 ) ,
.L ( 0.5 ) ,
.VM ( 1 ) ,
.spiceprefix ( X )
)
C4 ( 
 .c0( net5 ),
 .c1( Vtun ),
 .b( Vtun )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M6 ( 
 .D( net7 ),
 .G( ColSel2 ),
 .S( Vinj ),
 .B( Vinj )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M7 ( 
 .D( net12 ),
 .G( net10 ),
 .S( Vdd ),
 .B( Vinj )
);


cap_var_hvt
#(
.model ( cap_var_hvt ) ,
.W ( 0.5 ) ,
.L ( 0.5 ) ,
.VM ( 1 ) ,
.spiceprefix ( X )
)
C5 ( 
 .c0( net10 ),
 .c1( Gate1 ),
 .b( Gate1 )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M8 ( 
 .D( Drain2 ),
 .G( net10 ),
 .S( net11 ),
 .B( Vinj )
);


cap_var_hvt
#(
.model ( cap_var_hvt ) ,
.W ( 0.5 ) ,
.L ( 0.5 ) ,
.VM ( 1 ) ,
.spiceprefix ( X )
)
C6 ( 
 .c0( net10 ),
 .c1( Vtun ),
 .b( Vtun )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M9 ( 
 .D( net11 ),
 .G( ColSel1 ),
 .S( Vinj ),
 .B( Vinj )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M10 ( 
 .D( net8 ),
 .G( net13 ),
 .S( Vdd ),
 .B( Vinj )
);


cap_var_hvt
#(
.model ( cap_var_hvt ) ,
.W ( 0.5 ) ,
.L ( 0.5 ) ,
.VM ( 1 ) ,
.spiceprefix ( X )
)
C7 ( 
 .c0( net13 ),
 .c1( Gate1 ),
 .b( Gate1 )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M11 ( 
 .D( Drain1 ),
 .G( net13 ),
 .S( net14 ),
 .B( Vinj )
);


cap_var_hvt
#(
.model ( cap_var_hvt ) ,
.W ( 0.5 ) ,
.L ( 0.5 ) ,
.VM ( 1 ) ,
.spiceprefix ( X )
)
C8 ( 
 .c0( net13 ),
 .c1( Vtun ),
 .b( Vtun )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M12 ( 
 .D( net14 ),
 .G( ColSel1 ),
 .S( Vinj ),
 .B( Vinj )
);


nfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( nfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M15 ( 
 .S( net6 ),
 .G( Prog ),
 .S( Gate2 ),
 .B( GND )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M17 ( 
 .D( net2 ),
 .G( Prog ),
 .S( Vin12 ),
 .B( Vinj )
);


pfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_01v8 ) ,
.spiceprefix ( X )
)
M18 ( 
 .D( Output1 ),
 .G( net15 ),
 .S( Vdd ),
 .B( Vdd )
);


pfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_01v8 ) ,
.spiceprefix ( X )
)
M19 ( 
 .D( net15 ),
 .G( net15 ),
 .S( Vdd ),
 .B( Vdd )
);


nfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( nfet_01v8 ) ,
.spiceprefix ( X )
)
M20 ( 
 .D( Output1 ),
 .G( net9 ),
 .S( GND ),
 .B( GND )
);


nfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( nfet_01v8 ) ,
.spiceprefix ( X )
)
M21 ( 
 .D( net15 ),
 .G( net4 ),
 .S( GND ),
 .B( GND )
);


nfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( nfet_01v8 ) ,
.spiceprefix ( X )
)
M22 ( 
 .D( net4 ),
 .G( net4 ),
 .S( GND ),
 .B( GND )
);


nfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( nfet_01v8 ) ,
.spiceprefix ( X )
)
M23 ( 
 .D( net9 ),
 .G( net9 ),
 .S( GND ),
 .B( GND )
);


pfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_01v8 ) ,
.spiceprefix ( X )
)
M24 ( 
 .D( Output2 ),
 .G( net16 ),
 .S( Vdd ),
 .B( Vdd )
);


pfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_01v8 ) ,
.spiceprefix ( X )
)
M25 ( 
 .D( net16 ),
 .G( net16 ),
 .S( Vdd ),
 .B( Vdd )
);


nfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( nfet_01v8 ) ,
.spiceprefix ( X )
)
M26 ( 
 .D( Output2 ),
 .G( net17 ),
 .S( GND ),
 .B( GND )
);


nfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( nfet_01v8 ) ,
.spiceprefix ( X )
)
M27 ( 
 .D( net16 ),
 .G( net18 ),
 .S( GND ),
 .B( GND )
);


nfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( nfet_01v8 ) ,
.spiceprefix ( X )
)
M28 ( 
 .D( net18 ),
 .G( net18 ),
 .S( GND ),
 .B( GND )
);


nfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( nfet_01v8 ) ,
.spiceprefix ( X )
)
M29 ( 
 .D( net17 ),
 .G( net17 ),
 .S( GND ),
 .B( GND )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M30 ( 
 .D( Gate2 ),
 .G( Run ),
 .S( net2 ),
 .B( Vinj )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M31 ( 
 .D( net6 ),
 .G( Prog ),
 .S( Vin11 ),
 .B( Vinj )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M32 ( 
 .D( Gate2 ),
 .G( Run ),
 .S( net6 ),
 .B( Vinj )
);


nfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( nfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M33 ( 
 .S( Vin11 ),
 .G( Run ),
 .S( net6 ),
 .B( GND )
);


nfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( nfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M34 ( 
 .S( net2 ),
 .G( Prog ),
 .S( Gate2 ),
 .B( GND )
);


nfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( nfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M35 ( 
 .S( Vin12 ),
 .G( Run ),
 .S( net2 ),
 .B( GND )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M13 ( 
 .D( net18 ),
 .G( Vin21 ),
 .S( net12 ),
 .B( Vinj )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M14 ( 
 .D( net17 ),
 .G( Vin22 ),
 .S( net12 ),
 .B( Vinj )
);

endmodule

// expanding   symbol:  TA2Cell_1FG.sym # of pins=15
// sym_path: /home/ubuntu/.xschem/xschem_library/xschem_sky130/TA2Cell_1FG.sym
// sch_path: /home/ubuntu/.xschem/xschem_library/xschem_sky130/TA2Cell_1FG.sch
module TA2Cell_1FG (
  inout wire Vinj,
  inout wire Vtun,
  inout wire ColSel1,
  inout wire Vdd,
  inout wire Gate1,
  inout wire Gate2,
  inout wire ColSel2,
  inout wire Vin11,
  inout wire Output1,
  input wire Drain1,
  inout wire Vin12,
  inout wire Vin22,
  inout wire Output2,
  inout wire Vin21,
  input wire Drain2
);

wire net4  ;
wire net16  ;
wire net1  ;
wire net11  ;
wire net5  ;
wire net15  ;
wire net2  ;
wire net8  ;
wire net10  ;
wire net13  ;
wire net6  ;
wire net14  ;
wire net3  ;
wire net9  ;
wire net17  ;
wire GND  ;
wire net12  ;
wire net7  ;


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M3 ( 
 .D( net3 ),
 .G( net1 ),
 .S( net6 ),
 .B( Vinj )
);


cap_var_hvt
#(
.model ( cap_var_hvt ) ,
.W ( 0.5 ) ,
.L ( 0.5 ) ,
.VM ( 1 ) ,
.spiceprefix ( X )
)
C1 ( 
 .c0( net1 ),
 .c1( Gate2 ),
 .b( Gate2 )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M5 ( 
 .D( Drain2 ),
 .G( net1 ),
 .S( net2 ),
 .B( Vinj )
);


cap_var_hvt
#(
.model ( cap_var_hvt ) ,
.W ( 0.5 ) ,
.L ( 0.5 ) ,
.VM ( 1 ) ,
.spiceprefix ( X )
)
C2 ( 
 .c0( net1 ),
 .c1( Vtun ),
 .b( Vtun )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M1 ( 
 .D( net2 ),
 .G( ColSel2 ),
 .S( Vinj ),
 .B( Vinj )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M2 ( 
 .D( net6 ),
 .G( net4 ),
 .S( net7 ),
 .B( Vinj )
);


cap_var_hvt
#(
.model ( cap_var_hvt ) ,
.W ( 0.5 ) ,
.L ( 0.5 ) ,
.VM ( 1 ) ,
.spiceprefix ( X )
)
C3 ( 
 .c0( net4 ),
 .c1( Gate2 ),
 .b( Gate2 )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M4 ( 
 .D( Drain1 ),
 .G( net4 ),
 .S( net5 ),
 .B( Vinj )
);


cap_var_hvt
#(
.model ( cap_var_hvt ) ,
.W ( 0.5 ) ,
.L ( 0.5 ) ,
.VM ( 1 ) ,
.spiceprefix ( X )
)
C4 ( 
 .c0( net4 ),
 .c1( Vtun ),
 .b( Vtun )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M6 ( 
 .D( net5 ),
 .G( ColSel2 ),
 .S( Vinj ),
 .B( Vinj )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M7 ( 
 .D( net10 ),
 .G( net8 ),
 .S( Vdd ),
 .B( Vinj )
);


cap_var_hvt
#(
.model ( cap_var_hvt ) ,
.W ( 0.5 ) ,
.L ( 0.5 ) ,
.VM ( 1 ) ,
.spiceprefix ( X )
)
C5 ( 
 .c0( net8 ),
 .c1( Gate1 ),
 .b( Gate1 )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M8 ( 
 .D( Drain2 ),
 .G( net8 ),
 .S( net9 ),
 .B( Vinj )
);


cap_var_hvt
#(
.model ( cap_var_hvt ) ,
.W ( 0.5 ) ,
.L ( 0.5 ) ,
.VM ( 1 ) ,
.spiceprefix ( X )
)
C6 ( 
 .c0( net8 ),
 .c1( Vtun ),
 .b( Vtun )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M9 ( 
 .D( net9 ),
 .G( ColSel1 ),
 .S( Vinj ),
 .B( Vinj )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M10 ( 
 .D( net6 ),
 .G( net11 ),
 .S( Vdd ),
 .B( Vinj )
);


cap_var_hvt
#(
.model ( cap_var_hvt ) ,
.W ( 0.5 ) ,
.L ( 0.5 ) ,
.VM ( 1 ) ,
.spiceprefix ( X )
)
C7 ( 
 .c0( net11 ),
 .c1( Gate1 ),
 .b( Gate1 )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M11 ( 
 .D( Drain1 ),
 .G( net11 ),
 .S( net12 ),
 .B( Vinj )
);


cap_var_hvt
#(
.model ( cap_var_hvt ) ,
.W ( 0.5 ) ,
.L ( 0.5 ) ,
.VM ( 1 ) ,
.spiceprefix ( X )
)
C8 ( 
 .c0( net11 ),
 .c1( Vtun ),
 .b( Vtun )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M12 ( 
 .D( net12 ),
 .G( ColSel1 ),
 .S( Vinj ),
 .B( Vinj )
);


pfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_01v8 ) ,
.spiceprefix ( X )
)
M18 ( 
 .D( Output1 ),
 .G( net13 ),
 .S( Vdd ),
 .B( Vdd )
);


pfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_01v8 ) ,
.spiceprefix ( X )
)
M19 ( 
 .D( net13 ),
 .G( net13 ),
 .S( Vdd ),
 .B( Vdd )
);


nfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( nfet_01v8 ) ,
.spiceprefix ( X )
)
M20 ( 
 .D( Output1 ),
 .G( net7 ),
 .S( GND ),
 .B( GND )
);


nfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( nfet_01v8 ) ,
.spiceprefix ( X )
)
M21 ( 
 .D( net13 ),
 .G( net3 ),
 .S( GND ),
 .B( GND )
);


nfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( nfet_01v8 ) ,
.spiceprefix ( X )
)
M22 ( 
 .D( net3 ),
 .G( net3 ),
 .S( GND ),
 .B( GND )
);


nfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( nfet_01v8 ) ,
.spiceprefix ( X )
)
M23 ( 
 .D( net7 ),
 .G( net7 ),
 .S( GND ),
 .B( GND )
);


pfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_01v8 ) ,
.spiceprefix ( X )
)
M24 ( 
 .D( Output2 ),
 .G( net14 ),
 .S( Vdd ),
 .B( Vdd )
);


pfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_01v8 ) ,
.spiceprefix ( X )
)
M25 ( 
 .D( net14 ),
 .G( net14 ),
 .S( Vdd ),
 .B( Vdd )
);


nfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( nfet_01v8 ) ,
.spiceprefix ( X )
)
M26 ( 
 .D( Output2 ),
 .G( net15 ),
 .S( GND ),
 .B( GND )
);


nfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( nfet_01v8 ) ,
.spiceprefix ( X )
)
M27 ( 
 .D( net14 ),
 .G( net16 ),
 .S( GND ),
 .B( GND )
);


nfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( nfet_01v8 ) ,
.spiceprefix ( X )
)
M28 ( 
 .D( net16 ),
 .G( net16 ),
 .S( GND ),
 .B( GND )
);


nfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( nfet_01v8 ) ,
.spiceprefix ( X )
)
M29 ( 
 .D( net15 ),
 .G( net15 ),
 .S( GND ),
 .B( GND )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M13 ( 
 .D( net16 ),
 .G( Vin21 ),
 .S( net10 ),
 .B( Vinj )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M14 ( 
 .D( net15 ),
 .G( Vin22 ),
 .S( net10 ),
 .B( Vinj )
);

endmodule

// expanding   symbol:  Tgate4Single01.sym # of pins=13
// sym_path: /home/ubuntu/.xschem/xschem_library/xschem_sky130/Tgate4Single01.sym
// sch_path: /home/ubuntu/.xschem/xschem_library/xschem_sky130/Tgate4Single01.sch
module Tgate4Single01 (
  inout wire Vdd,
  inout wire Out1,
  input wire Select1,
  inout wire Node1_1,
  inout wire Out2,
  input wire Select2,
  inout wire Node1_2,
  inout wire Out3,
  input wire Select3,
  inout wire Node1_3,
  inout wire Out4,
  input wire Select4,
  inout wire Node1_4
);

wire net4  ;
wire net1  ;
wire net2  ;
wire net3  ;
wire GND  ;


pfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_01v8 ) ,
.spiceprefix ( X )
)
M1 ( 
 .D( Node1_2 ),
 .G( net1 ),
 .S( Out2 ),
 .B( Vdd )
);


pfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_01v8 ) ,
.spiceprefix ( X )
)
M2 ( 
 .D( net1 ),
 .G( Select2 ),
 .S( Vdd ),
 .B( Vdd )
);


nfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( nfet_01v8 ) ,
.spiceprefix ( X )
)
M3 ( 
 .D( net1 ),
 .G( Select2 ),
 .S( GND ),
 .B( GND )
);


nfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( nfet_01v8 ) ,
.spiceprefix ( X )
)
M4 ( 
 .D( Out2 ),
 .G( Select2 ),
 .S( Node1_2 ),
 .B( GND )
);


pfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_01v8 ) ,
.spiceprefix ( X )
)
M7 ( 
 .D( Node1_1 ),
 .G( net2 ),
 .S( Out1 ),
 .B( Vdd )
);


pfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_01v8 ) ,
.spiceprefix ( X )
)
M8 ( 
 .D( net2 ),
 .G( Select1 ),
 .S( Vdd ),
 .B( Vdd )
);


nfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( nfet_01v8 ) ,
.spiceprefix ( X )
)
M9 ( 
 .D( net2 ),
 .G( Select1 ),
 .S( GND ),
 .B( GND )
);


nfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( nfet_01v8 ) ,
.spiceprefix ( X )
)
M10 ( 
 .D( Out1 ),
 .G( Select1 ),
 .S( Node1_1 ),
 .B( GND )
);


pfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_01v8 ) ,
.spiceprefix ( X )
)
M13 ( 
 .D( Node1_4 ),
 .G( net3 ),
 .S( Out4 ),
 .B( Vdd )
);


pfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_01v8 ) ,
.spiceprefix ( X )
)
M14 ( 
 .D( net3 ),
 .G( Select4 ),
 .S( Vdd ),
 .B( Vdd )
);


nfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( nfet_01v8 ) ,
.spiceprefix ( X )
)
M15 ( 
 .D( net3 ),
 .G( Select4 ),
 .S( GND ),
 .B( GND )
);


nfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( nfet_01v8 ) ,
.spiceprefix ( X )
)
M16 ( 
 .D( Out4 ),
 .G( Select4 ),
 .S( Node1_4 ),
 .B( GND )
);


pfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_01v8 ) ,
.spiceprefix ( X )
)
M20 ( 
 .D( Node1_3 ),
 .G( net4 ),
 .S( Out3 ),
 .B( Vdd )
);


pfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_01v8 ) ,
.spiceprefix ( X )
)
M22 ( 
 .D( net4 ),
 .G( Select3 ),
 .S( Vdd ),
 .B( Vdd )
);


nfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( nfet_01v8 ) ,
.spiceprefix ( X )
)
M23 ( 
 .D( net4 ),
 .G( Select3 ),
 .S( GND ),
 .B( GND )
);


nfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( nfet_01v8 ) ,
.spiceprefix ( X )
)
M24 ( 
 .D( Out3 ),
 .G( Select3 ),
 .S( Node1_3 ),
 .B( GND )
);

endmodule

// expanding   symbol:  Trans2med.sym # of pins=13
// sym_path: /home/ubuntu/.xschem/xschem_library/xschem_sky130/Trans2med.sym
// sch_path: /home/ubuntu/.xschem/xschem_library/xschem_sky130/Trans2med.sch
module Trans2med (
  inout wire Drain1p,
  inout wire Drain1n,
  inout wire Well,
  input wire Gate1p,
  input wire Gate1n,
  inout wire Source1p,
  inout wire Source1n,
  inout wire Drain2n,
  inout wire Drain2p,
  input wire Gate2p,
  input wire Gate2n,
  inout wire Source2n,
  inout wire Source2p
);

wire GND  ;


pfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_01v8 ) ,
.spiceprefix ( X )
)
M1 ( 
 .D( Source1p ),
 .G( Gate1p ),
 .S( Drain1p ),
 .B( Well )
);


nfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( nfet_01v8 ) ,
.spiceprefix ( X )
)
M3 ( 
 .D( Drain1n ),
 .G( Gate1n ),
 .S( Source1n ),
 .B( GND )
);


pfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_01v8 ) ,
.spiceprefix ( X )
)
M7 ( 
 .D( Source2p ),
 .G( Gate2p ),
 .S( Drain2p ),
 .B( Well )
);


nfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( nfet_01v8 ) ,
.spiceprefix ( X )
)
M10 ( 
 .D( Drain2n ),
 .G( Gate2n ),
 .S( Source2n ),
 .B( GND )
);

endmodule

// expanding   symbol:  Trans4small.sym # of pins=19
// sym_path: /home/ubuntu/.xschem/xschem_library/xschem_sky130/Trans4small.sym
// sch_path: /home/ubuntu/.xschem/xschem_library/xschem_sky130/Trans4small.sch
module Trans4small (
  inout wire Drain1p,
  inout wire Drain1n,
  input wire Gate1p,
  inout wire Well,
  input wire Gate1n,
  inout wire Source1p,
  inout wire Source1n,
  inout wire Drain2p,
  inout wire Drain2n,
  input wire Gate2n,
  input wire Gate2p,
  inout wire Source2p,
  inout wire Source2n,
  inout wire Drain3p,
  inout wire Drain3n,
  input wire Gate3p,
  input wire Gate3n,
  inout wire Source3p,
  inout wire Source3n
);

wire GND  ;


pfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_01v8 ) ,
.spiceprefix ( X )
)
M1 ( 
 .D( Source1p ),
 .G( Gate1p ),
 .S( Drain1p ),
 .B( Well )
);


pfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_01v8 ) ,
.spiceprefix ( X )
)
M2 ( 
 .D( Source3p ),
 .G( Gate3p ),
 .S( Drain3p ),
 .B( Well )
);


nfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( nfet_01v8 ) ,
.spiceprefix ( X )
)
M3 ( 
 .D( Drain1n ),
 .G( Gate1n ),
 .S( Source1n ),
 .B( GND )
);


nfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( nfet_01v8 ) ,
.spiceprefix ( X )
)
M4 ( 
 .D( Drain3n ),
 .G( Gate3n ),
 .S( Source3n ),
 .B( GND )
);


pfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_01v8 ) ,
.spiceprefix ( X )
)
M7 ( 
 .D( Source2p ),
 .G( Gate2p ),
 .S( Drain2p ),
 .B( Well )
);


nfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( nfet_01v8 ) ,
.spiceprefix ( X )
)
M10 ( 
 .D( Drain2n ),
 .G( Gate2n ),
 .S( Source2n ),
 .B( GND )
);

endmodule

// expanding   symbol:  nFETLarge.sym # of pins=3
// sym_path: /home/ubuntu/.xschem/xschem_library/xschem_sky130/nFETLarge.sym
// sch_path: /home/ubuntu/.xschem/xschem_library/xschem_sky130/nFETLarge.sch
module nFETLarge (
  inout wire Drain1n,
  input wire Gate1n,
  inout wire Source1n
);

wire GND  ;


nfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( nfet_01v8 ) ,
.spiceprefix ( X )
)
M3 ( 
 .D( Drain1n ),
 .G( Gate1n ),
 .S( Source1n ),
 .B( GND )
);

endmodule

// expanding   symbol:  pFETLarge.sym # of pins=4
// sym_path: /home/ubuntu/.xschem/xschem_library/xschem_sky130/pFETLarge.sym
// sch_path: /home/ubuntu/.xschem/xschem_library/xschem_sky130/pFETLarge.sch
module pFETLarge (
  inout wire Drain1p,
  input wire Gate1p,
  inout wire Well,
  inout wire Source1p
);


pfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_01v8 ) ,
.spiceprefix ( X )
)
M1 ( 
 .D( Source1p ),
 .G( Gate1p ),
 .S( Drain1p ),
 .B( Well )
);

endmodule

// expanding   symbol:  FGcharacterization01.sym # of pins=12
// sym_path: /home/ubuntu/.xschem/xschem_library/xschem_sky130/FGcharacterization01.sym
// sch_path: /home/ubuntu/.xschem/xschem_library/xschem_sky130/FGcharacterization01.sch
module FGcharacterization01 (
  inout wire Vinj,
  input wire Drain1,
  input wire Vref,
  inout wire Source1,
  inout wire Output,
  inout wire Vbias,
  inout wire Vtun,
  input wire Gate5,
  input wire Gate4,
  input wire Gate2,
  input wire Gate3,
  inout wire Gate1
);

wire net4  ;
wire net1  ;
wire net5  ;
wire net2  ;
wire net3  ;
wire GND  ;


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M3 ( 
 .D( net5 ),
 .G( Vbias ),
 .S( Vinj ),
 .B( Vinj )
);


cap_var_hvt
#(
.model ( cap_var_hvt ) ,
.W ( 0.5 ) ,
.L ( 0.5 ) ,
.VM ( 1 ) ,
.spiceprefix ( X )
)
C1 ( 
 .c0( net1 ),
 .c1( Gate2 ),
 .b( Gate2 )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M5 ( 
 .D( net4 ),
 .G( Vref ),
 .S( net5 ),
 .B( Vinj )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M1 ( 
 .D( net3 ),
 .G( net1 ),
 .S( net5 ),
 .B( Vinj )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M2 ( 
 .D( Source1 ),
 .G( net1 ),
 .S( Drain1 ),
 .B( Vinj )
);


cap_var_hvt
#(
.model ( cap_var_hvt ) ,
.W ( 0.5 ) ,
.L ( 0.5 ) ,
.VM ( 1 ) ,
.spiceprefix ( X )
)
C3 ( 
 .c0( net1 ),
 .c1( Gate1 ),
 .b( Gate1 )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M4 ( 
 .D( net2 ),
 .G( net2 ),
 .S( Vinj ),
 .B( Vinj )
);


cap_var_hvt
#(
.model ( cap_var_hvt ) ,
.W ( 0.5 ) ,
.L ( 0.5 ) ,
.VM ( 1 ) ,
.spiceprefix ( X )
)
C4 ( 
 .c0( net1 ),
 .c1( Vtun ),
 .b( Vtun )
);


pfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M31 ( 
 .D( Output ),
 .G( net2 ),
 .S( Vinj ),
 .B( Vinj )
);


nfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( nfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M34 ( 
 .S( Output ),
 .G( net3 ),
 .S( GND ),
 .B( GND )
);


nfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( nfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M35 ( 
 .S( net3 ),
 .G( net3 ),
 .S( GND ),
 .B( GND )
);


nfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( nfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M7 ( 
 .S( net2 ),
 .G( net4 ),
 .S( GND ),
 .B( GND )
);


nfet_g5v0d10v5
#(
.L ( 0.5 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( nfet_g5v0d10v5 ) ,
.spiceprefix ( X )
)
M8 ( 
 .S( net4 ),
 .G( net4 ),
 .S( GND ),
 .B( GND )
);

endmodule

// expanding   symbol:  DAC5bit01.sym # of pins=7
// sym_path: /home/ubuntu/.xschem/xschem_library/xschem_sky130/DAC5bit01.sym
// sch_path: /home/ubuntu/.xschem/xschem_library/xschem_sky130/DAC5bit01.sch
module DAC5bit01 (
  input wire A4,
  input wire A0,
  input wire A3,
  input wire A2,
  input wire A1,
  inout wire Vdd,
  inout wire Out
);


pfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_01v8 ) ,
.spiceprefix ( X )
)
M1 ( 
 .D( Out ),
 .G( A0 ),
 .S( Vdd ),
 .B( Vdd )
);


pfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_01v8 ) ,
.spiceprefix ( X )
)
M2 ( 
 .D( Out ),
 .G( A1 ),
 .S( Vdd ),
 .B( Vdd )
);


pfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_01v8 ) ,
.spiceprefix ( X )
)
M3 ( 
 .D( Vdd ),
 .G( A1 ),
 .S( Out ),
 .B( Vdd )
);


pfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_01v8 ) ,
.spiceprefix ( X )
)
M4 ( 
 .D( Out ),
 .G( A2 ),
 .S( Vdd ),
 .B( Vdd )
);


pfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_01v8 ) ,
.spiceprefix ( X )
)
M5 ( 
 .D( Vdd ),
 .G( A2 ),
 .S( Out ),
 .B( Vdd )
);


pfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_01v8 ) ,
.spiceprefix ( X )
)
M6 ( 
 .D( Out ),
 .G( A2 ),
 .S( Vdd ),
 .B( Vdd )
);


pfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_01v8 ) ,
.spiceprefix ( X )
)
M11 ( 
 .D( Vdd ),
 .G( A2 ),
 .S( Out ),
 .B( Vdd )
);


pfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_01v8 ) ,
.spiceprefix ( X )
)
M12 ( 
 .D( Out ),
 .G( A3 ),
 .S( Vdd ),
 .B( Vdd )
);


pfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_01v8 ) ,
.spiceprefix ( X )
)
M13 ( 
 .D( Vdd ),
 .G( A3 ),
 .S( Out ),
 .B( Vdd )
);


pfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_01v8 ) ,
.spiceprefix ( X )
)
M14 ( 
 .D( Out ),
 .G( A3 ),
 .S( Vdd ),
 .B( Vdd )
);


pfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_01v8 ) ,
.spiceprefix ( X )
)
M15 ( 
 .D( Vdd ),
 .G( A3 ),
 .S( Out ),
 .B( Vdd )
);


pfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_01v8 ) ,
.spiceprefix ( X )
)
M16 ( 
 .D( Out ),
 .G( A3 ),
 .S( Vdd ),
 .B( Vdd )
);


pfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_01v8 ) ,
.spiceprefix ( X )
)
M17 ( 
 .D( Vdd ),
 .G( A3 ),
 .S( Out ),
 .B( Vdd )
);


pfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_01v8 ) ,
.spiceprefix ( X )
)
M18 ( 
 .D( Out ),
 .G( A3 ),
 .S( Vdd ),
 .B( Vdd )
);


pfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_01v8 ) ,
.spiceprefix ( X )
)
M19 ( 
 .D( Vdd ),
 .G( A3 ),
 .S( Out ),
 .B( Vdd )
);


pfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_01v8 ) ,
.spiceprefix ( X )
)
M20 ( 
 .D( Out ),
 .G( A4 ),
 .S( Vdd ),
 .B( Vdd )
);


pfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_01v8 ) ,
.spiceprefix ( X )
)
M21 ( 
 .D( Vdd ),
 .G( A4 ),
 .S( Out ),
 .B( Vdd )
);


pfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_01v8 ) ,
.spiceprefix ( X )
)
M22 ( 
 .D( Out ),
 .G( A4 ),
 .S( Vdd ),
 .B( Vdd )
);


pfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_01v8 ) ,
.spiceprefix ( X )
)
M23 ( 
 .D( Vdd ),
 .G( A4 ),
 .S( Out ),
 .B( Vdd )
);


pfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_01v8 ) ,
.spiceprefix ( X )
)
M24 ( 
 .D( Out ),
 .G( A4 ),
 .S( Vdd ),
 .B( Vdd )
);


pfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_01v8 ) ,
.spiceprefix ( X )
)
M25 ( 
 .D( Vdd ),
 .G( A4 ),
 .S( Out ),
 .B( Vdd )
);


pfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_01v8 ) ,
.spiceprefix ( X )
)
M26 ( 
 .D( Out ),
 .G( A4 ),
 .S( Vdd ),
 .B( Vdd )
);


pfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_01v8 ) ,
.spiceprefix ( X )
)
M27 ( 
 .D( Vdd ),
 .G( A4 ),
 .S( Out ),
 .B( Vdd )
);


pfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_01v8 ) ,
.spiceprefix ( X )
)
M28 ( 
 .D( Out ),
 .G( A4 ),
 .S( Vdd ),
 .B( Vdd )
);


pfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_01v8 ) ,
.spiceprefix ( X )
)
M29 ( 
 .D( Vdd ),
 .G( A4 ),
 .S( Out ),
 .B( Vdd )
);


pfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_01v8 ) ,
.spiceprefix ( X )
)
M30 ( 
 .D( Out ),
 .G( A4 ),
 .S( Vdd ),
 .B( Vdd )
);


pfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_01v8 ) ,
.spiceprefix ( X )
)
M31 ( 
 .D( Vdd ),
 .G( A4 ),
 .S( Out ),
 .B( Vdd )
);


pfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_01v8 ) ,
.spiceprefix ( X )
)
M32 ( 
 .D( Out ),
 .G( A4 ),
 .S( Vdd ),
 .B( Vdd )
);


pfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_01v8 ) ,
.spiceprefix ( X )
)
M33 ( 
 .D( Vdd ),
 .G( A4 ),
 .S( Out ),
 .B( Vdd )
);


pfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_01v8 ) ,
.spiceprefix ( X )
)
M34 ( 
 .D( Out ),
 .G( A4 ),
 .S( Vdd ),
 .B( Vdd )
);


pfet_01v8
#(
.L ( 0.15 ) ,
.W ( 1 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.29 ) ,
.nrs ( "'0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_01v8 ) ,
.spiceprefix ( X )
)
M35 ( 
 .D( Vdd ),
 .G( A4 ),
 .S( Out ),
 .B( Vdd )
);

endmodule
