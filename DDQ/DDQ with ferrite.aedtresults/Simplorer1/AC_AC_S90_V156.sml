// 1;Simplorer1.sml
//*************************************************************************************************
//                                           SML Netlist File                                     
//                                   created by Ansys Twin Builder 2022.2                            
//                                                                                                
//*************************************************************************************************

SMLDEF MaxwellData7_19 
 { 
 
 PORT Electrical:Rx_in1_src; 
 PORT Electrical:Rx_in2_src; 
 PORT Electrical:Rx_in3_src; 
 PORT Electrical:Tx_in1_src; 
 PORT Electrical:Tx_in2_src; 
 PORT Electrical:Tx_in3_src; 
 PORT Electrical:Rx_in1_snk; 
 PORT Electrical:Rx_in2_snk; 
 PORT Electrical:Rx_in3_snk; 
 PORT Electrical:Tx_in1_snk; 
 PORT Electrical:Tx_in2_snk; 
 PORT Electrical:Tx_in3_snk;
 }

// begin toplevel circuit

INTERN EQU 
{
	f:=85000;
	R_load:=10;
	Cp:=1.94e-07;
	Cs:=9.9e-07;
} DST: SIM(Type:=SFML, Sequ:=DSN_VAR);
INTERN ESINE E_source N1:= net_13 , N2:= net_1 (FREQ:= f, TPERIO:=Tend + 1, AMPL:=311.126983722081, PHASE:=0, PERIO:=0, OFF:=0, TDELAY:=0, SPC:=0, AC_PHASE := 0, AC_MAG := 0.001);
INTERN C Cp N1:= net_11 , N2:= net_2 (C:=Cp);
INTERN C Cs N1:= net_12 , N2:= net_8 (C:=Cs);
INTERN AM I_in N1:= net_2 , N2:= net_1 ( ) ;
INTERN VM V_in N1:= net_11 , N2:= net_13 ( ) ;
INTERN VM V_out N1:= net_12 , N2:= net_10 ( ) ;
INTERN AM I_out N1:= net_9 , N2:= net_8 ( ) ;
INTERN R R_load N1:= net_9 , N2:= net_10 (R:=R_load);
COUPL gnd gnd1 gnd_term:= net_10 () DST: SIM(Type:=SimVHDL) SRC: DB(File:="Simplorer Elements\VDALibs VHDLAMS\hybrid_emc_vda", Lang:=VHDLA, Lvl:="ideal");
COUPL gnd gnd2 gnd_term:= net_13 () DST: SIM(Type:=SimVHDL) SRC: DB(File:="Simplorer Elements\VDALibs VHDLAMS\hybrid_emc_vda", Lang:=VHDLA, Lvl:="ideal");
MODEL MaxwellData7_19 Mx_SS2 Rx_in1_src:= net_12 , Rx_in2_src:= net_12 , Rx_in3_src:= net_12 , Tx_in1_src:= net_11 , Tx_in2_src:= net_11 , Tx_in3_src:= net_11 , Rx_in1_snk:= net_10 , Rx_in2_snk:= net_10 , Rx_in3_snk:= net_10 , Tx_in1_snk:= net_13 , Tx_in2_snk:= net_13 , Tx_in3_snk:= net_13 (); 

// end toplevel circuit

SIMCTL AC
{
SIMCFG SIMPLORER_AC AC(FStart:=80000, Fend:=100000, Fstep:=1000, ACSweepType := 0);
SIMCFG SIMPLORER_DC AC_DC();
}
OUTCTL OutCtl1
{
RESULT SDB SDB_0(Cp.I);
RESULT SDB SDB_1(Cp.V);
RESULT SDB SDB_2(Cs.I);
RESULT SDB SDB_3(Cs.V);
RESULT SDB SDB_4(E_source.I);
RESULT SDB SDB_5(E_source.V);
RESULT SDB SDB_6(I_in.I);
RESULT SDB SDB_7(I_out.I);
RESULT SDB SDB_8(R_load.I);
RESULT SDB SDB_9(R_load.V);
RESULT SDB SDB_10(V_in.V);
RESULT SDB SDB_11(V_out.V);
RESULT VIEW VANALOG_0(Cp.I);
RESULT VIEW VANALOG_1(Cp.V);
RESULT VIEW VANALOG_2(Cs.I);
RESULT VIEW VANALOG_3(Cs.V);
RESULT VIEW VANALOG_4(E_source.I);
RESULT VIEW VANALOG_5(E_source.V);
RESULT VIEW VANALOG_6(I_in.I);
RESULT VIEW VANALOG_7(I_out.I);
RESULT VIEW VANALOG_8(R_load.I);
RESULT VIEW VANALOG_9(R_load.V);
RESULT VIEW VANALOG_10(V_in.V);
RESULT VIEW VANALOG_11(V_out.V);
OUTCFG VIEWTOOL VT1 ( Xmin := Fstart, Xmax := Fend);
OUTCFG SimplorerDB DB1 ( Xmin := Fstart, Xmax := Fend);
}