library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity DE10_LITE is
	port (
		ADC_CLK_10 : in STD_LOGIC;
		MAX10_CLK1_50: in STD_LOGIC;
		MAX10_CLK2_50: in STD_LOGIC;
		
		DRAM_ADDR: out STD_LOGIC_VECTOR (12 downto 0);
		DRAM_BA: out STD_LOGIC_VECTOR (1 downto 0);
		DRAM_CAS_N: out STD_LOGIC;
		DRAM_CKE: out STD_LOGIC;
		DRAM_CLK: out STD_LOGIC;
		DRAM_CS_N: out STD_LOGIC;
		DRAM_DQ: in STD_LOGIC_VECTOR (15 downto 0);
		DRAM_LDQM: out STD_LOGIC;
		DRAM_RAS_N: out STD_LOGIC;
		DRAM_UDQM: out STD_LOGIC;
		DRAM_WE_N: out STD_LOGIC;

		HEX0: out STD_LOGIC_VECTOR (7 downto 0);
		HEX1: out STD_LOGIC_VECTOR (7 downto 0);
		HEX2: out STD_LOGIC_VECTOR (7 downto 0);
		HEX3: out STD_LOGIC_VECTOR (7 downto 0);
		HEX4: out STD_LOGIC_VECTOR (7 downto 0);
		HEX5: out STD_LOGIC_VECTOR (7 downto 0);

		KEY: in STD_LOGIC_VECTOR (1 downto 0);

		LEDR: out STD_LOGIC_VECTOR (9 downto 0);

		SW: in STD_LOGIC_VECTOR (9 downto 0);

		VGA_B: out STD_LOGIC_VECTOR (3 downto 0);
		VGA_G: out STD_LOGIC_VECTOR (3 downto 0);
		VGA_HS: out STD_LOGIC;
		VGA_R: out STD_LOGIC_VECTOR (3 downto 0);
		VGA_VS: out STD_LOGIC;

		GSENSOR_CS_N: out STD_LOGIC;
		GSENSOR_INT: in STD_LOGIC_VECTOR (2 downto 1);
		GSENSOR_SCLK: out STD_LOGIC;
		GSENSOR_SDI: inout STD_LOGIC;
		GSENSOR_SDO: inout STD_LOGIC;

		ARDUINO_IO: inout STD_LOGIC_VECTOR (15 downto 0);
		ARDUINO_RESET_N: inout STD_LOGIC
	);
end DE10_LITE;

architecture Rtl of DE10_LITE is
	signal clk: std_logic;
	signal leds: STD_LOGIC_VECTOR(9 downto 0);
	signal data: std_logic_vector(23 downto 0) := (others => '0');
	signal led: std_logic := '0';
	
	component led_test
		port (
			LEDR_Control: out STD_LOGIC_VECTOR (9 downto 0)
		);
	end component;
	
	component segment_display
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
	end component;
	
	component VGA_Controller
		port (
			clk: in std_logic;
			VGA_B: out STD_LOGIC_VECTOR (3 downto 0);
			VGA_G: out STD_LOGIC_VECTOR (3 downto 0);
			VGA_HS: out STD_LOGIC;
			VGA_R: out STD_LOGIC_VECTOR (3 downto 0);
			VGA_VS: out STD_LOGIC
		);
	end component;
	
	component pll
		port (
			inclk0: in std_logic;
			c0: out std_logic
		);
	end component;

begin
	-- c0 is a 25.175MHz clock by phase-lock loop
	pll_inst : pll
		port map(
			inclk0 => MAX10_CLK1_50,
			c0 => clk
		);

	Display : segment_display
		port map (
			clk => MAX10_CLK1_50,
			data => data,
			HEX0 => HEX0,
			HEX1 => HEX1,
			HEX2 => HEX2,
			HEX3 => HEX3,
			HEX4 => HEX4,
			HEX5 => HEX5
		);
		
	VGA : VGA_Controller
		port map (
			clk => clk,
			VGA_B => VGA_B,
			VGA_G => VGA_G,
			VGA_HS => VGA_HS,
			VGA_R => VGA_R,
			VGA_VS => VGA_VS
		);
	
	process(MAX10_CLK1_50)
		variable counter : integer range 0 to 12499999 := 0;
	begin
		if rising_edge(MAX10_CLK1_50) then
			if counter = 12499998 then
				data <= std_logic_vector(unsigned(data) + 1);
				led <= not led;
				LEDR(0) <= led;
			end if;
			counter := counter + 1;
		end if;
	end process;
	
	
	
end Rtl;