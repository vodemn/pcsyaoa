LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

PACKAGE matrix_package IS

    CONSTANT interval : TIME := 50 ns;

    TYPE matrix IS ARRAY (NATURAL RANGE <>, NATURAL RANGE <>) OF NATURAL;
    TYPE matrix_element IS ARRAY (0 TO 2) OF NATURAL;

    FUNCTION findElementFunc (
        vec : MATRIX; 
        rows, column : NATURAL) RETURN matrix_element;

    PROCEDURE findElementProc(
        vec : IN MATRIX;
        value : INOUT NATURAL;
        y : OUT NATURAL;
        rows, column : IN NATURAL);

END PACKAGE matrix_package;

PACKAGE BODY matrix_package IS

    FUNCTION findElementFunc (
        vec : MATRIX; 
        rows, column : NATURAL) RETURN matrix_element IS
        VARIABLE element : matrix_element := (vec(0, column), 0, column);
    BEGIN
        FOR i IN 0 TO rows - 1 LOOP
            IF (vec(i, column) > element(0)) THEN
                element := (vec(i, column), i, column);
            END IF;
        END LOOP;
        RETURN element;
    END FUNCTION findElementFunc;

    PROCEDURE findElementProc(
        vec : IN MATRIX;
        value : INOUT NATURAL;
        y : OUT NATURAL;
        rows, column : IN NATURAL) IS
    BEGIN
        value := vec(0, column);
        y := 0;

        FOR i IN 0 TO rows - 1 LOOP
            IF (vec(i, column) > value) THEN
                value := vec(i, column);
                y := i;
            END IF;
        END LOOP;
    END findElementProc;
END PACKAGE BODY matrix_package;

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY matrix_scheme IS
    PORT (
        arr : IN MATRIX(0 TO 9, 0 TO 7);
        row, value : OUT INTEGER);
END matrix_scheme;

ARCHITECTURE struct_1 OF matrix_scheme IS
BEGIN

    MONITOR :
    PROCESS
        --VARIABLE value_proc, y_proc : NATURAL;
    BEGIN
        findElementProc(test_array, el_p, y_p, 10, column);
        --el_p <= value_proc;
        --y_p <= y_proc;
    END PROCESS;
END struct_1;