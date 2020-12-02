LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY NOAA IS
	PORT (
		a, b, c, d : IN std_logic;
		y : OUT std_logic);
END NOAA;

ARCHITECTURE NOAA_arch OF NOAA IS
BEGIN
	y <= NOT ((a and b) or (c and d)) after 5 ns;
END NOAA_arch;