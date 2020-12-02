LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

PACKAGE processors_package IS
    COMPONENT MatrixProcInner IS
        PORT (
            R, clk : IN STD_LOGIC;
            a : IN INTEGER;
            b : IN INTEGER;
            a_out : OUT INTEGER;
            b_out : OUT INTEGER;
            c : INOUT INTEGER);
    END COMPONENT;

    COMPONENT MatrixProcVertEdge IS
        PORT (
            R, clk : IN STD_LOGIC;
            a : IN INTEGER;
            b : IN INTEGER;
            b_out : OUT INTEGER;
            c : INOUT INTEGER);
    END COMPONENT;

    COMPONENT MatrixProcHorEdge IS
        PORT (
            R, clk : IN STD_LOGIC;
            a : IN INTEGER;
            b : IN INTEGER;
            a_out : OUT INTEGER;
            c : INOUT INTEGER);
    END COMPONENT;

    COMPONENT MatrixProcCorner IS
        PORT (
            R, clk : IN STD_LOGIC;
            a : IN INTEGER;
            b : IN INTEGER;
            c : INOUT INTEGER);
    END COMPONENT;

END PACKAGE processors_package;

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY MatrixProcInner IS
    PORT (
        R, clk : IN STD_LOGIC;
        a : IN INTEGER;
        b : IN INTEGER;
        a_out : OUT INTEGER;
        b_out : OUT INTEGER;
        c : INOUT INTEGER);
END MatrixProcInner;

ARCHITECTURE MatrixProcInnerArch OF MatrixProcInner IS
BEGIN

    PROCESS (R, clk)
    BEGIN
        IF (R = '1') THEN
            c <= 0;
        ELSE
            IF rising_edge(clk) THEN
                a_out <= a;
                b_out <= b;
                c <= c + a * b;
            END IF;
        END IF;
    END PROCESS;

END ARCHITECTURE MatrixProcInnerArch;

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY MatrixProcVertEdge IS
    PORT (
        R, clk : IN STD_LOGIC;
        a : IN INTEGER;
        b : IN INTEGER;
        b_out : OUT INTEGER;
        c : INOUT INTEGER);
END MatrixProcVertEdge;

ARCHITECTURE MatrixProcVertEdgeArch OF MatrixProcVertEdge IS

BEGIN

    PROCESS (R, clk)
    BEGIN
        IF (R = '1') THEN
            c <= 0;
        ELSE
            IF rising_edge(clk) THEN
                b_out <= b;
                c <= c + a * b;
            END IF;
        END IF;
    END PROCESS;

END ARCHITECTURE MatrixProcVertEdgeArch;

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY MatrixProcHorEdge IS
    PORT (
        R, clk : IN STD_LOGIC;
        a : IN INTEGER;
        b : IN INTEGER;
        a_out : OUT INTEGER;
        c : INOUT INTEGER);
END MatrixProcHorEdge;

ARCHITECTURE MatrixProcHorEdgeArch OF MatrixProcHorEdge IS

BEGIN

    PROCESS (R, clk)
    BEGIN
        IF (R = '1') THEN
            c <= 0;
        ELSE
            IF rising_edge(clk) THEN
                a_out <= a;
                c <= c + a * b;
            END IF;
        END IF;
    END PROCESS;

END ARCHITECTURE MatrixProcHorEdgeArch;

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY MatrixProcCorner IS
    PORT (
        R, clk : IN STD_LOGIC;
        a : IN INTEGER;
        b : IN INTEGER;
        c : INOUT INTEGER);
END MatrixProcCorner;

ARCHITECTURE MatrixProcCornerArch OF MatrixProcCorner IS

BEGIN

    PROCESS (R, clk)
    BEGIN
        IF (R = '1') THEN
            c <= 0;
        ELSE
            IF rising_edge(clk) THEN
                c <= c + a * b;
            END IF;
        END IF;
    END PROCESS;

END ARCHITECTURE MatrixProcCornerArch;