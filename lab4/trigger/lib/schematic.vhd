LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE work.lib_package.ALL;

ENTITY TriggerScheme IS
    PORT (
        R, S, C : IN STD_LOGIC;
        Q : INOUT STD_LOGIC);
END TriggerScheme;

ARCHITECTURE SchemeArch OF TriggerScheme IS

    SIGNAL x : STD_LOGIC_VECTOR(9 DOWNTO 1);

BEGIN
    X9 : NOAA PORT MAP(x(1), x(5), x(2), x(4), x(9));
    X8 : N PORT MAP(R, x(8));
    X6 : N PORT MAP(x(3), Q);
    X5 : N PORT MAP(x(4), x(5));
    X4 : N PORT MAP(C, x(4));
    X3 : NAO PORT MAP(S, x(2), x(8), x(3));
    X2 : NOAA PORT MAP(x(3), x(4), x(1), x(5), x(2));
    X1 : NAO PORT MAP(S, x(9), x(8), x(1));
END ARCHITECTURE SchemeArch;