library IEEE;
use IEEE.std_logic_1164.all;

entity bancoRegistra is
    port (e1,e2,e3,e4,e5,e6,e7,e8: in std_logic_vector(7 downto 0);
          s1,s2,s3,s4,s5,s6,s7,s8: out std_logic_vector(7 downto 0);
          clk1: in std_logic);
end bancoRegistra;

architecture arc_bancoRegistra of bancoRegistra is
component registrador8b is
    port (d1: in std_logic_vector(7 downto 0);
          clk1: in std_logic;
          Q1: out std_logic_vector(7 downto 0));
end component;

type t_Data is Array (0 to 7) of std_logic_vector(7 downto 0);

signal entrada : t_Data;
signal saida : t_Data;

-- importante: aquela sugestão de atribuição logo na declaração do sinal não funcionou, por isso, após o begin o mapeamento é feito um por um.

begin

entrada(0) <= e1;
entrada(1) <= e2;
entrada(2) <= e3;
entrada(3) <= e4;
entrada(4) <= e5;
entrada(5) <= e6;
entrada(6) <= e7;
entrada(7) <= e8;

s1 <= saida(0);
s2 <= saida(1);
s3 <= saida(2);
s4 <= saida(3);
s5 <= saida(4);
s6 <= saida(5);
s7 <= saida(6);
s8 <= saida(7);

arc_bancoRegistra: for i in 0 to 7 generate

bancoRegistra: registrador8b

port map (d1 => entrada(i),
          Q1 => saida(i),
          clk1 => clk1);
end generate arc_bancoRegistra;

end arc_bancoRegistra;
