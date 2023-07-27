LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY CNT16 IS
    GENERIC (N : INTEGER := 4);
    PORT (
        CLK, ARESETN : IN STD_LOGIC;
        LOAD : IN STD_LOGIC;
        DIR : IN STD_LOGIC;
        TCEN : IN STD_LOGIC;
        CNTEN : IN STD_LOGIC;
        PRE : IN STD_LOGIC_VECTOR (N-1 DOWNTO 0);
        TC : OUT STD_LOGIC;
        CNT : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)
    );
END ENTITY CNT16;


ARCHITECTURE PROC_2 OF CNT16 IS
    -- declare count value and next count value
    SIGNAL Q, Q_next : unsigned(N
    - 1 DOWNTO 0);
BEGIN
    -- state register for the count value
    P_REG : PROCESS (CLK, ARESETN)
    BEGIN
        IF ARESETN = '0' THEN
            Q <= (OTHERS => '0') AFTER 5 ns;
        ELSIF CLK'event AND CLK = '1' THEN
            Q <= Q_NEXT AFTER 5 ns;
        END IF;
    END PROCESS P_REG;
    P_COMB : PROCESS (Q, DIR, CNTEN, TCEN, LOAD, PRE)
 
        -- declare terminal count values (TC)
        VARIABLE MAXVAL : unsigned (N - 1 DOWNTO 0);
        VARIABLE MINVAL : unsigned (N - 1 DOWNTO 0);
    BEGIN
        MAXVAL := (OTHERS => '1');
        MINVAL := (OTHERS => '0');
        -- default output values
        Q_NEXT <= Q AFTER 5 ns;
        TC <= '0' AFTER 5 ns;
        -- next state logic
        IF LOAD = '1' THEN
            Q_NEXT <= unsigned(PRE) AFTER 5 ns;
        ELSIF CNTEN = '0' THEN
            IF DIR = '1' THEN
                Q_NEXT <= Q + 1 AFTER 5 ns;
            ELSE
                Q_NEXT <= Q - 1 AFTER 5 ns;
            END IF;
        END IF;
        -- set TC (active low)
        IF (TCEN = '1') AND ((DIR = '1' AND Q = MAXVAL) OR (DIR = '0'
            AND Q(N - 1 DOWNTO 0) = MINVAL)) THEN
            TC <= '1' AFTER 5 ns;
        END IF;
    END PROCESS P_COMB;
    CNT <= STD_LOGIC_VECTOR(Q);
END ARCHITECTURE PROC_2;