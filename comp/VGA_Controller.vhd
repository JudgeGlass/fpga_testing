library ieee;
use ieee.std_logic_1164.all;

entity VGA_Controller is
	port (
		clk: in std_logic;
		VGA_B: out STD_LOGIC_VECTOR (3 downto 0);
		VGA_G: out STD_LOGIC_VECTOR (3 downto 0);
		VGA_HS: out STD_LOGIC;
		VGA_R: out STD_LOGIC_VECTOR (3 downto 0);
		VGA_VS: out STD_LOGIC
	);
end VGA_Controller;

architecture behavior of VGA_Controller is
	signal clk_25MHz: std_logic := '0';
	signal clk_divider: integer range 0 to 1 := 0;

	constant display_h_end: integer := 640;
	constant display_v_end: integer := 480;
	constant front_porch_h: integer := 16;
	constant front_porch_v: integer := 10;
	constant back_porch_h: integer := 48;
	constant back_porch_v: integer := 33;
	constant sync_pulse_h: integer := 96;
	constant sync_pulse_v: integer := 2;
	constant h_period: integer := display_h_end + front_porch_h + sync_pulse_h + back_porch_h; -- 800
	constant v_period: integer := display_v_end + front_porch_v + sync_pulse_v + back_porch_v; -- 525

	signal h_default_pol: std_logic := '0';
	signal v_default_pol: std_logic := '0';

begin	
	process(clk)
		variable counter_x: integer range 0 to h_period := 0;
		variable counter_y: integer range 0 to v_period := 0;
	begin
		if rising_edge(clk) then
			if (counter_x < h_period - 1) then
				counter_x := counter_x + 1;
			else
				counter_x := 0;
				if (counter_y < v_period - 1) then
					counter_y := counter_y + 1;
				else
					counter_y := 0;
				end if;
			end if;
			
			if(counter_x >= display_h_end + front_porch_h and counter_x < display_h_end + front_porch_h + sync_pulse_h) then
				VGA_HS <= h_default_pol;
			else
				VGA_HS <= not h_default_pol;
			end if;
			
			if(counter_y >= display_v_end + front_porch_v and counter_y < display_v_end + front_porch_v + sync_pulse_v) then
				VGA_VS <= v_default_pol;
			else
				VGA_VS <= not v_default_pol;
			end if;
			
			-- Set pixel color
			if (counter_x < display_h_end and counter_y < display_v_end) then
				if (counter_x > 0 and counter_x < 50 and counter_y > 0 and counter_y < 50) then
					VGA_R <= "1111";
					VGA_G <= "0000";
					VGA_B <= "1111";
				else
					VGA_R <= "0000";
					VGA_G <= "0000";
					VGA_B <= "0000";
				end if;
			else
				VGA_R <= "0000";
				VGA_G <= "0000";
				VGA_B <= "0000";
			end if;
		end if;
	end process;
end behavior;
