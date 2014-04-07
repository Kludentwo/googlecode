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

-- DATE "04/07/2014 13:38:46"

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
	START_o : OUT std_logic_vector(7 DOWNTO 0);
	ADDR_o : OUT std_logic_vector(3 DOWNTO 0);
	current_state : OUT std_logic_vector(3 DOWNTO 0);
	RESPOND : IN std_logic_vector(7 DOWNTO 0);
	CLK : IN std_logic;
	RESET : IN std_logic;
	DATA : IN std_logic;
	LEDS : OUT std_logic_vector(3 DOWNTO 0)
	);
END SN_program_v01;

-- Design Ports Information
-- START_o[0]	=>  Location: PIN_H10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- START_o[1]	=>  Location: PIN_G21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- START_o[2]	=>  Location: PIN_J18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- START_o[3]	=>  Location: PIN_M22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- START_o[4]	=>  Location: PIN_B16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- START_o[5]	=>  Location: PIN_V9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- START_o[6]	=>  Location: PIN_C16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- START_o[7]	=>  Location: PIN_AC22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ADDR_o[0]	=>  Location: PIN_AE20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ADDR_o[1]	=>  Location: PIN_AF18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ADDR_o[2]	=>  Location: PIN_V2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ADDR_o[3]	=>  Location: PIN_P3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- current_state[0]	=>  Location: PIN_H16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- current_state[1]	=>  Location: PIN_H15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- current_state[2]	=>  Location: PIN_T6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- current_state[3]	=>  Location: PIN_V24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- RESPOND[0]	=>  Location: PIN_C13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- RESPOND[1]	=>  Location: PIN_D13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- RESPOND[2]	=>  Location: PIN_G18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- RESPOND[3]	=>  Location: PIN_T7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- RESPOND[4]	=>  Location: PIN_T18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- RESPOND[5]	=>  Location: PIN_F15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- RESPOND[6]	=>  Location: PIN_B20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- RESPOND[7]	=>  Location: PIN_D9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- RESET	=>  Location: PIN_P24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- LEDS[0]	=>  Location: PIN_AE19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- LEDS[1]	=>  Location: PIN_D18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- LEDS[2]	=>  Location: PIN_AE4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- LEDS[3]	=>  Location: PIN_P23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- CLK	=>  Location: PIN_P2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- DATA	=>  Location: PIN_B17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


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
SIGNAL ww_START_o : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_ADDR_o : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_current_state : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_RESPOND : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_CLK : std_logic;
SIGNAL ww_RESET : std_logic;
SIGNAL ww_DATA : std_logic;
SIGNAL ww_LEDS : std_logic_vector(3 DOWNTO 0);
SIGNAL \CLK~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Add0~4_combout\ : std_logic;
SIGNAL \Add0~16_combout\ : std_logic;
SIGNAL \Add0~26_combout\ : std_logic;
SIGNAL \Add0~52_combout\ : std_logic;
SIGNAL \Add0~56_combout\ : std_logic;
SIGNAL \Selector1~1_combout\ : std_logic;
SIGNAL \Selector1~4_combout\ : std_logic;
SIGNAL \Selector1~8_combout\ : std_logic;
SIGNAL \f_state.get_info~regout\ : std_logic;
SIGNAL \f_state.get_data~regout\ : std_logic;
SIGNAL \Selector7~0_combout\ : std_logic;
SIGNAL \Equal5~3_combout\ : std_logic;
SIGNAL \Selector3~1_combout\ : std_logic;
SIGNAL \Selector5~2_combout\ : std_logic;
SIGNAL \Selector5~3_combout\ : std_logic;
SIGNAL \Selector6~0_combout\ : std_logic;
SIGNAL \Selector6~1_combout\ : std_logic;
SIGNAL \address_counter[31]~4_combout\ : std_logic;
SIGNAL \address_counter[8]~feeder_combout\ : std_logic;
SIGNAL \CLK~combout\ : std_logic;
SIGNAL \CLK~clkctrl_outclk\ : std_logic;
SIGNAL \DATA~combout\ : std_logic;
SIGNAL \manchester_counter~0_combout\ : std_logic;
SIGNAL \manchester_counter~regout\ : std_logic;
SIGNAL \m_bit1~0_combout\ : std_logic;
SIGNAL \m1~0_combout\ : std_logic;
SIGNAL \m1~regout\ : std_logic;
SIGNAL \Selector7~1_combout\ : std_logic;
SIGNAL \fault~regout\ : std_logic;
SIGNAL \Selector0~0_combout\ : std_logic;
SIGNAL \Add0~37\ : std_logic;
SIGNAL \Add0~39\ : std_logic;
SIGNAL \Add0~40_combout\ : std_logic;
SIGNAL \Add0~41\ : std_logic;
SIGNAL \Add0~43\ : std_logic;
SIGNAL \Add0~45\ : std_logic;
SIGNAL \Add0~46_combout\ : std_logic;
SIGNAL \Add0~47\ : std_logic;
SIGNAL \Add0~49\ : std_logic;
SIGNAL \Add0~50_combout\ : std_logic;
SIGNAL \Add0~48_combout\ : std_logic;
SIGNAL \Add0~51\ : std_logic;
SIGNAL \Add0~53\ : std_logic;
SIGNAL \Add0~54_combout\ : std_logic;
SIGNAL \Equal5~7_combout\ : std_logic;
SIGNAL \Add0~55\ : std_logic;
SIGNAL \Add0~57\ : std_logic;
SIGNAL \Add0~58_combout\ : std_logic;
SIGNAL \Add0~59\ : std_logic;
SIGNAL \Add0~60_combout\ : std_logic;
SIGNAL \Add0~61\ : std_logic;
SIGNAL \Add0~62_combout\ : std_logic;
SIGNAL \Equal5~8_combout\ : std_logic;
SIGNAL \Add0~44_combout\ : std_logic;
SIGNAL \Equal5~6_combout\ : std_logic;
SIGNAL \Add0~8_combout\ : std_logic;
SIGNAL \Equal5~2_combout\ : std_logic;
SIGNAL \Add0~6_combout\ : std_logic;
SIGNAL \address_counter[0]~3_combout\ : std_logic;
SIGNAL \Add0~0_combout\ : std_logic;
SIGNAL \Add0~1\ : std_logic;
SIGNAL \Add0~2_combout\ : std_logic;
SIGNAL \Equal5~1_combout\ : std_logic;
SIGNAL \Add0~24_combout\ : std_logic;
SIGNAL \Add0~28_combout\ : std_logic;
SIGNAL \Equal5~4_combout\ : std_logic;
SIGNAL \Equal5~5_combout\ : std_logic;
SIGNAL \address_counter~1_combout\ : std_logic;
SIGNAL \address_counter~2_combout\ : std_logic;
SIGNAL \Add0~3\ : std_logic;
SIGNAL \Add0~5\ : std_logic;
SIGNAL \Add0~7\ : std_logic;
SIGNAL \Add0~9\ : std_logic;
SIGNAL \Add0~10_combout\ : std_logic;
SIGNAL \Add0~11\ : std_logic;
SIGNAL \Add0~12_combout\ : std_logic;
SIGNAL \Add0~13\ : std_logic;
SIGNAL \Add0~14_combout\ : std_logic;
SIGNAL \Add0~15\ : std_logic;
SIGNAL \Add0~17\ : std_logic;
SIGNAL \Add0~18_combout\ : std_logic;
SIGNAL \address_counter[9]~feeder_combout\ : std_logic;
SIGNAL \Add0~19\ : std_logic;
SIGNAL \Add0~21\ : std_logic;
SIGNAL \Add0~22_combout\ : std_logic;
SIGNAL \Add0~23\ : std_logic;
SIGNAL \Add0~25\ : std_logic;
SIGNAL \Add0~27\ : std_logic;
SIGNAL \Add0~29\ : std_logic;
SIGNAL \Add0~30_combout\ : std_logic;
SIGNAL \address_counter[15]~feeder_combout\ : std_logic;
SIGNAL \Add0~31\ : std_logic;
SIGNAL \Add0~33\ : std_logic;
SIGNAL \Add0~34_combout\ : std_logic;
SIGNAL \Add0~35\ : std_logic;
SIGNAL \Add0~36_combout\ : std_logic;
SIGNAL \Add0~38_combout\ : std_logic;
SIGNAL \Selector1~6_combout\ : std_logic;
SIGNAL \Add0~42_combout\ : std_logic;
SIGNAL \Selector1~7_combout\ : std_logic;
SIGNAL \address_counter[14]~feeder_combout\ : std_logic;
SIGNAL \address_counter[12]~feeder_combout\ : std_logic;
SIGNAL \Selector1~5_combout\ : std_logic;
SIGNAL \Selector1~9_combout\ : std_logic;
SIGNAL \manchester_bit~regout\ : std_logic;
SIGNAL \manchester_bit~0_combout\ : std_logic;
SIGNAL \m_bit1~1_combout\ : std_logic;
SIGNAL \m_bit1~2_combout\ : std_logic;
SIGNAL \m_bit1~regout\ : std_logic;
SIGNAL \m_bit2~0_combout\ : std_logic;
SIGNAL \m_bit2~regout\ : std_logic;
SIGNAL \m_bit3~0_combout\ : std_logic;
SIGNAL \m_bit3~regout\ : std_logic;
SIGNAL \Selector5~1_combout\ : std_logic;
SIGNAL \Add0~20_combout\ : std_logic;
SIGNAL \address_counter[10]~feeder_combout\ : std_logic;
SIGNAL \Selector1~2_combout\ : std_logic;
SIGNAL \Selector1~0_combout\ : std_logic;
SIGNAL \Selector1~3_combout\ : std_logic;
SIGNAL \Selector1~10_combout\ : std_logic;
SIGNAL \Selector1~14_combout\ : std_logic;
SIGNAL \Selector0~1_combout\ : std_logic;
SIGNAL \r_state.idle~regout\ : std_logic;
SIGNAL \start_bit1~feeder_combout\ : std_logic;
SIGNAL \Equal0~1_combout\ : std_logic;
SIGNAL \Selector5~0_combout\ : std_logic;
SIGNAL \Selector2~0_combout\ : std_logic;
SIGNAL \Selector2~1_combout\ : std_logic;
SIGNAL \r_state.check_functioncode~regout\ : std_logic;
SIGNAL \Mux0~0_combout\ : std_logic;
SIGNAL \Selector3~0_combout\ : std_logic;
SIGNAL \Selector3~2_combout\ : std_logic;
SIGNAL \f_state.idle~regout\ : std_logic;
SIGNAL \start_bit1~regout\ : std_logic;
SIGNAL \start_bit2~feeder_combout\ : std_logic;
SIGNAL \start_bit2~regout\ : std_logic;
SIGNAL \start_bit3~feeder_combout\ : std_logic;
SIGNAL \start_bit3~regout\ : std_logic;
SIGNAL \start_bit4~regout\ : std_logic;
SIGNAL \start_bit5~regout\ : std_logic;
SIGNAL \start_bit6~feeder_combout\ : std_logic;
SIGNAL \start_bit6~regout\ : std_logic;
SIGNAL \start_bit7~feeder_combout\ : std_logic;
SIGNAL \start_bit7~regout\ : std_logic;
SIGNAL \start_bit8~regout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \Selector4~0_combout\ : std_logic;
SIGNAL \Selector4~1_combout\ : std_logic;
SIGNAL \f_state.manchester_converting~regout\ : std_logic;
SIGNAL \address_counter[0]~0_combout\ : std_logic;
SIGNAL \Add0~32_combout\ : std_logic;
SIGNAL \Equal5~0_combout\ : std_logic;
SIGNAL \m_bit4~0_combout\ : std_logic;
SIGNAL \m_bit4~regout\ : std_logic;
SIGNAL \Selector1~11_combout\ : std_logic;
SIGNAL \Selector1~12_combout\ : std_logic;
SIGNAL \Selector1~13_combout\ : std_logic;
SIGNAL \r_state.check_address~regout\ : std_logic;
SIGNAL \current_state[0]~0_combout\ : std_logic;
SIGNAL \current_state[0]~reg0_regout\ : std_logic;
SIGNAL \current_state[1]~reg0_regout\ : std_logic;
SIGNAL address_counter : std_logic_vector(31 DOWNTO 0);
SIGNAL \ALT_INV_CLK~clkctrl_outclk\ : std_logic;
SIGNAL \ALT_INV_f_state.idle~regout\ : std_logic;

BEGIN

START_o <= ww_START_o;
ADDR_o <= ww_ADDR_o;
current_state <= ww_current_state;
ww_RESPOND <= RESPOND;
ww_CLK <= CLK;
ww_RESET <= RESET;
ww_DATA <= DATA;
LEDS <= ww_LEDS;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\CLK~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \CLK~combout\);
\ALT_INV_CLK~clkctrl_outclk\ <= NOT \CLK~clkctrl_outclk\;
\ALT_INV_f_state.idle~regout\ <= NOT \f_state.idle~regout\;

-- Location: LCCOMB_X44_Y31_N4
\Add0~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~4_combout\ = (address_counter(2) & (\Add0~3\ $ (GND))) # (!address_counter(2) & (!\Add0~3\ & VCC))
-- \Add0~5\ = CARRY((address_counter(2) & !\Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => address_counter(2),
	datad => VCC,
	cin => \Add0~3\,
	combout => \Add0~4_combout\,
	cout => \Add0~5\);

-- Location: LCCOMB_X44_Y31_N16
\Add0~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~16_combout\ = (address_counter(8) & (\Add0~15\ $ (GND))) # (!address_counter(8) & (!\Add0~15\ & VCC))
-- \Add0~17\ = CARRY((address_counter(8) & !\Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => address_counter(8),
	datad => VCC,
	cin => \Add0~15\,
	combout => \Add0~16_combout\,
	cout => \Add0~17\);

-- Location: LCCOMB_X44_Y31_N26
\Add0~26\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~26_combout\ = (address_counter(13) & (!\Add0~25\)) # (!address_counter(13) & ((\Add0~25\) # (GND)))
-- \Add0~27\ = CARRY((!\Add0~25\) # (!address_counter(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => address_counter(13),
	datad => VCC,
	cin => \Add0~25\,
	combout => \Add0~26_combout\,
	cout => \Add0~27\);

-- Location: LCCOMB_X44_Y30_N20
\Add0~52\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~52_combout\ = (address_counter(26) & (\Add0~51\ $ (GND))) # (!address_counter(26) & (!\Add0~51\ & VCC))
-- \Add0~53\ = CARRY((address_counter(26) & !\Add0~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => address_counter(26),
	datad => VCC,
	cin => \Add0~51\,
	combout => \Add0~52_combout\,
	cout => \Add0~53\);

-- Location: LCCOMB_X44_Y30_N24
\Add0~56\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~56_combout\ = (address_counter(28) & (\Add0~55\ $ (GND))) # (!address_counter(28) & (!\Add0~55\ & VCC))
-- \Add0~57\ = CARRY((address_counter(28) & !\Add0~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => address_counter(28),
	datad => VCC,
	cin => \Add0~55\,
	combout => \Add0~56_combout\,
	cout => \Add0~57\);

-- Location: LCFF_X43_Y31_N9
\address_counter[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~clkctrl_outclk\,
	sdata => \Add0~8_combout\,
	sload => VCC,
	ena => \address_counter[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => address_counter(4));

-- Location: LCCOMB_X43_Y31_N16
\Selector1~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector1~1_combout\ = (!address_counter(6) & (!address_counter(5) & (!address_counter(4) & !address_counter(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => address_counter(6),
	datab => address_counter(5),
	datac => address_counter(4),
	datad => address_counter(7),
	combout => \Selector1~1_combout\);

-- Location: LCFF_X42_Y31_N1
\address_counter[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~clkctrl_outclk\,
	datain => \address_counter[8]~feeder_combout\,
	ena => \address_counter[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => address_counter(8));

-- Location: LCFF_X43_Y30_N31
\address_counter[31]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~clkctrl_outclk\,
	datain => \address_counter[31]~4_combout\,
	ena => \address_counter[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => address_counter(31));

-- Location: LCFF_X44_Y30_N25
\address_counter[28]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~clkctrl_outclk\,
	datain => \Add0~56_combout\,
	ena => \address_counter[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => address_counter(28));

-- Location: LCCOMB_X43_Y30_N20
\Selector1~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector1~4_combout\ = (address_counter(31) & (!address_counter(30) & (!address_counter(29) & !address_counter(28))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => address_counter(31),
	datab => address_counter(30),
	datac => address_counter(29),
	datad => address_counter(28),
	combout => \Selector1~4_combout\);

-- Location: LCFF_X43_Y31_N21
\address_counter[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~clkctrl_outclk\,
	sdata => \Add0~26_combout\,
	sload => VCC,
	ena => \address_counter[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => address_counter(13));

-- Location: LCFF_X44_Y30_N13
\address_counter[22]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~clkctrl_outclk\,
	datain => \Add0~44_combout\,
	ena => \address_counter[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => address_counter(22));

-- Location: LCFF_X44_Y30_N17
\address_counter[24]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~clkctrl_outclk\,
	datain => \Add0~48_combout\,
	ena => \address_counter[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => address_counter(24));

-- Location: LCFF_X44_Y30_N21
\address_counter[26]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~clkctrl_outclk\,
	datain => \Add0~52_combout\,
	ena => \address_counter[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => address_counter(26));

-- Location: LCCOMB_X43_Y30_N6
\Selector1~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector1~8_combout\ = (!address_counter(24) & (!address_counter(26) & (!address_counter(25) & !address_counter(27))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => address_counter(24),
	datab => address_counter(26),
	datac => address_counter(25),
	datad => address_counter(27),
	combout => \Selector1~8_combout\);

-- Location: LCFF_X42_Y32_N3
\f_state.get_info\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \Selector5~2_combout\,
	ena => \Selector5~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \f_state.get_info~regout\);

-- Location: LCFF_X42_Y32_N21
\f_state.get_data\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \Selector6~1_combout\,
	ena => \Selector5~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \f_state.get_data~regout\);

-- Location: LCCOMB_X42_Y32_N10
\Selector7~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector7~0_combout\ = (\fault~regout\ & ((\f_state.manchester_converting~regout\) # ((\f_state.get_info~regout\) # (\f_state.get_data~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \f_state.manchester_converting~regout\,
	datab => \f_state.get_info~regout\,
	datac => \f_state.get_data~regout\,
	datad => \fault~regout\,
	combout => \Selector7~0_combout\);

-- Location: LCCOMB_X43_Y31_N12
\Equal5~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal5~3_combout\ = (\Add0~16_combout\) # ((\Add0~20_combout\) # ((\Add0~22_combout\) # (\Add0~18_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~16_combout\,
	datab => \Add0~20_combout\,
	datac => \Add0~22_combout\,
	datad => \Add0~18_combout\,
	combout => \Equal5~3_combout\);

-- Location: LCCOMB_X42_Y32_N12
\Selector3~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector3~1_combout\ = (!\r_state.check_functioncode~regout\ & ((!\r_state.check_address~regout\) # (!\fault~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001100010011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fault~regout\,
	datab => \r_state.check_functioncode~regout\,
	datac => \r_state.check_address~regout\,
	combout => \Selector3~1_combout\);

-- Location: LCCOMB_X42_Y32_N2
\Selector5~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector5~2_combout\ = (\Selector5~1_combout\ & \r_state.check_functioncode~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Selector5~1_combout\,
	datac => \r_state.check_functioncode~regout\,
	combout => \Selector5~2_combout\);

-- Location: LCCOMB_X42_Y32_N24
\Selector5~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector5~3_combout\ = ((\Equal0~1_combout\ & (\Equal0~0_combout\ & !\r_state.idle~regout\))) # (!\Selector3~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~1_combout\,
	datab => \Equal0~0_combout\,
	datac => \r_state.idle~regout\,
	datad => \Selector3~1_combout\,
	combout => \Selector5~3_combout\);

-- Location: LCCOMB_X42_Y30_N24
\Selector6~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector6~0_combout\ = (\m_bit2~regout\ & (!\m_bit4~regout\ & (!\m_bit3~regout\ & !\m_bit1~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \m_bit2~regout\,
	datab => \m_bit4~regout\,
	datac => \m_bit3~regout\,
	datad => \m_bit1~regout\,
	combout => \Selector6~0_combout\);

-- Location: LCCOMB_X42_Y32_N20
\Selector6~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector6~1_combout\ = (\r_state.check_functioncode~regout\ & \Selector6~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \r_state.check_functioncode~regout\,
	datad => \Selector6~0_combout\,
	combout => \Selector6~1_combout\);

-- Location: LCCOMB_X43_Y30_N30
\address_counter[31]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \address_counter[31]~4_combout\ = !\Add0~62_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Add0~62_combout\,
	combout => \address_counter[31]~4_combout\);

-- Location: LCCOMB_X42_Y31_N0
\address_counter[8]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \address_counter[8]~feeder_combout\ = \Add0~16_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Add0~16_combout\,
	combout => \address_counter[8]~feeder_combout\);

-- Location: PIN_P2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
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

-- Location: CLKCTRL_G3
\CLK~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \CLK~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \CLK~clkctrl_outclk\);

-- Location: PIN_B17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
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

-- Location: LCCOMB_X43_Y32_N26
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

-- Location: LCFF_X43_Y32_N27
manchester_counter : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~clkctrl_outclk\,
	datain => \manchester_counter~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \manchester_counter~regout\);

-- Location: LCCOMB_X42_Y30_N8
\m_bit1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \m_bit1~0_combout\ = (\manchester_counter~regout\ & \f_state.manchester_converting~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \manchester_counter~regout\,
	datad => \f_state.manchester_converting~regout\,
	combout => \m_bit1~0_combout\);

-- Location: LCCOMB_X43_Y32_N0
\m1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \m1~0_combout\ = (\manchester_counter~regout\ & (((\m1~regout\)))) # (!\manchester_counter~regout\ & ((\f_state.manchester_converting~regout\ & (\DATA~combout\)) # (!\f_state.manchester_converting~regout\ & ((\m1~regout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \manchester_counter~regout\,
	datab => \DATA~combout\,
	datac => \m1~regout\,
	datad => \f_state.manchester_converting~regout\,
	combout => \m1~0_combout\);

-- Location: LCFF_X43_Y32_N1
m1 : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~clkctrl_outclk\,
	datain => \m1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \m1~regout\);

-- Location: LCCOMB_X43_Y32_N4
\Selector7~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector7~1_combout\ = (\Selector7~0_combout\) # ((\m_bit1~0_combout\ & (\DATA~combout\ $ (!\m1~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101010111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector7~0_combout\,
	datab => \DATA~combout\,
	datac => \m_bit1~0_combout\,
	datad => \m1~regout\,
	combout => \Selector7~1_combout\);

-- Location: LCFF_X43_Y32_N5
fault : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~clkctrl_outclk\,
	datain => \Selector7~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \fault~regout\);

-- Location: LCCOMB_X42_Y30_N10
\Selector0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector0~0_combout\ = (\r_state.check_functioncode~regout\ & (((\fault~regout\) # (\Selector1~11_combout\)))) # (!\r_state.check_functioncode~regout\ & (\r_state.check_address~regout\ & (\fault~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \r_state.check_functioncode~regout\,
	datab => \r_state.check_address~regout\,
	datac => \fault~regout\,
	datad => \Selector1~11_combout\,
	combout => \Selector0~0_combout\);

-- Location: LCFF_X44_Y30_N19
\address_counter[25]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~clkctrl_outclk\,
	datain => \Add0~50_combout\,
	ena => \address_counter[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => address_counter(25));

-- Location: LCCOMB_X44_Y30_N4
\Add0~36\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~36_combout\ = (address_counter(18) & (\Add0~35\ $ (GND))) # (!address_counter(18) & (!\Add0~35\ & VCC))
-- \Add0~37\ = CARRY((address_counter(18) & !\Add0~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => address_counter(18),
	datad => VCC,
	cin => \Add0~35\,
	combout => \Add0~36_combout\,
	cout => \Add0~37\);

-- Location: LCCOMB_X44_Y30_N6
\Add0~38\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~38_combout\ = (address_counter(19) & (!\Add0~37\)) # (!address_counter(19) & ((\Add0~37\) # (GND)))
-- \Add0~39\ = CARRY((!\Add0~37\) # (!address_counter(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => address_counter(19),
	datad => VCC,
	cin => \Add0~37\,
	combout => \Add0~38_combout\,
	cout => \Add0~39\);

-- Location: LCCOMB_X44_Y30_N8
\Add0~40\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~40_combout\ = (address_counter(20) & (\Add0~39\ $ (GND))) # (!address_counter(20) & (!\Add0~39\ & VCC))
-- \Add0~41\ = CARRY((address_counter(20) & !\Add0~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => address_counter(20),
	datad => VCC,
	cin => \Add0~39\,
	combout => \Add0~40_combout\,
	cout => \Add0~41\);

-- Location: LCFF_X44_Y30_N9
\address_counter[20]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~clkctrl_outclk\,
	datain => \Add0~40_combout\,
	ena => \address_counter[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => address_counter(20));

-- Location: LCCOMB_X44_Y30_N10
\Add0~42\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~42_combout\ = (address_counter(21) & (!\Add0~41\)) # (!address_counter(21) & ((\Add0~41\) # (GND)))
-- \Add0~43\ = CARRY((!\Add0~41\) # (!address_counter(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => address_counter(21),
	datad => VCC,
	cin => \Add0~41\,
	combout => \Add0~42_combout\,
	cout => \Add0~43\);

-- Location: LCCOMB_X44_Y30_N12
\Add0~44\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~44_combout\ = (address_counter(22) & (\Add0~43\ $ (GND))) # (!address_counter(22) & (!\Add0~43\ & VCC))
-- \Add0~45\ = CARRY((address_counter(22) & !\Add0~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => address_counter(22),
	datad => VCC,
	cin => \Add0~43\,
	combout => \Add0~44_combout\,
	cout => \Add0~45\);

-- Location: LCCOMB_X44_Y30_N14
\Add0~46\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~46_combout\ = (address_counter(23) & (!\Add0~45\)) # (!address_counter(23) & ((\Add0~45\) # (GND)))
-- \Add0~47\ = CARRY((!\Add0~45\) # (!address_counter(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => address_counter(23),
	datad => VCC,
	cin => \Add0~45\,
	combout => \Add0~46_combout\,
	cout => \Add0~47\);

-- Location: LCFF_X44_Y30_N15
\address_counter[23]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~clkctrl_outclk\,
	datain => \Add0~46_combout\,
	ena => \address_counter[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => address_counter(23));

-- Location: LCCOMB_X44_Y30_N16
\Add0~48\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~48_combout\ = (address_counter(24) & (\Add0~47\ $ (GND))) # (!address_counter(24) & (!\Add0~47\ & VCC))
-- \Add0~49\ = CARRY((address_counter(24) & !\Add0~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => address_counter(24),
	datad => VCC,
	cin => \Add0~47\,
	combout => \Add0~48_combout\,
	cout => \Add0~49\);

-- Location: LCCOMB_X44_Y30_N18
\Add0~50\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~50_combout\ = (address_counter(25) & (!\Add0~49\)) # (!address_counter(25) & ((\Add0~49\) # (GND)))
-- \Add0~51\ = CARRY((!\Add0~49\) # (!address_counter(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => address_counter(25),
	datad => VCC,
	cin => \Add0~49\,
	combout => \Add0~50_combout\,
	cout => \Add0~51\);

-- Location: LCFF_X44_Y30_N23
\address_counter[27]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~clkctrl_outclk\,
	datain => \Add0~54_combout\,
	ena => \address_counter[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => address_counter(27));

-- Location: LCCOMB_X44_Y30_N22
\Add0~54\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~54_combout\ = (address_counter(27) & (!\Add0~53\)) # (!address_counter(27) & ((\Add0~53\) # (GND)))
-- \Add0~55\ = CARRY((!\Add0~53\) # (!address_counter(27)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => address_counter(27),
	datad => VCC,
	cin => \Add0~53\,
	combout => \Add0~54_combout\,
	cout => \Add0~55\);

-- Location: LCCOMB_X45_Y30_N6
\Equal5~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal5~7_combout\ = (\Add0~52_combout\) # ((\Add0~50_combout\) # ((\Add0~48_combout\) # (\Add0~54_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~52_combout\,
	datab => \Add0~50_combout\,
	datac => \Add0~48_combout\,
	datad => \Add0~54_combout\,
	combout => \Equal5~7_combout\);

-- Location: LCFF_X44_Y30_N27
\address_counter[29]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~clkctrl_outclk\,
	datain => \Add0~58_combout\,
	ena => \address_counter[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => address_counter(29));

-- Location: LCCOMB_X44_Y30_N26
\Add0~58\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~58_combout\ = (address_counter(29) & (!\Add0~57\)) # (!address_counter(29) & ((\Add0~57\) # (GND)))
-- \Add0~59\ = CARRY((!\Add0~57\) # (!address_counter(29)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => address_counter(29),
	datad => VCC,
	cin => \Add0~57\,
	combout => \Add0~58_combout\,
	cout => \Add0~59\);

-- Location: LCCOMB_X44_Y30_N28
\Add0~60\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~60_combout\ = (address_counter(30) & (\Add0~59\ $ (GND))) # (!address_counter(30) & (!\Add0~59\ & VCC))
-- \Add0~61\ = CARRY((address_counter(30) & !\Add0~59\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => address_counter(30),
	datad => VCC,
	cin => \Add0~59\,
	combout => \Add0~60_combout\,
	cout => \Add0~61\);

-- Location: LCFF_X44_Y30_N29
\address_counter[30]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~clkctrl_outclk\,
	datain => \Add0~60_combout\,
	ena => \address_counter[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => address_counter(30));

-- Location: LCCOMB_X44_Y30_N30
\Add0~62\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~62_combout\ = address_counter(31) $ (!\Add0~61\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => address_counter(31),
	cin => \Add0~61\,
	combout => \Add0~62_combout\);

-- Location: LCCOMB_X45_Y30_N16
\Equal5~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal5~8_combout\ = (\Add0~56_combout\) # ((\Add0~58_combout\) # ((\Add0~62_combout\) # (\Add0~60_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~56_combout\,
	datab => \Add0~58_combout\,
	datac => \Add0~62_combout\,
	datad => \Add0~60_combout\,
	combout => \Equal5~8_combout\);

-- Location: LCCOMB_X45_Y30_N24
\Equal5~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal5~6_combout\ = (\Add0~42_combout\) # ((\Add0~40_combout\) # ((\Add0~44_combout\) # (\Add0~46_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~42_combout\,
	datab => \Add0~40_combout\,
	datac => \Add0~44_combout\,
	datad => \Add0~46_combout\,
	combout => \Equal5~6_combout\);

-- Location: LCCOMB_X44_Y31_N8
\Add0~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~8_combout\ = (address_counter(4) & (\Add0~7\ $ (GND))) # (!address_counter(4) & (!\Add0~7\ & VCC))
-- \Add0~9\ = CARRY((address_counter(4) & !\Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => address_counter(4),
	datad => VCC,
	cin => \Add0~7\,
	combout => \Add0~8_combout\,
	cout => \Add0~9\);

-- Location: LCCOMB_X43_Y31_N2
\Equal5~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal5~2_combout\ = (\Add0~14_combout\) # ((\Add0~12_combout\) # ((\Add0~8_combout\) # (\Add0~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~14_combout\,
	datab => \Add0~12_combout\,
	datac => \Add0~8_combout\,
	datad => \Add0~10_combout\,
	combout => \Equal5~2_combout\);

-- Location: LCCOMB_X44_Y31_N6
\Add0~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~6_combout\ = (address_counter(3) & (!\Add0~5\)) # (!address_counter(3) & ((\Add0~5\) # (GND)))
-- \Add0~7\ = CARRY((!\Add0~5\) # (!address_counter(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => address_counter(3),
	datad => VCC,
	cin => \Add0~5\,
	combout => \Add0~6_combout\,
	cout => \Add0~7\);

-- Location: LCCOMB_X43_Y30_N8
\address_counter[0]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \address_counter[0]~3_combout\ = !\Add0~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add0~0_combout\,
	combout => \address_counter[0]~3_combout\);

-- Location: LCFF_X43_Y30_N9
\address_counter[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~clkctrl_outclk\,
	datain => \address_counter[0]~3_combout\,
	ena => \address_counter[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => address_counter(0));

-- Location: LCCOMB_X44_Y31_N0
\Add0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~0_combout\ = address_counter(0) $ (GND)
-- \Add0~1\ = CARRY(!address_counter(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => address_counter(0),
	datad => VCC,
	combout => \Add0~0_combout\,
	cout => \Add0~1\);

-- Location: LCFF_X44_Y31_N3
\address_counter[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~clkctrl_outclk\,
	datain => \Add0~2_combout\,
	ena => \address_counter[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => address_counter(1));

-- Location: LCCOMB_X44_Y31_N2
\Add0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~2_combout\ = (address_counter(1) & (!\Add0~1\)) # (!address_counter(1) & ((\Add0~1\) # (GND)))
-- \Add0~3\ = CARRY((!\Add0~1\) # (!address_counter(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => address_counter(1),
	datad => VCC,
	cin => \Add0~1\,
	combout => \Add0~2_combout\,
	cout => \Add0~3\);

-- Location: LCCOMB_X43_Y31_N4
\Equal5~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal5~1_combout\ = ((\Add0~6_combout\) # ((\Add0~0_combout\) # (\Add0~2_combout\))) # (!\Add0~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~4_combout\,
	datab => \Add0~6_combout\,
	datac => \Add0~0_combout\,
	datad => \Add0~2_combout\,
	combout => \Equal5~1_combout\);

-- Location: LCCOMB_X44_Y31_N24
\Add0~24\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~24_combout\ = (address_counter(12) & (\Add0~23\ $ (GND))) # (!address_counter(12) & (!\Add0~23\ & VCC))
-- \Add0~25\ = CARRY((address_counter(12) & !\Add0~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => address_counter(12),
	datad => VCC,
	cin => \Add0~23\,
	combout => \Add0~24_combout\,
	cout => \Add0~25\);

-- Location: LCCOMB_X44_Y31_N28
\Add0~28\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~28_combout\ = (address_counter(14) & (\Add0~27\ $ (GND))) # (!address_counter(14) & (!\Add0~27\ & VCC))
-- \Add0~29\ = CARRY((address_counter(14) & !\Add0~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => address_counter(14),
	datad => VCC,
	cin => \Add0~27\,
	combout => \Add0~28_combout\,
	cout => \Add0~29\);

-- Location: LCCOMB_X43_Y31_N22
\Equal5~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal5~4_combout\ = (\Add0~26_combout\) # ((\Add0~30_combout\) # ((\Add0~24_combout\) # (\Add0~28_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~26_combout\,
	datab => \Add0~30_combout\,
	datac => \Add0~24_combout\,
	datad => \Add0~28_combout\,
	combout => \Equal5~4_combout\);

-- Location: LCCOMB_X43_Y31_N0
\Equal5~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal5~5_combout\ = (\Equal5~3_combout\) # ((\Equal5~2_combout\) # ((\Equal5~1_combout\) # (\Equal5~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal5~3_combout\,
	datab => \Equal5~2_combout\,
	datac => \Equal5~1_combout\,
	datad => \Equal5~4_combout\,
	combout => \Equal5~5_combout\);

-- Location: LCCOMB_X42_Y30_N22
\address_counter~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \address_counter~1_combout\ = (\Equal5~0_combout\) # ((\Equal5~6_combout\) # (\Equal5~5_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Equal5~0_combout\,
	datac => \Equal5~6_combout\,
	datad => \Equal5~5_combout\,
	combout => \address_counter~1_combout\);

-- Location: LCCOMB_X42_Y30_N18
\address_counter~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \address_counter~2_combout\ = (\Add0~4_combout\ & ((\Equal5~7_combout\) # ((\Equal5~8_combout\) # (\address_counter~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~4_combout\,
	datab => \Equal5~7_combout\,
	datac => \Equal5~8_combout\,
	datad => \address_counter~1_combout\,
	combout => \address_counter~2_combout\);

-- Location: LCFF_X42_Y30_N19
\address_counter[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~clkctrl_outclk\,
	datain => \address_counter~2_combout\,
	ena => \address_counter[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => address_counter(2));

-- Location: LCCOMB_X44_Y31_N10
\Add0~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~10_combout\ = (address_counter(5) & (!\Add0~9\)) # (!address_counter(5) & ((\Add0~9\) # (GND)))
-- \Add0~11\ = CARRY((!\Add0~9\) # (!address_counter(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => address_counter(5),
	datad => VCC,
	cin => \Add0~9\,
	combout => \Add0~10_combout\,
	cout => \Add0~11\);

-- Location: LCFF_X43_Y31_N19
\address_counter[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~clkctrl_outclk\,
	sdata => \Add0~10_combout\,
	sload => VCC,
	ena => \address_counter[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => address_counter(5));

-- Location: LCCOMB_X44_Y31_N12
\Add0~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~12_combout\ = (address_counter(6) & (\Add0~11\ $ (GND))) # (!address_counter(6) & (!\Add0~11\ & VCC))
-- \Add0~13\ = CARRY((address_counter(6) & !\Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => address_counter(6),
	datad => VCC,
	cin => \Add0~11\,
	combout => \Add0~12_combout\,
	cout => \Add0~13\);

-- Location: LCFF_X43_Y31_N25
\address_counter[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~clkctrl_outclk\,
	sdata => \Add0~12_combout\,
	sload => VCC,
	ena => \address_counter[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => address_counter(6));

-- Location: LCCOMB_X44_Y31_N14
\Add0~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~14_combout\ = (address_counter(7) & (!\Add0~13\)) # (!address_counter(7) & ((\Add0~13\) # (GND)))
-- \Add0~15\ = CARRY((!\Add0~13\) # (!address_counter(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => address_counter(7),
	datad => VCC,
	cin => \Add0~13\,
	combout => \Add0~14_combout\,
	cout => \Add0~15\);

-- Location: LCFF_X43_Y31_N7
\address_counter[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~clkctrl_outclk\,
	sdata => \Add0~14_combout\,
	sload => VCC,
	ena => \address_counter[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => address_counter(7));

-- Location: LCCOMB_X44_Y31_N18
\Add0~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~18_combout\ = (address_counter(9) & (!\Add0~17\)) # (!address_counter(9) & ((\Add0~17\) # (GND)))
-- \Add0~19\ = CARRY((!\Add0~17\) # (!address_counter(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => address_counter(9),
	datad => VCC,
	cin => \Add0~17\,
	combout => \Add0~18_combout\,
	cout => \Add0~19\);

-- Location: LCCOMB_X42_Y31_N18
\address_counter[9]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \address_counter[9]~feeder_combout\ = \Add0~18_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Add0~18_combout\,
	combout => \address_counter[9]~feeder_combout\);

-- Location: LCFF_X42_Y31_N19
\address_counter[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~clkctrl_outclk\,
	datain => \address_counter[9]~feeder_combout\,
	ena => \address_counter[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => address_counter(9));

-- Location: LCCOMB_X44_Y31_N20
\Add0~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~20_combout\ = (address_counter(10) & (\Add0~19\ $ (GND))) # (!address_counter(10) & (!\Add0~19\ & VCC))
-- \Add0~21\ = CARRY((address_counter(10) & !\Add0~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => address_counter(10),
	datad => VCC,
	cin => \Add0~19\,
	combout => \Add0~20_combout\,
	cout => \Add0~21\);

-- Location: LCCOMB_X44_Y31_N22
\Add0~22\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~22_combout\ = (address_counter(11) & (!\Add0~21\)) # (!address_counter(11) & ((\Add0~21\) # (GND)))
-- \Add0~23\ = CARRY((!\Add0~21\) # (!address_counter(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => address_counter(11),
	datad => VCC,
	cin => \Add0~21\,
	combout => \Add0~22_combout\,
	cout => \Add0~23\);

-- Location: LCFF_X42_Y31_N3
\address_counter[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~clkctrl_outclk\,
	sdata => \Add0~22_combout\,
	sload => VCC,
	ena => \address_counter[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => address_counter(11));

-- Location: LCCOMB_X44_Y31_N30
\Add0~30\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~30_combout\ = (address_counter(15) & (!\Add0~29\)) # (!address_counter(15) & ((\Add0~29\) # (GND)))
-- \Add0~31\ = CARRY((!\Add0~29\) # (!address_counter(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => address_counter(15),
	datad => VCC,
	cin => \Add0~29\,
	combout => \Add0~30_combout\,
	cout => \Add0~31\);

-- Location: LCCOMB_X43_Y31_N28
\address_counter[15]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \address_counter[15]~feeder_combout\ = \Add0~30_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Add0~30_combout\,
	combout => \address_counter[15]~feeder_combout\);

-- Location: LCFF_X43_Y31_N29
\address_counter[15]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~clkctrl_outclk\,
	datain => \address_counter[15]~feeder_combout\,
	ena => \address_counter[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => address_counter(15));

-- Location: LCCOMB_X44_Y30_N0
\Add0~32\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~32_combout\ = (address_counter(16) & (\Add0~31\ $ (GND))) # (!address_counter(16) & (!\Add0~31\ & VCC))
-- \Add0~33\ = CARRY((address_counter(16) & !\Add0~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => address_counter(16),
	datad => VCC,
	cin => \Add0~31\,
	combout => \Add0~32_combout\,
	cout => \Add0~33\);

-- Location: LCCOMB_X44_Y30_N2
\Add0~34\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~34_combout\ = (address_counter(17) & (!\Add0~33\)) # (!address_counter(17) & ((\Add0~33\) # (GND)))
-- \Add0~35\ = CARRY((!\Add0~33\) # (!address_counter(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => address_counter(17),
	datad => VCC,
	cin => \Add0~33\,
	combout => \Add0~34_combout\,
	cout => \Add0~35\);

-- Location: LCFF_X44_Y30_N3
\address_counter[17]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~clkctrl_outclk\,
	datain => \Add0~34_combout\,
	ena => \address_counter[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => address_counter(17));

-- Location: LCFF_X44_Y30_N5
\address_counter[18]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~clkctrl_outclk\,
	datain => \Add0~36_combout\,
	ena => \address_counter[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => address_counter(18));

-- Location: LCFF_X44_Y30_N7
\address_counter[19]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~clkctrl_outclk\,
	datain => \Add0~38_combout\,
	ena => \address_counter[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => address_counter(19));

-- Location: LCCOMB_X43_Y30_N2
\Selector1~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector1~6_combout\ = (!address_counter(17) & (!address_counter(16) & (!address_counter(18) & !address_counter(19))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => address_counter(17),
	datab => address_counter(16),
	datac => address_counter(18),
	datad => address_counter(19),
	combout => \Selector1~6_combout\);

-- Location: LCFF_X44_Y30_N11
\address_counter[21]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~clkctrl_outclk\,
	datain => \Add0~42_combout\,
	ena => \address_counter[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => address_counter(21));

-- Location: LCCOMB_X43_Y30_N4
\Selector1~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector1~7_combout\ = (!address_counter(22) & (!address_counter(21) & (!address_counter(23) & !address_counter(20))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => address_counter(22),
	datab => address_counter(21),
	datac => address_counter(23),
	datad => address_counter(20),
	combout => \Selector1~7_combout\);

-- Location: LCCOMB_X43_Y31_N30
\address_counter[14]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \address_counter[14]~feeder_combout\ = \Add0~28_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Add0~28_combout\,
	combout => \address_counter[14]~feeder_combout\);

-- Location: LCFF_X43_Y31_N31
\address_counter[14]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~clkctrl_outclk\,
	datain => \address_counter[14]~feeder_combout\,
	ena => \address_counter[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => address_counter(14));

-- Location: LCCOMB_X43_Y31_N14
\address_counter[12]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \address_counter[12]~feeder_combout\ = \Add0~24_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Add0~24_combout\,
	combout => \address_counter[12]~feeder_combout\);

-- Location: LCFF_X43_Y31_N15
\address_counter[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~clkctrl_outclk\,
	datain => \address_counter[12]~feeder_combout\,
	ena => \address_counter[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => address_counter(12));

-- Location: LCCOMB_X43_Y31_N26
\Selector1~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector1~5_combout\ = (!address_counter(13) & (!address_counter(14) & (!address_counter(12) & !address_counter(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => address_counter(13),
	datab => address_counter(14),
	datac => address_counter(12),
	datad => address_counter(15),
	combout => \Selector1~5_combout\);

-- Location: LCCOMB_X43_Y30_N24
\Selector1~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector1~9_combout\ = (\Selector1~8_combout\ & (\Selector1~6_combout\ & (\Selector1~7_combout\ & \Selector1~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector1~8_combout\,
	datab => \Selector1~6_combout\,
	datac => \Selector1~7_combout\,
	datad => \Selector1~5_combout\,
	combout => \Selector1~9_combout\);

-- Location: LCFF_X43_Y32_N23
manchester_bit : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~clkctrl_outclk\,
	datain => \manchester_bit~0_combout\,
	ena => \m_bit1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \manchester_bit~regout\);

-- Location: LCCOMB_X43_Y32_N22
\manchester_bit~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \manchester_bit~0_combout\ = (\DATA~combout\ & (\manchester_bit~regout\ & \m1~regout\)) # (!\DATA~combout\ & ((\manchester_bit~regout\) # (\m1~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \DATA~combout\,
	datac => \manchester_bit~regout\,
	datad => \m1~regout\,
	combout => \manchester_bit~0_combout\);

-- Location: LCCOMB_X42_Y30_N12
\m_bit1~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \m_bit1~1_combout\ = (!\Equal5~6_combout\ & (\r_state.check_address~regout\ & (!\Equal5~7_combout\ & !\Equal5~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal5~6_combout\,
	datab => \r_state.check_address~regout\,
	datac => \Equal5~7_combout\,
	datad => \Equal5~8_combout\,
	combout => \m_bit1~1_combout\);

-- Location: LCCOMB_X42_Y30_N28
\m_bit1~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \m_bit1~2_combout\ = (\manchester_bit~0_combout\ & ((\Equal5~5_combout\) # ((\Equal5~0_combout\) # (!\m_bit1~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal5~5_combout\,
	datab => \Equal5~0_combout\,
	datac => \manchester_bit~0_combout\,
	datad => \m_bit1~1_combout\,
	combout => \m_bit1~2_combout\);

-- Location: LCFF_X42_Y30_N29
m_bit1 : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~clkctrl_outclk\,
	datain => \m_bit1~2_combout\,
	ena => \m_bit1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \m_bit1~regout\);

-- Location: LCCOMB_X42_Y30_N6
\m_bit2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \m_bit2~0_combout\ = (\m_bit1~regout\ & ((\Equal5~5_combout\) # ((\Equal5~0_combout\) # (!\m_bit1~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal5~5_combout\,
	datab => \Equal5~0_combout\,
	datac => \m_bit1~regout\,
	datad => \m_bit1~1_combout\,
	combout => \m_bit2~0_combout\);

-- Location: LCFF_X42_Y30_N7
m_bit2 : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~clkctrl_outclk\,
	datain => \m_bit2~0_combout\,
	ena => \m_bit1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \m_bit2~regout\);

-- Location: LCCOMB_X42_Y30_N4
\m_bit3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \m_bit3~0_combout\ = (\m_bit2~regout\ & ((\Equal5~5_combout\) # ((\Equal5~0_combout\) # (!\m_bit1~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal5~5_combout\,
	datab => \Equal5~0_combout\,
	datac => \m_bit2~regout\,
	datad => \m_bit1~1_combout\,
	combout => \m_bit3~0_combout\);

-- Location: LCFF_X42_Y30_N5
m_bit3 : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~clkctrl_outclk\,
	datain => \m_bit3~0_combout\,
	ena => \m_bit1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \m_bit3~regout\);

-- Location: LCCOMB_X42_Y30_N16
\Selector5~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector5~1_combout\ = (!\m_bit2~regout\ & (!\m_bit4~regout\ & (!\m_bit3~regout\ & \m_bit1~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \m_bit2~regout\,
	datab => \m_bit4~regout\,
	datac => \m_bit3~regout\,
	datad => \m_bit1~regout\,
	combout => \Selector5~1_combout\);

-- Location: LCCOMB_X42_Y31_N20
\address_counter[10]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \address_counter[10]~feeder_combout\ = \Add0~20_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Add0~20_combout\,
	combout => \address_counter[10]~feeder_combout\);

-- Location: LCFF_X42_Y31_N21
\address_counter[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~clkctrl_outclk\,
	datain => \address_counter[10]~feeder_combout\,
	ena => \address_counter[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => address_counter(10));

-- Location: LCCOMB_X42_Y31_N16
\Selector1~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector1~2_combout\ = (!address_counter(8) & (!address_counter(9) & (!address_counter(10) & !address_counter(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => address_counter(8),
	datab => address_counter(9),
	datac => address_counter(10),
	datad => address_counter(11),
	combout => \Selector1~2_combout\);

-- Location: LCFF_X44_Y31_N7
\address_counter[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~clkctrl_outclk\,
	datain => \Add0~6_combout\,
	ena => \address_counter[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => address_counter(3));

-- Location: LCCOMB_X43_Y30_N18
\Selector1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector1~0_combout\ = (address_counter(2) & (!address_counter(3) & (address_counter(0) & !address_counter(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => address_counter(2),
	datab => address_counter(3),
	datac => address_counter(0),
	datad => address_counter(1),
	combout => \Selector1~0_combout\);

-- Location: LCCOMB_X43_Y30_N0
\Selector1~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector1~3_combout\ = (\Selector1~1_combout\ & (\Selector5~1_combout\ & (\Selector1~2_combout\ & \Selector1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector1~1_combout\,
	datab => \Selector5~1_combout\,
	datac => \Selector1~2_combout\,
	datad => \Selector1~0_combout\,
	combout => \Selector1~3_combout\);

-- Location: LCCOMB_X43_Y30_N22
\Selector1~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector1~10_combout\ = (\fault~regout\) # ((\Selector1~4_combout\ & (\Selector1~9_combout\ & \Selector1~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector1~4_combout\,
	datab => \fault~regout\,
	datac => \Selector1~9_combout\,
	datad => \Selector1~3_combout\,
	combout => \Selector1~10_combout\);

-- Location: LCCOMB_X43_Y30_N12
\Selector1~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector1~14_combout\ = (\r_state.check_address~regout\ & \Selector1~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \r_state.check_address~regout\,
	datad => \Selector1~10_combout\,
	combout => \Selector1~14_combout\);

-- Location: LCCOMB_X43_Y30_N10
\Selector0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector0~1_combout\ = (!\Selector0~0_combout\ & ((\Selector5~0_combout\) # ((\r_state.idle~regout\) # (\Selector1~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector5~0_combout\,
	datab => \Selector0~0_combout\,
	datac => \r_state.idle~regout\,
	datad => \Selector1~14_combout\,
	combout => \Selector0~1_combout\);

-- Location: LCFF_X43_Y30_N11
\r_state.idle\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \Selector0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \r_state.idle~regout\);

-- Location: LCCOMB_X41_Y32_N10
\start_bit1~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \start_bit1~feeder_combout\ = \DATA~combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \DATA~combout\,
	combout => \start_bit1~feeder_combout\);

-- Location: LCCOMB_X41_Y32_N4
\Equal0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~1_combout\ = (!\start_bit3~regout\ & (!\start_bit2~regout\ & (\start_bit4~regout\ & \start_bit1~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \start_bit3~regout\,
	datab => \start_bit2~regout\,
	datac => \start_bit4~regout\,
	datad => \start_bit1~regout\,
	combout => \Equal0~1_combout\);

-- Location: LCCOMB_X42_Y32_N4
\Selector5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector5~0_combout\ = (!\r_state.idle~regout\ & (\Equal0~1_combout\ & \Equal0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \r_state.idle~regout\,
	datac => \Equal0~1_combout\,
	datad => \Equal0~0_combout\,
	combout => \Selector5~0_combout\);

-- Location: LCCOMB_X43_Y30_N14
\Selector2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector2~0_combout\ = (\r_state.check_functioncode~regout\ & (!\Selector5~0_combout\ & ((!\Selector1~10_combout\) # (!\r_state.check_address~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \r_state.check_functioncode~regout\,
	datab => \r_state.check_address~regout\,
	datac => \Selector5~0_combout\,
	datad => \Selector1~10_combout\,
	combout => \Selector2~0_combout\);

-- Location: LCCOMB_X43_Y30_N16
\Selector2~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector2~1_combout\ = (!\Selector1~12_combout\ & ((\Selector2~0_combout\) # ((!\fault~regout\ & \Selector1~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fault~regout\,
	datab => \Selector1~12_combout\,
	datac => \Selector2~0_combout\,
	datad => \Selector1~14_combout\,
	combout => \Selector2~1_combout\);

-- Location: LCFF_X43_Y30_N17
\r_state.check_functioncode\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \Selector2~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \r_state.check_functioncode~regout\);

-- Location: LCCOMB_X42_Y30_N0
\Mux0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux0~0_combout\ = (!\m_bit4~regout\ & (!\m_bit3~regout\ & (\m_bit2~regout\ $ (\m_bit1~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \m_bit2~regout\,
	datab => \m_bit4~regout\,
	datac => \m_bit3~regout\,
	datad => \m_bit1~regout\,
	combout => \Mux0~0_combout\);

-- Location: LCCOMB_X42_Y30_N2
\Selector3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector3~0_combout\ = (\r_state.check_functioncode~regout\ & \Mux0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \r_state.check_functioncode~regout\,
	datad => \Mux0~0_combout\,
	combout => \Selector3~0_combout\);

-- Location: LCCOMB_X42_Y32_N18
\Selector3~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector3~2_combout\ = (\Selector3~0_combout\) # ((\Selector3~1_combout\ & ((\Selector5~0_combout\) # (\f_state.idle~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector3~1_combout\,
	datab => \Selector5~0_combout\,
	datac => \f_state.idle~regout\,
	datad => \Selector3~0_combout\,
	combout => \Selector3~2_combout\);

-- Location: LCFF_X42_Y32_N19
\f_state.idle\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \Selector3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \f_state.idle~regout\);

-- Location: LCFF_X41_Y32_N11
start_bit1 : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~clkctrl_outclk\,
	datain => \start_bit1~feeder_combout\,
	ena => \ALT_INV_f_state.idle~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \start_bit1~regout\);

-- Location: LCCOMB_X41_Y32_N18
\start_bit2~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \start_bit2~feeder_combout\ = \start_bit1~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \start_bit1~regout\,
	combout => \start_bit2~feeder_combout\);

-- Location: LCFF_X41_Y32_N19
start_bit2 : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~clkctrl_outclk\,
	datain => \start_bit2~feeder_combout\,
	ena => \ALT_INV_f_state.idle~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \start_bit2~regout\);

-- Location: LCCOMB_X41_Y32_N20
\start_bit3~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \start_bit3~feeder_combout\ = \start_bit2~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \start_bit2~regout\,
	combout => \start_bit3~feeder_combout\);

-- Location: LCFF_X41_Y32_N21
start_bit3 : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~clkctrl_outclk\,
	datain => \start_bit3~feeder_combout\,
	ena => \ALT_INV_f_state.idle~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \start_bit3~regout\);

-- Location: LCFF_X41_Y32_N9
start_bit4 : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~clkctrl_outclk\,
	sdata => \start_bit3~regout\,
	sload => VCC,
	ena => \ALT_INV_f_state.idle~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \start_bit4~regout\);

-- Location: LCFF_X41_Y32_N23
start_bit5 : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~clkctrl_outclk\,
	sdata => \start_bit4~regout\,
	sload => VCC,
	ena => \ALT_INV_f_state.idle~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \start_bit5~regout\);

-- Location: LCCOMB_X41_Y32_N26
\start_bit6~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \start_bit6~feeder_combout\ = \start_bit5~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \start_bit5~regout\,
	combout => \start_bit6~feeder_combout\);

-- Location: LCFF_X41_Y32_N27
start_bit6 : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~clkctrl_outclk\,
	datain => \start_bit6~feeder_combout\,
	ena => \ALT_INV_f_state.idle~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \start_bit6~regout\);

-- Location: LCCOMB_X41_Y32_N12
\start_bit7~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \start_bit7~feeder_combout\ = \start_bit6~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \start_bit6~regout\,
	combout => \start_bit7~feeder_combout\);

-- Location: LCFF_X41_Y32_N13
start_bit7 : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~clkctrl_outclk\,
	datain => \start_bit7~feeder_combout\,
	ena => \ALT_INV_f_state.idle~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \start_bit7~regout\);

-- Location: LCFF_X41_Y32_N17
start_bit8 : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~clkctrl_outclk\,
	sdata => \start_bit7~regout\,
	sload => VCC,
	ena => \ALT_INV_f_state.idle~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \start_bit8~regout\);

-- Location: LCCOMB_X41_Y32_N16
\Equal0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = (\start_bit7~regout\ & (\start_bit6~regout\ & (!\start_bit8~regout\ & !\start_bit5~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \start_bit7~regout\,
	datab => \start_bit6~regout\,
	datac => \start_bit8~regout\,
	datad => \start_bit5~regout\,
	combout => \Equal0~0_combout\);

-- Location: LCCOMB_X42_Y32_N26
\Selector4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector4~0_combout\ = (!\r_state.idle~regout\ & ((\f_state.manchester_converting~regout\) # ((\Equal0~1_combout\ & \Equal0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~1_combout\,
	datab => \r_state.idle~regout\,
	datac => \f_state.manchester_converting~regout\,
	datad => \Equal0~0_combout\,
	combout => \Selector4~0_combout\);

-- Location: LCCOMB_X42_Y32_N16
\Selector4~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector4~1_combout\ = (\Selector4~0_combout\) # ((!\fault~regout\ & (\r_state.check_address~regout\ & \f_state.manchester_converting~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fault~regout\,
	datab => \r_state.check_address~regout\,
	datac => \f_state.manchester_converting~regout\,
	datad => \Selector4~0_combout\,
	combout => \Selector4~1_combout\);

-- Location: LCFF_X42_Y32_N17
\f_state.manchester_converting\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \Selector4~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \f_state.manchester_converting~regout\);

-- Location: LCCOMB_X43_Y31_N10
\address_counter[0]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \address_counter[0]~0_combout\ = (\manchester_counter~regout\ & (\f_state.manchester_converting~regout\ & \r_state.check_address~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \manchester_counter~regout\,
	datac => \f_state.manchester_converting~regout\,
	datad => \r_state.check_address~regout\,
	combout => \address_counter[0]~0_combout\);

-- Location: LCFF_X44_Y30_N1
\address_counter[16]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~clkctrl_outclk\,
	datain => \Add0~32_combout\,
	ena => \address_counter[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => address_counter(16));

-- Location: LCCOMB_X42_Y30_N26
\Equal5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal5~0_combout\ = (\Add0~38_combout\) # ((\Add0~32_combout\) # ((\Add0~34_combout\) # (\Add0~36_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~38_combout\,
	datab => \Add0~32_combout\,
	datac => \Add0~34_combout\,
	datad => \Add0~36_combout\,
	combout => \Equal5~0_combout\);

-- Location: LCCOMB_X42_Y30_N30
\m_bit4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \m_bit4~0_combout\ = (\m_bit3~regout\ & ((\Equal5~5_combout\) # ((\Equal5~0_combout\) # (!\m_bit1~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal5~5_combout\,
	datab => \Equal5~0_combout\,
	datac => \m_bit3~regout\,
	datad => \m_bit1~1_combout\,
	combout => \m_bit4~0_combout\);

-- Location: LCFF_X42_Y30_N31
m_bit4 : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CLK~clkctrl_outclk\,
	datain => \m_bit4~0_combout\,
	ena => \m_bit1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \m_bit4~regout\);

-- Location: LCCOMB_X42_Y30_N20
\Selector1~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector1~11_combout\ = (\m_bit4~regout\) # ((\m_bit3~regout\) # (\m_bit2~regout\ $ (!\m_bit1~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \m_bit2~regout\,
	datab => \m_bit4~regout\,
	datac => \m_bit3~regout\,
	datad => \m_bit1~regout\,
	combout => \Selector1~11_combout\);

-- Location: LCCOMB_X43_Y30_N26
\Selector1~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector1~12_combout\ = (\r_state.check_functioncode~regout\ & ((\Selector1~11_combout\) # (\fault~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \r_state.check_functioncode~regout\,
	datab => \Selector1~11_combout\,
	datad => \fault~regout\,
	combout => \Selector1~12_combout\);

-- Location: LCCOMB_X43_Y30_N28
\Selector1~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector1~13_combout\ = (!\Selector1~12_combout\ & ((\r_state.check_address~regout\ & ((!\Selector1~10_combout\))) # (!\r_state.check_address~regout\ & (\Selector5~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector5~0_combout\,
	datab => \Selector1~12_combout\,
	datac => \r_state.check_address~regout\,
	datad => \Selector1~10_combout\,
	combout => \Selector1~13_combout\);

-- Location: LCFF_X43_Y30_N29
\r_state.check_address\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \Selector1~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \r_state.check_address~regout\);

-- Location: LCCOMB_X42_Y32_N0
\current_state[0]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \current_state[0]~0_combout\ = !\r_state.check_address~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \r_state.check_address~regout\,
	combout => \current_state[0]~0_combout\);

-- Location: LCFF_X42_Y32_N1
\current_state[0]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \current_state[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \current_state[0]~reg0_regout\);

-- Location: LCFF_X42_Y32_N23
\current_state[1]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	sdata => \r_state.idle~regout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \current_state[1]~reg0_regout\);

-- Location: PIN_H10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_START_o(0));

-- Location: PIN_G21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_START_o(1));

-- Location: PIN_J18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_START_o(2));

-- Location: PIN_M22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_START_o(3));

-- Location: PIN_B16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_START_o(4));

-- Location: PIN_V9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_START_o(5));

-- Location: PIN_C16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_START_o(6));

-- Location: PIN_AC22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_START_o(7));

-- Location: PIN_AE20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ADDR_o(0));

-- Location: PIN_AF18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ADDR_o(1));

-- Location: PIN_V2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ADDR_o(2));

-- Location: PIN_P3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ADDR_o(3));

-- Location: PIN_H16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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

-- Location: PIN_H15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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

-- Location: PIN_T6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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

-- Location: PIN_V24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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

-- Location: PIN_C13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\RESPOND[0]~I\ : cycloneii_io
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
	padio => ww_RESPOND(0));

-- Location: PIN_D13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\RESPOND[1]~I\ : cycloneii_io
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
	padio => ww_RESPOND(1));

-- Location: PIN_G18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\RESPOND[2]~I\ : cycloneii_io
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
	padio => ww_RESPOND(2));

-- Location: PIN_T7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\RESPOND[3]~I\ : cycloneii_io
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
	padio => ww_RESPOND(3));

-- Location: PIN_T18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\RESPOND[4]~I\ : cycloneii_io
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
	padio => ww_RESPOND(4));

-- Location: PIN_F15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\RESPOND[5]~I\ : cycloneii_io
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
	padio => ww_RESPOND(5));

-- Location: PIN_B20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\RESPOND[6]~I\ : cycloneii_io
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
	padio => ww_RESPOND(6));

-- Location: PIN_D9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\RESPOND[7]~I\ : cycloneii_io
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
	padio => ww_RESPOND(7));

-- Location: PIN_P24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
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
	padio => ww_RESET);

-- Location: PIN_AE19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_LEDS(0));

-- Location: PIN_D18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_LEDS(1));

-- Location: PIN_AE4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_LEDS(2));

-- Location: PIN_P23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_LEDS(3));
END structure;


