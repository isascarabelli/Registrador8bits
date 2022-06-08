library IEEE;
use IEEE.std_logic_1164.all;

entity bc8b is

port (ee: in std_logic_vector(7 downto 0);
      sele: in std_logic_vector(2 downto 0);
      clk: in std_logic;
      rw: in std_logic;
      saida: out std_logic_vector(7 downto 0));

end bc8b;

architecture arch_bc8b of bc8b is
    
component mult8x1 is

port (me1, me2, me3, me4, me5, me6, me7, me8: in std_logic_vector(7 downto 0);
      sel: in std_logic_vector(2 downto 0);
      s: out std_logic_vector(7 downto 0));

end component;

component bancoRegistra is
    port (e1,e2,e3,e4,e5,e6,e7,e8: in std_logic_vector(7 downto 0);
          s1,s2,s3,s4,s5,s6,s7,s8: out std_logic_vector(7 downto 0);
          clk1: in std_logic);
end component;

component demux8x1 is

port (dme: in std_logic_vector(7 downto 0);
      sel: in std_logic_vector(2 downto 0);
      ds1, ds2, ds3, ds4, ds5, ds6, ds7, ds8: out std_logic_vector(7 downto 0));

end component;

signal S_s1 : std_logic_vector(7 downto 0);
signal S_s2 : std_logic_vector(7 downto 0);
signal S_s3 : std_logic_vector(7 downto 0);
signal S_s4 : std_logic_vector(7 downto 0);
signal S_s5 : std_logic_vector(7 downto 0);
signal S_s6 : std_logic_vector(7 downto 0);
signal S_s7 : std_logic_vector(7 downto 0);
signal S_s8 : std_logic_vector(7 downto 0);

signal S_m1 : std_logic_vector(7 downto 0);
signal S_m2 : std_logic_vector(7 downto 0);
signal S_m3 : std_logic_vector(7 downto 0);
signal S_m4 : std_logic_vector(7 downto 0);
signal S_m5 : std_logic_vector(7 downto 0);
signal S_m6 : std_logic_vector(7 downto 0);
signal S_m7 : std_logic_vector(7 downto 0);
signal S_m8 : std_logic_vector(7 downto 0);

signal final_clock : std_logic;

begin

  demux : demux8x1
  	port map(
  	    dme => ee,
  	    sel => sele,
  	    ds1 => S_s1,
  	    ds1 => S_s2,
  	    ds1 => S_s3
  	    ds1 => S_s4,
  	    ds1 => S_s5,
  	    ds1 => S_s6,
  	    ds1 => S_s7,
  	    ds1 => S_s8
  	);
  		 

  bc : bancoRegistra
      port map(
         e1 => S_s1,
         e2 => S_s2,
         e3 => S_s3,
         e4 => S_s4,
         e5 => S_s5,
         e6 => S_s6,
         e7 => S_s7,
         e8 => S_s8,
         clk1 => final_clock,
         s1 => S_m1,
         s2 => S_m2,
         s3 => S_m3,
         s4 => S_m4,
         s5 => S_m5,
         s6 => S_m6,
         s7 => S_m7,
         s8 => S_m8
     );
     
  mult : mult8x1
      port map(
        me1 => S_m1,
        me2 => S_m2,
        me3 => S_m3,
        me4 => S_m4,
        me5 => S_m5,
        me6 => S_m6,
        me7 => S_m7,
        me8 => S_m8,
        sel => sele,
        s => saida      
      ); 
      
   final_clock <= (clk and rw); 
--   clk borda de descida / read = 1 / write = 0

end arch_bc8b;
