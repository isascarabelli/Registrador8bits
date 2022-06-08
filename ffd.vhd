library IEEE;
use IEEE.std_logic_1164.all;

entity flipflopD is
    port(d: in std_logic;
         clk: in std_logic;
         Q: out std_logic);
end flipflopD;

architecture trasicao_descida of flipflopD is
begin

    process (clk, d)
    begin 
    if (clk'event and clk = '0') then
    Q <= D;
    end if;
    
end process;
end trasicao_descida;
