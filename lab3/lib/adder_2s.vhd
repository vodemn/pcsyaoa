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