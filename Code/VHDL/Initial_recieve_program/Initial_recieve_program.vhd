library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;



entity initial_recieve_program is
  port (
------------Debugging---------
    START_o   : out std_logic_vector(7 downto 0);
    ADDR_o    : out std_logic_vector(3 downto 0);
	current_state : out std_logic_vector(3 downto 0);
------------inputs------------
		CLK	    	: in std_logic;
		RESET	  	: in std_logic;
		DATA	   	: in std_logic;
------------Outputs-----------
		LEDS	   	: out std_logic_vector(3 downto 0)
    );
end entity initial_recieve_program;


architecture rtl of initial_recieve_program is
  type state_type is (idle, address_check, get_data);
  signal r1,r2,r3,r4,r5,r6,r7,r8	: std_logic;
  signal s1,s2,s3,s4,s5,s6,s7,s8 	: std_logic;
  signal reveived_bit				: std_logic;
  signal start						: std_logic_vector(7 downto 0);
  signal address 					: std_logic_vector(3 downto 0);
  signal fc 						: std_logic_vector(3 downto 0);
  signal bit_count					: std_logic;
  signal address_counter			: std_logic_vector(2 downto 0);
  signal state 						: state_type;
begin
	START_o <= start;
	ADDR_o  <= address;  
	start <= s8 & s7 & s6 & s5 & s4 & s3 & s2 & s1; 
	address <=  r4 & r3 & r2 & r1; 
	
	 process(CLK,RESET)
	 variable data_count 		: integer range 0 to 3;
	 variable Manchester_r		: std_logic_vector(1 downto 0);
	 variable b1,b2				: std_logic;
		begin
			
			if rising_edge(CLK) then
			
				if start = "01101001" then
					state <= address_check;
				end if;
				
				if address = "0001" then
					state <= get_data;
					data_count := 0;
				end if;
				
				if address = "0010" then
					state <= get_data;
					data_count := 0;
				end if;
				
				if address_counter = "100" then
					state <= idle;
				end if;
				
				if state = get_data then
					state <= idle;
				end if;
				
				if RESET = '0' then
					state <= idle;
				end if;
			end if;
			
			if falling_edge(CLK) then 			-- sample data
				if RESET = '0' then
					LEDS <= "0000";
				end if;
				
				case state is
					when idle => 					-- wait for start sequence
						current_state <= "0001";
						s8 <= s7;
						s7 <= s6;
						s6 <= s5;
						s5 <= s4;
						s4 <= s3;
						s3 <= s2;
						s2 <= s1;
						s1 <= DATA;
						bit_count <= '0';
						address_counter <= "000";
					
					when address_check => 			-- Sample manchester
						s8 <= '1';
						s7 <= '1';
						s6 <= '1';
						s5 <= '1';
						s4 <= '1';
						s3 <= '1';
						s2 <= '1';
						s1 <= '1';
						current_state <= "0010";
						if bit_count = '0' then	
							b1 := DATA;
							r7 <= b1;
							bit_count <= '1';
						elsif bit_count = '1' then
							b2 := DATA;
							r8 <= b2;
							Manchester_r := b1 & b2;
							if Manchester_r = "01" then
								r1 <= '0';
							else
								r1 <= '1';
							end if;
							r4 <= r3;
							r3 <= r2;
							r2 <= r1;
							bit_count <= '0';
							address_counter <= std_logic_vector(unsigned(address_counter)+1);
						end if;
				
				
					when get_data =>
						r4 <= '1';
						r3 <= '1';
						r2 <= '1'; 
						r1 <= '1';
						current_state <= "0011";
						LEDS <= address;
				
			end case;
			
			end if;
	 end process;
end architecture;

-- END OF FILE --