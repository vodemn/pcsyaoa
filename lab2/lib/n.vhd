LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY N IS
	PORT (
		a : IN std_logic;
		y : OUT std_logic);
END N;

ARCHITECTURE N_arch OF N IS
BEGIN
	y <= NOT a AFTER 1 ns;
END N_arch;