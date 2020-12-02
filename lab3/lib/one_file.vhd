LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY add1 IS
    PORT (
        a1, b1 : IN STD_LOGIC;
        c1, p1 : OUT STD_LOGIC);
END add1;

ARCHITECTURE struct_1 OF add1 IS
BEGIN
    p1 <= ((a1 AND (NOT b1)) OR ((NOT a1) AND b1));
    c1 <= a1 AND b1;
END struct_1;

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY add2 IS
    PORT (
        c1, a2, b2 : IN STD_LOGIC;
        p2, p3 : OUT STD_LOGIC);
END add2;
ARCHITECTURE struct_1 OF add2 IS
BEGIN
    p2 <= ((NOT c1) AND (NOT a2) AND b2) OR
        ((NOT c1) AND a2 AND (NOT b2)) OR
        (c1 AND (NOT a2) AND (NOT b2)) OR
        (a2 AND b2 AND c1);
    p3 <= (a2 AND c1) OR (b2 AND c1) OR (a2 AND b2);
END struct_1;

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY adder_2 IS
    PORT (
        a2, a1 : IN STD_LOGIC;
        b : IN STD_LOGIC_VECTOR(2 DOWNTO 1);
        p : OUT STD_LOGIC_VECTOR(3 DOWNTO 1));
END adder_2;

ARCHITECTURE structure OF adder_2 IS
    COMPONENT add1
        PORT (
            a1, b1 : IN STD_LOGIC;
            c1, p1 : OUT STD_LOGIC);
    END COMPONENT;
    COMPONENT add2
        PORT (
            c1, a2, b2 : IN STD_LOGIC;
            p2, p3 : OUT STD_LOGIC);
    END COMPONENT;
    SIGNAL c1 : STD_LOGIC;
BEGIN
    circ1 : add1 PORT MAP(a1, b(1), c1, p(1));
    circ2 : add2 PORT MAP(c1, a2, b(2), p(2), p(3));
END structure;

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY adder_2s IS
    PORT (
        a2, a1 : IN STD_LOGIC;
        s : IN STD_LOGIC;
        p : OUT STD_LOGIC_VECTOR(3 DOWNTO 1));
END adder_2s;

ARCHITECTURE structure OF adder_2s IS
    COMPONENT add1
        PORT (
            a1, b1 : IN STD_LOGIC;
            c1, p1 : OUT STD_LOGIC);
    END COMPONENT;
    COMPONENT add2
        PORT (
            c1, a2, b2 : IN STD_LOGIC;
            p2, p3 : OUT STD_LOGIC);
    END COMPONENT;
    SIGNAL c1 : STD_LOGIC;
BEGIN
    circ1 : add1
    PORT MAP(a1, '0', c1, p(1));
    circ2 : add2
    PORT MAP(c1, a2, s, p(2), p(3));
END structure;

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY SchemeModel IS
    PORT (
        x1 : IN STD_LOGIC_VECTOR(1 TO 4);
        x2 : IN STD_LOGIC_VECTOR(1 TO 4);
        x3 : IN STD_LOGIC_VECTOR(1 TO 4);
        x4 : IN STD_LOGIC_VECTOR(1 TO 4);
        y1 : OUT STD_LOGIC_VECTOR(1 TO 3);
        y2 : OUT STD_LOGIC_VECTOR(1 TO 3);
        y3 : OUT STD_LOGIC_VECTOR(1 TO 3);
        y4 : OUT STD_LOGIC_VECTOR(1 TO 3);
        p : OUT STD_LOGIC_VECTOR(0 TO 1));
END SchemeModel;

ARCHITECTURE SchemeArch OF SchemeModel IS

    CONSTANT interval : TIME := 50 ns;

    COMPONENT adder_2 IS
        PORT (
            a2, a1 : IN STD_LOGIC;
            b : IN STD_LOGIC_VECTOR(2 DOWNTO 1);
            p : OUT STD_LOGIC_VECTOR(3 DOWNTO 1));
    END COMPONENT adder_2;

    COMPONENT adder_2s IS
        PORT (
            a2, a1 : IN STD_LOGIC;
            s : IN STD_LOGIC;
            p : OUT STD_LOGIC_VECTOR(3 DOWNTO 1));
    END COMPONENT adder_2s;

    SIGNAL adder1_1_out : STD_LOGIC_VECTOR(1 TO 3);
    SIGNAL adder1_2_out : STD_LOGIC_VECTOR(1 TO 3);
    SIGNAL adder1_3_out : STD_LOGIC_VECTOR(1 TO 3);
    SIGNAL adder1_4_out : STD_LOGIC_VECTOR(1 TO 3);

    SIGNAL adder2_1_out : STD_LOGIC_VECTOR(1 TO 3);
    SIGNAL adder2_2_out : STD_LOGIC_VECTOR(1 TO 3);
    SIGNAL adder2_3_out : STD_LOGIC_VECTOR(1 TO 3);
    SIGNAL adder2_4_out : STD_LOGIC_VECTOR(1 TO 3);

BEGIN
    adder1_1 : adder_2 PORT MAP(x1(1), '0', x1(2 TO 3), adder1_1_out);
    adder1_2 : adder_2 PORT MAP(x2(1), adder1_1_out(1), x2(2 TO 3), adder1_2_out);
    adder1_3 : adder_2 PORT MAP(x3(1), adder1_2_out(1), x3(2 TO 3), adder1_3_out);
    adder1_4 : adder_2 PORT MAP(x4(1), adder1_3_out(1), x4(2 TO 3), adder1_4_out);

    adder2_1 : adder_2s PORT MAP('0', x1(4), adder1_1_out(2), adder2_1_out);
    adder2_2 : adder_2s PORT MAP(adder2_1_out(1), x2(4), adder1_2_out(2), adder2_2_out);
    adder2_3 : adder_2s PORT MAP(adder2_2_out(1), x3(4), adder1_3_out(2), adder2_3_out);
    adder2_4 : adder_2s PORT MAP(adder2_3_out(1), x4(4), adder1_4_out(2), adder2_4_out);

    y1 <= (adder1_1_out(3), adder2_1_out(2), adder2_1_out(3));
    y2 <= (adder1_2_out(3), adder2_2_out(2), adder2_2_out(3));
    y3 <= (adder1_3_out(3), adder2_3_out(2), adder2_3_out(3));
    y4 <= (adder1_4_out(3), adder2_4_out(2), adder2_4_out(3));
    p <= (adder1_4_out(1), adder2_4_out(1));
END ARCHITECTURE SchemeArch;