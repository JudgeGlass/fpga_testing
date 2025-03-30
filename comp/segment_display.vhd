library ieee;
use ieee.std_logic_1164.all;

entity segment_display is
	port(
		clk: in std_logic;
		data: in std_logic_vector (23 downto 0);
		HEX0: out std_logic_vector (7 downto 0);
		HEX1: out std_logic_vector (7 downto 0);
		HEX2: out std_logic_vector (7 downto 0);
		HEX3: out std_logic_vector (7 downto 0);
		HEX4: out std_logic_vector (7 downto 0);
		HEX5: out std_logic_vector (7 downto 0)
	);
end segment_display;

architecture behavior of segment_display is

	component segment_test
		port(
			clk: in std_logic;
			B: in std_logic_vector (3 downto 0);
			HEXR_Control: out std_logic_vector (7 downto 0)
		);
	end component;

begin
	SEGMENT_Test_Control_0 : segment_test
		port map (
			clk => clk,
			B => data(3 downto 0),
			HEXR_Control => HEX0
		);
	
	SEGMENT_Test_Control_1 : segment_test
		port map (
			clk => clk,
			B => data(7 downto 4),
			HEXR_Control => HEX1
		);
		
	SEGMENT_Test_Control_2 : segment_test
		port map (
			clk => clk,
			B => data(11 downto 8),
			HEXR_Control => HEX2
		);
		
	SEGMENT_Test_Control_3 : segment_test
		port map (
			clk =>  clk,
			B => data(15 downto 12),
			HEXR_Control => HEX3
		);
		
	SEGMENT_Test_Control_4 : segment_test
		port map (
			clk => clk,
			B => data(19 downto 16),
			HEXR_Control => HEX4
		);
		
	SEGMENT_Test_Control_5 : segment_test
		port map (
			clk => clk,
			B => data(23 downto 20),
			HEXR_Control => HEX5
		);
end behavior;