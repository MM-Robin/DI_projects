
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity CNT16 is

 generic (N:integer :=4);
 
 port (
 CLK, ARESETN : in std_logic;
 LOAD : in std_logic;
 DIR : in std_logic;
 TCEN : in std_logic;
 CNTEN : in std_logic;
 PRE : in std_logic_vector (N-1 downto 0);
 TC : out std_logic;
 RHS : out std_logic;
 LCDB_DATA_IN_LED : out std_logic_vector (15 downto 0)
 --CNT : out std_logic_vector(N-1 downto 0)
 ); 
end entity CNT16;

architecture PROC_2 of CNT16 is

-- declare count value and next count value
signal Q, Q_next : unsigned(N-1 downto 0);

begin

-- state register for the count value
P_REG : process (CLK,ARESETN)
begin
 if ARESETN ='0' then
 Q <= (others => '0') after 5 ns;
 elsif CLK'event and CLK='1' then
 Q <= Q_NEXT after 5 ns;
 end if;
end process P_REG;

P_COMB : process (Q,DIR,CNTEN,TCEN,LOAD,PRE)

-- declare terminal count values (TC)
variable MAXVAL : unsigned (N-1 downto 0);
variable MINVAL : unsigned (N-1 downto 0);

begin
 MAXVAL := (others => '1'); MINVAL := (others => '0');
 
 -- default output values
 Q_NEXT <= Q after 5 ns;
 TC <= '0' after 5 ns;
 
 -- next state logic
 if LOAD = '1' then
 Q_NEXT <= unsigned(PRE) after 5 ns;
 elsif CNTEN = '0' then
 if DIR = '1' then
 Q_NEXT <= Q + 1 after 5 ns;
 else
 Q_NEXT <= Q - 1 after 5 ns;
 end if;
 end if;
 
 -- Here is the mistake, TCEN should be active low '0' 
 if (TCEN='0') and ((DIR = '1' and Q = MAXVAL) or (DIR = '0' and
Q(N-1 downto 0) = MINVAL)) then
 TC <= '1' after 5 ns;
 end if;
end process P_COMB;

P_7SEG : process (Q)

begin

LCDB_DATA_IN_LED(15 downto 8) <= (others => '0') after 5ns;

if to_integer(Q) <= 9 then
LCDB_DATA_IN_LED(3 downto 0) <= std_logic_vector(Q) after 5ns;
LCDB_DATA_IN_LED(7 downto 4) <= (others => '0') after 5ns;
else
LCDB_DATA_IN_LED(3 downto 0) <= std_logic_vector(Q-10) after 5ns;
LCDB_DATA_IN_LED(7 downto 4) <= "0001" after 5ns;
end if;

end process P_7SEG;

RHS <= '1';

end architecture PROC_2; 
