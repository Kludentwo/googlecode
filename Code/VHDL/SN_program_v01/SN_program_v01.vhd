library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;



entity SN_program_v01 is
  port (
------------Debugging---------
		START_o   		: out std_logic_vector(7 downto 0);
		ADDR_o    		: out std_logic_vector(3 downto 0);
		current_state 	: out std_logic_vector(3 downto 0);
------------inputs------------
		RESPOND			: in 	std_logic_vector(7 downto 0);
		CLK	    		: in 	std_logic;
		RESET	  			: in 	std_logic;
		DATA	   		: in 	std_logic;
------------Outputs-----------
		LEDS	   		: out std_logic_vector(3 downto 0)
    );
end entity SN_program_v01;


architecture rtl of SN_program_v01 is
------------Signals-----------
  type 	r_state_type is (idle,check_address,check_functioncode);
  type 	f_state_type is (idle,manchester_converting,get_info,get_data);
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
  signal m_bit1,
			m_bit2,
			m_bit3,
			m_bit4						: std_logic;
  signal manchester_counter 		: std_logic := '0';

			
begin

	
	 process(CLK,RESET)
------------Variables-----------
		variable start_seq 				: std_logic_vector(7 downto 0) := "01101001";
		variable address 					: std_logic_vector(3 downto 0) := "0001";
		variable manchester_seq			: std_logic_vector(1 downto 0);
		variable manchester_bit			: std_logic;
		variable m1,m2						: std_logic;
		variable fault						: std_logic;
		variable address_counter		: integer;
		variable functioncode_counter : integer;
		variable functioncode			: std_logic_vector(3 downto 0);
		begin
			if RESET = '0' then
			
			end if;
			if rising_edge(CLK) then  			-- state controller
				case r_state is
					when idle =>
						current_state <= "0001";
						if (start_bit8 & start_bit7 & start_bit6 & start_bit5 & start_bit4 & start_bit3 & start_bit2 & start_bit1) = start_seq then
							r_state <= check_address;
							f_state <= manchester_converting;
						end if;
						
					when check_address =>
						current_state <= "0010";
						--if address_counter = 4 then
							if(m_bit4 & m_bit3 & m_bit2 & m_bit1) = address then
								r_state <= check_functioncode;
						--	end if;
						end if;
						if fault = '1' then
							r_state <= idle;
							f_state <= idle;
						end if;
						
					when check_functioncode =>
						current_state <= "0011";
						functioncode := m_bit4 & m_bit3 & m_bit2 & m_bit1;
						if fault = '1' then
							r_state <= idle;
							f_state <= idle;
						end if;
						case functioncode is
							when "0001" => f_state <= get_info;
							when "0010" => f_state <= get_data;
							when others => 
								f_state <= idle;
								r_state <= idle;
						end case;
				end case;
			end if;
			
			if falling_edge(CLK) then 			-- sample data
				case f_state is 
					when idle => 					-- wait for start sequence
						start_bit8 <= start_bit7;
						start_bit7 <= start_bit6;
						start_bit6 <= start_bit5;
						start_bit5 <= start_bit4;
						start_bit4 <= start_bit3;
						start_bit3 <= start_bit2;
						start_bit2 <= start_bit1;
						start_bit1 <= DATA;
						fault := '0';
				
					when manchester_converting =>
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
							m_bit4 <= m_bit3;
							m_bit3 <= m_bit2;
							m_bit2 <= m_bit1;
							m_bit1 <= manchester_bit;
							if r_state = check_address then
								address_counter := address_counter + 1;
								if address_counter = 5 then
									m_bit4 <= '0';
									m_bit3 <= '0';
									m_bit2 <= '0';
									m_bit1 <= '0';
									address_counter := 0;
								end if;
							end if;
							if r_state = check_functioncode then	
							end if;
							
						end if;
					
					when get_info =>
					
					when get_data =>
					
				end case;
			
			end if;
	 end process;
end architecture;

-- END OF FILE --