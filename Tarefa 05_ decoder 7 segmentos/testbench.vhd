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

     shifter_inst : entity work.sseg_d
        port map(
            input  => input_tb,
            output => output_tb
        );
           -- instanciando o somador adder em uma instancia adder_inst
        port map(
                                            --fazendo portmap, conectando as portas da entidade interna aos sinais
            input   => input_tb,            -- conectando entrada do shifter
            shift_cntrl => shift_ctl_tb ,   -- conectando controle do shifter
            shift_out => output_tb          -- conectando saída do shifter
        );

 -- gera os valores de entrada
input_tb <=  to_unsigned(15,input_tb'length);


 --gera os valores de controle
 process
 begin
     shift_ctl_tb <= "00";
     wait for 5 ns;
     shift_ctl_tb <= "01";
     wait for 5 ns;
     shift_ctl_tb <= "10";
     wait for 5 ns;
     shift_ctl_tb <= "11";
     wait for 5 ns;
 end process;
 
 --gera os valores de sel


end architecture RTL;


