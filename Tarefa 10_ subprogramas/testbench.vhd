-------------------------------------------------------------------
-- name        : testbench.vhd
-- author      : Kenner Marqueti Couto
-- version     : 0.1
-- copyright   : Instituto Federal de Santa Catarina
-- description : Testbench for tarefa 10
-------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Utilização das funções e procedimentos de my_package
use work.ksseg.all;

entity testbench is --declaração de entradas e saídas

end entity testbench;

architecture RTL of testbench is --declaração da parte interna 

    signal clock: std_logic;
    signal output : unsigned (6 downto 0);
    signal bcd : unsigned (3 downto 0);
    signal s_count : unsigned (23 downto 0);
    signal s_aclr_n : std_logic := '1';
    

begin
    
    counter_inst : entity work.counter
        port map(
            clk       => clock,
            aclr_n    => s_aclr_n,
            count_out  => s_count
        );
    
    process
    begin
        clock <= '1';
        wait for 1 ns;
        clock <= '0';
        wait for 1 ns;
    end process;

    bcd <= s_count (3 downto 0);
   
    output <= bcd_to_7seg(bcd);

end architecture RTL;
