----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/18/2019 01:54:32 PM
-- Design Name: 
-- Module Name: Divisor_Clock - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;


entity divClk is
    Port ( reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           clk1Hz : out STD_LOGIC);
end divClk;

architecture Behavioral of divClk is

constant preset1 : std_logic_vector(25 downto 0) := "00000000000000000000000001";--Numero de ciclos p/ nivel alto
constant preset2 : std_logic_vector(25 downto 0) := "00000000000000000000000100";--Numero de ciclos p/ nivel baixo 
signal s_1Hz : std_logic := '0';
signal count : std_logic_vector(25 downto 0) := (others => '0');

begin

clk1Hz <= s_1Hz;

process (clk, reset)
begin 
    if rising_edge(clk) then
		if s_1Hz = '1' then
        if reset= '1' then
            s_1Hz <= '0';
            count <= (others => '0');
        elsif count=preset1 then
            s_1Hz <= not s_1Hz;
            count <= (others => '0');
        else 
            count <= count + '1';
        end if;
		else 
			if reset= '1' then
            s_1Hz <= '0';
            count <= (others => '0');
        elsif count=preset2 then
            s_1Hz <= not s_1Hz;
            count <= (others => '0');
        else 
            count <= count + '1';
		  end if;
    end if;
	end if;
end process;

end Behavioral;
