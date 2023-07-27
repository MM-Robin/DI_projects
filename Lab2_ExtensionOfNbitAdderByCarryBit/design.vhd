-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;


ENTITY NBITADDER IS
    GENERIC (N : INTEGER := 8); -- N = length of addends
    PORT (
        A : IN bit_vector (N - 1 DOWNTO 0); -- 1st addend
        B : IN bit_vector (N - 1 DOWNTO 0); -- 2nd addend
        C_IN : IN BIT; -- 1-bit carry in
        S : OUT bit_vector (N - 1 DOWNTO 0); -- sum
        OVR : OUT BIT); -- overflow flag
END ENTITY NBITADDER;
ARCHITECTURE DATAFLOW OF NBITADDER IS
    -- signal vector for carries of the n columns
    SIGNAL C_TMP : bit_vector (N DOWNTO 0); -- length N+1 to hold
    -- left most carry bit
BEGIN
    C_TMP(0) <= C_IN; -- first carry is the external carry in
    NBIT : FOR I IN 0 TO N - 1 GENERATE
        -- carry of the i-th column
        S(I) <= (A(I) XOR B(I)) XOR C_TMP(I) AFTER 5 ns;
        C_TMP(I + 1) <= (C_TMP(I) AND (A(I) OR B(I))) OR (A(I) AND
        B(I)) AFTER 5 ns;
    END GENERATE NBIT;
    OVR <= (C_TMP(N) XOR C_TMP(N - 1)) AFTER 10 ns;--OVR BEHAIVOR
    -- N 1-bit adders are generated and their signals connected
    
END ARCHITECTURE DATAFLOW;