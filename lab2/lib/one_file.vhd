LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY N IS
    PORT (
        a : IN STD_LOGIC;
        y : OUT STD_LOGIC);
END N;

ARCHITECTURE N_arch OF N IS
BEGIN
    y <= NOT a AFTER 1 ns;
END N_arch;

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY NA3 IS
    PORT (
        a, b, c : IN STD_LOGIC;
        y : OUT STD_LOGIC);
END NA3;

ARCHITECTURE NA3_arch OF NA3 IS
BEGIN
    y <= NOT (a AND b AND c) AFTER 3 ns;
END NA3_arch;

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY NA3O2 IS
    PORT (
        a, b, c, d : IN STD_LOGIC;
        y : OUT STD_LOGIC);
END NA3O2;

ARCHITECTURE NA3O2_arch OF NA3O2 IS
BEGIN
    y <= NOT (a AND b AND (c OR d)) AFTER 4 ns;
END NA3O2_arch;

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY NAO3 IS
    PORT (
        a, b, c, d : IN STD_LOGIC;
        y : OUT STD_LOGIC);
END NAO3;

ARCHITECTURE NAO3_arch OF NAO3 IS
BEGIN
    y <= NOT (a AND (b OR c OR d)) AFTER 5 ns;
END NAO3_arch;

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY NAOA2 IS
    PORT (
        a, b, c, d : IN STD_LOGIC;
        y : OUT STD_LOGIC);
END NAOA2;

ARCHITECTURE NAOA2_arch OF NAOA2 IS
BEGIN
    y <= NOT (a AND (b OR (c AND d))) AFTER 4 ns;
END NAOA2_arch;

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY NEX2 IS
    PORT (
        a, b : IN STD_LOGIC;
        y : OUT STD_LOGIC);
END NEX2;

ARCHITECTURE NEX2_arch OF NEX2 IS
BEGIN
    y <= (a AND b) OR ((NOT a) AND (NOT b)) AFTER 5 ns;
END NEX2_arch;

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY NO2 IS
    PORT (
        a, b : IN STD_LOGIC;
        y : OUT STD_LOGIC);
END NO2;

ARCHITECTURE NO2_arch OF NO2 IS
BEGIN
    y <= NOT (a OR b) AFTER 3 ns;
END NO2_arch;

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY NO4 IS
    PORT (
        a, b, c, d : IN STD_LOGIC;
        y : OUT STD_LOGIC);
END NO4;

ARCHITECTURE NO4_arch OF NO4 IS
BEGIN
    y <= NOT (a OR b OR c OR d) AFTER 5 ns;
END NO4_arch;

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY NOAO2 IS
    PORT (
        a, b, c, d : IN STD_LOGIC;
        y : OUT STD_LOGIC);
END NOAO2;

ARCHITECTURE NOAO2_arch OF NOAO2 IS
BEGIN
    y <= NOT (a OR (b AND (c OR d))) AFTER 4 ns;
END NOAO2_arch;

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY SchemeModel IS
    PORT (
        x : IN STD_LOGIC_VECTOR(0 TO 3);
        y : OUT STD_LOGIC_VECTOR(0 TO 3));
END SchemeModel;

ARCHITECTURE SchemeArch OF SchemeModel IS

    CONSTANT interval : TIME := 50 ns;

    COMPONENT N IS
        PORT (
            a : IN STD_LOGIC;
            y : OUT STD_LOGIC);
    END COMPONENT N;

    COMPONENT NA3 IS
        PORT (
            a, b, c : IN STD_LOGIC;
            y : OUT STD_LOGIC);
    END COMPONENT NA3;

    COMPONENT NA3O2 IS
        PORT (
            a, b, c, d : IN STD_LOGIC;
            y : OUT STD_LOGIC);
    END COMPONENT NA3O2;

    COMPONENT NAO3 IS
        PORT (
            a, b, c, d : IN STD_LOGIC;
            y : OUT STD_LOGIC);
    END COMPONENT NAO3;

    COMPONENT NAOA2 IS
        PORT (
            a, b, c, d : IN STD_LOGIC;
            y : OUT STD_LOGIC);
    END COMPONENT NAOA2;

    COMPONENT NOAO2 IS
        PORT (
            a, b, c, d : IN STD_LOGIC;
            y : OUT STD_LOGIC);
    END COMPONENT NOAO2;

    COMPONENT NEX2 IS
        PORT (
            a, b : IN STD_LOGIC;
            y : OUT STD_LOGIC);
    END COMPONENT NEX2;

    COMPONENT NO2 IS
        PORT (
            a, b : IN STD_LOGIC;
            y : OUT STD_LOGIC);
    END COMPONENT NO2;

    COMPONENT NO4 IS
        PORT (
            a, b, c, d : IN STD_LOGIC;
            y : OUT STD_LOGIC);
    END COMPONENT NO4;

    SIGNAL Level_0 : STD_LOGIC;
    SIGNAL Level_1 : STD_LOGIC_VECTOR(0 TO 2);
    SIGNAL Level_2 : STD_LOGIC_VECTOR(0 TO 3);
    SIGNAL Level_3 : STD_LOGIC_VECTOR(0 TO 5);
    SIGNAL Level_4 : STD_LOGIC_VECTOR(0 TO 2);

BEGIN
    Nex : NEX2 PORT MAP(a => x(0), b => x(3), y => Level_0);

    Inv_11 : N PORT MAP(a => Level_4(0), y => Level_1(0));
    Inv_12 : N PORT MAP(a => x(1), y => Level_1(1));
    Inv_13 : N PORT MAP(a => Level_0, y => Level_1(2));

    Inv_21 : N PORT MAP(a => Level_1(2), y => Level_2(0));
    Na3_21 : NA3 PORT MAP(a => Level_1(1), b => x(3), c => x(0), y => Level_2(1));
    Inv_22 : N PORT MAP(a => Level_1(0), y => Level_2(2));
    Inv_23 : N PORT MAP(a => x(2), y => Level_2(3));

    Inv_31 : N PORT MAP(a => Level_1(2), y => Level_3(0));
    Na3o2_31 : NA3O2 PORT MAP(a => Level_2(3), b => Level_2(0), c => x(1), d => x(0), y => Level_3(1));
    Noao2_31 : NOAO2 PORT MAP(a => Level_2(3), b => Level_2(1), c => x(0), d => Level_1(1), y => Level_3(2));
    No2_31 : NO2 PORT MAP(a => x(0), b => x(3), y => Level_3(3));
    Inv_32 : N PORT MAP(a => Level_1(0), y => Level_3(4));
    Naoa2_31 : NAOA2 PORT MAP(a => x(1), b => Level_2(2), c => Level_2(3), d => x(3), y => Level_3(5));

    Nao3_41 : NAO3 PORT MAP(a => Level_3(1), b => Level_3(0), c => Level_2(3), d => x(1), y => Level_4(0));
    Nao3_42 : NAOA2 PORT MAP(a => Level_3(5), b => Level_3(2), c => Level_2(3), d => x(3), y => Level_4(1));
    No4_41 : NO4 PORT MAP(a => x(2), b => x(1), c => Level_3(4), d => Level_3(3), y => Level_4(2));

    y(0) <= Level_4(0);
    y(1) <= Level_3(2);
    y(2) <= Level_4(2);
    y(3) <= Level_4(1);
END ARCHITECTURE SchemeArch;