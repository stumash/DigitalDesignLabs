-- megafunction wizard: %LPM_DECODE%
-- GENERATION: STANDARD
-- VERSION: WM1.0
-- MODULE: LPM_DECODE 

-- ============================================================
-- File Name: lpm_decode0.vhd
-- Megafunction Name(s):
-- 			LPM_DECODE
--
-- Simulation Library Files(s):
-- 			lpm
-- ============================================================
-- ************************************************************
-- THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
--
-- 13.0.1 Build 232 06/12/2013 SP 1 SJ Full Version
-- ************************************************************


--Copyright (C) 1991-2013 Altera Corporation
--Your use of Altera Corporation's design tools, logic functions 
--and other software and tools, and its AMPP partner logic 
--functions, and any output files from any of the foregoing 
--(including device programming or simulation files), and any 
--associated documentation or information are expressly subject 
--to the terms and conditions of the Altera Program License 
--Subscription Agreement, Altera MegaCore Function License 
--Agreement, or other applicable license agreement, including, 
--without limitation, that your use is for the sole purpose of 
--programming logic devices manufactured by Altera and sold by 
--Altera or its authorized distributors.  Please refer to the 
--applicable agreement for further details.


LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY lpm;
USE lpm.all;

ENTITY lpm_decode0 IS
	PORT
	(
		data		: IN STD_LOGIC_VECTOR (1 DOWNTO 0);
		eq0		: OUT STD_LOGIC ;
		eq1		: OUT STD_LOGIC ;
		eq2		: OUT STD_LOGIC ;
		eq3		: OUT STD_LOGIC 
	);
END lpm_decode0;


ARCHITECTURE SYN OF lpm_decode0 IS

	SIGNAL sub_wire0	: STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL sub_wire1	: STD_LOGIC ;
	SIGNAL sub_wire2	: STD_LOGIC ;
	SIGNAL sub_wire3	: STD_LOGIC ;
	SIGNAL sub_wire4	: STD_LOGIC ;



	COMPONENT lpm_decode
	GENERIC (
		lpm_decodes		: NATURAL;
		lpm_type		: STRING;
		lpm_width		: NATURAL
	);
	PORT (
			data	: IN STD_LOGIC_VECTOR (1 DOWNTO 0);
			eq	: OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
	);
	END COMPONENT;

BEGIN
	sub_wire4    <= sub_wire0(3);
	sub_wire3    <= sub_wire0(1);
	sub_wire2    <= sub_wire0(2);
	sub_wire1    <= sub_wire0(0);
	eq0    <= sub_wire1;
	eq2    <= sub_wire2;
	eq1    <= sub_wire3;
	eq3    <= sub_wire4;

	LPM_DECODE_component : LPM_DECODE
	GENERIC MAP (
		lpm_decodes => 4,
		lpm_type => "LPM_DECODE",
		lpm_width => 2
	)
	PORT MAP (
		data => data,
		eq => sub_wire0
	);



END SYN;

-- ============================================================
-- CNX file retrieval info
-- ============================================================
-- Retrieval info: PRIVATE: BaseDec NUMERIC "1"
-- Retrieval info: PRIVATE: EnableInput NUMERIC "0"
-- Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Cyclone II"
-- Retrieval info: PRIVATE: LPM_PIPELINE NUMERIC "0"
-- Retrieval info: PRIVATE: Latency NUMERIC "0"
-- Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "1"
-- Retrieval info: PRIVATE: aclr NUMERIC "0"
-- Retrieval info: PRIVATE: clken NUMERIC "0"
-- Retrieval info: PRIVATE: eq0 NUMERIC "1"
-- Retrieval info: PRIVATE: eq1 NUMERIC "1"
-- Retrieval info: PRIVATE: eq2 NUMERIC "1"
-- Retrieval info: PRIVATE: eq3 NUMERIC "1"
-- Retrieval info: PRIVATE: nBit NUMERIC "2"
-- Retrieval info: PRIVATE: new_diagram STRING "1"
-- Retrieval info: LIBRARY: lpm lpm.lpm_components.all
-- Retrieval info: CONSTANT: LPM_DECODES NUMERIC "4"
-- Retrieval info: CONSTANT: LPM_TYPE STRING "LPM_DECODE"
-- Retrieval info: CONSTANT: LPM_WIDTH NUMERIC "2"
-- Retrieval info: USED_PORT: @eq 0 0 4 0 OUTPUT NODEFVAL "@eq[3..0]"
-- Retrieval info: USED_PORT: data 0 0 2 0 INPUT NODEFVAL "data[1..0]"
-- Retrieval info: USED_PORT: eq0 0 0 0 0 OUTPUT NODEFVAL "eq0"
-- Retrieval info: USED_PORT: eq1 0 0 0 0 OUTPUT NODEFVAL "eq1"
-- Retrieval info: USED_PORT: eq2 0 0 0 0 OUTPUT NODEFVAL "eq2"
-- Retrieval info: USED_PORT: eq3 0 0 0 0 OUTPUT NODEFVAL "eq3"
-- Retrieval info: CONNECT: @data 0 0 2 0 data 0 0 2 0
-- Retrieval info: CONNECT: eq0 0 0 0 0 @eq 0 0 1 0
-- Retrieval info: CONNECT: eq1 0 0 0 0 @eq 0 0 1 1
-- Retrieval info: CONNECT: eq2 0 0 0 0 @eq 0 0 1 2
-- Retrieval info: CONNECT: eq3 0 0 0 0 @eq 0 0 1 3
-- Retrieval info: GEN_FILE: TYPE_NORMAL lpm_decode0.vhd TRUE
-- Retrieval info: GEN_FILE: TYPE_NORMAL lpm_decode0.inc FALSE
-- Retrieval info: GEN_FILE: TYPE_NORMAL lpm_decode0.cmp TRUE
-- Retrieval info: GEN_FILE: TYPE_NORMAL lpm_decode0.bsf TRUE FALSE
-- Retrieval info: GEN_FILE: TYPE_NORMAL lpm_decode0_inst.vhd FALSE
-- Retrieval info: GEN_FILE: TYPE_NORMAL lpm_decode0_syn.v TRUE
-- Retrieval info: LIB_FILE: lpm
