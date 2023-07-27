
library IEEE;
use IEEE.std_logic_1164.all;
use work.all;

entity FullAdder is port(
	a, b, cin : in bit;
    cout, sum :out bit);
end;

entity halfAdder is port(
	a, b: in bit;
    cout, sum :out bit);
end;

architecture dataflow of FullAdder is 
begin
  sum <= (a xor b) xor cin;
  cout <= (a and b) or (a and cin) or (b and cin);
end;  