library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

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
	signal leds: STD_LOGIC_VECTOR(9 downto 0);
	
	component led_test
		port (
			LEDR_Control: out STD_LOGIC_VECTOR (9 downto 0)
		);
	end component;

begin
	LED_Test_Control : led_test
		port map (
			LEDR_Control => leds
		);
		
	LEDR(9 downto 0) <= leds(9 downto 0);
end Rtl;