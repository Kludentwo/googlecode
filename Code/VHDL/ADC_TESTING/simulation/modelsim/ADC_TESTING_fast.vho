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

-- DATE "04/14/2014 09:08:11"

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

ENTITY 	ADC_TESTING IS
    PORT (
	CLK_27 : IN std_logic;
	S_CLK : OUT std_logic;
	DATA : IN std_logic;
	CS : OUT std_logic;
	SHDN : OUT std_logic;
	LEDS : OUT std_logic_vector(11 DOWNTO 0);
	reset : IN std_logic;
	S_CLK_test : OUT std_logic;
	DATA_test : OUT std_logic;
	CS_test : OUT std_logic;
	pause : IN std_logic
	);
END ADC_TESTING;

-- Design Ports Information
-- S_CLK	=>  Location: PIN_D25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- CS	=>  Location: PIN_J22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SHDN	=>  Location: PIN_AA1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- LEDS[0]	=>  Location: PIN_AE23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- LEDS[1]	=>  Location: PIN_AF23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- LEDS[2]	=>  Location: PIN_AB21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- LEDS[3]	=>  Location: PIN_AC22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- LEDS[4]	=>  Location: PIN_AD22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- LEDS[5]	=>  Location: PIN_AD23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- LEDS[6]	=>  Location: PIN_AD21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- LEDS[7]	=>  Location: PIN_AC21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- LEDS[8]	=>  Location: PIN_AA14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- LEDS[9]	=>  Location: PIN_Y13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- LEDS[10]	=>  Location: PIN_AA13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- LEDS[11]	=>  Location: PIN_AC14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- S_CLK_test	=>  Location: PIN_K25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- DATA_test	=>  Location: PIN_M22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- CS_test	=>  Location: PIN_K26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- CLK_27	=>  Location: PIN_D13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- reset	=>  Location: PIN_AF14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- pause	=>  Location: PIN_G26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- DATA	=>  Location: PIN_E26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF ADC_TESTING IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_CLK_27 : std_logic;
SIGNAL ww_S_CLK : std_logic;
SIGNAL ww_DATA : std_logic;
SIGNAL ww_CS : std_logic;
SIGNAL ww_SHDN : std_logic;
SIGNAL ww_LEDS : std_logic_vector(11 DOWNTO 0);
SIGNAL ww_reset : std_logic;
SIGNAL ww_S_CLK_test : std_logic;
SIGNAL ww_DATA_test : std_logic;
SIGNAL ww_CS_test : std_logic;
SIGNAL ww_pause : std_logic;
SIGNAL \CLK_1MHz~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \CLK_27~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Add1~2_combout\ : std_logic;
SIGNAL \Add1~12_combout\ : std_logic;
SIGNAL \Add0~2_combout\ : std_logic;
SIGNAL \Add0~8_combout\ : std_logic;
SIGNAL \LED_out~16_combout\ : std_logic;
SIGNAL \Add3~2_combout\ : std_logic;
SIGNAL \wait_counter~4_combout\ : std_logic;
SIGNAL \pause~combout\ : std_logic;
SIGNAL \CLK_27~combout\ : std_logic;
SIGNAL \CLK_27~clkctrl_outclk\ : std_logic;
SIGNAL \Add0~0_combout\ : std_logic;
SIGNAL \Add0~13\ : std_logic;
SIGNAL \Add0~14_combout\ : std_logic;
SIGNAL \Add0~15\ : std_logic;
SIGNAL \Add0~16_combout\ : std_logic;
SIGNAL \Add0~17\ : std_logic;
SIGNAL \Add0~19\ : std_logic;
SIGNAL \Add0~20_combout\ : std_logic;
SIGNAL \Add0~18_combout\ : std_logic;
SIGNAL \Equal0~2_combout\ : std_logic;
SIGNAL \counter~1_combout\ : std_logic;
SIGNAL \counter~0_combout\ : std_logic;
SIGNAL \Add0~1\ : std_logic;
SIGNAL \Add0~3\ : std_logic;
SIGNAL \Add0~4_combout\ : std_logic;
SIGNAL \Add0~5\ : std_logic;
SIGNAL \Add0~6_combout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \counter~2_combout\ : std_logic;
SIGNAL \Add0~7\ : std_logic;
SIGNAL \Add0~9\ : std_logic;
SIGNAL \Add0~10_combout\ : std_logic;
SIGNAL \Add0~11\ : std_logic;
SIGNAL \Add0~12_combout\ : std_logic;
SIGNAL \Equal0~1_combout\ : std_logic;
SIGNAL \CLK_1MHz~0_combout\ : std_logic;
SIGNAL \CLK_1MHz~regout\ : std_logic;
SIGNAL \reset~combout\ : std_logic;
SIGNAL \DATA~combout\ : std_logic;
SIGNAL \wait_counter~10_combout\ : std_logic;
SIGNAL \wait_counter~0_combout\ : std_logic;
SIGNAL \Add1~0_combout\ : std_logic;
SIGNAL \wait_counter~7_combout\ : std_logic;
SIGNAL \wait_counter~9_combout\ : std_logic;
SIGNAL \Add1~1\ : std_logic;
SIGNAL \Add1~3\ : std_logic;
SIGNAL \Add1~4_combout\ : std_logic;
SIGNAL \wait_counter~8_combout\ : std_logic;
SIGNAL \Add1~5\ : std_logic;
SIGNAL \Add1~6_combout\ : std_logic;
SIGNAL \LessThan0~1_combout\ : std_logic;
SIGNAL \Add1~7\ : std_logic;
SIGNAL \Add1~9\ : std_logic;
SIGNAL \Add1~10_combout\ : std_logic;
SIGNAL \wait_counter~5_combout\ : std_logic;
SIGNAL \Add1~11\ : std_logic;
SIGNAL \Add1~13\ : std_logic;
SIGNAL \Add1~14_combout\ : std_logic;
SIGNAL \wait_counter~3_combout\ : std_logic;
SIGNAL \Add1~15\ : std_logic;
SIGNAL \Add1~16_combout\ : std_logic;
SIGNAL \wait_counter~2_combout\ : std_logic;
SIGNAL \Add1~17\ : std_logic;
SIGNAL \Add1~18_combout\ : std_logic;
SIGNAL \LessThan0~0_combout\ : std_logic;
SIGNAL \LessThan0~2_combout\ : std_logic;
SIGNAL \wait_counter~6_combout\ : std_logic;
SIGNAL \Add1~8_combout\ : std_logic;
SIGNAL \LessThan0~3_combout\ : std_logic;
SIGNAL \wait_counter~1_combout\ : std_logic;
SIGNAL \Add1~19\ : std_logic;
SIGNAL \Add1~20_combout\ : std_logic;
SIGNAL \wait_flag~4_combout\ : std_logic;
SIGNAL \wait_conv~1_combout\ : std_logic;
SIGNAL \wait_conv~regout\ : std_logic;
SIGNAL \wait_conv~0_combout\ : std_logic;
SIGNAL \s_wait_conv~feeder_combout\ : std_logic;
SIGNAL \s_wait_conv~regout\ : std_logic;
SIGNAL \S_CLK~0_combout\ : std_logic;
SIGNAL \S_CLK~reg0_regout\ : std_logic;
SIGNAL \CLK_1MHz~clkctrl_outclk\ : std_logic;
SIGNAL \data_counter~5_combout\ : std_logic;
SIGNAL \data_counter[3]~6_combout\ : std_logic;
SIGNAL \data_counter~7_combout\ : std_logic;
SIGNAL \data_counter~10_combout\ : std_logic;
SIGNAL \data_counter~2_combout\ : std_logic;
SIGNAL \data_counter~8_combout\ : std_logic;
SIGNAL \done_flag~1_combout\ : std_logic;
SIGNAL \first_clock~0_combout\ : std_logic;
SIGNAL \data_counter~3_combout\ : std_logic;
SIGNAL \data_counter~9_combout\ : std_logic;
SIGNAL \Add3~3_combout\ : std_logic;
SIGNAL \done_flag~2_combout\ : std_logic;
SIGNAL \done_flag~3_combout\ : std_logic;
SIGNAL \done_flag~regout\ : std_logic;
SIGNAL \CS_test~0_combout\ : std_logic;
SIGNAL \CS_test~reg0_regout\ : std_logic;
SIGNAL \LessThan0~4_combout\ : std_logic;
SIGNAL \first_clock~1_combout\ : std_logic;
SIGNAL \first_clock~2_combout\ : std_logic;
SIGNAL \first_clock~regout\ : std_logic;
SIGNAL \LED_out~10_combout\ : std_logic;
SIGNAL \data_counter~11_combout\ : std_logic;
SIGNAL \data_counter~4_combout\ : std_logic;
SIGNAL \LED_out~11_combout\ : std_logic;
SIGNAL \LED_out~12_combout\ : std_logic;
SIGNAL \LED_out~13_combout\ : std_logic;
SIGNAL \LED_out~38_combout\ : std_logic;
SIGNAL \LED_out~14_combout\ : std_logic;
SIGNAL \LED_out~15_combout\ : std_logic;
SIGNAL \wait_flag~3_combout\ : std_logic;
SIGNAL \wait_flag~regout\ : std_logic;
SIGNAL \wait_flag~2_combout\ : std_logic;
SIGNAL \LED_out~17_combout\ : std_logic;
SIGNAL \LED_out~18_combout\ : std_logic;
SIGNAL \LED_out~19_combout\ : std_logic;
SIGNAL \LED_out~20_combout\ : std_logic;
SIGNAL \LED_out~21_combout\ : std_logic;
SIGNAL \LED_out~23_combout\ : std_logic;
SIGNAL \LED_out~24_combout\ : std_logic;
SIGNAL \LED_out~25_combout\ : std_logic;
SIGNAL \LED_out~27_combout\ : std_logic;
SIGNAL \LED_out~22_combout\ : std_logic;
SIGNAL \LED_out~26_combout\ : std_logic;
SIGNAL \LED_out~28_combout\ : std_logic;
SIGNAL \LED_out~29_combout\ : std_logic;
SIGNAL \LED_out~30_combout\ : std_logic;
SIGNAL \LED_out~31_combout\ : std_logic;
SIGNAL \LED_out~32_combout\ : std_logic;
SIGNAL \LED_out~33_combout\ : std_logic;
SIGNAL \LED_out~34_combout\ : std_logic;
SIGNAL \LED_out~35_combout\ : std_logic;
SIGNAL \LED_out~36_combout\ : std_logic;
SIGNAL \LED_out~37_combout\ : std_logic;
SIGNAL \S_CLK_test~reg0feeder_combout\ : std_logic;
SIGNAL \S_CLK_test~reg0_regout\ : std_logic;
SIGNAL \done_flag~0_combout\ : std_logic;
SIGNAL \DATA_test~0_combout\ : std_logic;
SIGNAL \DATA_test~reg0_regout\ : std_logic;
SIGNAL wait_counter : std_logic_vector(19 DOWNTO 0);
SIGNAL data_counter : std_logic_vector(3 DOWNTO 0);
SIGNAL counter : std_logic_vector(10 DOWNTO 0);
SIGNAL LED_out : std_logic_vector(11 DOWNTO 0);

BEGIN

ww_CLK_27 <= CLK_27;
S_CLK <= ww_S_CLK;
ww_DATA <= DATA;
CS <= ww_CS;
SHDN <= ww_SHDN;
LEDS <= ww_LEDS;
ww_reset <= reset;
S_CLK_test <= ww_S_CLK_test;
DATA_test <= ww_DATA_test;
CS_test <= ww_CS_test;
ww_pause <= pause;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\CLK_1MHz~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \CLK_1MHz~regout\);

\CLK_27~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \CLK_27~combout\);

-- Location: LCCOMB_X56_Y3_N10
\Add1~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~2_combout\ = (\Add1~1\ & ((\reset~combout\) # ((!wait_counter(1))))) # (!\Add1~1\ & (((!\reset~combout\ & wait_counter(1))) # (GND)))
-- \Add1~3\ = CARRY((\reset~combout\) # ((!\Add1~1\) # (!wait_counter(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011010010111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \reset~combout\,
	datab => wait_counter(1),
	datad => VCC,
	cin => \Add1~1\,
	combout => \Add1~2_combout\,
	cout => \Add1~3\);

-- Location: LCCOMB_X56_Y3_N20
\Add1~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~12_combout\ = (\Add1~11\ & (wait_counter(6) & (!\reset~combout\ & VCC))) # (!\Add1~11\ & ((((wait_counter(6) & !\reset~combout\)))))
-- \Add1~13\ = CARRY((wait_counter(6) & (!\reset~combout\ & !\Add1~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010110100000010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => wait_counter(6),
	datab => \reset~combout\,
	datad => VCC,
	cin => \Add1~11\,
	combout => \Add1~12_combout\,
	cout => \Add1~13\);

-- Location: LCCOMB_X7_Y24_N6
\Add0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~2_combout\ = (counter(1) & (!\Add0~1\)) # (!counter(1) & ((\Add0~1\) # (GND)))
-- \Add0~3\ = CARRY((!\Add0~1\) # (!counter(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter(1),
	datad => VCC,
	cin => \Add0~1\,
	combout => \Add0~2_combout\,
	cout => \Add0~3\);

-- Location: LCCOMB_X7_Y24_N12
\Add0~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~8_combout\ = (counter(4) & (\Add0~7\ $ (GND))) # (!counter(4) & (!\Add0~7\ & VCC))
-- \Add0~9\ = CARRY((counter(4) & !\Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => counter(4),
	datad => VCC,
	cin => \Add0~7\,
	combout => \Add0~8_combout\,
	cout => \Add0~9\);

-- Location: LCFF_X55_Y3_N15
\wait_counter[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK_1MHz~clkctrl_outclk\,
	datain => \wait_counter~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => wait_counter(6));

-- Location: LCCOMB_X59_Y3_N2
\LED_out~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \LED_out~16_combout\ = (\data_counter~4_combout\ & (\LED_out~10_combout\ & (!\data_counter~5_combout\ & !\data_counter~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_counter~4_combout\,
	datab => \LED_out~10_combout\,
	datac => \data_counter~5_combout\,
	datad => \data_counter~2_combout\,
	combout => \LED_out~16_combout\);

-- Location: LCFF_X7_Y24_N13
\counter[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK_27~clkctrl_outclk\,
	datain => \Add0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => counter(4));

-- Location: LCFF_X7_Y24_N17
\counter[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK_27~clkctrl_outclk\,
	datain => \Add0~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => counter(6));

-- Location: LCFF_X7_Y24_N23
\counter[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK_27~clkctrl_outclk\,
	datain => \Add0~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => counter(9));

-- Location: LCCOMB_X54_Y3_N10
\Add3~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add3~2_combout\ = ((\reset~combout\) # (!data_counter(1))) # (!data_counter(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => data_counter(0),
	datac => \reset~combout\,
	datad => data_counter(1),
	combout => \Add3~2_combout\);

-- Location: LCCOMB_X55_Y3_N14
\wait_counter~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \wait_counter~4_combout\ = (\Add1~12_combout\ & (!\LessThan0~2_combout\ & !\Add1~20_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~12_combout\,
	datab => \LessThan0~2_combout\,
	datad => \Add1~20_combout\,
	combout => \wait_counter~4_combout\);

-- Location: PIN_G26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\pause~I\ : cycloneii_io
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
	padio => ww_pause,
	combout => \pause~combout\);

-- Location: PIN_D13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\CLK_27~I\ : cycloneii_io
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
	padio => ww_CLK_27,
	combout => \CLK_27~combout\);

-- Location: CLKCTRL_G11
\CLK_27~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \CLK_27~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \CLK_27~clkctrl_outclk\);

-- Location: LCFF_X7_Y24_N5
\counter[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK_27~clkctrl_outclk\,
	datain => \Add0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => counter(0));

-- Location: LCCOMB_X7_Y24_N4
\Add0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~0_combout\ = counter(0) $ (VCC)
-- \Add0~1\ = CARRY(counter(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => counter(0),
	datad => VCC,
	combout => \Add0~0_combout\,
	cout => \Add0~1\);

-- Location: LCFF_X7_Y24_N25
\counter[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK_27~clkctrl_outclk\,
	datain => \Add0~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => counter(10));

-- Location: LCCOMB_X7_Y24_N16
\Add0~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~12_combout\ = (counter(6) & (\Add0~11\ $ (GND))) # (!counter(6) & (!\Add0~11\ & VCC))
-- \Add0~13\ = CARRY((counter(6) & !\Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => counter(6),
	datad => VCC,
	cin => \Add0~11\,
	combout => \Add0~12_combout\,
	cout => \Add0~13\);

-- Location: LCCOMB_X7_Y24_N18
\Add0~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~14_combout\ = (counter(7) & (!\Add0~13\)) # (!counter(7) & ((\Add0~13\) # (GND)))
-- \Add0~15\ = CARRY((!\Add0~13\) # (!counter(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter(7),
	datad => VCC,
	cin => \Add0~13\,
	combout => \Add0~14_combout\,
	cout => \Add0~15\);

-- Location: LCFF_X7_Y24_N19
\counter[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK_27~clkctrl_outclk\,
	datain => \Add0~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => counter(7));

-- Location: LCCOMB_X7_Y24_N20
\Add0~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~16_combout\ = (counter(8) & (\Add0~15\ $ (GND))) # (!counter(8) & (!\Add0~15\ & VCC))
-- \Add0~17\ = CARRY((counter(8) & !\Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter(8),
	datad => VCC,
	cin => \Add0~15\,
	combout => \Add0~16_combout\,
	cout => \Add0~17\);

-- Location: LCFF_X7_Y24_N21
\counter[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK_27~clkctrl_outclk\,
	datain => \Add0~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => counter(8));

-- Location: LCCOMB_X7_Y24_N22
\Add0~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~18_combout\ = (counter(9) & (!\Add0~17\)) # (!counter(9) & ((\Add0~17\) # (GND)))
-- \Add0~19\ = CARRY((!\Add0~17\) # (!counter(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => counter(9),
	datad => VCC,
	cin => \Add0~17\,
	combout => \Add0~18_combout\,
	cout => \Add0~19\);

-- Location: LCCOMB_X7_Y24_N24
\Add0~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~20_combout\ = \Add0~19\ $ (!counter(10))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => counter(10),
	cin => \Add0~19\,
	combout => \Add0~20_combout\);

-- Location: LCCOMB_X7_Y24_N2
\Equal0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~2_combout\ = (!\Add0~16_combout\ & (!\Add0~20_combout\ & !\Add0~18_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~16_combout\,
	datac => \Add0~20_combout\,
	datad => \Add0~18_combout\,
	combout => \Equal0~2_combout\);

-- Location: LCCOMB_X7_Y24_N26
\counter~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \counter~1_combout\ = (\Add0~4_combout\ & (((!\Equal0~2_combout\) # (!\Equal0~1_combout\)) # (!\Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~4_combout\,
	datab => \Equal0~0_combout\,
	datac => \Equal0~1_combout\,
	datad => \Equal0~2_combout\,
	combout => \counter~1_combout\);

-- Location: LCFF_X7_Y24_N27
\counter[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK_27~clkctrl_outclk\,
	datain => \counter~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => counter(2));

-- Location: LCCOMB_X7_Y24_N28
\counter~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \counter~0_combout\ = (\Add0~2_combout\ & (((!\Equal0~2_combout\) # (!\Equal0~1_combout\)) # (!\Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~2_combout\,
	datab => \Equal0~0_combout\,
	datac => \Equal0~1_combout\,
	datad => \Equal0~2_combout\,
	combout => \counter~0_combout\);

-- Location: LCFF_X7_Y24_N29
\counter[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK_27~clkctrl_outclk\,
	datain => \counter~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => counter(1));

-- Location: LCCOMB_X7_Y24_N8
\Add0~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~4_combout\ = (counter(2) & (\Add0~3\ $ (GND))) # (!counter(2) & (!\Add0~3\ & VCC))
-- \Add0~5\ = CARRY((counter(2) & !\Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter(2),
	datad => VCC,
	cin => \Add0~3\,
	combout => \Add0~4_combout\,
	cout => \Add0~5\);

-- Location: LCCOMB_X7_Y24_N10
\Add0~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~6_combout\ = (counter(3) & (!\Add0~5\)) # (!counter(3) & ((\Add0~5\) # (GND)))
-- \Add0~7\ = CARRY((!\Add0~5\) # (!counter(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter(3),
	datad => VCC,
	cin => \Add0~5\,
	combout => \Add0~6_combout\,
	cout => \Add0~7\);

-- Location: LCCOMB_X7_Y24_N0
\Equal0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = (\Add0~2_combout\ & (!\Add0~0_combout\ & (\Add0~4_combout\ & \Add0~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~2_combout\,
	datab => \Add0~0_combout\,
	datac => \Add0~4_combout\,
	datad => \Add0~6_combout\,
	combout => \Equal0~0_combout\);

-- Location: LCCOMB_X7_Y24_N30
\counter~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \counter~2_combout\ = (\Add0~6_combout\ & (((!\Equal0~2_combout\) # (!\Equal0~1_combout\)) # (!\Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~6_combout\,
	datab => \Equal0~0_combout\,
	datac => \Equal0~1_combout\,
	datad => \Equal0~2_combout\,
	combout => \counter~2_combout\);

-- Location: LCFF_X7_Y24_N31
\counter[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK_27~clkctrl_outclk\,
	datain => \counter~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => counter(3));

-- Location: LCCOMB_X7_Y24_N14
\Add0~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~10_combout\ = (counter(5) & (!\Add0~9\)) # (!counter(5) & ((\Add0~9\) # (GND)))
-- \Add0~11\ = CARRY((!\Add0~9\) # (!counter(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter(5),
	datad => VCC,
	cin => \Add0~9\,
	combout => \Add0~10_combout\,
	cout => \Add0~11\);

-- Location: LCFF_X7_Y24_N15
\counter[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK_27~clkctrl_outclk\,
	datain => \Add0~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => counter(5));

-- Location: LCCOMB_X8_Y24_N14
\Equal0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~1_combout\ = (!\Add0~8_combout\ & (!\Add0~12_combout\ & (!\Add0~10_combout\ & !\Add0~14_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~8_combout\,
	datab => \Add0~12_combout\,
	datac => \Add0~10_combout\,
	datad => \Add0~14_combout\,
	combout => \Equal0~1_combout\);

-- Location: LCCOMB_X8_Y24_N22
\CLK_1MHz~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CLK_1MHz~0_combout\ = \CLK_1MHz~regout\ $ (((\Equal0~0_combout\ & (\Equal0~1_combout\ & \Equal0~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~0_combout\,
	datab => \Equal0~1_combout\,
	datac => \CLK_1MHz~regout\,
	datad => \Equal0~2_combout\,
	combout => \CLK_1MHz~0_combout\);

-- Location: LCFF_X8_Y24_N23
CLK_1MHz : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK_27~clkctrl_outclk\,
	datain => \CLK_1MHz~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CLK_1MHz~regout\);

-- Location: PIN_AF14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\reset~I\ : cycloneii_io
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
	padio => ww_reset,
	combout => \reset~combout\);

-- Location: PIN_E26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
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

-- Location: LCCOMB_X56_Y3_N2
\wait_counter~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \wait_counter~10_combout\ = (!\Add1~20_combout\ & (\Add1~0_combout\ & !\LessThan0~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add1~20_combout\,
	datac => \Add1~0_combout\,
	datad => \LessThan0~2_combout\,
	combout => \wait_counter~10_combout\);

-- Location: LCFF_X56_Y3_N3
\wait_counter[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK_1MHz~clkctrl_outclk\,
	datain => \wait_counter~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => wait_counter(0));

-- Location: LCCOMB_X56_Y3_N4
\wait_counter~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \wait_counter~0_combout\ = (!\reset~combout\ & wait_counter(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \reset~combout\,
	datad => wait_counter(0),
	combout => \wait_counter~0_combout\);

-- Location: LCCOMB_X56_Y3_N8
\Add1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~0_combout\ = (\pause~combout\ & (\wait_counter~0_combout\ $ (VCC))) # (!\pause~combout\ & (\wait_counter~0_combout\ & VCC))
-- \Add1~1\ = CARRY((\pause~combout\ & \wait_counter~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pause~combout\,
	datab => \wait_counter~0_combout\,
	datad => VCC,
	combout => \Add1~0_combout\,
	cout => \Add1~1\);

-- Location: LCCOMB_X55_Y3_N4
\wait_counter~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \wait_counter~7_combout\ = (\Add1~6_combout\ & (!\LessThan0~2_combout\ & !\Add1~20_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~6_combout\,
	datac => \LessThan0~2_combout\,
	datad => \Add1~20_combout\,
	combout => \wait_counter~7_combout\);

-- Location: LCFF_X55_Y3_N5
\wait_counter[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK_1MHz~clkctrl_outclk\,
	datain => \wait_counter~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => wait_counter(3));

-- Location: LCCOMB_X56_Y3_N0
\wait_counter~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \wait_counter~9_combout\ = (\Add1~2_combout\ & (!\Add1~20_combout\ & !\LessThan0~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~2_combout\,
	datab => \Add1~20_combout\,
	datad => \LessThan0~2_combout\,
	combout => \wait_counter~9_combout\);

-- Location: LCFF_X56_Y3_N1
\wait_counter[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK_1MHz~clkctrl_outclk\,
	datain => \wait_counter~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => wait_counter(1));

-- Location: LCCOMB_X56_Y3_N12
\Add1~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~4_combout\ = (\Add1~3\ & (!\reset~combout\ & (wait_counter(2) & VCC))) # (!\Add1~3\ & ((((!\reset~combout\ & wait_counter(2))))))
-- \Add1~5\ = CARRY((!\reset~combout\ & (wait_counter(2) & !\Add1~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100101100000100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \reset~combout\,
	datab => wait_counter(2),
	datad => VCC,
	cin => \Add1~3\,
	combout => \Add1~4_combout\,
	cout => \Add1~5\);

-- Location: LCCOMB_X55_Y3_N22
\wait_counter~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \wait_counter~8_combout\ = (\Add1~4_combout\ & (!\LessThan0~2_combout\ & !\Add1~20_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add1~4_combout\,
	datac => \LessThan0~2_combout\,
	datad => \Add1~20_combout\,
	combout => \wait_counter~8_combout\);

-- Location: LCFF_X55_Y3_N23
\wait_counter[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK_1MHz~clkctrl_outclk\,
	datain => \wait_counter~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => wait_counter(2));

-- Location: LCCOMB_X56_Y3_N14
\Add1~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~6_combout\ = (\Add1~5\ & ((\reset~combout\) # ((!wait_counter(3))))) # (!\Add1~5\ & (((!\reset~combout\ & wait_counter(3))) # (GND)))
-- \Add1~7\ = CARRY((\reset~combout\) # ((!\Add1~5\) # (!wait_counter(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011010010111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \reset~combout\,
	datab => wait_counter(3),
	datad => VCC,
	cin => \Add1~5\,
	combout => \Add1~6_combout\,
	cout => \Add1~7\);

-- Location: LCCOMB_X56_Y3_N30
\LessThan0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \LessThan0~1_combout\ = (\Add1~6_combout\ & ((\Add1~2_combout\) # ((\Add1~0_combout\) # (\Add1~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~2_combout\,
	datab => \Add1~0_combout\,
	datac => \Add1~6_combout\,
	datad => \Add1~4_combout\,
	combout => \LessThan0~1_combout\);

-- Location: LCCOMB_X56_Y3_N16
\Add1~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~8_combout\ = (\Add1~7\ & (!\reset~combout\ & (wait_counter(4) & VCC))) # (!\Add1~7\ & ((((!\reset~combout\ & wait_counter(4))))))
-- \Add1~9\ = CARRY((!\reset~combout\ & (wait_counter(4) & !\Add1~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100101100000100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \reset~combout\,
	datab => wait_counter(4),
	datad => VCC,
	cin => \Add1~7\,
	combout => \Add1~8_combout\,
	cout => \Add1~9\);

-- Location: LCCOMB_X56_Y3_N18
\Add1~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~10_combout\ = (\Add1~9\ & ((\reset~combout\) # ((!wait_counter(5))))) # (!\Add1~9\ & (((!\reset~combout\ & wait_counter(5))) # (GND)))
-- \Add1~11\ = CARRY((\reset~combout\) # ((!\Add1~9\) # (!wait_counter(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011010010111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \reset~combout\,
	datab => wait_counter(5),
	datad => VCC,
	cin => \Add1~9\,
	combout => \Add1~10_combout\,
	cout => \Add1~11\);

-- Location: LCCOMB_X55_Y3_N24
\wait_counter~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \wait_counter~5_combout\ = (\Add1~10_combout\ & (!\LessThan0~2_combout\ & !\Add1~20_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add1~10_combout\,
	datac => \LessThan0~2_combout\,
	datad => \Add1~20_combout\,
	combout => \wait_counter~5_combout\);

-- Location: LCFF_X55_Y3_N25
\wait_counter[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK_1MHz~clkctrl_outclk\,
	datain => \wait_counter~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => wait_counter(5));

-- Location: LCCOMB_X56_Y3_N22
\Add1~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~14_combout\ = (\Add1~13\ & ((\reset~combout\) # ((!wait_counter(7))))) # (!\Add1~13\ & (((!\reset~combout\ & wait_counter(7))) # (GND)))
-- \Add1~15\ = CARRY((\reset~combout\) # ((!\Add1~13\) # (!wait_counter(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011010010111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \reset~combout\,
	datab => wait_counter(7),
	datad => VCC,
	cin => \Add1~13\,
	combout => \Add1~14_combout\,
	cout => \Add1~15\);

-- Location: LCCOMB_X55_Y3_N16
\wait_counter~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \wait_counter~3_combout\ = (\Add1~14_combout\ & (!\LessThan0~2_combout\ & !\Add1~20_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add1~14_combout\,
	datac => \LessThan0~2_combout\,
	datad => \Add1~20_combout\,
	combout => \wait_counter~3_combout\);

-- Location: LCFF_X55_Y3_N17
\wait_counter[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK_1MHz~clkctrl_outclk\,
	datain => \wait_counter~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => wait_counter(7));

-- Location: LCCOMB_X56_Y3_N24
\Add1~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~16_combout\ = (\Add1~15\ & (!\reset~combout\ & (wait_counter(8) & VCC))) # (!\Add1~15\ & ((((!\reset~combout\ & wait_counter(8))))))
-- \Add1~17\ = CARRY((!\reset~combout\ & (wait_counter(8) & !\Add1~15\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100101100000100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \reset~combout\,
	datab => wait_counter(8),
	datad => VCC,
	cin => \Add1~15\,
	combout => \Add1~16_combout\,
	cout => \Add1~17\);

-- Location: LCCOMB_X55_Y3_N6
\wait_counter~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \wait_counter~2_combout\ = (\Add1~16_combout\ & (!\LessThan0~2_combout\ & !\Add1~20_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add1~16_combout\,
	datac => \LessThan0~2_combout\,
	datad => \Add1~20_combout\,
	combout => \wait_counter~2_combout\);

-- Location: LCFF_X55_Y3_N7
\wait_counter[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK_1MHz~clkctrl_outclk\,
	datain => \wait_counter~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => wait_counter(8));

-- Location: LCCOMB_X56_Y3_N26
\Add1~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~18_combout\ = (\Add1~17\ & ((\reset~combout\) # ((!wait_counter(9))))) # (!\Add1~17\ & (((!\reset~combout\ & wait_counter(9))) # (GND)))
-- \Add1~19\ = CARRY((\reset~combout\) # ((!\Add1~17\) # (!wait_counter(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011010010111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \reset~combout\,
	datab => wait_counter(9),
	datad => VCC,
	cin => \Add1~17\,
	combout => \Add1~18_combout\,
	cout => \Add1~19\);

-- Location: LCCOMB_X56_Y3_N6
\LessThan0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \LessThan0~0_combout\ = (\Add1~12_combout\ & (\Add1~10_combout\ & (\Add1~16_combout\ & \Add1~14_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~12_combout\,
	datab => \Add1~10_combout\,
	datac => \Add1~16_combout\,
	datad => \Add1~14_combout\,
	combout => \LessThan0~0_combout\);

-- Location: LCCOMB_X55_Y3_N28
\LessThan0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \LessThan0~2_combout\ = (\Add1~18_combout\ & (\LessThan0~0_combout\ & ((\Add1~8_combout\) # (\LessThan0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~8_combout\,
	datab => \LessThan0~1_combout\,
	datac => \Add1~18_combout\,
	datad => \LessThan0~0_combout\,
	combout => \LessThan0~2_combout\);

-- Location: LCCOMB_X55_Y3_N26
\wait_counter~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \wait_counter~6_combout\ = (\Add1~8_combout\ & (!\Add1~20_combout\ & !\LessThan0~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~8_combout\,
	datab => \Add1~20_combout\,
	datad => \LessThan0~2_combout\,
	combout => \wait_counter~6_combout\);

-- Location: LCFF_X55_Y3_N27
\wait_counter[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK_1MHz~clkctrl_outclk\,
	datain => \wait_counter~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => wait_counter(4));

-- Location: LCCOMB_X57_Y3_N20
\LessThan0~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \LessThan0~3_combout\ = (\Add1~8_combout\) # (\LessThan0~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add1~8_combout\,
	datac => \LessThan0~1_combout\,
	combout => \LessThan0~3_combout\);

-- Location: LCCOMB_X57_Y3_N30
\wait_counter~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \wait_counter~1_combout\ = (!\Add1~20_combout\ & (\Add1~18_combout\ & ((!\LessThan0~3_combout\) # (!\LessThan0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~0_combout\,
	datab => \Add1~20_combout\,
	datac => \LessThan0~3_combout\,
	datad => \Add1~18_combout\,
	combout => \wait_counter~1_combout\);

-- Location: LCFF_X57_Y3_N31
\wait_counter[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK_1MHz~clkctrl_outclk\,
	datain => \wait_counter~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => wait_counter(9));

-- Location: LCCOMB_X56_Y3_N28
\Add1~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~20_combout\ = !\Add1~19\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Add1~19\,
	combout => \Add1~20_combout\);

-- Location: LCCOMB_X55_Y3_N30
\wait_flag~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \wait_flag~4_combout\ = (\Add1~20_combout\) # ((\LessThan0~2_combout\) # ((\wait_flag~regout\ & !\reset~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \wait_flag~regout\,
	datab => \Add1~20_combout\,
	datac => \reset~combout\,
	datad => \LessThan0~2_combout\,
	combout => \wait_flag~4_combout\);

-- Location: LCCOMB_X55_Y3_N2
\wait_conv~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \wait_conv~1_combout\ = (\wait_flag~4_combout\ & (!\done_flag~regout\ & ((\wait_conv~0_combout\) # (\DATA~combout\)))) # (!\wait_flag~4_combout\ & (((\wait_conv~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \done_flag~regout\,
	datab => \wait_conv~0_combout\,
	datac => \DATA~combout\,
	datad => \wait_flag~4_combout\,
	combout => \wait_conv~1_combout\);

-- Location: LCFF_X55_Y3_N3
wait_conv : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK_1MHz~clkctrl_outclk\,
	datain => \wait_conv~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \wait_conv~regout\);

-- Location: LCCOMB_X54_Y3_N4
\wait_conv~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \wait_conv~0_combout\ = (!\reset~combout\ & \wait_conv~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \reset~combout\,
	datad => \wait_conv~regout\,
	combout => \wait_conv~0_combout\);

-- Location: LCCOMB_X8_Y24_N10
\s_wait_conv~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \s_wait_conv~feeder_combout\ = \wait_conv~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \wait_conv~0_combout\,
	combout => \s_wait_conv~feeder_combout\);

-- Location: LCFF_X8_Y24_N11
s_wait_conv : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK_1MHz~clkctrl_outclk\,
	datain => \s_wait_conv~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \s_wait_conv~regout\);

-- Location: LCCOMB_X8_Y24_N18
\S_CLK~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \S_CLK~0_combout\ = (\CLK_1MHz~regout\ & \s_wait_conv~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CLK_1MHz~regout\,
	datad => \s_wait_conv~regout\,
	combout => \S_CLK~0_combout\);

-- Location: LCFF_X8_Y24_N19
\S_CLK~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK_27~clkctrl_outclk\,
	datain => \S_CLK~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \S_CLK~reg0_regout\);

-- Location: CLKCTRL_G1
\CLK_1MHz~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \CLK_1MHz~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \CLK_1MHz~clkctrl_outclk\);

-- Location: LCCOMB_X59_Y3_N4
\data_counter~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_counter~5_combout\ = (!\reset~combout\ & data_counter(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \reset~combout\,
	datad => data_counter(2),
	combout => \data_counter~5_combout\);

-- Location: LCCOMB_X54_Y3_N8
\data_counter[3]~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_counter[3]~6_combout\ = ((!\done_flag~regout\ & ((!\wait_conv~0_combout\) # (!\first_clock~0_combout\)))) # (!\wait_flag~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000011111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \first_clock~0_combout\,
	datab => \wait_conv~0_combout\,
	datac => \done_flag~regout\,
	datad => \wait_flag~4_combout\,
	combout => \data_counter[3]~6_combout\);

-- Location: LCCOMB_X54_Y3_N22
\data_counter~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_counter~7_combout\ = (\first_clock~0_combout\ & (\wait_conv~0_combout\ & (!\done_flag~regout\ & \wait_flag~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \first_clock~0_combout\,
	datab => \wait_conv~0_combout\,
	datac => \done_flag~regout\,
	datad => \wait_flag~4_combout\,
	combout => \data_counter~7_combout\);

-- Location: LCCOMB_X54_Y3_N2
\data_counter~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_counter~10_combout\ = (\data_counter~5_combout\ & ((\data_counter[3]~6_combout\) # ((\Add3~2_combout\ & \data_counter~7_combout\)))) # (!\data_counter~5_combout\ & (!\Add3~2_combout\ & ((\data_counter~7_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add3~2_combout\,
	datab => \data_counter~5_combout\,
	datac => \data_counter[3]~6_combout\,
	datad => \data_counter~7_combout\,
	combout => \data_counter~10_combout\);

-- Location: LCFF_X54_Y3_N3
\data_counter[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK_1MHz~clkctrl_outclk\,
	datain => \data_counter~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => data_counter(2));

-- Location: LCCOMB_X59_Y3_N28
\data_counter~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_counter~2_combout\ = (!\reset~combout\ & data_counter(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \reset~combout\,
	datad => data_counter(1),
	combout => \data_counter~2_combout\);

-- Location: LCCOMB_X54_Y3_N28
\data_counter~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_counter~8_combout\ = (\data_counter~2_combout\ & ((\data_counter[3]~6_combout\) # ((!\data_counter~4_combout\ & \data_counter~7_combout\)))) # (!\data_counter~2_combout\ & (\data_counter~4_combout\ & ((\data_counter~7_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_counter~4_combout\,
	datab => \data_counter~2_combout\,
	datac => \data_counter[3]~6_combout\,
	datad => \data_counter~7_combout\,
	combout => \data_counter~8_combout\);

-- Location: LCFF_X54_Y3_N29
\data_counter[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK_1MHz~clkctrl_outclk\,
	datain => \data_counter~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => data_counter(1));

-- Location: LCCOMB_X54_Y3_N20
\done_flag~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \done_flag~1_combout\ = (\wait_conv~regout\ & (!data_counter(2) & data_counter(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \wait_conv~regout\,
	datac => data_counter(2),
	datad => data_counter(1),
	combout => \done_flag~1_combout\);

-- Location: LCCOMB_X57_Y3_N22
\first_clock~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \first_clock~0_combout\ = (\first_clock~regout\ & !\reset~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \first_clock~regout\,
	datac => \reset~combout\,
	combout => \first_clock~0_combout\);

-- Location: LCCOMB_X58_Y3_N26
\data_counter~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_counter~3_combout\ = (!\reset~combout\ & data_counter(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \reset~combout\,
	datad => data_counter(3),
	combout => \data_counter~3_combout\);

-- Location: LCCOMB_X54_Y3_N26
\data_counter~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_counter~9_combout\ = (\Add3~3_combout\ & ((\data_counter~7_combout\) # ((\data_counter~3_combout\ & \data_counter[3]~6_combout\)))) # (!\Add3~3_combout\ & (\data_counter~3_combout\ & (\data_counter[3]~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add3~3_combout\,
	datab => \data_counter~3_combout\,
	datac => \data_counter[3]~6_combout\,
	datad => \data_counter~7_combout\,
	combout => \data_counter~9_combout\);

-- Location: LCFF_X54_Y3_N27
\data_counter[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK_1MHz~clkctrl_outclk\,
	datain => \data_counter~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => data_counter(3));

-- Location: LCCOMB_X54_Y3_N12
\Add3~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add3~3_combout\ = (!\reset~combout\ & (data_counter(3) $ (((!\Add3~2_combout\ & data_counter(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add3~2_combout\,
	datab => data_counter(2),
	datac => \reset~combout\,
	datad => data_counter(3),
	combout => \Add3~3_combout\);

-- Location: LCCOMB_X54_Y3_N18
\done_flag~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \done_flag~2_combout\ = (data_counter(0) & (\done_flag~1_combout\ & (\first_clock~0_combout\ & \Add3~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => data_counter(0),
	datab => \done_flag~1_combout\,
	datac => \first_clock~0_combout\,
	datad => \Add3~3_combout\,
	combout => \done_flag~2_combout\);

-- Location: LCCOMB_X55_Y3_N12
\done_flag~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \done_flag~3_combout\ = (!\reset~combout\ & ((\done_flag~regout\ & ((!\wait_flag~4_combout\))) # (!\done_flag~regout\ & (\done_flag~2_combout\ & \wait_flag~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~combout\,
	datab => \done_flag~2_combout\,
	datac => \done_flag~regout\,
	datad => \wait_flag~4_combout\,
	combout => \done_flag~3_combout\);

-- Location: LCFF_X55_Y3_N13
done_flag : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK_1MHz~clkctrl_outclk\,
	datain => \done_flag~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \done_flag~regout\);

-- Location: LCCOMB_X55_Y3_N8
\CS_test~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CS_test~0_combout\ = (\wait_flag~4_combout\ & (((\done_flag~regout\)))) # (!\wait_flag~4_combout\ & ((\reset~combout\) # ((\CS_test~reg0_regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~combout\,
	datab => \done_flag~regout\,
	datac => \CS_test~reg0_regout\,
	datad => \wait_flag~4_combout\,
	combout => \CS_test~0_combout\);

-- Location: LCFF_X55_Y3_N9
\CS_test~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK_1MHz~clkctrl_outclk\,
	datain => \CS_test~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CS_test~reg0_regout\);

-- Location: LCCOMB_X57_Y3_N14
\LessThan0~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \LessThan0~4_combout\ = (\Add1~20_combout\) # ((\LessThan0~3_combout\ & (\LessThan0~0_combout\ & \Add1~18_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~3_combout\,
	datab => \Add1~20_combout\,
	datac => \LessThan0~0_combout\,
	datad => \Add1~18_combout\,
	combout => \LessThan0~4_combout\);

-- Location: LCCOMB_X58_Y3_N30
\first_clock~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \first_clock~1_combout\ = (\reset~combout\) # ((\done_flag~regout\) # ((!\wait_conv~regout\ & !\first_clock~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~combout\,
	datab => \done_flag~regout\,
	datac => \wait_conv~regout\,
	datad => \first_clock~regout\,
	combout => \first_clock~1_combout\);

-- Location: LCCOMB_X57_Y3_N16
\first_clock~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \first_clock~2_combout\ = (\wait_flag~2_combout\ & (((!\first_clock~1_combout\)))) # (!\wait_flag~2_combout\ & ((\LessThan0~4_combout\ & ((!\first_clock~1_combout\))) # (!\LessThan0~4_combout\ & (\first_clock~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010011111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \wait_flag~2_combout\,
	datab => \first_clock~0_combout\,
	datac => \LessThan0~4_combout\,
	datad => \first_clock~1_combout\,
	combout => \first_clock~2_combout\);

-- Location: LCFF_X57_Y3_N17
first_clock : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK_1MHz~clkctrl_outclk\,
	datain => \first_clock~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \first_clock~regout\);

-- Location: LCCOMB_X58_Y3_N16
\LED_out~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \LED_out~10_combout\ = (\wait_conv~regout\ & \first_clock~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \wait_conv~regout\,
	datad => \first_clock~regout\,
	combout => \LED_out~10_combout\);

-- Location: LCCOMB_X54_Y3_N24
\data_counter~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_counter~11_combout\ = (\reset~combout\ & (((\data_counter~7_combout\)))) # (!\reset~combout\ & ((data_counter(0) & (\data_counter[3]~6_combout\)) # (!data_counter(0) & ((\data_counter~7_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~combout\,
	datab => \data_counter[3]~6_combout\,
	datac => data_counter(0),
	datad => \data_counter~7_combout\,
	combout => \data_counter~11_combout\);

-- Location: LCFF_X54_Y3_N25
\data_counter[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK_1MHz~clkctrl_outclk\,
	datain => \data_counter~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => data_counter(0));

-- Location: LCCOMB_X59_Y3_N18
\data_counter~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_counter~4_combout\ = (!\reset~combout\ & data_counter(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \reset~combout\,
	datad => data_counter(0),
	combout => \data_counter~4_combout\);

-- Location: LCCOMB_X58_Y3_N14
\LED_out~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \LED_out~11_combout\ = (!\data_counter~5_combout\ & (\data_counter~3_combout\ & (\LED_out~10_combout\ & \data_counter~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_counter~5_combout\,
	datab => \data_counter~3_combout\,
	datac => \LED_out~10_combout\,
	datad => \data_counter~4_combout\,
	combout => \LED_out~11_combout\);

-- Location: LCCOMB_X58_Y3_N12
\LED_out~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \LED_out~12_combout\ = (\data_counter~2_combout\ & (\LED_out~11_combout\ & ((\wait_flag~2_combout\) # (\LessThan0~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \wait_flag~2_combout\,
	datab => \data_counter~2_combout\,
	datac => \LED_out~11_combout\,
	datad => \LessThan0~4_combout\,
	combout => \LED_out~12_combout\);

-- Location: LCCOMB_X58_Y3_N8
\LED_out~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \LED_out~13_combout\ = (\LED_out~12_combout\ & (\DATA~combout\)) # (!\LED_out~12_combout\ & ((LED_out(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DATA~combout\,
	datac => LED_out(0),
	datad => \LED_out~12_combout\,
	combout => \LED_out~13_combout\);

-- Location: LCFF_X58_Y3_N9
\LED_out[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK_1MHz~clkctrl_outclk\,
	datain => \LED_out~13_combout\,
	sclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => LED_out(0));

-- Location: LCCOMB_X59_Y3_N12
\LED_out~38\ : cycloneii_lcell_comb
-- Equation(s):
-- \LED_out~38_combout\ = (\LED_out~10_combout\ & ((\reset~combout\) # ((!data_counter(2) & !data_counter(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => data_counter(2),
	datab => data_counter(0),
	datac => \reset~combout\,
	datad => \LED_out~10_combout\,
	combout => \LED_out~38_combout\);

-- Location: LCCOMB_X57_Y3_N26
\LED_out~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \LED_out~14_combout\ = (\LED_out~38_combout\ & (\data_counter~2_combout\ & ((\wait_flag~2_combout\) # (\LessThan0~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \wait_flag~2_combout\,
	datab => \LED_out~38_combout\,
	datac => \LessThan0~4_combout\,
	datad => \data_counter~2_combout\,
	combout => \LED_out~14_combout\);

-- Location: LCCOMB_X57_Y3_N28
\LED_out~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \LED_out~15_combout\ = (\data_counter~3_combout\ & ((\LED_out~14_combout\ & (\DATA~combout\)) # (!\LED_out~14_combout\ & ((LED_out(1)))))) # (!\data_counter~3_combout\ & (((LED_out(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_counter~3_combout\,
	datab => \DATA~combout\,
	datac => LED_out(1),
	datad => \LED_out~14_combout\,
	combout => \LED_out~15_combout\);

-- Location: LCFF_X57_Y3_N29
\LED_out[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK_1MHz~clkctrl_outclk\,
	datain => \LED_out~15_combout\,
	sclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => LED_out(1));

-- Location: LCCOMB_X55_Y3_N10
\wait_flag~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \wait_flag~3_combout\ = (!\done_flag~regout\ & ((\Add1~20_combout\) # ((\wait_flag~2_combout\) # (\LessThan0~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \done_flag~regout\,
	datab => \Add1~20_combout\,
	datac => \wait_flag~2_combout\,
	datad => \LessThan0~2_combout\,
	combout => \wait_flag~3_combout\);

-- Location: LCFF_X55_Y3_N11
wait_flag : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK_1MHz~clkctrl_outclk\,
	datain => \wait_flag~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \wait_flag~regout\);

-- Location: LCCOMB_X55_Y3_N20
\wait_flag~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \wait_flag~2_combout\ = (!\reset~combout\ & \wait_flag~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \reset~combout\,
	datad => \wait_flag~regout\,
	combout => \wait_flag~2_combout\);

-- Location: LCCOMB_X58_Y3_N18
\LED_out~17\ : cycloneii_lcell_comb
-- Equation(s):
-- \LED_out~17_combout\ = (\LED_out~16_combout\ & (\data_counter~3_combout\ & ((\wait_flag~2_combout\) # (\LessThan0~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LED_out~16_combout\,
	datab => \data_counter~3_combout\,
	datac => \wait_flag~2_combout\,
	datad => \LessThan0~4_combout\,
	combout => \LED_out~17_combout\);

-- Location: LCCOMB_X58_Y3_N2
\LED_out~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \LED_out~18_combout\ = (\LED_out~17_combout\ & (\DATA~combout\)) # (!\LED_out~17_combout\ & ((LED_out(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DATA~combout\,
	datac => LED_out(2),
	datad => \LED_out~17_combout\,
	combout => \LED_out~18_combout\);

-- Location: LCFF_X58_Y3_N3
\LED_out[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK_1MHz~clkctrl_outclk\,
	datain => \LED_out~18_combout\,
	sclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => LED_out(2));

-- Location: LCCOMB_X59_Y3_N24
\LED_out~19\ : cycloneii_lcell_comb
-- Equation(s):
-- \LED_out~19_combout\ = (\reset~combout\) # ((!data_counter(0) & !data_counter(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => data_counter(0),
	datac => \reset~combout\,
	datad => data_counter(1),
	combout => \LED_out~19_combout\);

-- Location: LCCOMB_X57_Y3_N12
\LED_out~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \LED_out~20_combout\ = (\LED_out~10_combout\ & (\LED_out~19_combout\ & (!\data_counter~5_combout\ & \wait_flag~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LED_out~10_combout\,
	datab => \LED_out~19_combout\,
	datac => \data_counter~5_combout\,
	datad => \wait_flag~4_combout\,
	combout => \LED_out~20_combout\);

-- Location: LCCOMB_X57_Y3_N2
\LED_out~21\ : cycloneii_lcell_comb
-- Equation(s):
-- \LED_out~21_combout\ = (\data_counter~3_combout\ & ((\LED_out~20_combout\ & (\DATA~combout\)) # (!\LED_out~20_combout\ & ((LED_out(3)))))) # (!\data_counter~3_combout\ & (((LED_out(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_counter~3_combout\,
	datab => \DATA~combout\,
	datac => LED_out(3),
	datad => \LED_out~20_combout\,
	combout => \LED_out~21_combout\);

-- Location: LCFF_X57_Y3_N3
\LED_out[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK_1MHz~clkctrl_outclk\,
	datain => \LED_out~21_combout\,
	sclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => LED_out(3));

-- Location: LCCOMB_X57_Y3_N10
\LED_out~23\ : cycloneii_lcell_comb
-- Equation(s):
-- \LED_out~23_combout\ = (\LED_out~22_combout\ & (\data_counter~2_combout\ & (\LED_out~10_combout\ & \wait_flag~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LED_out~22_combout\,
	datab => \data_counter~2_combout\,
	datac => \LED_out~10_combout\,
	datad => \wait_flag~4_combout\,
	combout => \LED_out~23_combout\);

-- Location: LCCOMB_X57_Y3_N8
\LED_out~24\ : cycloneii_lcell_comb
-- Equation(s):
-- \LED_out~24_combout\ = (\data_counter~4_combout\ & ((\LED_out~23_combout\ & (\DATA~combout\)) # (!\LED_out~23_combout\ & ((LED_out(4)))))) # (!\data_counter~4_combout\ & (((LED_out(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_counter~4_combout\,
	datab => \DATA~combout\,
	datac => LED_out(4),
	datad => \LED_out~23_combout\,
	combout => \LED_out~24_combout\);

-- Location: LCFF_X57_Y3_N9
\LED_out[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK_1MHz~clkctrl_outclk\,
	datain => \LED_out~24_combout\,
	sclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => LED_out(4));

-- Location: LCCOMB_X57_Y3_N18
\LED_out~25\ : cycloneii_lcell_comb
-- Equation(s):
-- \LED_out~25_combout\ = (\data_counter~4_combout\ & (((LED_out(5))))) # (!\data_counter~4_combout\ & ((\LED_out~23_combout\ & (\DATA~combout\)) # (!\LED_out~23_combout\ & ((LED_out(5))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_counter~4_combout\,
	datab => \DATA~combout\,
	datac => LED_out(5),
	datad => \LED_out~23_combout\,
	combout => \LED_out~25_combout\);

-- Location: LCFF_X57_Y3_N19
\LED_out[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK_1MHz~clkctrl_outclk\,
	datain => \LED_out~25_combout\,
	sclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => LED_out(5));

-- Location: LCCOMB_X59_Y3_N30
\LED_out~27\ : cycloneii_lcell_comb
-- Equation(s):
-- \LED_out~27_combout\ = (data_counter(0) & (!\reset~combout\ & !data_counter(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => data_counter(0),
	datac => \reset~combout\,
	datad => data_counter(1),
	combout => \LED_out~27_combout\);

-- Location: LCCOMB_X58_Y3_N28
\LED_out~22\ : cycloneii_lcell_comb
-- Equation(s):
-- \LED_out~22_combout\ = (data_counter(2) & (!\reset~combout\ & !data_counter(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => data_counter(2),
	datac => \reset~combout\,
	datad => data_counter(3),
	combout => \LED_out~22_combout\);

-- Location: LCCOMB_X58_Y3_N22
\LED_out~26\ : cycloneii_lcell_comb
-- Equation(s):
-- \LED_out~26_combout\ = (\LED_out~10_combout\ & (\LED_out~22_combout\ & ((\wait_flag~2_combout\) # (\LessThan0~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LED_out~10_combout\,
	datab => \LED_out~22_combout\,
	datac => \wait_flag~2_combout\,
	datad => \LessThan0~4_combout\,
	combout => \LED_out~26_combout\);

-- Location: LCCOMB_X58_Y3_N20
\LED_out~28\ : cycloneii_lcell_comb
-- Equation(s):
-- \LED_out~28_combout\ = (\LED_out~27_combout\ & ((\LED_out~26_combout\ & (\DATA~combout\)) # (!\LED_out~26_combout\ & ((LED_out(6)))))) # (!\LED_out~27_combout\ & (((LED_out(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DATA~combout\,
	datab => \LED_out~27_combout\,
	datac => LED_out(6),
	datad => \LED_out~26_combout\,
	combout => \LED_out~28_combout\);

-- Location: LCFF_X58_Y3_N21
\LED_out[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK_1MHz~clkctrl_outclk\,
	datain => \LED_out~28_combout\,
	sclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => LED_out(6));

-- Location: LCCOMB_X58_Y3_N6
\LED_out~29\ : cycloneii_lcell_comb
-- Equation(s):
-- \LED_out~29_combout\ = (\LED_out~19_combout\ & ((\LED_out~26_combout\ & (\DATA~combout\)) # (!\LED_out~26_combout\ & ((LED_out(7)))))) # (!\LED_out~19_combout\ & (((LED_out(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DATA~combout\,
	datab => \LED_out~19_combout\,
	datac => LED_out(7),
	datad => \LED_out~26_combout\,
	combout => \LED_out~29_combout\);

-- Location: LCFF_X58_Y3_N7
\LED_out[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK_1MHz~clkctrl_outclk\,
	datain => \LED_out~29_combout\,
	sclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => LED_out(7));

-- Location: LCCOMB_X58_Y3_N4
\LED_out~30\ : cycloneii_lcell_comb
-- Equation(s):
-- \LED_out~30_combout\ = (!\data_counter~5_combout\ & (!\data_counter~3_combout\ & (\LED_out~10_combout\ & \data_counter~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_counter~5_combout\,
	datab => \data_counter~3_combout\,
	datac => \LED_out~10_combout\,
	datad => \data_counter~4_combout\,
	combout => \LED_out~30_combout\);

-- Location: LCCOMB_X58_Y3_N10
\LED_out~31\ : cycloneii_lcell_comb
-- Equation(s):
-- \LED_out~31_combout\ = (\data_counter~2_combout\ & (\LED_out~30_combout\ & ((\wait_flag~2_combout\) # (\LessThan0~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \wait_flag~2_combout\,
	datab => \data_counter~2_combout\,
	datac => \LED_out~30_combout\,
	datad => \LessThan0~4_combout\,
	combout => \LED_out~31_combout\);

-- Location: LCCOMB_X58_Y3_N24
\LED_out~32\ : cycloneii_lcell_comb
-- Equation(s):
-- \LED_out~32_combout\ = (\LED_out~31_combout\ & (\DATA~combout\)) # (!\LED_out~31_combout\ & ((LED_out(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DATA~combout\,
	datac => LED_out(8),
	datad => \LED_out~31_combout\,
	combout => \LED_out~32_combout\);

-- Location: LCFF_X58_Y3_N25
\LED_out[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK_1MHz~clkctrl_outclk\,
	datain => \LED_out~32_combout\,
	sclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => LED_out(8));

-- Location: LCCOMB_X57_Y3_N4
\LED_out~33\ : cycloneii_lcell_comb
-- Equation(s):
-- \LED_out~33_combout\ = (\data_counter~3_combout\ & (((LED_out(9))))) # (!\data_counter~3_combout\ & ((\LED_out~14_combout\ & (\DATA~combout\)) # (!\LED_out~14_combout\ & ((LED_out(9))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_counter~3_combout\,
	datab => \DATA~combout\,
	datac => LED_out(9),
	datad => \LED_out~14_combout\,
	combout => \LED_out~33_combout\);

-- Location: LCFF_X57_Y3_N5
\LED_out[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK_1MHz~clkctrl_outclk\,
	datain => \LED_out~33_combout\,
	sclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => LED_out(9));

-- Location: LCCOMB_X58_Y3_N0
\LED_out~34\ : cycloneii_lcell_comb
-- Equation(s):
-- \LED_out~34_combout\ = (!\data_counter~5_combout\ & (!\data_counter~3_combout\ & (\LED_out~10_combout\ & !\data_counter~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_counter~5_combout\,
	datab => \data_counter~3_combout\,
	datac => \LED_out~10_combout\,
	datad => \data_counter~2_combout\,
	combout => \LED_out~34_combout\);

-- Location: LCCOMB_X57_Y3_N0
\LED_out~35\ : cycloneii_lcell_comb
-- Equation(s):
-- \LED_out~35_combout\ = (\LED_out~34_combout\ & (\data_counter~4_combout\ & ((\wait_flag~2_combout\) # (\LessThan0~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \wait_flag~2_combout\,
	datab => \LED_out~34_combout\,
	datac => \LessThan0~4_combout\,
	datad => \data_counter~4_combout\,
	combout => \LED_out~35_combout\);

-- Location: LCCOMB_X57_Y3_N6
\LED_out~36\ : cycloneii_lcell_comb
-- Equation(s):
-- \LED_out~36_combout\ = (\LED_out~35_combout\ & (\DATA~combout\)) # (!\LED_out~35_combout\ & ((LED_out(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \DATA~combout\,
	datac => LED_out(10),
	datad => \LED_out~35_combout\,
	combout => \LED_out~36_combout\);

-- Location: LCFF_X57_Y3_N7
\LED_out[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK_1MHz~clkctrl_outclk\,
	datain => \LED_out~36_combout\,
	sclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => LED_out(10));

-- Location: LCCOMB_X57_Y3_N24
\LED_out~37\ : cycloneii_lcell_comb
-- Equation(s):
-- \LED_out~37_combout\ = (\data_counter~3_combout\ & (((LED_out(11))))) # (!\data_counter~3_combout\ & ((\LED_out~20_combout\ & (\DATA~combout\)) # (!\LED_out~20_combout\ & ((LED_out(11))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_counter~3_combout\,
	datab => \DATA~combout\,
	datac => LED_out(11),
	datad => \LED_out~20_combout\,
	combout => \LED_out~37_combout\);

-- Location: LCFF_X57_Y3_N25
\LED_out[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK_1MHz~clkctrl_outclk\,
	datain => \LED_out~37_combout\,
	sclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => LED_out(11));

-- Location: LCCOMB_X8_Y24_N12
\S_CLK_test~reg0feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \S_CLK_test~reg0feeder_combout\ = \S_CLK~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \S_CLK~0_combout\,
	combout => \S_CLK_test~reg0feeder_combout\);

-- Location: LCFF_X8_Y24_N13
\S_CLK_test~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK_27~clkctrl_outclk\,
	datain => \S_CLK_test~reg0feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \S_CLK_test~reg0_regout\);

-- Location: LCCOMB_X55_Y3_N0
\done_flag~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \done_flag~0_combout\ = (\first_clock~0_combout\ & ((\wait_flag~2_combout\) # ((\Add1~20_combout\) # (\LessThan0~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \wait_flag~2_combout\,
	datab => \Add1~20_combout\,
	datac => \first_clock~0_combout\,
	datad => \LessThan0~2_combout\,
	combout => \done_flag~0_combout\);

-- Location: LCCOMB_X55_Y3_N18
\DATA_test~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \DATA_test~0_combout\ = (\wait_conv~0_combout\ & ((\done_flag~0_combout\ & (\DATA~combout\)) # (!\done_flag~0_combout\ & ((\DATA_test~reg0_regout\))))) # (!\wait_conv~0_combout\ & (((\DATA_test~reg0_regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \wait_conv~0_combout\,
	datab => \DATA~combout\,
	datac => \DATA_test~reg0_regout\,
	datad => \done_flag~0_combout\,
	combout => \DATA_test~0_combout\);

-- Location: LCFF_X55_Y3_N19
\DATA_test~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK_1MHz~clkctrl_outclk\,
	datain => \DATA_test~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DATA_test~reg0_regout\);

-- Location: PIN_D25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\S_CLK~I\ : cycloneii_io
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
	datain => \S_CLK~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_S_CLK);

-- Location: PIN_J22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\CS~I\ : cycloneii_io
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
	datain => \CS_test~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_CS);

-- Location: PIN_AA1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SHDN~I\ : cycloneii_io
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
	datain => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_SHDN);

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
	datain => LED_out(0),
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
	datain => LED_out(1),
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
	datain => LED_out(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_LEDS(2));

-- Location: PIN_AC22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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
	datain => LED_out(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_LEDS(3));

-- Location: PIN_AD22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\LEDS[4]~I\ : cycloneii_io
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
	datain => LED_out(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_LEDS(4));

-- Location: PIN_AD23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\LEDS[5]~I\ : cycloneii_io
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
	datain => LED_out(5),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_LEDS(5));

-- Location: PIN_AD21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\LEDS[6]~I\ : cycloneii_io
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
	datain => LED_out(6),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_LEDS(6));

-- Location: PIN_AC21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\LEDS[7]~I\ : cycloneii_io
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
	datain => LED_out(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_LEDS(7));

-- Location: PIN_AA14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\LEDS[8]~I\ : cycloneii_io
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
	datain => LED_out(8),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_LEDS(8));

-- Location: PIN_Y13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\LEDS[9]~I\ : cycloneii_io
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
	datain => LED_out(9),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_LEDS(9));

-- Location: PIN_AA13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\LEDS[10]~I\ : cycloneii_io
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
	datain => LED_out(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_LEDS(10));

-- Location: PIN_AC14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\LEDS[11]~I\ : cycloneii_io
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
	datain => LED_out(11),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_LEDS(11));

-- Location: PIN_K25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\S_CLK_test~I\ : cycloneii_io
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
	datain => \S_CLK_test~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_S_CLK_test);

-- Location: PIN_M22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\DATA_test~I\ : cycloneii_io
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
	datain => \DATA_test~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_DATA_test);

-- Location: PIN_K26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\CS_test~I\ : cycloneii_io
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
	datain => \CS_test~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_CS_test);
END structure;


