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
-- PROGRAM "Quartus II 32-bit"
-- VERSION "Version 12.1 Build 177 11/07/2012 SJ Full Version"

-- DATE "04/11/2014 13:49:55"

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

ENTITY 	initial_recieve_program IS
    PORT (
	START_o : OUT std_logic_vector(7 DOWNTO 0);
	ADDR_o : OUT std_logic_vector(3 DOWNTO 0);
	current_state : OUT std_logic_vector(3 DOWNTO 0);
	CLK : IN std_logic;
	RESET : IN std_logic;
	DATA : IN std_logic;
	LEDS : OUT std_logic_vector(3 DOWNTO 0)
	);
END initial_recieve_program;

-- Design Ports Information
-- START_o[0]	=>  Location: PIN_N20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- START_o[1]	=>  Location: PIN_M19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- START_o[2]	=>  Location: PIN_M21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- START_o[3]	=>  Location: PIN_L25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- START_o[4]	=>  Location: PIN_L24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- START_o[5]	=>  Location: PIN_M24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- START_o[6]	=>  Location: PIN_N24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- START_o[7]	=>  Location: PIN_M20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ADDR_o[0]	=>  Location: PIN_M22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ADDR_o[1]	=>  Location: PIN_M23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ADDR_o[2]	=>  Location: PIN_L23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ADDR_o[3]	=>  Location: PIN_L19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- current_state[0]	=>  Location: PIN_N23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- current_state[1]	=>  Location: PIN_J25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- current_state[2]	=>  Location: PIN_P24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- current_state[3]	=>  Location: PIN_E25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- LEDS[0]	=>  Location: PIN_AE23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- LEDS[1]	=>  Location: PIN_AF23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- LEDS[2]	=>  Location: PIN_AB21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- LEDS[3]	=>  Location: PIN_C22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- DATA	=>  Location: PIN_K26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- CLK	=>  Location: PIN_K25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- RESET	=>  Location: PIN_G26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF initial_recieve_program IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_START_o : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_ADDR_o : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_current_state : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_CLK : std_logic;
SIGNAL ww_RESET : std_logic;
SIGNAL ww_DATA : std_logic;
SIGNAL ww_LEDS : std_logic_vector(3 DOWNTO 0);
SIGNAL \state~13_combout\ : std_logic;
SIGNAL \Selector11~0_combout\ : std_logic;
SIGNAL \Add0~0_combout\ : std_logic;
SIGNAL \CLK~combout\ : std_logic;
SIGNAL \Selector8~0_combout\ : std_logic;
SIGNAL \bit_count~regout\ : std_logic;
SIGNAL \Selector10~0_combout\ : std_logic;
SIGNAL \Selector10~1_combout\ : std_logic;
SIGNAL \RESET~combout\ : std_logic;
SIGNAL \LEDS[0]~1_combout\ : std_logic;
SIGNAL \Selector9~0_combout\ : std_logic;
SIGNAL \state~8_combout\ : std_logic;
SIGNAL \Selector14~0_combout\ : std_logic;
SIGNAL \Selector4~0_combout\ : std_logic;
SIGNAL \s4~regout\ : std_logic;
SIGNAL \Selector3~0_combout\ : std_logic;
SIGNAL \s5~regout\ : std_logic;
SIGNAL \Selector2~0_combout\ : std_logic;
SIGNAL \s6~regout\ : std_logic;
SIGNAL \Selector1~0_combout\ : std_logic;
SIGNAL \s7~regout\ : std_logic;
SIGNAL \Selector0~0_combout\ : std_logic;
SIGNAL \s8~regout\ : std_logic;
SIGNAL \Equal0~1_combout\ : std_logic;
SIGNAL \Selector6~0_combout\ : std_logic;
SIGNAL \s2~regout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \state~15_combout\ : std_logic;
SIGNAL \state~16_combout\ : std_logic;
SIGNAL \state.idle~regout\ : std_logic;
SIGNAL \r1~0_combout\ : std_logic;
SIGNAL \r3~regout\ : std_logic;
SIGNAL \Selector13~0_combout\ : std_logic;
SIGNAL \r4~regout\ : std_logic;
SIGNAL \state~10_combout\ : std_logic;
SIGNAL \state~14_combout\ : std_logic;
SIGNAL \state.get_data~regout\ : std_logic;
SIGNAL \DATA~combout\ : std_logic;
SIGNAL \b1~0_combout\ : std_logic;
SIGNAL \b1~regout\ : std_logic;
SIGNAL \Equal4~0_combout\ : std_logic;
SIGNAL \r1~regout\ : std_logic;
SIGNAL \Selector15~0_combout\ : std_logic;
SIGNAL \r2~regout\ : std_logic;
SIGNAL \state~9_combout\ : std_logic;
SIGNAL \state~11_combout\ : std_logic;
SIGNAL \state~12_combout\ : std_logic;
SIGNAL \state.address_check~regout\ : std_logic;
SIGNAL \Selector7~0_combout\ : std_logic;
SIGNAL \s1~regout\ : std_logic;
SIGNAL \Selector5~0_combout\ : std_logic;
SIGNAL \s3~regout\ : std_logic;
SIGNAL \current_state[0]~0_combout\ : std_logic;
SIGNAL \current_state[0]~reg0_regout\ : std_logic;
SIGNAL \current_state[1]~reg0feeder_combout\ : std_logic;
SIGNAL \current_state[1]~reg0_regout\ : std_logic;
SIGNAL \LEDS~0_combout\ : std_logic;
SIGNAL \LEDS[0]~reg0_regout\ : std_logic;
SIGNAL \LEDS~2_combout\ : std_logic;
SIGNAL \LEDS[1]~reg0_regout\ : std_logic;
SIGNAL \LEDS~3_combout\ : std_logic;
SIGNAL \LEDS[2]~reg0_regout\ : std_logic;
SIGNAL \LEDS~4_combout\ : std_logic;
SIGNAL \LEDS[3]~reg0_regout\ : std_logic;
SIGNAL address_counter : std_logic_vector(2 DOWNTO 0);
SIGNAL \ALT_INV_CLK~combout\ : std_logic;
SIGNAL \ALT_INV_state.get_data~regout\ : std_logic;

BEGIN

START_o <= ww_START_o;
ADDR_o <= ww_ADDR_o;
current_state <= ww_current_state;
ww_CLK <= CLK;
ww_RESET <= RESET;
ww_DATA <= DATA;
LEDS <= ww_LEDS;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_CLK~combout\ <= NOT \CLK~combout\;
\ALT_INV_state.get_data~regout\ <= NOT \state.get_data~regout\;

-- Location: LCFF_X64_Y22_N25
\address_counter[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~combout\,
	datain => \Selector11~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => address_counter(0));

-- Location: LCCOMB_X63_Y22_N12
\state~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \state~13_combout\ = (!\Equal0~1_combout\ & !\Equal0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Equal0~1_combout\,
	datad => \Equal0~0_combout\,
	combout => \state~13_combout\);

-- Location: LCCOMB_X64_Y22_N24
\Selector11~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector11~0_combout\ = (address_counter(0) & ((\state.get_data~regout\) # ((!\bit_count~regout\ & \state.address_check~regout\)))) # (!address_counter(0) & (\bit_count~regout\ & (\state.address_check~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bit_count~regout\,
	datab => \state.address_check~regout\,
	datac => address_counter(0),
	datad => \state.get_data~regout\,
	combout => \Selector11~0_combout\);

-- Location: LCCOMB_X64_Y22_N12
\Add0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~0_combout\ = address_counter(2) $ (((address_counter(0) & (\bit_count~regout\ & address_counter(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => address_counter(0),
	datab => address_counter(2),
	datac => \bit_count~regout\,
	datad => address_counter(1),
	combout => \Add0~0_combout\);

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

-- Location: LCCOMB_X64_Y22_N6
\Selector8~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector8~0_combout\ = (\bit_count~regout\ & (\state.get_data~regout\)) # (!\bit_count~regout\ & ((\state.address_check~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.get_data~regout\,
	datac => \bit_count~regout\,
	datad => \state.address_check~regout\,
	combout => \Selector8~0_combout\);

-- Location: LCFF_X64_Y22_N7
bit_count : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~combout\,
	datain => \Selector8~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \bit_count~regout\);

-- Location: LCCOMB_X64_Y22_N26
\Selector10~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector10~0_combout\ = (\state.address_check~regout\ & (address_counter(1) $ (((address_counter(0) & \bit_count~regout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => address_counter(0),
	datab => address_counter(1),
	datac => \bit_count~regout\,
	datad => \state.address_check~regout\,
	combout => \Selector10~0_combout\);

-- Location: LCCOMB_X64_Y22_N30
\Selector10~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector10~1_combout\ = (\Selector10~0_combout\) # ((\state.get_data~regout\ & address_counter(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.get_data~regout\,
	datac => address_counter(1),
	datad => \Selector10~0_combout\,
	combout => \Selector10~1_combout\);

-- Location: LCFF_X64_Y22_N31
\address_counter[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~combout\,
	datain => \Selector10~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => address_counter(1));

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
\LEDS[0]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \LEDS[0]~1_combout\ = (\state.get_data~regout\) # (!\RESET~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \RESET~combout\,
	datad => \state.get_data~regout\,
	combout => \LEDS[0]~1_combout\);

-- Location: LCCOMB_X64_Y22_N22
\Selector9~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector9~0_combout\ = (\Add0~0_combout\ & ((\state.address_check~regout\) # ((address_counter(2) & \state.get_data~regout\)))) # (!\Add0~0_combout\ & (((address_counter(2) & \state.get_data~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~0_combout\,
	datab => \state.address_check~regout\,
	datac => address_counter(2),
	datad => \state.get_data~regout\,
	combout => \Selector9~0_combout\);

-- Location: LCFF_X64_Y22_N23
\address_counter[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~combout\,
	datain => \Selector9~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => address_counter(2));

-- Location: LCCOMB_X64_Y22_N16
\state~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \state~8_combout\ = (!\LEDS[0]~1_combout\ & ((address_counter(0)) # ((address_counter(1)) # (!address_counter(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => address_counter(0),
	datab => address_counter(1),
	datac => \LEDS[0]~1_combout\,
	datad => address_counter(2),
	combout => \state~8_combout\);

-- Location: LCCOMB_X62_Y22_N8
\Selector14~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector14~0_combout\ = (\state.get_data~regout\) # (\r2~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \state.get_data~regout\,
	datad => \r2~regout\,
	combout => \Selector14~0_combout\);

-- Location: LCCOMB_X63_Y22_N14
\Selector4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector4~0_combout\ = (\s3~regout\) # (\state.address_check~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s3~regout\,
	datac => \state.address_check~regout\,
	combout => \Selector4~0_combout\);

-- Location: LCFF_X63_Y22_N15
s4 : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~combout\,
	datain => \Selector4~0_combout\,
	ena => \ALT_INV_state.get_data~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \s4~regout\);

-- Location: LCCOMB_X63_Y22_N0
\Selector3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector3~0_combout\ = (\state.address_check~regout\) # (\s4~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \state.address_check~regout\,
	datad => \s4~regout\,
	combout => \Selector3~0_combout\);

-- Location: LCFF_X63_Y22_N1
s5 : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~combout\,
	datain => \Selector3~0_combout\,
	ena => \ALT_INV_state.get_data~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \s5~regout\);

-- Location: LCCOMB_X63_Y22_N6
\Selector2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector2~0_combout\ = (\state.address_check~regout\) # (\s5~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \state.address_check~regout\,
	datad => \s5~regout\,
	combout => \Selector2~0_combout\);

-- Location: LCFF_X63_Y22_N7
s6 : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~combout\,
	datain => \Selector2~0_combout\,
	ena => \ALT_INV_state.get_data~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \s6~regout\);

-- Location: LCCOMB_X63_Y22_N4
\Selector1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector1~0_combout\ = (\state.address_check~regout\) # (\s6~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \state.address_check~regout\,
	datad => \s6~regout\,
	combout => \Selector1~0_combout\);

-- Location: LCFF_X63_Y22_N5
s7 : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~combout\,
	datain => \Selector1~0_combout\,
	ena => \ALT_INV_state.get_data~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \s7~regout\);

-- Location: LCCOMB_X63_Y22_N2
\Selector0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector0~0_combout\ = (\s7~regout\) # (\state.address_check~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \s7~regout\,
	datac => \state.address_check~regout\,
	combout => \Selector0~0_combout\);

-- Location: LCFF_X63_Y22_N3
s8 : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~combout\,
	datain => \Selector0~0_combout\,
	ena => \ALT_INV_state.get_data~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \s8~regout\);

-- Location: LCCOMB_X63_Y22_N8
\Equal0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~1_combout\ = ((\s8~regout\) # ((\s5~regout\) # (!\s7~regout\))) # (!\s6~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s6~regout\,
	datab => \s8~regout\,
	datac => \s7~regout\,
	datad => \s5~regout\,
	combout => \Equal0~1_combout\);

-- Location: LCCOMB_X63_Y22_N26
\Selector6~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector6~0_combout\ = (\state.address_check~regout\) # (\s1~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \state.address_check~regout\,
	datad => \s1~regout\,
	combout => \Selector6~0_combout\);

-- Location: LCFF_X63_Y22_N27
s2 : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~combout\,
	datain => \Selector6~0_combout\,
	ena => \ALT_INV_state.get_data~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \s2~regout\);

-- Location: LCCOMB_X63_Y22_N22
\Equal0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = (\s3~regout\) # ((\s2~regout\) # ((!\s1~regout\) # (!\s4~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s3~regout\,
	datab => \s2~regout\,
	datac => \s4~regout\,
	datad => \s1~regout\,
	combout => \Equal0~0_combout\);

-- Location: LCCOMB_X63_Y22_N30
\state~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \state~15_combout\ = (\Equal0~1_combout\) # (\Equal0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Equal0~1_combout\,
	datad => \Equal0~0_combout\,
	combout => \state~15_combout\);

-- Location: LCCOMB_X63_Y22_N24
\state~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \state~16_combout\ = (\state~8_combout\ & (((\state.idle~regout\) # (!\state~10_combout\)) # (!\state~15_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state~8_combout\,
	datab => \state~15_combout\,
	datac => \state.idle~regout\,
	datad => \state~10_combout\,
	combout => \state~16_combout\);

-- Location: LCFF_X63_Y22_N25
\state.idle\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \state~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \state.idle~regout\);

-- Location: LCCOMB_X62_Y22_N20
\r1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \r1~0_combout\ = (\state.idle~regout\ & ((\bit_count~regout\) # (!\state.address_check~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bit_count~regout\,
	datac => \state.address_check~regout\,
	datad => \state.idle~regout\,
	combout => \r1~0_combout\);

-- Location: LCFF_X62_Y22_N9
r3 : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~combout\,
	datain => \Selector14~0_combout\,
	ena => \r1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \r3~regout\);

-- Location: LCCOMB_X62_Y22_N10
\Selector13~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector13~0_combout\ = (\state.get_data~regout\) # (\r3~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \state.get_data~regout\,
	datad => \r3~regout\,
	combout => \Selector13~0_combout\);

-- Location: LCFF_X62_Y22_N11
r4 : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~combout\,
	datain => \Selector13~0_combout\,
	ena => \r1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \r4~regout\);

-- Location: LCCOMB_X62_Y22_N16
\state~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \state~10_combout\ = (\r3~regout\) # ((\r4~regout\) # (\r1~regout\ $ (!\r2~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \r1~regout\,
	datab => \r2~regout\,
	datac => \r3~regout\,
	datad => \r4~regout\,
	combout => \state~10_combout\);

-- Location: LCCOMB_X63_Y22_N10
\state~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \state~14_combout\ = (\state~9_combout\ & (\state~8_combout\ & ((\state~13_combout\) # (!\state~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state~13_combout\,
	datab => \state~9_combout\,
	datac => \state~8_combout\,
	datad => \state~10_combout\,
	combout => \state~14_combout\);

-- Location: LCFF_X63_Y22_N11
\state.get_data\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \state~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \state.get_data~regout\);

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

-- Location: LCCOMB_X64_Y22_N20
\b1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \b1~0_combout\ = (\bit_count~regout\ & (((\b1~regout\)))) # (!\bit_count~regout\ & ((\state.address_check~regout\ & (\DATA~combout\)) # (!\state.address_check~regout\ & ((\b1~regout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bit_count~regout\,
	datab => \DATA~combout\,
	datac => \b1~regout\,
	datad => \state.address_check~regout\,
	combout => \b1~0_combout\);

-- Location: LCFF_X64_Y22_N21
b1 : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~combout\,
	datain => \b1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \b1~regout\);

-- Location: LCCOMB_X62_Y22_N24
\Equal4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal4~0_combout\ = (\b1~regout\) # (!\DATA~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \DATA~combout\,
	datad => \b1~regout\,
	combout => \Equal4~0_combout\);

-- Location: LCFF_X62_Y22_N25
r1 : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~combout\,
	datain => \Equal4~0_combout\,
	sdata => VCC,
	sload => \state.get_data~regout\,
	ena => \r1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \r1~regout\);

-- Location: LCCOMB_X62_Y22_N22
\Selector15~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector15~0_combout\ = (\state.get_data~regout\) # (\r1~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \state.get_data~regout\,
	datad => \r1~regout\,
	combout => \Selector15~0_combout\);

-- Location: LCFF_X62_Y22_N23
r2 : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~combout\,
	datain => \Selector15~0_combout\,
	ena => \r1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \r2~regout\);

-- Location: LCCOMB_X62_Y22_N18
\state~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \state~9_combout\ = (!\r4~regout\ & (!\r3~regout\ & (\r2~regout\ $ (\r1~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \r4~regout\,
	datab => \r2~regout\,
	datac => \r3~regout\,
	datad => \r1~regout\,
	combout => \state~9_combout\);

-- Location: LCCOMB_X63_Y22_N18
\state~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \state~11_combout\ = (\Equal0~0_combout\ & (\state.address_check~regout\)) # (!\Equal0~0_combout\ & ((\Equal0~1_combout\ & (\state.address_check~regout\)) # (!\Equal0~1_combout\ & ((!\state~9_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100010101011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.address_check~regout\,
	datab => \Equal0~0_combout\,
	datac => \Equal0~1_combout\,
	datad => \state~9_combout\,
	combout => \state~11_combout\);

-- Location: LCCOMB_X63_Y22_N16
\state~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \state~12_combout\ = (\state~8_combout\ & ((\state~10_combout\ & ((\state~11_combout\))) # (!\state~10_combout\ & (!\state~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state~8_combout\,
	datab => \state~9_combout\,
	datac => \state~10_combout\,
	datad => \state~11_combout\,
	combout => \state~12_combout\);

-- Location: LCFF_X63_Y22_N17
\state.address_check\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \state~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \state.address_check~regout\);

-- Location: LCCOMB_X63_Y22_N28
\Selector7~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector7~0_combout\ = (\state.address_check~regout\) # (\DATA~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \state.address_check~regout\,
	datad => \DATA~combout\,
	combout => \Selector7~0_combout\);

-- Location: LCFF_X63_Y22_N29
s1 : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~combout\,
	datain => \Selector7~0_combout\,
	ena => \ALT_INV_state.get_data~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \s1~regout\);

-- Location: LCCOMB_X63_Y22_N20
\Selector5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector5~0_combout\ = (\state.address_check~regout\) # (\s2~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \state.address_check~regout\,
	datad => \s2~regout\,
	combout => \Selector5~0_combout\);

-- Location: LCFF_X63_Y22_N21
s3 : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~combout\,
	datain => \Selector5~0_combout\,
	ena => \ALT_INV_state.get_data~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \s3~regout\);

-- Location: LCCOMB_X64_Y22_N8
\current_state[0]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \current_state[0]~0_combout\ = !\state.address_check~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \state.address_check~regout\,
	combout => \current_state[0]~0_combout\);

-- Location: LCFF_X64_Y22_N9
\current_state[0]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~combout\,
	datain => \current_state[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \current_state[0]~reg0_regout\);

-- Location: LCCOMB_X64_Y22_N10
\current_state[1]~reg0feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \current_state[1]~reg0feeder_combout\ = \state.idle~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \state.idle~regout\,
	combout => \current_state[1]~reg0feeder_combout\);

-- Location: LCFF_X64_Y22_N11
\current_state[1]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~combout\,
	datain => \current_state[1]~reg0feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \current_state[1]~reg0_regout\);

-- Location: LCCOMB_X64_Y22_N0
\LEDS~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \LEDS~0_combout\ = (\r1~regout\ & \state.get_data~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \r1~regout\,
	datad => \state.get_data~regout\,
	combout => \LEDS~0_combout\);

-- Location: LCFF_X64_Y22_N1
\LEDS[0]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~combout\,
	datain => \LEDS~0_combout\,
	ena => \LEDS[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \LEDS[0]~reg0_regout\);

-- Location: LCCOMB_X64_Y22_N2
\LEDS~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \LEDS~2_combout\ = (\r2~regout\ & \state.get_data~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \r2~regout\,
	datad => \state.get_data~regout\,
	combout => \LEDS~2_combout\);

-- Location: LCFF_X64_Y22_N3
\LEDS[1]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~combout\,
	datain => \LEDS~2_combout\,
	ena => \LEDS[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \LEDS[1]~reg0_regout\);

-- Location: LCCOMB_X64_Y22_N28
\LEDS~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \LEDS~3_combout\ = (\r3~regout\ & \state.get_data~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \r3~regout\,
	datad => \state.get_data~regout\,
	combout => \LEDS~3_combout\);

-- Location: LCFF_X64_Y22_N29
\LEDS[2]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~combout\,
	datain => \LEDS~3_combout\,
	ena => \LEDS[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \LEDS[2]~reg0_regout\);

-- Location: LCCOMB_X64_Y22_N18
\LEDS~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \LEDS~4_combout\ = (\r4~regout\ & \state.get_data~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \r4~regout\,
	datad => \state.get_data~regout\,
	combout => \LEDS~4_combout\);

-- Location: LCFF_X64_Y22_N19
\LEDS[3]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~combout\,
	datain => \LEDS~4_combout\,
	ena => \LEDS[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \LEDS[3]~reg0_regout\);

-- Location: PIN_N20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\START_o[0]~I\ : cycloneii_io
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
	datain => \s1~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_START_o(0));

-- Location: PIN_M19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\START_o[1]~I\ : cycloneii_io
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
	datain => \s2~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_START_o(1));

-- Location: PIN_M21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\START_o[2]~I\ : cycloneii_io
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
	datain => \s3~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_START_o(2));

-- Location: PIN_L25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\START_o[3]~I\ : cycloneii_io
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
	datain => \s4~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_START_o(3));

-- Location: PIN_L24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\START_o[4]~I\ : cycloneii_io
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
	datain => \s5~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_START_o(4));

-- Location: PIN_M24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\START_o[5]~I\ : cycloneii_io
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
	datain => \s6~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_START_o(5));

-- Location: PIN_N24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\START_o[6]~I\ : cycloneii_io
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
	datain => \s7~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_START_o(6));

-- Location: PIN_M20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\START_o[7]~I\ : cycloneii_io
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
	datain => \s8~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_START_o(7));

-- Location: PIN_M22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ADDR_o[0]~I\ : cycloneii_io
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
	datain => \r1~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ADDR_o(0));

-- Location: PIN_M23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ADDR_o[1]~I\ : cycloneii_io
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
	datain => \r2~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ADDR_o(1));

-- Location: PIN_L23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ADDR_o[2]~I\ : cycloneii_io
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
	datain => \r3~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ADDR_o(2));

-- Location: PIN_L19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ADDR_o[3]~I\ : cycloneii_io
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
	datain => \r4~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ADDR_o(3));

-- Location: PIN_N23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\current_state[0]~I\ : cycloneii_io
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
	datain => \current_state[0]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_current_state(0));

-- Location: PIN_J25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\current_state[1]~I\ : cycloneii_io
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
	datain => \current_state[1]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_current_state(1));

-- Location: PIN_P24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\current_state[2]~I\ : cycloneii_io
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
	padio => ww_current_state(2));

-- Location: PIN_E25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\current_state[3]~I\ : cycloneii_io
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
	padio => ww_current_state(3));

-- Location: PIN_AE23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\LEDS[0]~I\ : cycloneii_io
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
	datain => \LEDS[0]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_LEDS(0));

-- Location: PIN_AF23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\LEDS[1]~I\ : cycloneii_io
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
	datain => \LEDS[1]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_LEDS(1));

-- Location: PIN_AB21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\LEDS[2]~I\ : cycloneii_io
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
	datain => \LEDS[2]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_LEDS(2));

-- Location: PIN_C22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\LEDS[3]~I\ : cycloneii_io
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
	datain => \LEDS[3]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_LEDS(3));
END structure;


