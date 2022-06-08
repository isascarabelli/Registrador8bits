library IEEE;
use IEEE.std_logic_1164.all;

entity demux1x8 is

port (dme: in std_logic_vector(7 downto 0);
      sel: in std_logic_vector(2 downto 0);
      ds1, ds2, ds3, ds4, ds5, ds6, ds7, ds8: out std_logic_vector(7 downto 0));

end demux1x8;

architecture arch_demux1x8 of demux1x8 is

begin

  ds1 <= dme when (sel = "000") else "00000000";
  ds2 <= dme when (sel = "001") else "00000000";
  ds3 <= dme when (sel = "010") else "00000000";
  ds4 <= dme when (sel = "011") else "00000000";
  ds5 <= dme when (sel = "100") else "00000000";
  ds6 <= dme when (sel = "101") else "00000000";
  ds7 <= dme when (sel = "110") else "00000000";
  ds8 <= dme when (sel = "111") else "00000000";

end arch_demux1x8;
