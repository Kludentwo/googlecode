library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;



entity SN_program_v01 is
  port (
------------inputs------------
		CLK	    		: in 	std_logic;
		RESET	  			: in 	std_logic;
		DATA	   		: in 	std_logic;
		ADC_DATA			: in  std_logic_vector(11 downto 0);
		ADC_DATA_RDY	: in std_logic;
------------Outputs-----------
		R_DATA			: out std_logic;
		LEDS				: out std_logic_vector(11 downto 0);
		temperature_out: out std_logic_vector(11 downto 0);
		
		--LEDS	   		: out std_logic_vector(3 downto 0);
		--LEDS_R			: out std_logic_vector(3 downto 0);
		--DATA_debugging : out std_logic;
		--CLK_debugging	: out std_logic;
		--fcode_1_leds	: inout std_logic_vector(3 downto 0);
		--fcode_2_leds	: inout std_logic_vector(3 downto 0);
		in_switches		: in std_logic_vector(15 downto 0);
		R_DATA_debigging: out std_logic--;
		--responding		: out std_logic
    );
end entity SN_program_v01;


architecture rtl of SN_program_v01 is
------------Signals-----------
  type 	r_state_type is (idle,check_address,check_functioncode);
  type 	f_state_type is (idle,manchester_converting,respond);
  signal r_state						: r_state_type;
  signal f_state						: f_state_type;
  signal start_bit1,
			start_bit2,
			start_bit3,
			start_bit4,
			start_bit5,
			start_bit6,
			start_bit7,
			start_bit8					: std_logic;
  signal m_a_bit1,
			m_a_bit2,
			m_a_bit3,
			m_a_bit4						: std_logic;
  signal m_f_bit1,
			m_f_bit2,
			m_f_bit3,
			m_f_bit4						: std_logic;
  signal manchester_counter 		: std_logic := '0';
  signal r_manchester_counter		: std_logic := '0';
  signal flopped_ADC_DATA			: std_logic_vector(11 downto 0);
  	
  signal ca_counter					: integer range 0 to 100 := 0;
  signal cf_counter					: integer range 0 to 100 := 0;
  signal mc_counter					: integer range 0 to 100 := 0;
  signal gi_counter 					: integer range 0 to 100 := 0;
  signal gd_counter					: integer range 0 to 100 := 0;
  signal output_data					: std_logic;
  signal new_sample					: std_logic;
  signal temperature					: std_logic_vector(11 downto 0);
  signal error_counter				: std_logic_vector(11 downto 0);
begin
	--CLK_debugging <= CLK;
	--DATA_debugging <= DATA;
R_DATA <= output_data;
--LEDS <= flopped_ADC_DATA;	
temperature_out <= temperature;
LEDS <= error_counter;
------------------------------------------------------------
-- Routine type:		Process
-- name: 				communication
-- Sensitivity list:	CLK, RESET
-- Desription:			The process communication handles the
--							the communication done.
--							It has a statemachine controller which 
--							is handled on falling edge, and  
--							datasampling, handled on rising edge.
------------------------------------------------------------
	 communication: process(CLK,RESET)
------------Variables-----------
		variable start_seq 					: std_logic_vector(7 downto 0) := "01101001";
		variable address 						: std_logic_vector(3 downto 0) := "0001";
		variable errors						: std_logic_vector(3 downto 0) := X"0";
		variable get_info						: std_logic_vector(3 downto 0) := "0001";
		variable get_data						: std_logic_vector(3 downto 0) := "0010";
		variable manchester_seq				: std_logic_vector(1 downto 0);
		variable manchester_bit				: std_logic;
		variable m1,m2							: std_logic;
		variable fault							: std_logic;
		variable address_counter			: integer range 0 to 4;
		variable functioncode_counter 	: integer range 0 to 5;
		variable functioncode				: std_logic_vector(3 downto 0);
		variable r_address					: std_logic_vector(3 downto 0);
		variable respond_counter			: integer range 0 to 24 := 0;	
		variable respond_flag				: std_logic := '0';
		variable fault_counts				: integer range 0 to 100 := 50;
		variable Respond_Data				: std_logic_vector(23 downto 0);
		variable Respond_Data_d				: std_logic_vector(23 downto 0);
		variable new_value					: std_logic;
		variable averaged_ADC_DATA			: std_logic_vector(23 downto 0);
		variable averaged_ADC_DATA_OLD	: std_logic_vector(23 downto 0):= X"000000";
		variable temp_temp					: std_logic_vector(11 downto 0);

		begin
				
		if falling_edge(CLK) then 
			if RESET = '0' then
				r_state <= idle;
				f_state <= idle;
				error_counter <= X"000";
			end if;
			
			if ADC_DATA_RDY = '1' then
				if new_sample = '1' then
					new_sample <= '0';
					flopped_ADC_DATA <= ADC_DATA;
--					new_value := '1';
				end if;
			end if;
--			
			if ADC_DATA_RDY = '0' then
				new_sample <= '1';
			end if;
--			
--			if new_value = '1' then
--				new_value := '0';
--				temp_temp := std_logic_vector(741104097141/(unsigned(flopped_ADC_DATA) - 2865510) - 258424);
--				temperature <= temp_temp(11 downto 0);
--				--temperature <= "001000110000";
--			end if;
			
			if fault = '1' then
				r_state <= idle;
				f_state <= idle;
				errors := "0001";
				error_counter <= std_logic_vector(unsigned(error_counter) + 1);
			end if;
			------------------------------------------------------------
			-- Routine type:		Case
			-- name: 				statemachine_controller
			-- Sensitivity list:	r_state
			-- Desription:			The case handles all statemachine related
			--							When the right start, address and a
			--							functioncode is recieved it changes r_state
			--							and f_state accordingly.
			------------------------------------------------------------
				statemachine_controller: case r_state is
					when idle =>
						--LEDS	<= X"00F";
						if (start_bit8 & start_bit7 & start_bit6 & start_bit5 & start_bit4 & start_bit3 & start_bit2 & start_bit1) = start_seq then
							r_state <= check_address;
							f_state <= manchester_converting;
						end if;
						if respond_flag = '1' then
							f_state <= idle;
						end if;

					when check_address =>
						--LEDS	<= X"0F0";
						r_address := m_a_bit4 & m_a_bit3 & m_a_bit2 & m_a_bit1;
						if address_counter = 4 then
							if r_address = address then
								r_state <= check_functioncode;
							else
								r_state <= idle;
								f_state <= idle;
							end if;
						end if;
						
					when check_functioncode =>
						--LEDS	<= X"F00";
						functioncode := m_f_bit4 & m_f_bit3 & m_f_bit2 & m_f_bit1;
						if functioncode_counter = 4 then
							if functioncode = get_info then
								f_state <= respond;
								r_state <= idle;
								Respond_Data := address & get_info & errors & in_switches(11 downto 0);
								errors := x"0";
								
							elsif functioncode = get_data then
								f_state <= respond;
								r_state <= idle;
								Respond_Data := address & get_data & errors & flopped_ADC_DATA;
								errors := x"0";
								
							else
								r_state <= idle;
								f_state <= idle;
								errors := "0001";
								--error_counter <= std_logic_vector(unsigned(error_counter) + 1);
							end if;
						end if;
						
				end case statemachine_controller;
			end if;

			
			if rising_edge(CLK) then 			
			if RESET = '0' then

			end if;
			------------------------------------------------------------
			-- Routine type:		Case
			-- name: 				Linecoding
			-- Sensitivity list:	f_state
			-- Desription:			The case handles all linecoding in the
			--							system.
			------------------------------------------------------------
				Linecoding: case f_state is 
					when idle => 					
						start_bit8 <= start_bit7;
						start_bit7 <= start_bit6;
						start_bit6 <= start_bit5;
						start_bit5 <= start_bit4;
						start_bit4 <= start_bit3;
						start_bit3 <= start_bit2;
						start_bit2 <= start_bit1;
						start_bit1 <= DATA;
						fault := '0';
						respond_flag := '0';
						functioncode_counter := 0;
						address_counter := 0;
						m_a_bit4 <= '0';
						m_a_bit3 <= '0';
						m_a_bit2 <= '0';
						m_a_bit1 <= '0';
						m_f_bit4 <= '0';
						m_f_bit3 <= '0';
						m_f_bit2 <= '0';
						m_f_bit1 <= '0';
						output_data <= '0';
						
					when manchester_converting =>
						start_bit8 <= '0';
						start_bit7 <= '0';
						start_bit6 <= '0';
						start_bit5 <= '0';
						start_bit4 <= '0';
						start_bit3 <= '0';
						start_bit2 <= '0';
						start_bit1 <= '0';
						
						if manchester_counter = '0' then
							m1 := DATA;
							manchester_counter <= '1';
						elsif manchester_counter ='1' then
							m2 := DATA;
							manchester_counter <= '0';
							manchester_seq := m1 & m2;
							if manchester_seq = "01" then
								manchester_bit := '0';
							elsif manchester_seq = "10" then
								manchester_bit := '1';
							else
								fault := '1';
							end if;

							if r_state = check_address then
								m_a_bit4 <= m_a_bit3;
								m_a_bit3 <= m_a_bit2;
								m_a_bit2 <= m_a_bit1;
								m_a_bit1 <= manchester_bit;
								address_counter := address_counter + 1;
							end if;
							if r_state = check_functioncode then
								m_f_bit4 <= m_f_bit3;
								m_f_bit3 <= m_f_bit2;
								m_f_bit2 <= m_f_bit1;
								m_f_bit1 <= manchester_bit;
								functioncode_counter := functioncode_counter + 1;
								r_manchester_counter <= '0';
							end if;
							
						end if;
					
					when respond => 
						output_data <= Respond_Data(23 - respond_counter);
						respond_counter := respond_counter + 1;
						if respond_counter = 24 then
							respond_flag := '1';
							respond_counter := 0;
						end if;
				end case Linecoding;
			
			end if;
	 end process communication;
end architecture;

-- END OF FILE --