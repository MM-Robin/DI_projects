-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;
USE IEEE.numeric_std.ALL;

ENTITY ARITH_ADDER IS
    GENERIC (N : INTEGER := 8); -- N = length of addends
    PORT (
        A : IN signed(N - 1 DOWNTO 0); -- 1st addend
        B : IN signed(N - 1 DOWNTO 0); -- 2nd addend
        C_IN : IN STD_LOGIC_VECTOR(0 DOWNTO 0); -- 1-bit carry IN
        S : OUT signed(N - 1 DOWNTO 0)); -- sum (length N)
END ENTITY ARITH_ADDER;
ARCHITECTURE ARITHMETIC OF ARITH_ADDER IS
BEGIN
    S <= A + B + signed('0' & C_IN) AFTER 5 ns;
END ARCHITECTURE ARITHMETIC;