--# ============================================================================
--# Name        : seven_segment_cntrl.vhd
--# Author      : Kenner Marqueti Couto
--# Version     : 0.1
--# Description : Seven seg decoder kit testbench
--# ============================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity testbench is
end entity testbench;

architecture RTL of testbench is

    --conexoes externas:
    signal input_tb : unsigned(3 downto 0);                  --entrada do shifter tb
    signal output_tb   : unsigned(7 downto 0);              --saída do shifter tb

begin

     sseg_inst : entity work.sseg_d --instanciando decoder 7 segmentos
        port map(
            input  => input_tb,
            output => output_tb
        );



 process
 begin
     input_tb <= "0000";
     wait for 5 ns;
     input_tb <= "0001";
     wait for 5 ns;
     input_tb <= "0010";
     wait for 5 ns;
     input_tb <= "0011";
     wait for 5 ns;
     input_tb <= "0100";
     wait for 5 ns;
     input_tb <= "0101";
     wait for 5 ns;
     input_tb <= "0110";
     wait for 5 ns;
     input_tb <= "0111";
     wait for 5 ns;
     input_tb <= "1000";
     wait for 5 ns;
     input_tb <= "1001";
     wait for 5 ns;
     input_tb <= "1010";
     wait for 5 ns;
     input_tb <= "1011";
     wait for 5 ns;
     input_tb <= "1100";
     wait for 5 ns;
     input_tb <= "1101";
     wait for 5 ns;
     input_tb <= "1110";
     wait for 5 ns;
     input_tb <= "1111";
     wait for 5 ns;
 end process;
 
 --gera os valores de sel


end architecture RTL;



