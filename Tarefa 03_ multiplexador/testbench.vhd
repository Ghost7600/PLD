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
    signal sel_tb : std_logic;                          --seletora do mux, é std_logic pq é controle
    signal a_tb   : unsigned(datasize-1 downto 0);      --entrada a da entidade testbench
    signal b_tb   : unsigned(datasize-1 downto 0);      --entrada b da entidade testbench
    signal result_tb_when : unsigned(datasize-1 downto 0);    --saida product da entidade testbench
    signal result_tb_sel : unsigned(datasize-1 downto 0);    --saida product da entidade testbench

begin

    mux_when_inst : entity work.mux_when      -- instanciando o somador adder em uma instancia adder_inst
        generic map(
            datasize => datasize        -- passando o datsize
        )
        port map(
                            --fazendo portmap, conectando as portas da entidade portamap ao somador adder interno
            a   => a_tb,    -- a interno conecta com a_tb externo
            b   => b_tb,    -- b interno conecta com b_tb externo
            sel => sel_tb,  -- seletora interna conecta com seletora externa
            result => result_tb_when 
        );


        mux_sel_inst : entity work.mux_sel      -- instanciando o somador adder em uma instancia adder_inst
        generic map(
            datasize => datasize        -- passando o datsize
        )
        port map(
                            --fazendo portmap, conectando as portas da entidade portamap ao somador adder interno
            a   => a_tb,    -- a interno conecta com a_tb externo
            b   => b_tb,    -- b interno conecta com b_tb externo
            sel => sel_tb,  -- seletora interna conecta com seletora externa
            result => result_tb_sel
        );

 -- gera os valores de a
 process
 begin
     a_tb <=  to_unsigned(15,a_tb'length);
     wait for 10 ns;
     a_tb <= to_unsigned(15,a_tb'length);
     wait for 10 ns;
 end process;

 --gera os valores de b
 process
 begin
     b_tb <= to_unsigned(3,b_tb'length);
     wait for 5 ns;
     b_tb <= to_unsigned(3,b_tb'length);
     wait for 5 ns;
 end process;
 
 --gera os valores de sel
 process
 begin
     sel_tb <= '0';
     wait for 20 ns;
     sel_tb <= '1';
     wait for 20 ns;
 end process;

end architecture RTL;



