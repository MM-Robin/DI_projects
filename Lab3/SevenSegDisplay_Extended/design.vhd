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
        PRE : IN STD_LOGIC_VECTOR (N - 1 DOWNTO 0);
        TC : OUT STD_LOGIC;
        LCDB_DATA_IN_LED : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
        CNT : OUT STD_LOGIC_VECTOR(N - 1 DOWNTO 0);
        RHS : OUT STD_LOGIC
    );
END ENTITY CNT16;
ARCHITECTURE PROC_2 OF CNT16 IS
    -- declare count value and next count value
    SIGNAL Q, Q_next, DIG0, DIG1, DIG2, DIG3 : unsigned(N
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
        IF (TCEN = '0') AND ((DIR = '1' AND Q = MAXVAL) OR (DIR = '0'
            AND Q(N - 1 DOWNTO 0) = MINVAL)) THEN
            TC <= '1' AFTER 5 ns;
        END IF;
    END PROCESS P_COMB;--
    P_7SEG : PROCESS (Q, DIG0, DIG1, DIG2, DIG3)
    BEGIN
        RHS <= '1';--set to 0 if using port 1 and 2 otherwise the output will be flipped
        IF Q > "1001" THEN
            DIG0 <= Q - 10;
            DIG1 <= "0001";
            DIG2 <= "0000";
            DIG3 <= "0000";
        ELSE
            DIG0 <= Q;
            DIG1 <= "0000";
            DIG2 <= "0000";
            DIG3 <= "0000";
        END IF;
        LCDB_DATA_IN_LED(3 DOWNTO 0) <= STD_LOGIC_VECTOR(DIG0) AFTER 5 ns;
        LCDB_DATA_IN_LED(7 DOWNTO 4) <= STD_LOGIC_VECTOR(DIG1) AFTER 5 ns;
        LCDB_DATA_IN_LED(11 DOWNTO 8) <= STD_LOGIC_VECTOR(DIG2) AFTER 5 ns;
        LCDB_DATA_IN_LED(15 DOWNTO 12) <= STD_LOGIC_VECTOR(DIG3) AFTER 5 ns;
        CNT <= STD_LOGIC_VECTOR(Q) AFTER 5 ns;
    END PROCESS P_7SEG;
END ARCHITECTURE PROC_2;