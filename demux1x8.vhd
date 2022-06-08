library IEEE;
use IEEE.std_logic_1164.all;

entity demux8x1 is

port (dme: in std_logic_vector(7 downto 0);
      sel: in std_logic_vector(2 downto 0);
      ds1, ds2, ds3, ds4, ds5, ds6, ds7, ds8: out std_logic_vector(7 downto 0));

end demux8x1;

architecture arch_demux8x1 of demux8x1 is

begin

  ds1 <= dme when (sel = "000") else '0';
  ds2 <= dme when (sel = "001") else '0';
  ds3 <= dme when (sel = "010") else '0';
  ds4 <= dme when (sel = "011") else '0';
  ds5 <= dme when (sel = "100") else '0';
  ds6 <= dme when (sel = "101") else '0';
  ds7 <= dme when (sel = "110") else '0';
  ds8 <= dme when (sel = "111") else '0';

end arch_mult8x1;
