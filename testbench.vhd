library IEEE;
use IEEE.std_logic_1164.all;
 
entity testbench is

end testbench; 

architecture tb of testbench is
component bc8b is

port (ee: in std_logic_vector(7 downto 0);
      sele: in std_logic_vector(2 downto 0);
      clk: in std_logic;
      rw: in std_logic;
      saida: out std_logic_vector(7 downto 0));

end component;

signal e1_tb: std_logic_vector(7 downto 0):="00000000";
signal clk_tb: std_logic;
signal saida_tb: std_logic_vector(7 downto 0);
signal sele_tb: std_logic_vector(2 downto 0);
signal rw_tb: std_logic;

begin

  UUT: bc8b
  
  port map(ee => e1_tb, sele => sele_tb, clk => clk_tb, rw => rw_tb, saida => saida_tb);

  tb: process
  begin
  
    e1_tb <= "00000001";
    clk_tb <= '0';
    rw_tb <= '1';
    sele_tb <= "000";
    
    wait for 100 ns;
    
    e1_tb <= "11111111";
    clk_tb <= '0';
    rw_tb <= '1';
    sele_tb <= "111";
    
    wait for 100 ns;
    
    e1_tb <= "01110011";
    clk_tb <= '1';
    rw_tb <= '1';
    sele_tb <= "000";
    
    wait for 100 ns;
    
    e1_tb <= "11100101";
    clk_tb <= '0';
    rw_tb <= '1';
    sele_tb <= "011";
    
    wait for 100 ns;
    
  end process;
end tb;
