-- Copyright (C) 1991-2012 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 12.1 Build 177 11/07/2012 SJ Full Version"

-- DATE "04/16/2014 08:52:21"

-- 
-- Device: Altera EP2C35F672C6 Package FBGA672
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEII;
LIBRARY IEEE;
USE CYCLONEII.CYCLONEII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	SN_program_v01 IS
    PORT (
	CLK : IN std_logic;
	RESET : IN std_logic;
	DATA : IN std_logic;
	ADC_DATA : IN std_logic_vector(11 DOWNTO 0);
	ADC_DATA_RDY : IN std_logic;
	R_DATA : OUT std_logic;
	in_switches : IN std_logic_vector(15 DOWNTO 0);
	R_DATA_debigging : OUT std_logic
	);
END SN_program_v01;

-- Design Ports Information
-- ADC_DATA[0]	=>  Location: PIN_AA9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ADC_DATA[1]	=>  Location: PIN_AF17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ADC_DATA[2]	=>  Location: PIN_D21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ADC_DATA[3]	=>  Location: PIN_AB10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ADC_DATA[4]	=>  Location: PIN_AA26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ADC_DATA[5]	=>  Location: PIN_AA15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ADC_DATA[6]	=>  Location: PIN_K1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ADC_DATA[7]	=>  Location: PIN_H15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ADC_DATA[8]	=>  Location: PIN_H24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ADC_DATA[9]	=>  Location: PIN_V17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ADC_DATA[10]	=>  Location: PIN_B10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ADC_DATA[11]	=>  Location: PIN_P23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ADC_DATA_RDY	=>  Location: PIN_AD19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- R_DATA	=>  Location: PIN_M24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- R_DATA_debigging	=>  Location: PIN_E26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- CLK	=>  Location: PIN_K25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- in_switches[13]	=>  Location: PIN_T7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- in_switches[11]	=>  Location: PIN_P1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- in_switches[15]	=>  Location: PIN_U4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- in_switches[9]	=>  Location: PIN_A13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- in_switches[2]	=>  Location: PIN_P25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- in_switches[4]	=>  Location: PIN_AF14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- in_switches[6]	=>  Location: PIN_AC13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- in_switches[0]	=>  Location: PIN_N25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- in_switches[3]	=>  Location: PIN_AE14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- in_switches[5]	=>  Location: PIN_AD13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- in_switches[7]	=>  Location: PIN_C13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- in_switches[1]	=>  Location: PIN_N26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- in_switches[12]	=>  Location: PIN_P2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- in_switches[10]	=>  Location: PIN_N1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- in_switches[14]	=>  Location: PIN_U3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- in_switches[8]	=>  Location: PIN_B13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- RESET	=>  Location: PIN_G26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- DATA	=>  Location: PIN_K26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF SN_program_v01 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_CLK : std_logic;
SIGNAL ww_RESET : std_logic;
SIGNAL ww_DATA : std_logic;
SIGNAL ww_ADC_DATA : std_logic_vector(11 DOWNTO 0);
SIGNAL ww_ADC_DATA_RDY : std_logic;
SIGNAL ww_R_DATA : std_logic;
SIGNAL ww_in_switches : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_R_DATA_debigging : std_logic;
SIGNAL \output_data~0_combout\ : std_logic;
SIGNAL \Mux0~0_combout\ : std_logic;
SIGNAL \Mux0~1_combout\ : std_logic;
SIGNAL \m_f_bit3~regout\ : std_logic;
SIGNAL \start_bit8~regout\ : std_logic;
SIGNAL \m_a_bit4~regout\ : std_logic;
SIGNAL \manchester_bit~regout\ : std_logic;
SIGNAL \manchester_bit~0_combout\ : std_logic;
SIGNAL \Selector28~1_combout\ : std_logic;
SIGNAL \Add1~0_combout\ : std_logic;
SIGNAL \Selector7~0_combout\ : std_logic;
SIGNAL \Add0~0_combout\ : std_logic;
SIGNAL \Selector23~1_combout\ : std_logic;
SIGNAL \manchester_bit~1_combout\ : std_logic;
SIGNAL \Respond_Data[11]~feeder_combout\ : std_logic;
SIGNAL \Respond_Data[9]~feeder_combout\ : std_logic;
SIGNAL \CLK~combout\ : std_logic;
SIGNAL \respond_counter[0]~0_combout\ : std_logic;
SIGNAL \Add3~1_combout\ : std_logic;
SIGNAL \Add3~2_combout\ : std_logic;
SIGNAL \Add3~0_combout\ : std_logic;
SIGNAL \Selector33~0_combout\ : std_logic;
SIGNAL \Equal8~1_combout\ : std_logic;
SIGNAL \Selector5~0_combout\ : std_logic;
SIGNAL \Selector23~0_combout\ : std_logic;
SIGNAL \Selector20~0_combout\ : std_logic;
SIGNAL \Selector21~0_combout\ : std_logic;
SIGNAL \manchester_counter~0_combout\ : std_logic;
SIGNAL \manchester_counter~regout\ : std_logic;
SIGNAL \Selector22~2_combout\ : std_logic;
SIGNAL \Selector22~3_combout\ : std_logic;
SIGNAL \Selector6~1_combout\ : std_logic;
SIGNAL \DATA~combout\ : std_logic;
SIGNAL \Selector14~0_combout\ : std_logic;
SIGNAL \start_bit1~regout\ : std_logic;
SIGNAL \Selector13~0_combout\ : std_logic;
SIGNAL \start_bit2~regout\ : std_logic;
SIGNAL \Selector12~0_combout\ : std_logic;
SIGNAL \start_bit3~regout\ : std_logic;
SIGNAL \Selector11~0_combout\ : std_logic;
SIGNAL \start_bit4~regout\ : std_logic;
SIGNAL \Equal0~1_combout\ : std_logic;
SIGNAL \Selector10~0_combout\ : std_logic;
SIGNAL \start_bit5~regout\ : std_logic;
SIGNAL \Selector9~0_combout\ : std_logic;
SIGNAL \start_bit6~regout\ : std_logic;
SIGNAL \Selector8~0_combout\ : std_logic;
SIGNAL \start_bit7~regout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \Equal0~2_combout\ : std_logic;
SIGNAL \Selector0~0_combout\ : std_logic;
SIGNAL \Selector0~1_combout\ : std_logic;
SIGNAL \r_state.idle~regout\ : std_logic;
SIGNAL \Selector1~0_combout\ : std_logic;
SIGNAL \Selector1~1_combout\ : std_logic;
SIGNAL \r_state.check_address~regout\ : std_logic;
SIGNAL \Selector24~0_combout\ : std_logic;
SIGNAL \Selector26~0_combout\ : std_logic;
SIGNAL \m_a_bit1~regout\ : std_logic;
SIGNAL \Selector25~0_combout\ : std_logic;
SIGNAL \m_a_bit2~regout\ : std_logic;
SIGNAL \Selector24~1_combout\ : std_logic;
SIGNAL \m_a_bit3~regout\ : std_logic;
SIGNAL \Equal2~0_combout\ : std_logic;
SIGNAL \RESET~combout\ : std_logic;
SIGNAL \m1~0_combout\ : std_logic;
SIGNAL \m1~regout\ : std_logic;
SIGNAL \Selector15~0_combout\ : std_logic;
SIGNAL \Selector15~1_combout\ : std_logic;
SIGNAL \fault~regout\ : std_logic;
SIGNAL \Selector2~0_combout\ : std_logic;
SIGNAL \Selector2~1_combout\ : std_logic;
SIGNAL \r_state.check_functioncode~regout\ : std_logic;
SIGNAL \Selector27~0_combout\ : std_logic;
SIGNAL \Selector28~0_combout\ : std_logic;
SIGNAL \Selector17~0_combout\ : std_logic;
SIGNAL \f_state~10_combout\ : std_logic;
SIGNAL \Selector4~1_combout\ : std_logic;
SIGNAL \Selector4~3_combout\ : std_logic;
SIGNAL \Selector4~4_combout\ : std_logic;
SIGNAL \Selector4~2_combout\ : std_logic;
SIGNAL \Selector4~5_combout\ : std_logic;
SIGNAL \f_state.get_info~regout\ : std_logic;
SIGNAL \Selector19~2_combout\ : std_logic;
SIGNAL \Selector19~3_combout\ : std_logic;
SIGNAL \Selector18~0_combout\ : std_logic;
SIGNAL \Respond_Data[20]~0_combout\ : std_logic;
SIGNAL \Selector6~2_combout\ : std_logic;
SIGNAL \Selector6~4_combout\ : std_logic;
SIGNAL \Selector6~5_combout\ : std_logic;
SIGNAL \f_state.get_data~regout\ : std_logic;
SIGNAL \start_bit8~0_combout\ : std_logic;
SIGNAL \Selector16~0_combout\ : std_logic;
SIGNAL \respond_flag~regout\ : std_logic;
SIGNAL \Selector4~0_combout\ : std_logic;
SIGNAL \f_state.manchester_converting~regout\ : std_logic;
SIGNAL \Selector27~1_combout\ : std_logic;
SIGNAL \m_f_bit4~regout\ : std_logic;
SIGNAL \Selector30~0_combout\ : std_logic;
SIGNAL \m_f_bit1~regout\ : std_logic;
SIGNAL \Selector29~0_combout\ : std_logic;
SIGNAL \m_f_bit2~regout\ : std_logic;
SIGNAL \Equal4~0_combout\ : std_logic;
SIGNAL \Selector6~0_combout\ : std_logic;
SIGNAL \Selector6~3_combout\ : std_logic;
SIGNAL \Selector3~0_combout\ : std_logic;
SIGNAL \Selector3~1_combout\ : std_logic;
SIGNAL \Selector3~2_combout\ : std_logic;
SIGNAL \f_state.idle~regout\ : std_logic;
SIGNAL \output_data~1_combout\ : std_logic;
SIGNAL \Equal8~0_combout\ : std_logic;
SIGNAL \Selector32~0_combout\ : std_logic;
SIGNAL \Respond_Data[17]~1_combout\ : std_logic;
SIGNAL \Respond_Data[10]~feeder_combout\ : std_logic;
SIGNAL \Mux0~7_combout\ : std_logic;
SIGNAL \Mux0~8_combout\ : std_logic;
SIGNAL \Respond_Data[1]~feeder_combout\ : std_logic;
SIGNAL \Respond_Data[5]~feeder_combout\ : std_logic;
SIGNAL \Mux0~4_combout\ : std_logic;
SIGNAL \Mux0~5_combout\ : std_logic;
SIGNAL \Respond_Data[0]~feeder_combout\ : std_logic;
SIGNAL \Respond_Data[4]~feeder_combout\ : std_logic;
SIGNAL \Mux0~2_combout\ : std_logic;
SIGNAL \Mux0~3_combout\ : std_logic;
SIGNAL \Mux0~6_combout\ : std_logic;
SIGNAL \Mux0~9_combout\ : std_logic;
SIGNAL \output_data~2_combout\ : std_logic;
SIGNAL \output_data~3_combout\ : std_logic;
SIGNAL \output_data~regout\ : std_logic;
SIGNAL respond_counter : std_logic_vector(4 DOWNTO 0);
SIGNAL functioncode_counter : std_logic_vector(2 DOWNTO 0);
SIGNAL address_counter : std_logic_vector(2 DOWNTO 0);
SIGNAL Respond_Data : std_logic_vector(23 DOWNTO 0);
SIGNAL \in_switches~combout\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \ALT_INV_CLK~combout\ : std_logic;

BEGIN

ww_CLK <= CLK;
ww_RESET <= RESET;
ww_DATA <= DATA;
ww_ADC_DATA <= ADC_DATA;
ww_ADC_DATA_RDY <= ADC_DATA_RDY;
R_DATA <= ww_R_DATA;
ww_in_switches <= in_switches;
R_DATA_debigging <= ww_R_DATA_debigging;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_CLK~combout\ <= NOT \CLK~combout\;

-- Location: LCFF_X60_Y22_N25
\Respond_Data[17]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~combout\,
	sdata => \Equal4~0_combout\,
	sload => VCC,
	ena => \Respond_Data[17]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Respond_Data(17));

-- Location: LCCOMB_X61_Y22_N10
\output_data~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \output_data~0_combout\ = (respond_counter(1) & (respond_counter(0) $ (((respond_counter(2) & Respond_Data(17))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => respond_counter(2),
	datab => respond_counter(0),
	datac => respond_counter(1),
	datad => Respond_Data(17),
	combout => \output_data~0_combout\);

-- Location: LCFF_X60_Y22_N3
\Respond_Data[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~combout\,
	sdata => \in_switches~combout\(13),
	sload => VCC,
	ena => \Respond_Data[17]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Respond_Data(13));

-- Location: LCFF_X60_Y22_N13
\Respond_Data[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~combout\,
	datain => \Respond_Data[11]~feeder_combout\,
	ena => \Respond_Data[17]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Respond_Data(11));

-- Location: LCFF_X60_Y22_N27
\Respond_Data[15]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~combout\,
	sdata => \in_switches~combout\(15),
	sload => VCC,
	ena => \Respond_Data[17]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Respond_Data(15));

-- Location: LCCOMB_X60_Y22_N26
\Mux0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux0~0_combout\ = (respond_counter(2) & ((respond_counter(1)) # ((Respond_Data(11))))) # (!respond_counter(2) & (!respond_counter(1) & (Respond_Data(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => respond_counter(2),
	datab => respond_counter(1),
	datac => Respond_Data(15),
	datad => Respond_Data(11),
	combout => \Mux0~0_combout\);

-- Location: LCFF_X60_Y22_N21
\Respond_Data[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~combout\,
	datain => \Respond_Data[9]~feeder_combout\,
	ena => \Respond_Data[17]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Respond_Data(9));

-- Location: LCCOMB_X60_Y22_N2
\Mux0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux0~1_combout\ = (respond_counter(1) & ((\Mux0~0_combout\ & (Respond_Data(9))) # (!\Mux0~0_combout\ & ((Respond_Data(13)))))) # (!respond_counter(1) & (((\Mux0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Respond_Data(9),
	datab => respond_counter(1),
	datac => Respond_Data(13),
	datad => \Mux0~0_combout\,
	combout => \Mux0~1_combout\);

-- Location: LCFF_X60_Y22_N11
\Respond_Data[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~combout\,
	sdata => \in_switches~combout\(8),
	sload => VCC,
	ena => \Respond_Data[17]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Respond_Data(8));

-- Location: LCFF_X61_Y21_N17
m_f_bit3 : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \Selector28~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \m_f_bit3~regout\);

-- Location: LCFF_X63_Y21_N11
start_bit8 : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \Selector7~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \start_bit8~regout\);

-- Location: LCFF_X64_Y21_N25
m_a_bit4 : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \Selector23~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \m_a_bit4~regout\);

-- Location: LCFF_X64_Y22_N31
manchester_bit : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \manchester_bit~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \manchester_bit~regout\);

-- Location: LCCOMB_X64_Y22_N16
\manchester_bit~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \manchester_bit~0_combout\ = (\manchester_bit~regout\ & ((\m1~regout\) # (!\DATA~combout\))) # (!\manchester_bit~regout\ & (\m1~regout\ & !\DATA~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \manchester_bit~regout\,
	datac => \m1~regout\,
	datad => \DATA~combout\,
	combout => \manchester_bit~0_combout\);

-- Location: LCCOMB_X61_Y21_N16
\Selector28~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector28~1_combout\ = (\m_f_bit2~regout\ & ((\Selector27~0_combout\) # ((\m_f_bit3~regout\ & \Selector28~0_combout\)))) # (!\m_f_bit2~regout\ & (((\m_f_bit3~regout\ & \Selector28~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \m_f_bit2~regout\,
	datab => \Selector27~0_combout\,
	datac => \m_f_bit3~regout\,
	datad => \Selector28~0_combout\,
	combout => \Selector28~1_combout\);

-- Location: LCCOMB_X61_Y21_N12
\Add1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~0_combout\ = functioncode_counter(2) $ (((functioncode_counter(1) & functioncode_counter(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => functioncode_counter(1),
	datab => functioncode_counter(0),
	datad => functioncode_counter(2),
	combout => \Add1~0_combout\);

-- Location: LCCOMB_X63_Y21_N10
\Selector7~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector7~0_combout\ = (\f_state.idle~regout\ & (\start_bit8~0_combout\ & (\start_bit8~regout\))) # (!\f_state.idle~regout\ & ((\start_bit7~regout\) # ((\start_bit8~0_combout\ & \start_bit8~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \f_state.idle~regout\,
	datab => \start_bit8~0_combout\,
	datac => \start_bit8~regout\,
	datad => \start_bit7~regout\,
	combout => \Selector7~0_combout\);

-- Location: LCCOMB_X64_Y21_N16
\Add0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~0_combout\ = address_counter(2) $ (((address_counter(0) & address_counter(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110101001101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => address_counter(2),
	datab => address_counter(0),
	datac => address_counter(1),
	combout => \Add0~0_combout\);

-- Location: LCCOMB_X64_Y21_N24
\Selector23~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector23~1_combout\ = (\Selector23~0_combout\ & ((\m_a_bit3~regout\) # ((\m_a_bit4~regout\ & \Selector24~0_combout\)))) # (!\Selector23~0_combout\ & (((\m_a_bit4~regout\ & \Selector24~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector23~0_combout\,
	datab => \m_a_bit3~regout\,
	datac => \m_a_bit4~regout\,
	datad => \Selector24~0_combout\,
	combout => \Selector23~1_combout\);

-- Location: LCCOMB_X64_Y22_N30
\manchester_bit~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \manchester_bit~1_combout\ = (\manchester_counter~regout\ & ((\f_state.manchester_converting~regout\ & (\manchester_bit~0_combout\)) # (!\f_state.manchester_converting~regout\ & ((\manchester_bit~regout\))))) # (!\manchester_counter~regout\ & 
-- (((\manchester_bit~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \manchester_bit~0_combout\,
	datab => \manchester_counter~regout\,
	datac => \manchester_bit~regout\,
	datad => \f_state.manchester_converting~regout\,
	combout => \manchester_bit~1_combout\);

-- Location: PIN_T7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\in_switches[13]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_in_switches(13),
	combout => \in_switches~combout\(13));

-- Location: PIN_P1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\in_switches[11]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_in_switches(11),
	combout => \in_switches~combout\(11));

-- Location: PIN_U4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\in_switches[15]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_in_switches(15),
	combout => \in_switches~combout\(15));

-- Location: PIN_A13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\in_switches[9]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_in_switches(9),
	combout => \in_switches~combout\(9));

-- Location: PIN_B13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\in_switches[8]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_in_switches(8),
	combout => \in_switches~combout\(8));

-- Location: LCCOMB_X60_Y22_N12
\Respond_Data[11]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \Respond_Data[11]~feeder_combout\ = \in_switches~combout\(11)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \in_switches~combout\(11),
	combout => \Respond_Data[11]~feeder_combout\);

-- Location: LCCOMB_X60_Y22_N20
\Respond_Data[9]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \Respond_Data[9]~feeder_combout\ = \in_switches~combout\(9)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \in_switches~combout\(9),
	combout => \Respond_Data[9]~feeder_combout\);

-- Location: PIN_K25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\CLK~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_CLK,
	combout => \CLK~combout\);

-- Location: LCCOMB_X62_Y22_N22
\respond_counter[0]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \respond_counter[0]~0_combout\ = !respond_counter(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => respond_counter(0),
	combout => \respond_counter[0]~0_combout\);

-- Location: LCCOMB_X62_Y22_N8
\Add3~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add3~1_combout\ = respond_counter(1) $ (respond_counter(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => respond_counter(1),
	datad => respond_counter(0),
	combout => \Add3~1_combout\);

-- Location: LCFF_X62_Y22_N9
\respond_counter[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \Add3~1_combout\,
	ena => \output_data~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => respond_counter(1));

-- Location: LCCOMB_X62_Y22_N24
\Add3~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add3~2_combout\ = respond_counter(2) $ (((respond_counter(0) & respond_counter(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => respond_counter(0),
	datac => respond_counter(2),
	datad => respond_counter(1),
	combout => \Add3~2_combout\);

-- Location: LCFF_X62_Y22_N25
\respond_counter[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \Add3~2_combout\,
	ena => \output_data~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => respond_counter(2));

-- Location: LCCOMB_X62_Y22_N4
\Add3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add3~0_combout\ = (respond_counter(0) & (respond_counter(2) & respond_counter(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => respond_counter(0),
	datac => respond_counter(2),
	datad => respond_counter(1),
	combout => \Add3~0_combout\);

-- Location: LCCOMB_X62_Y22_N20
\Selector33~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector33~0_combout\ = (\Equal8~0_combout\ & (!respond_counter(4) & (\Add3~0_combout\ $ (respond_counter(3))))) # (!\Equal8~0_combout\ & (\Add3~0_combout\ $ ((respond_counter(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add3~0_combout\,
	datab => \Equal8~0_combout\,
	datac => respond_counter(3),
	datad => respond_counter(4),
	combout => \Selector33~0_combout\);

-- Location: LCFF_X62_Y22_N21
\respond_counter[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \Selector33~0_combout\,
	ena => \output_data~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => respond_counter(3));

-- Location: LCCOMB_X62_Y22_N26
\Equal8~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal8~1_combout\ = (\Equal8~0_combout\ & (respond_counter(4) $ (((\Add3~0_combout\ & respond_counter(3))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => respond_counter(4),
	datab => \Equal8~0_combout\,
	datac => \Add3~0_combout\,
	datad => respond_counter(3),
	combout => \Equal8~1_combout\);

-- Location: LCCOMB_X63_Y21_N2
\Selector5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector5~0_combout\ = (!\Equal4~0_combout\ & \Respond_Data[20]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal4~0_combout\,
	datac => \Respond_Data[20]~0_combout\,
	combout => \Selector5~0_combout\);

-- Location: LCCOMB_X64_Y21_N10
\Selector23~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector23~0_combout\ = (\manchester_counter~regout\ & (\f_state.manchester_converting~regout\ & \r_state.check_address~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \manchester_counter~regout\,
	datab => \f_state.manchester_converting~regout\,
	datac => \r_state.check_address~regout\,
	combout => \Selector23~0_combout\);

-- Location: LCCOMB_X63_Y21_N28
\Selector20~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector20~0_combout\ = (\Add0~0_combout\ & ((\Selector23~0_combout\) # ((address_counter(2) & \Selector24~0_combout\)))) # (!\Add0~0_combout\ & (((address_counter(2) & \Selector24~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~0_combout\,
	datab => \Selector23~0_combout\,
	datac => address_counter(2),
	datad => \Selector24~0_combout\,
	combout => \Selector20~0_combout\);

-- Location: LCFF_X63_Y21_N29
\address_counter[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \Selector20~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => address_counter(2));

-- Location: LCCOMB_X63_Y21_N20
\Selector21~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector21~0_combout\ = (address_counter(1) & ((\Selector24~0_combout\) # ((!address_counter(0) & \Selector23~0_combout\)))) # (!address_counter(1) & (address_counter(0) & (\Selector23~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => address_counter(0),
	datab => \Selector23~0_combout\,
	datac => address_counter(1),
	datad => \Selector24~0_combout\,
	combout => \Selector21~0_combout\);

-- Location: LCFF_X63_Y21_N21
\address_counter[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \Selector21~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => address_counter(1));

-- Location: LCCOMB_X64_Y22_N14
\manchester_counter~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \manchester_counter~0_combout\ = \manchester_counter~regout\ $ (\f_state.manchester_converting~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \manchester_counter~regout\,
	datad => \f_state.manchester_converting~regout\,
	combout => \manchester_counter~0_combout\);

-- Location: LCFF_X64_Y22_N15
manchester_counter : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \manchester_counter~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \manchester_counter~regout\);

-- Location: LCCOMB_X62_Y21_N8
\Selector22~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector22~2_combout\ = (\f_state.manchester_converting~regout\ & (address_counter(0) $ (((\r_state.check_address~regout\ & \manchester_counter~regout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \r_state.check_address~regout\,
	datab => \manchester_counter~regout\,
	datac => \f_state.manchester_converting~regout\,
	datad => address_counter(0),
	combout => \Selector22~2_combout\);

-- Location: LCCOMB_X63_Y21_N18
\Selector22~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector22~3_combout\ = (\Selector22~2_combout\) # ((address_counter(0) & ((\f_state.get_info~regout\) # (\f_state.get_data~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \f_state.get_info~regout\,
	datab => \f_state.get_data~regout\,
	datac => address_counter(0),
	datad => \Selector22~2_combout\,
	combout => \Selector22~3_combout\);

-- Location: LCFF_X63_Y21_N19
\address_counter[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \Selector22~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => address_counter(0));

-- Location: LCCOMB_X63_Y21_N22
\Selector6~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector6~1_combout\ = (\r_state.check_address~regout\ & (address_counter(2) & (!address_counter(1) & !address_counter(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \r_state.check_address~regout\,
	datab => address_counter(2),
	datac => address_counter(1),
	datad => address_counter(0),
	combout => \Selector6~1_combout\);

-- Location: PIN_K26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\DATA~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_DATA,
	combout => \DATA~combout\);

-- Location: LCCOMB_X64_Y22_N28
\Selector14~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector14~0_combout\ = (\f_state.idle~regout\ & (((\start_bit1~regout\ & \start_bit8~0_combout\)))) # (!\f_state.idle~regout\ & ((\DATA~combout\) # ((\start_bit1~regout\ & \start_bit8~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \f_state.idle~regout\,
	datab => \DATA~combout\,
	datac => \start_bit1~regout\,
	datad => \start_bit8~0_combout\,
	combout => \Selector14~0_combout\);

-- Location: LCFF_X64_Y22_N29
start_bit1 : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \Selector14~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \start_bit1~regout\);

-- Location: LCCOMB_X64_Y22_N24
\Selector13~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector13~0_combout\ = (\f_state.idle~regout\ & (((\start_bit2~regout\ & \start_bit8~0_combout\)))) # (!\f_state.idle~regout\ & ((\start_bit1~regout\) # ((\start_bit2~regout\ & \start_bit8~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \f_state.idle~regout\,
	datab => \start_bit1~regout\,
	datac => \start_bit2~regout\,
	datad => \start_bit8~0_combout\,
	combout => \Selector13~0_combout\);

-- Location: LCFF_X64_Y22_N25
start_bit2 : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \Selector13~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \start_bit2~regout\);

-- Location: LCCOMB_X64_Y22_N22
\Selector12~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector12~0_combout\ = (\f_state.idle~regout\ & (((\start_bit3~regout\ & \start_bit8~0_combout\)))) # (!\f_state.idle~regout\ & ((\start_bit2~regout\) # ((\start_bit3~regout\ & \start_bit8~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \f_state.idle~regout\,
	datab => \start_bit2~regout\,
	datac => \start_bit3~regout\,
	datad => \start_bit8~0_combout\,
	combout => \Selector12~0_combout\);

-- Location: LCFF_X64_Y22_N23
start_bit3 : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \Selector12~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \start_bit3~regout\);

-- Location: LCCOMB_X64_Y22_N10
\Selector11~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector11~0_combout\ = (\f_state.idle~regout\ & (((\start_bit4~regout\ & \start_bit8~0_combout\)))) # (!\f_state.idle~regout\ & ((\start_bit3~regout\) # ((\start_bit4~regout\ & \start_bit8~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \f_state.idle~regout\,
	datab => \start_bit3~regout\,
	datac => \start_bit4~regout\,
	datad => \start_bit8~0_combout\,
	combout => \Selector11~0_combout\);

-- Location: LCFF_X64_Y22_N11
start_bit4 : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \Selector11~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \start_bit4~regout\);

-- Location: LCCOMB_X64_Y22_N2
\Equal0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~1_combout\ = ((\start_bit3~regout\) # ((\start_bit2~regout\) # (!\start_bit4~regout\))) # (!\start_bit1~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \start_bit1~regout\,
	datab => \start_bit3~regout\,
	datac => \start_bit2~regout\,
	datad => \start_bit4~regout\,
	combout => \Equal0~1_combout\);

-- Location: LCCOMB_X63_Y21_N16
\Selector10~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector10~0_combout\ = (\f_state.idle~regout\ & (((\start_bit5~regout\ & \start_bit8~0_combout\)))) # (!\f_state.idle~regout\ & ((\start_bit4~regout\) # ((\start_bit5~regout\ & \start_bit8~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \f_state.idle~regout\,
	datab => \start_bit4~regout\,
	datac => \start_bit5~regout\,
	datad => \start_bit8~0_combout\,
	combout => \Selector10~0_combout\);

-- Location: LCFF_X63_Y21_N17
start_bit5 : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \Selector10~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \start_bit5~regout\);

-- Location: LCCOMB_X63_Y21_N8
\Selector9~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector9~0_combout\ = (\f_state.idle~regout\ & (\start_bit8~0_combout\ & (\start_bit6~regout\))) # (!\f_state.idle~regout\ & ((\start_bit5~regout\) # ((\start_bit8~0_combout\ & \start_bit6~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \f_state.idle~regout\,
	datab => \start_bit8~0_combout\,
	datac => \start_bit6~regout\,
	datad => \start_bit5~regout\,
	combout => \Selector9~0_combout\);

-- Location: LCFF_X63_Y21_N9
start_bit6 : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \Selector9~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \start_bit6~regout\);

-- Location: LCCOMB_X63_Y21_N26
\Selector8~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector8~0_combout\ = (\f_state.idle~regout\ & (((\start_bit7~regout\ & \start_bit8~0_combout\)))) # (!\f_state.idle~regout\ & ((\start_bit6~regout\) # ((\start_bit7~regout\ & \start_bit8~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \f_state.idle~regout\,
	datab => \start_bit6~regout\,
	datac => \start_bit7~regout\,
	datad => \start_bit8~0_combout\,
	combout => \Selector8~0_combout\);

-- Location: LCFF_X63_Y21_N27
start_bit7 : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \Selector8~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \start_bit7~regout\);

-- Location: LCCOMB_X63_Y21_N6
\Equal0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = (\start_bit8~regout\) # (((\start_bit5~regout\) # (!\start_bit7~regout\)) # (!\start_bit6~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \start_bit8~regout\,
	datab => \start_bit6~regout\,
	datac => \start_bit5~regout\,
	datad => \start_bit7~regout\,
	combout => \Equal0~0_combout\);

-- Location: LCCOMB_X63_Y21_N4
\Equal0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~2_combout\ = (\Equal0~1_combout\) # (\Equal0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Equal0~1_combout\,
	datad => \Equal0~0_combout\,
	combout => \Equal0~2_combout\);

-- Location: LCCOMB_X64_Y21_N12
\Selector0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector0~0_combout\ = (!\Selector6~1_combout\ & ((\r_state.idle~regout\ & (!\f_state~10_combout\)) # (!\r_state.idle~regout\ & ((\Equal0~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \f_state~10_combout\,
	datab => \Selector6~1_combout\,
	datac => \Equal0~2_combout\,
	datad => \r_state.idle~regout\,
	combout => \Selector0~0_combout\);

-- Location: LCCOMB_X64_Y21_N26
\Selector0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector0~1_combout\ = (!\Respond_Data[20]~0_combout\ & (!\Selector0~0_combout\ & ((\Equal2~0_combout\) # (!\Selector6~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal2~0_combout\,
	datab => \Selector6~1_combout\,
	datac => \Respond_Data[20]~0_combout\,
	datad => \Selector0~0_combout\,
	combout => \Selector0~1_combout\);

-- Location: LCFF_X64_Y21_N27
\r_state.idle\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~combout\,
	datain => \Selector0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \r_state.idle~regout\);

-- Location: LCCOMB_X64_Y21_N20
\Selector1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector1~0_combout\ = (\r_state.check_address~regout\ & ((address_counter(1)) # ((address_counter(0)) # (!address_counter(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => address_counter(1),
	datab => address_counter(2),
	datac => \r_state.check_address~regout\,
	datad => address_counter(0),
	combout => \Selector1~0_combout\);

-- Location: LCCOMB_X64_Y21_N8
\Selector1~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector1~1_combout\ = (\f_state~10_combout\ & ((\Selector1~0_combout\) # ((!\r_state.idle~regout\ & !\Equal0~2_combout\)))) # (!\f_state~10_combout\ & (!\r_state.idle~regout\ & (!\Equal0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \f_state~10_combout\,
	datab => \r_state.idle~regout\,
	datac => \Equal0~2_combout\,
	datad => \Selector1~0_combout\,
	combout => \Selector1~1_combout\);

-- Location: LCFF_X64_Y21_N9
\r_state.check_address\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~combout\,
	datain => \Selector1~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \r_state.check_address~regout\);

-- Location: LCCOMB_X64_Y21_N2
\Selector24~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector24~0_combout\ = (\start_bit8~0_combout\) # ((\f_state.manchester_converting~regout\ & ((!\r_state.check_address~regout\) # (!\manchester_counter~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \manchester_counter~regout\,
	datab => \f_state.manchester_converting~regout\,
	datac => \r_state.check_address~regout\,
	datad => \start_bit8~0_combout\,
	combout => \Selector24~0_combout\);

-- Location: LCCOMB_X64_Y21_N6
\Selector26~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector26~0_combout\ = (\manchester_bit~0_combout\ & ((\Selector23~0_combout\) # ((\Selector24~0_combout\ & \m_a_bit1~regout\)))) # (!\manchester_bit~0_combout\ & (\Selector24~0_combout\ & (\m_a_bit1~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \manchester_bit~0_combout\,
	datab => \Selector24~0_combout\,
	datac => \m_a_bit1~regout\,
	datad => \Selector23~0_combout\,
	combout => \Selector26~0_combout\);

-- Location: LCFF_X64_Y21_N7
m_a_bit1 : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \Selector26~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \m_a_bit1~regout\);

-- Location: LCCOMB_X64_Y21_N4
\Selector25~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector25~0_combout\ = (\Selector23~0_combout\ & ((\m_a_bit1~regout\) # ((\m_a_bit2~regout\ & \Selector24~0_combout\)))) # (!\Selector23~0_combout\ & (((\m_a_bit2~regout\ & \Selector24~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector23~0_combout\,
	datab => \m_a_bit1~regout\,
	datac => \m_a_bit2~regout\,
	datad => \Selector24~0_combout\,
	combout => \Selector25~0_combout\);

-- Location: LCFF_X64_Y21_N5
m_a_bit2 : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \Selector25~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \m_a_bit2~regout\);

-- Location: LCCOMB_X64_Y21_N30
\Selector24~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector24~1_combout\ = (\Selector23~0_combout\ & ((\m_a_bit2~regout\) # ((\m_a_bit3~regout\ & \Selector24~0_combout\)))) # (!\Selector23~0_combout\ & (((\m_a_bit3~regout\ & \Selector24~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector23~0_combout\,
	datab => \m_a_bit2~regout\,
	datac => \m_a_bit3~regout\,
	datad => \Selector24~0_combout\,
	combout => \Selector24~1_combout\);

-- Location: LCFF_X64_Y21_N31
m_a_bit3 : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \Selector24~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \m_a_bit3~regout\);

-- Location: LCCOMB_X64_Y21_N14
\Equal2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal2~0_combout\ = (!\m_a_bit4~regout\ & (!\m_a_bit3~regout\ & (!\m_a_bit2~regout\ & \m_a_bit1~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \m_a_bit4~regout\,
	datab => \m_a_bit3~regout\,
	datac => \m_a_bit2~regout\,
	datad => \m_a_bit1~regout\,
	combout => \Equal2~0_combout\);

-- Location: PIN_G26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\RESET~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_RESET,
	combout => \RESET~combout\);

-- Location: LCCOMB_X64_Y22_N4
\m1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \m1~0_combout\ = (\manchester_counter~regout\ & (((\m1~regout\)))) # (!\manchester_counter~regout\ & ((\f_state.manchester_converting~regout\ & (\DATA~combout\)) # (!\f_state.manchester_converting~regout\ & ((\m1~regout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DATA~combout\,
	datab => \manchester_counter~regout\,
	datac => \m1~regout\,
	datad => \f_state.manchester_converting~regout\,
	combout => \m1~0_combout\);

-- Location: LCFF_X64_Y22_N5
m1 : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \m1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \m1~regout\);

-- Location: LCCOMB_X63_Y22_N16
\Selector15~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector15~0_combout\ = (\manchester_counter~regout\ & (\f_state.manchester_converting~regout\ & (\DATA~combout\ $ (!\m1~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DATA~combout\,
	datab => \manchester_counter~regout\,
	datac => \m1~regout\,
	datad => \f_state.manchester_converting~regout\,
	combout => \Selector15~0_combout\);

-- Location: LCCOMB_X62_Y21_N20
\Selector15~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector15~1_combout\ = (\Selector15~0_combout\) # ((\fault~regout\ & ((\start_bit8~0_combout\) # (\f_state.manchester_converting~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \start_bit8~0_combout\,
	datab => \f_state.manchester_converting~regout\,
	datac => \fault~regout\,
	datad => \Selector15~0_combout\,
	combout => \Selector15~1_combout\);

-- Location: LCFF_X62_Y21_N21
fault : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \Selector15~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \fault~regout\);

-- Location: LCCOMB_X62_Y21_N10
\Selector2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector2~0_combout\ = (\RESET~combout\ & (!\fault~regout\ & \r_state.check_functioncode~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \RESET~combout\,
	datac => \fault~regout\,
	datad => \r_state.check_functioncode~regout\,
	combout => \Selector2~0_combout\);

-- Location: LCCOMB_X64_Y22_N26
\Selector2~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector2~1_combout\ = (!\Respond_Data[20]~0_combout\ & ((\Selector6~1_combout\ & (\Equal2~0_combout\)) # (!\Selector6~1_combout\ & ((\Selector2~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector6~1_combout\,
	datab => \Equal2~0_combout\,
	datac => \Respond_Data[20]~0_combout\,
	datad => \Selector2~0_combout\,
	combout => \Selector2~1_combout\);

-- Location: LCFF_X64_Y22_N27
\r_state.check_functioncode\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~combout\,
	datain => \Selector2~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \r_state.check_functioncode~regout\);

-- Location: LCCOMB_X61_Y21_N4
\Selector27~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector27~0_combout\ = (\f_state.manchester_converting~regout\ & (\r_state.check_functioncode~regout\ & \manchester_counter~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \f_state.manchester_converting~regout\,
	datab => \r_state.check_functioncode~regout\,
	datac => \manchester_counter~regout\,
	combout => \Selector27~0_combout\);

-- Location: LCCOMB_X61_Y21_N18
\Selector28~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector28~0_combout\ = (\start_bit8~0_combout\) # ((\f_state.manchester_converting~regout\ & ((!\r_state.check_functioncode~regout\) # (!\manchester_counter~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \manchester_counter~regout\,
	datab => \f_state.manchester_converting~regout\,
	datac => \r_state.check_functioncode~regout\,
	datad => \start_bit8~0_combout\,
	combout => \Selector28~0_combout\);

-- Location: LCCOMB_X61_Y21_N26
\Selector17~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector17~0_combout\ = (\Add1~0_combout\ & ((\Selector27~0_combout\) # ((functioncode_counter(2) & \Selector28~0_combout\)))) # (!\Add1~0_combout\ & (((functioncode_counter(2) & \Selector28~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~0_combout\,
	datab => \Selector27~0_combout\,
	datac => functioncode_counter(2),
	datad => \Selector28~0_combout\,
	combout => \Selector17~0_combout\);

-- Location: LCFF_X61_Y21_N27
\functioncode_counter[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \Selector17~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => functioncode_counter(2));

-- Location: LCCOMB_X62_Y21_N18
\f_state~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \f_state~10_combout\ = (\RESET~combout\ & !\fault~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \RESET~combout\,
	datac => \fault~regout\,
	combout => \f_state~10_combout\);

-- Location: LCCOMB_X62_Y21_N4
\Selector4~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector4~1_combout\ = ((!functioncode_counter(1) & (functioncode_counter(2) & !functioncode_counter(0)))) # (!\f_state~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => functioncode_counter(1),
	datab => functioncode_counter(2),
	datac => functioncode_counter(0),
	datad => \f_state~10_combout\,
	combout => \Selector4~1_combout\);

-- Location: LCCOMB_X64_Y21_N0
\Selector4~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector4~3_combout\ = (!address_counter(1) & (!address_counter(0) & (!\Equal2~0_combout\ & address_counter(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => address_counter(1),
	datab => address_counter(0),
	datac => \Equal2~0_combout\,
	datad => address_counter(2),
	combout => \Selector4~3_combout\);

-- Location: LCCOMB_X63_Y21_N14
\Selector4~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector4~4_combout\ = ((\r_state.check_address~regout\ & ((\fault~regout\) # (\Selector4~3_combout\)))) # (!\RESET~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fault~regout\,
	datab => \RESET~combout\,
	datac => \Selector4~3_combout\,
	datad => \r_state.check_address~regout\,
	combout => \Selector4~4_combout\);

-- Location: LCCOMB_X63_Y21_N30
\Selector4~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector4~2_combout\ = (!\r_state.check_address~regout\ & ((\respond_flag~regout\) # ((!\f_state~10_combout\) # (!\Equal0~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \r_state.check_address~regout\,
	datab => \respond_flag~regout\,
	datac => \Equal0~2_combout\,
	datad => \f_state~10_combout\,
	combout => \Selector4~2_combout\);

-- Location: LCCOMB_X63_Y21_N24
\Selector4~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector4~5_combout\ = (\r_state.check_functioncode~regout\ & (\Selector4~1_combout\)) # (!\r_state.check_functioncode~regout\ & (((\Selector4~4_combout\) # (\Selector4~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110111011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \r_state.check_functioncode~regout\,
	datab => \Selector4~1_combout\,
	datac => \Selector4~4_combout\,
	datad => \Selector4~2_combout\,
	combout => \Selector4~5_combout\);

-- Location: LCFF_X63_Y21_N3
\f_state.get_info\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~combout\,
	datain => \Selector5~0_combout\,
	ena => \Selector4~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \f_state.get_info~regout\);

-- Location: LCCOMB_X61_Y21_N6
\Selector19~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector19~2_combout\ = (\f_state.manchester_converting~regout\ & (functioncode_counter(0) $ (((\r_state.check_functioncode~regout\ & \manchester_counter~regout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \f_state.manchester_converting~regout\,
	datab => functioncode_counter(0),
	datac => \r_state.check_functioncode~regout\,
	datad => \manchester_counter~regout\,
	combout => \Selector19~2_combout\);

-- Location: LCCOMB_X61_Y21_N24
\Selector19~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector19~3_combout\ = (\Selector19~2_combout\) # ((functioncode_counter(0) & ((\f_state.get_data~regout\) # (\f_state.get_info~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \f_state.get_data~regout\,
	datab => \f_state.get_info~regout\,
	datac => functioncode_counter(0),
	datad => \Selector19~2_combout\,
	combout => \Selector19~3_combout\);

-- Location: LCFF_X61_Y21_N25
\functioncode_counter[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \Selector19~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => functioncode_counter(0));

-- Location: LCCOMB_X61_Y21_N30
\Selector18~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector18~0_combout\ = (functioncode_counter(1) & ((\Selector28~0_combout\) # ((\Selector27~0_combout\ & !functioncode_counter(0))))) # (!functioncode_counter(1) & (\Selector27~0_combout\ & (functioncode_counter(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector27~0_combout\,
	datab => functioncode_counter(0),
	datac => functioncode_counter(1),
	datad => \Selector28~0_combout\,
	combout => \Selector18~0_combout\);

-- Location: LCFF_X61_Y21_N31
\functioncode_counter[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \Selector18~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => functioncode_counter(1));

-- Location: LCCOMB_X61_Y21_N0
\Respond_Data[20]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Respond_Data[20]~0_combout\ = (!functioncode_counter(0) & (!functioncode_counter(1) & (\r_state.check_functioncode~regout\ & functioncode_counter(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => functioncode_counter(0),
	datab => functioncode_counter(1),
	datac => \r_state.check_functioncode~regout\,
	datad => functioncode_counter(2),
	combout => \Respond_Data[20]~0_combout\);

-- Location: LCCOMB_X63_Y21_N0
\Selector6~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector6~2_combout\ = (!\fault~regout\ & (\RESET~combout\ & ((\Equal2~0_combout\) # (!\Selector6~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fault~regout\,
	datab => \RESET~combout\,
	datac => \Equal2~0_combout\,
	datad => \Selector6~1_combout\,
	combout => \Selector6~2_combout\);

-- Location: LCCOMB_X64_Y21_N18
\Selector6~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector6~4_combout\ = (\Selector6~2_combout\ & ((\r_state.idle~regout\) # ((!\respond_flag~regout\ & \Equal0~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \respond_flag~regout\,
	datab => \Equal0~2_combout\,
	datac => \Selector6~2_combout\,
	datad => \r_state.idle~regout\,
	combout => \Selector6~4_combout\);

-- Location: LCCOMB_X64_Y21_N28
\Selector6~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector6~5_combout\ = (\Respond_Data[20]~0_combout\ & (\Selector6~0_combout\)) # (!\Respond_Data[20]~0_combout\ & (((\f_state.get_data~regout\ & \Selector6~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector6~0_combout\,
	datab => \Respond_Data[20]~0_combout\,
	datac => \f_state.get_data~regout\,
	datad => \Selector6~4_combout\,
	combout => \Selector6~5_combout\);

-- Location: LCFF_X64_Y21_N29
\f_state.get_data\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~combout\,
	datain => \Selector6~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \f_state.get_data~regout\);

-- Location: LCCOMB_X64_Y21_N22
\start_bit8~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \start_bit8~0_combout\ = (\f_state.get_data~regout\) # (\f_state.get_info~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \f_state.get_data~regout\,
	datad => \f_state.get_info~regout\,
	combout => \start_bit8~0_combout\);

-- Location: LCCOMB_X64_Y22_N12
\Selector16~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector16~0_combout\ = (\respond_flag~regout\ & ((\f_state.manchester_converting~regout\) # ((\start_bit8~0_combout\)))) # (!\respond_flag~regout\ & (((\Equal8~1_combout\ & \start_bit8~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \f_state.manchester_converting~regout\,
	datab => \Equal8~1_combout\,
	datac => \respond_flag~regout\,
	datad => \start_bit8~0_combout\,
	combout => \Selector16~0_combout\);

-- Location: LCFF_X64_Y22_N13
respond_flag : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \Selector16~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \respond_flag~regout\);

-- Location: LCCOMB_X63_Y21_N12
\Selector4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector4~0_combout\ = (!\r_state.check_functioncode~regout\ & (!\respond_flag~regout\ & (!\Equal0~2_combout\ & !\r_state.check_address~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \r_state.check_functioncode~regout\,
	datab => \respond_flag~regout\,
	datac => \Equal0~2_combout\,
	datad => \r_state.check_address~regout\,
	combout => \Selector4~0_combout\);

-- Location: LCFF_X63_Y21_N13
\f_state.manchester_converting\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~combout\,
	datain => \Selector4~0_combout\,
	ena => \Selector4~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \f_state.manchester_converting~regout\);

-- Location: LCCOMB_X61_Y21_N22
\Selector27~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector27~1_combout\ = (\m_f_bit3~regout\ & ((\Selector27~0_combout\) # ((\m_f_bit4~regout\ & \Selector28~0_combout\)))) # (!\m_f_bit3~regout\ & (((\m_f_bit4~regout\ & \Selector28~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \m_f_bit3~regout\,
	datab => \Selector27~0_combout\,
	datac => \m_f_bit4~regout\,
	datad => \Selector28~0_combout\,
	combout => \Selector27~1_combout\);

-- Location: LCFF_X61_Y21_N23
m_f_bit4 : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \Selector27~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \m_f_bit4~regout\);

-- Location: LCCOMB_X61_Y21_N8
\Selector30~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector30~0_combout\ = (\manchester_bit~0_combout\ & ((\Selector27~0_combout\) # ((\m_f_bit1~regout\ & \Selector28~0_combout\)))) # (!\manchester_bit~0_combout\ & (((\m_f_bit1~regout\ & \Selector28~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \manchester_bit~0_combout\,
	datab => \Selector27~0_combout\,
	datac => \m_f_bit1~regout\,
	datad => \Selector28~0_combout\,
	combout => \Selector30~0_combout\);

-- Location: LCFF_X61_Y21_N9
m_f_bit1 : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \Selector30~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \m_f_bit1~regout\);

-- Location: LCCOMB_X61_Y21_N2
\Selector29~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector29~0_combout\ = (\m_f_bit1~regout\ & ((\Selector27~0_combout\) # ((\m_f_bit2~regout\ & \Selector28~0_combout\)))) # (!\m_f_bit1~regout\ & (((\m_f_bit2~regout\ & \Selector28~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \m_f_bit1~regout\,
	datab => \Selector27~0_combout\,
	datac => \m_f_bit2~regout\,
	datad => \Selector28~0_combout\,
	combout => \Selector29~0_combout\);

-- Location: LCFF_X61_Y21_N3
m_f_bit2 : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \Selector29~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \m_f_bit2~regout\);

-- Location: LCCOMB_X61_Y21_N20
\Equal4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal4~0_combout\ = (\m_f_bit3~regout\) # ((\m_f_bit4~regout\) # ((\m_f_bit2~regout\) # (!\m_f_bit1~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \m_f_bit3~regout\,
	datab => \m_f_bit4~regout\,
	datac => \m_f_bit1~regout\,
	datad => \m_f_bit2~regout\,
	combout => \Equal4~0_combout\);

-- Location: LCCOMB_X61_Y21_N10
\Selector6~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector6~0_combout\ = (!\m_f_bit3~regout\ & (!\m_f_bit4~regout\ & (!\m_f_bit1~regout\ & \m_f_bit2~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \m_f_bit3~regout\,
	datab => \m_f_bit4~regout\,
	datac => \m_f_bit1~regout\,
	datad => \m_f_bit2~regout\,
	combout => \Selector6~0_combout\);

-- Location: LCCOMB_X64_Y22_N20
\Selector6~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector6~3_combout\ = (!\r_state.idle~regout\ & ((\respond_flag~regout\) # ((!\Equal0~1_combout\ & !\Equal0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010001000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \r_state.idle~regout\,
	datab => \respond_flag~regout\,
	datac => \Equal0~1_combout\,
	datad => \Equal0~0_combout\,
	combout => \Selector6~3_combout\);

-- Location: LCCOMB_X64_Y22_N18
\Selector3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector3~0_combout\ = (\respond_flag~regout\) # ((!\Equal2~0_combout\ & \Selector6~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \respond_flag~regout\,
	datac => \Equal2~0_combout\,
	datad => \Selector6~1_combout\,
	combout => \Selector3~0_combout\);

-- Location: LCCOMB_X64_Y22_N0
\Selector3~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector3~1_combout\ = (\Selector6~3_combout\ & (((!\Selector3~0_combout\)))) # (!\Selector6~3_combout\ & (\f_state.idle~regout\ & (\Selector6~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \f_state.idle~regout\,
	datab => \Selector6~2_combout\,
	datac => \Selector6~3_combout\,
	datad => \Selector3~0_combout\,
	combout => \Selector3~1_combout\);

-- Location: LCCOMB_X64_Y22_N8
\Selector3~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector3~2_combout\ = (\Respond_Data[20]~0_combout\ & (((\Selector6~0_combout\)) # (!\Equal4~0_combout\))) # (!\Respond_Data[20]~0_combout\ & (((\Selector3~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011110100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Respond_Data[20]~0_combout\,
	datab => \Equal4~0_combout\,
	datac => \Selector6~0_combout\,
	datad => \Selector3~1_combout\,
	combout => \Selector3~2_combout\);

-- Location: LCFF_X64_Y22_N9
\f_state.idle\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~combout\,
	datain => \Selector3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \f_state.idle~regout\);

-- Location: LCCOMB_X62_Y22_N0
\output_data~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \output_data~1_combout\ = (!\f_state.manchester_converting~regout\ & \f_state.idle~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \f_state.manchester_converting~regout\,
	datad => \f_state.idle~regout\,
	combout => \output_data~1_combout\);

-- Location: LCFF_X62_Y22_N23
\respond_counter[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \respond_counter[0]~0_combout\,
	ena => \output_data~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => respond_counter(0));

-- Location: LCCOMB_X62_Y22_N18
\Equal8~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal8~0_combout\ = (!respond_counter(3) & (respond_counter(0) & (respond_counter(2) & respond_counter(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => respond_counter(3),
	datab => respond_counter(0),
	datac => respond_counter(2),
	datad => respond_counter(1),
	combout => \Equal8~0_combout\);

-- Location: LCCOMB_X62_Y22_N10
\Selector32~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector32~0_combout\ = (!\Equal8~0_combout\ & (respond_counter(4) $ (((\Add3~0_combout\ & respond_counter(3))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add3~0_combout\,
	datab => \Equal8~0_combout\,
	datac => respond_counter(4),
	datad => respond_counter(3),
	combout => \Selector32~0_combout\);

-- Location: LCFF_X62_Y22_N11
\respond_counter[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \Selector32~0_combout\,
	ena => \output_data~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => respond_counter(4));

-- Location: PIN_P2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\in_switches[12]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_in_switches(12),
	combout => \in_switches~combout\(12));

-- Location: LCCOMB_X60_Y22_N24
\Respond_Data[17]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Respond_Data[17]~1_combout\ = (\Respond_Data[20]~0_combout\ & ((\Selector6~0_combout\) # (!\Equal4~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Selector6~0_combout\,
	datac => \Equal4~0_combout\,
	datad => \Respond_Data[20]~0_combout\,
	combout => \Respond_Data[17]~1_combout\);

-- Location: LCFF_X61_Y22_N15
\Respond_Data[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~combout\,
	sdata => \in_switches~combout\(12),
	sload => VCC,
	ena => \Respond_Data[17]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Respond_Data(12));

-- Location: PIN_U3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\in_switches[14]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_in_switches(14),
	combout => \in_switches~combout\(14));

-- Location: LCFF_X61_Y22_N19
\Respond_Data[14]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~combout\,
	sdata => \in_switches~combout\(14),
	sload => VCC,
	ena => \Respond_Data[17]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Respond_Data(14));

-- Location: PIN_N1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\in_switches[10]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_in_switches(10),
	combout => \in_switches~combout\(10));

-- Location: LCCOMB_X61_Y22_N12
\Respond_Data[10]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \Respond_Data[10]~feeder_combout\ = \in_switches~combout\(10)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \in_switches~combout\(10),
	combout => \Respond_Data[10]~feeder_combout\);

-- Location: LCFF_X61_Y22_N13
\Respond_Data[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~combout\,
	datain => \Respond_Data[10]~feeder_combout\,
	ena => \Respond_Data[17]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Respond_Data(10));

-- Location: LCCOMB_X61_Y22_N18
\Mux0~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux0~7_combout\ = (respond_counter(2) & ((respond_counter(1)) # ((Respond_Data(10))))) # (!respond_counter(2) & (!respond_counter(1) & (Respond_Data(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => respond_counter(2),
	datab => respond_counter(1),
	datac => Respond_Data(14),
	datad => Respond_Data(10),
	combout => \Mux0~7_combout\);

-- Location: LCCOMB_X61_Y22_N14
\Mux0~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux0~8_combout\ = (respond_counter(1) & ((\Mux0~7_combout\ & (Respond_Data(8))) # (!\Mux0~7_combout\ & ((Respond_Data(12)))))) # (!respond_counter(1) & (((\Mux0~7_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Respond_Data(8),
	datab => respond_counter(1),
	datac => Respond_Data(12),
	datad => \Mux0~7_combout\,
	combout => \Mux0~8_combout\);

-- Location: PIN_N26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\in_switches[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_in_switches(1),
	combout => \in_switches~combout\(1));

-- Location: LCCOMB_X60_Y22_N4
\Respond_Data[1]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \Respond_Data[1]~feeder_combout\ = \in_switches~combout\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \in_switches~combout\(1),
	combout => \Respond_Data[1]~feeder_combout\);

-- Location: LCFF_X60_Y22_N5
\Respond_Data[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~combout\,
	datain => \Respond_Data[1]~feeder_combout\,
	ena => \Respond_Data[17]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Respond_Data(1));

-- Location: PIN_AE14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\in_switches[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_in_switches(3),
	combout => \in_switches~combout\(3));

-- Location: LCFF_X60_Y22_N31
\Respond_Data[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~combout\,
	sdata => \in_switches~combout\(3),
	sload => VCC,
	ena => \Respond_Data[17]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Respond_Data(3));

-- Location: PIN_C13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\in_switches[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_in_switches(7),
	combout => \in_switches~combout\(7));

-- Location: LCFF_X60_Y22_N19
\Respond_Data[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~combout\,
	sdata => \in_switches~combout\(7),
	sload => VCC,
	ena => \Respond_Data[17]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Respond_Data(7));

-- Location: PIN_AD13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\in_switches[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_in_switches(5),
	combout => \in_switches~combout\(5));

-- Location: LCCOMB_X60_Y22_N28
\Respond_Data[5]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \Respond_Data[5]~feeder_combout\ = \in_switches~combout\(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \in_switches~combout\(5),
	combout => \Respond_Data[5]~feeder_combout\);

-- Location: LCFF_X60_Y22_N29
\Respond_Data[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~combout\,
	datain => \Respond_Data[5]~feeder_combout\,
	ena => \Respond_Data[17]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Respond_Data(5));

-- Location: LCCOMB_X60_Y22_N18
\Mux0~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux0~4_combout\ = (respond_counter(2) & (respond_counter(1))) # (!respond_counter(2) & ((respond_counter(1) & ((Respond_Data(5)))) # (!respond_counter(1) & (Respond_Data(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => respond_counter(2),
	datab => respond_counter(1),
	datac => Respond_Data(7),
	datad => Respond_Data(5),
	combout => \Mux0~4_combout\);

-- Location: LCCOMB_X60_Y22_N30
\Mux0~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux0~5_combout\ = (respond_counter(2) & ((\Mux0~4_combout\ & (Respond_Data(1))) # (!\Mux0~4_combout\ & ((Respond_Data(3)))))) # (!respond_counter(2) & (((\Mux0~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => respond_counter(2),
	datab => Respond_Data(1),
	datac => Respond_Data(3),
	datad => \Mux0~4_combout\,
	combout => \Mux0~5_combout\);

-- Location: PIN_N25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\in_switches[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_in_switches(0),
	combout => \in_switches~combout\(0));

-- Location: LCCOMB_X60_Y22_N16
\Respond_Data[0]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \Respond_Data[0]~feeder_combout\ = \in_switches~combout\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \in_switches~combout\(0),
	combout => \Respond_Data[0]~feeder_combout\);

-- Location: LCFF_X60_Y22_N17
\Respond_Data[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~combout\,
	datain => \Respond_Data[0]~feeder_combout\,
	ena => \Respond_Data[17]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Respond_Data(0));

-- Location: PIN_P25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\in_switches[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_in_switches(2),
	combout => \in_switches~combout\(2));

-- Location: LCFF_X60_Y22_N15
\Respond_Data[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~combout\,
	sdata => \in_switches~combout\(2),
	sload => VCC,
	ena => \Respond_Data[17]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Respond_Data(2));

-- Location: PIN_AC13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\in_switches[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_in_switches(6),
	combout => \in_switches~combout\(6));

-- Location: LCFF_X60_Y22_N23
\Respond_Data[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~combout\,
	sdata => \in_switches~combout\(6),
	sload => VCC,
	ena => \Respond_Data[17]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Respond_Data(6));

-- Location: PIN_AF14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\in_switches[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_in_switches(4),
	combout => \in_switches~combout\(4));

-- Location: LCCOMB_X60_Y22_N0
\Respond_Data[4]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \Respond_Data[4]~feeder_combout\ = \in_switches~combout\(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \in_switches~combout\(4),
	combout => \Respond_Data[4]~feeder_combout\);

-- Location: LCFF_X60_Y22_N1
\Respond_Data[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~combout\,
	datain => \Respond_Data[4]~feeder_combout\,
	ena => \Respond_Data[17]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Respond_Data(4));

-- Location: LCCOMB_X60_Y22_N22
\Mux0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux0~2_combout\ = (respond_counter(2) & (respond_counter(1))) # (!respond_counter(2) & ((respond_counter(1) & ((Respond_Data(4)))) # (!respond_counter(1) & (Respond_Data(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => respond_counter(2),
	datab => respond_counter(1),
	datac => Respond_Data(6),
	datad => Respond_Data(4),
	combout => \Mux0~2_combout\);

-- Location: LCCOMB_X60_Y22_N14
\Mux0~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux0~3_combout\ = (respond_counter(2) & ((\Mux0~2_combout\ & (Respond_Data(0))) # (!\Mux0~2_combout\ & ((Respond_Data(2)))))) # (!respond_counter(2) & (((\Mux0~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => respond_counter(2),
	datab => Respond_Data(0),
	datac => Respond_Data(2),
	datad => \Mux0~2_combout\,
	combout => \Mux0~3_combout\);

-- Location: LCCOMB_X61_Y22_N28
\Mux0~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux0~6_combout\ = (respond_counter(3) & (respond_counter(0))) # (!respond_counter(3) & ((respond_counter(0) & ((\Mux0~3_combout\))) # (!respond_counter(0) & (\Mux0~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => respond_counter(3),
	datab => respond_counter(0),
	datac => \Mux0~5_combout\,
	datad => \Mux0~3_combout\,
	combout => \Mux0~6_combout\);

-- Location: LCCOMB_X61_Y22_N0
\Mux0~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux0~9_combout\ = (respond_counter(3) & ((\Mux0~6_combout\ & ((\Mux0~8_combout\))) # (!\Mux0~6_combout\ & (\Mux0~1_combout\)))) # (!respond_counter(3) & (((\Mux0~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux0~1_combout\,
	datab => \Mux0~8_combout\,
	datac => respond_counter(3),
	datad => \Mux0~6_combout\,
	combout => \Mux0~9_combout\);

-- Location: LCCOMB_X61_Y22_N2
\output_data~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \output_data~2_combout\ = (respond_counter(4) & (!\Equal8~1_combout\ & (!respond_counter(3) & \Mux0~9_combout\))) # (!respond_counter(4) & (((!\Equal8~1_combout\ & \Mux0~9_combout\)) # (!respond_counter(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001011100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal8~1_combout\,
	datab => respond_counter(4),
	datac => respond_counter(3),
	datad => \Mux0~9_combout\,
	combout => \output_data~2_combout\);

-- Location: LCCOMB_X61_Y22_N20
\output_data~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \output_data~3_combout\ = (\output_data~2_combout\ & ((respond_counter(4) & ((!respond_counter(3)))) # (!respond_counter(4) & ((\output_data~0_combout\) # (respond_counter(3))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \output_data~0_combout\,
	datab => respond_counter(4),
	datac => respond_counter(3),
	datad => \output_data~2_combout\,
	combout => \output_data~3_combout\);

-- Location: LCFF_X61_Y22_N21
output_data : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \output_data~3_combout\,
	ena => \output_data~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \output_data~regout\);

-- Location: PIN_AA9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ADC_DATA[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ADC_DATA(0));

-- Location: PIN_AF17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ADC_DATA[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ADC_DATA(1));

-- Location: PIN_D21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ADC_DATA[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ADC_DATA(2));

-- Location: PIN_AB10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ADC_DATA[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ADC_DATA(3));

-- Location: PIN_AA26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ADC_DATA[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ADC_DATA(4));

-- Location: PIN_AA15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ADC_DATA[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ADC_DATA(5));

-- Location: PIN_K1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ADC_DATA[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ADC_DATA(6));

-- Location: PIN_H15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ADC_DATA[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ADC_DATA(7));

-- Location: PIN_H24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ADC_DATA[8]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ADC_DATA(8));

-- Location: PIN_V17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ADC_DATA[9]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ADC_DATA(9));

-- Location: PIN_B10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ADC_DATA[10]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ADC_DATA(10));

-- Location: PIN_P23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ADC_DATA[11]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ADC_DATA(11));

-- Location: PIN_AD19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ADC_DATA_RDY~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ADC_DATA_RDY);

-- Location: PIN_M24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\R_DATA~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_R_DATA);

-- Location: PIN_E26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\R_DATA_debigging~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \output_data~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_R_DATA_debigging);
END structure;


