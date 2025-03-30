library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- 0 - Top
-- 1 - Top right
-- 2 - Bottom right
-- 3 - Bottom
-- 4 - Bottom left
-- 5 - Top left
-- 6 - Center
-- 7 - Decimal

entity segment_test is
	port(
		clk: in std_logic;
		B: in std_logic_vector (3 downto 0);
		HEXR_Control: out std_logic_vector (7 downto 0)
	);
end segment_test;

architecture behavior of segment_test is
begin
	process(clk) is
	begin
		
		if B(3 downto 0) = "0001" then
			HEXR_Control <= not "00000110";
		elsif B(3 downto 0) = "0010" then
			HEXR_Control <= not "01011011";
		elsif B(3 downto 0) = "0011" then
			HEXR_Control <= not "01001111";
		elsif B(3 downto 0) = "0100" then
			HEXR_Control <= not "01100110";
		elsif B(3 downto 0) = "0101" then
			HEXR_Control <= not "01101101";
		elsif B(3 downto 0) = "0110" then
			HEXR_Control <= not "01111101";
		elsif B(3 downto 0) = "0111" then
			HEXR_Control <= not "00000111";
		elsif B(3 downto 0) = "1000" then
			HEXR_Control <= not "01111111";
		elsif B(3 downto 0) = "1001" then
			HEXR_Control <= not "01100111";
		elsif B(3 downto 0) = "1010" then
			HEXR_Control <= not "01110111";
		elsif B(3 downto 0) = "1011" then
			HEXR_Control <= not "01111100";
		elsif B(3 downto 0) = "1100" then
			HEXR_Control <= not "01011000";
		elsif B(3 downto 0) = "1101" then
			HEXR_Control <= not "01011110";
		elsif B(3 downto 0) = "1110" then
			HEXR_Control <= not "01111001";
		elsif B(3 downto 0) = "1111" then
			HEXR_Control <= not "01110001";
		elsif B(3 downto 0) = "0000" then
			HEXR_Control <= not "00111111";
		end if;
		
		
	end process;
	
end behavior;