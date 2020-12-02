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