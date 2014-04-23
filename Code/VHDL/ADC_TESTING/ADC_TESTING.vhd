library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;



entity ADC_TESTING is
  port (
		CLK_27    		: in 	std_logic;
		S_CLK    		: out std_logic;
		DATA	   		: in 	std_logic;
		CS					: out std_logic;
		SHDN				: out std_logic;
		LEDS	   		: out std_logic_vector(11 downto 0);
		reset				: in std_logic;
		----- testing-----
		S_CLK_test		: out std_logic;
		DATA_test		: out std_logic;
		CS_test			: out std_logic;
		pause				: in std_logic
    );
end entity ADC_TESTING;


architecture rtl of ADC_TESTING is
signal CLK_1MHz	: std_logic := '0';
signal LED_out		: std_logic_vector(11 downto 0);
signal s_wait_conv: std_logic;
signal done_flag		: std_logic := '0';
begin
LEDS <= LED_out;
SHDN <= '1';



process(CLK_27)
	variable counter : integer range 0 to 1351 := 0;
	begin
		if rising_edge(CLK_27) then
			counter := counter + 1;
			if counter = 14 then
				counter := 0;
				CLK_1MHz <= not CLK_1MHz;
			end if;
			if s_wait_conv = '1' then
				S_CLK <= CLK_1MHz;
				S_CLK_test <= CLK_1MHz;
			else
				S_CLK <= '0';
				S_CLK_test <= '0';
			end if;
		end if;
end process;

process(CLK_1MHz, reset)
	variable wait_counter 	: integer range 0 to 1000000 := 0;
	variable wait_flag		: std_logic := '0';
	
	variable wait_conv		: std_logic := '0';
	variable first_clock		: std_logic := '1';
	variable data_counter	: integer range 0 to 12 := 0;
	begin
		
		if CLK_1MHz'event and CLK_1MHz = '1' then
		if reset = '1' then
			wait_flag := '0';
			done_flag <= '0';
			CS <= '1';
			CS_test <= '1';
			data_counter := 0;
			first_clock := '1';
			wait_conv := '0';
			wait_counter := 0;
			LED_out <= "000000000000";
		end if;
			if pause = '1' then
				wait_counter := wait_counter + 1;
			end if;
			s_wait_conv <= wait_conv;
			if wait_counter > 1000 then -- set flag to 1 when a second has passed
				wait_counter := 0;
				wait_flag := '1';
			end if;
		
			if wait_flag = '1' then -- take a sample each second
				CS <= '0';
				CS_test <= '0';
				
				if wait_conv = '0' then
					if DATA = '1' then
						wait_conv := '1';
					end if;
				else
					if first_clock = '1' then
						first_clock := '0';
					else
						LED_out(11 - data_counter) <= DATA;
						DATA_test <= DATA;
						data_counter := data_counter + 1;
						if data_counter = 12 then
							done_flag <= '1';
						end if;
					end if;
				end if;
				if done_flag = '1' then
					wait_flag := '0';
					done_flag <= '0';
					CS <= '1';
					CS_test <= '1';
					data_counter := 0;
					first_clock := '1';
					wait_conv := '0';
				end if;
				
			end if;
		end if;
	--	if CLK_1MHz'event and CLK_1MHz = '0' then
	--	  S_CLK <= '0';
	--	end if;
		end process;
end architecture;

-- END OF FILE --