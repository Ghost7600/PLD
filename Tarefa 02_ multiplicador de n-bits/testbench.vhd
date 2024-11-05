--# ============================================================================
--# Name        : testbench.vhd
--# Author      : Kenner Marqueti Couto
--# Version     : 0.1
--# Copyright   : Renan, Departamento de Eletrônica, Florianópolis, IFSC
--# Description : Implementação de somador de n bits.
--# Adapted by  : Kenner Marqueti Couto
--# ============================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity testbench is
end entity testbench;

architecture RTL of testbench is

    constant datasize : integer := 4;
                                                        --conexoes externas:
    signal a_tb   : unsigned(datasize-1 downto 0);      --entrada a da entidade testbench
    signal b_tb   : unsigned(datasize-1 downto 0);      --entrada b da entidade testbench
    signal product_tb : unsigned(2*datasize-1 downto 0);      --saida product da entidade testbench

begin

    mult_inst : entity work.mult      -- instanciando o somador adder em uma instancia adder_inst
        generic map(
            datasize => datasize        -- passando o datsize
        )
        port map(
                            --fazendo portmap, conectando as portas da entidade portamap ao somador adder interno
            a   => a_tb,    -- a interno conecta com a_tb externo
            b   => b_tb,    -- b interno conecta com b_tb externo
            product => product_tb   -- mult interno conecta com mult_tb externo
        );

 -- gera os valores de a
 process
 begin
     a_tb <=  to_unsigned(5,a_tb'length);
     wait for 10 ns;
     a_tb <= to_unsigned(10,a_tb'length);
     wait for 10 ns;
 end process;

 --gera os valores de b
 process
 begin
     b_tb <= to_unsigned(12,b_tb'length);
     wait for 5 ns;
     b_tb <= to_unsigned(3,b_tb'length);
     wait for 5 ns;
 end process;
 
end architecture RTL;



