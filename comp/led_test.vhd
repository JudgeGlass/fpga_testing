library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity led_test is
	port (
		LEDR_Control: out STD_LOGIC_VECTOR (9 downto 0)
	);
end led_test;

architecture Behavioral of led_test is
begin
	LEDR_Control <= "1010101011";
end Behavioral;