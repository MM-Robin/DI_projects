
use work.all;

entity testbench is
-- empty
end testbench;

architecture tb of testbench is
signal a, b , cin, cout, sum: bit := '0';
begin
  f:
  entity FullAdder(dataflow)
  port map(a=> a,
           b=> b,
          cin => cin,
           sum => sum,
           cout => cout);
  a<= not a after 200ns;
    b<= not b after 100ns;
  cin<= not cin after 50ns;
end tb;