library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity Initial_Recieve_program_tb is
end;

architecture bench of Initial_Recieve_program_tb is

  component Initial_Recieve_program
    port (
      START_o         : out std_logic_vector(7 downto 0);
      ADDR_o          : out std_logic_vector(3 downto 0);
	  current_state : out std_logic_vector(3 downto 0);
      CLK           : in std_logic;
      RESET         : in std_logic;
      LEDS          : out std_logic_vector(3 downto 0);
      DATA          : in  std_logic
      );
  end component;
  signal START            : std_logic_vector(7 downto 0)  := "00000000";
  signal ADDR             : std_logic_vector(3 downto 0)  := "0000";
  signal current_state 	  : std_logic_vector(3 downto 0)  := "0000";
  signal CLK              : std_logic                     := '0';
  signal dclk             : std_logic                     := '0';
  signal LEDS             : std_logic_vector(3 downto 0)  := X"0";
  signal RESET            : std_logic                     := '1';
  signal DATA             : std_logic                     := '0';
  signal input_data       : std_logic_vector(23 downto 0) := "011010010101011001010101";
  signal pause		      : std_logic_vector(15 downto 0) := "0000000000000000";
  signal input_data2      : std_logic_vector(23 downto 0) := "011010010101100101010101";

  
begin

  Initial_Recieve_program_inst : Initial_Recieve_program
    port map (
      START_o       => START,
      ADDR_o        => ADDR,
	  current_state => current_state,
      CLK         => CLK,
      RESET       => RESET,
      LEDS        => LEDS,
      DATA        => DATA);

  -- clock generation
  CLK <= not CLK after 50us/2;
  dclk <= not dclk after 50us;




  stimulus : process
  begin
  wait until CLK = '1';
  loop
    for I in 0 to 23 loop
      DATA <= input_data(23-I);
      wait until CLK = '1';
    end loop;
	--for I in 0 to 15 loop
    --  DATA <= pause(15-I);
    --  wait until CLK = '1';
    --end loop;
	for I in 0 to 23 loop
      DATA <= input_data2(23-I);
      wait until CLK = '1';
    end loop;
	end loop;
    wait;
  end process;

end;  -- Architecture


-- END OF FILE --
