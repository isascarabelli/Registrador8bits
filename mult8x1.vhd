library IEEE;
use IEEE.std_logic_1164.all;

entity mult8x1 is

port (me1, me2, me3, me4, me5, me6, me7, me8: in std_logic_vector(7 downto 0);
      sel: in std_logic_vector(2 downto 0);
      s: out std_logic_vector(7 downto 0));

end mult8x1;

architecture arch_mult8x1 of mult8x1 is

begin

  s <= me1 when (sel = "000") else
       me2 when (sel = "001") else
       me3 when (sel = "010") else
       me4 when (sel = "011") else
       me5 when (sel = "100") else
       me6 when (sel = "101") else
       me7 when (sel = "111") else
       me8;

end arch_mult8x1;
