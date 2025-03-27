library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity and_gate_tb is
end and_gate_tb;

architecture behavior of and_gate_tb is
	component and_gate
		port (
			a: in STD_LOGIC;
			b: in STD_LOGIC;
			y: out STD_LOGIC
		);
	end component;

	signal a: STD_LOGIC := '0';
	signal b: STD_LOGIC := '0';
	signal y: STD_LOGIC;
begin
	uut: and_gate port map(
		a => a,
		b => b,
		y => y
	);

	stim_proc: process
	begin
		report "Starting AND gate sim...";
		a <= '0'; b <= '0'; wait for 10 ns;
		a <= '0'; b <= '1'; wait for 10 ns;
		a <= '1'; b <= '0'; wait for 10 ns;
		a <= '1'; b <= '1'; wait for 10 ns;

		report "done";
		wait;
	end process;
end behavior;


