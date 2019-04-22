library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;  --try to use this library as much as possible.
 
entity sine is
port (clk :in  std_logic;
      dataout : out integer range -128 to 127
      );
end sine;
 
architecture Behavioral of sine is
  signal i : integer range 0 to 30:=0;
  type memory_type is array (0 to 29) of integer range -128 to 127; 
  --ROM for storing the sine values generated by MATLAB.
  signal sine : memory_type :=(0,16,31,45,58,67,74,77,77,74,67,58,45,31,16,0,-16,-31,-45,-58,-67,-74,-77,-77,-74,-67,-58,-45,-31,-16);
begin
  process(clk)
  begin
    --to check the rising edge of the clock signal
    if(rising_edge(clk)) then    
      dataout <= sine(i);
      i <= i+ 1;
      if(i = 29) then
        i <= 0;
      end if;
    end if;
  end process;
end Behavioral;