library IEEE;
use IEEE.std_logic_1164.all;

entity registrador8b is
    port(d1: in std_logic_vector(7 downto 0);
         clk1: in std_logic;
         Q1: out std_logic_vector(7 downto 0));
end registrador8b;

architecture arch_register8b of registrador8b is
component flipflopD is
    port (d: in std_logic;
         clk: in std_logic;
         Q: out std_logic);
         
end component;

begin 
arch_register8b: for i in 0 to 7 generate

registrador8b: flipflopD
port map (d => d1(i),
          clk => clk1,
          Q => Q1(i));
end generate arch_register8b;
          
end arch_register8b;
