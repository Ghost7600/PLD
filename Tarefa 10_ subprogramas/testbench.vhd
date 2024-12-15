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

entity testbench is

end entity testbench;

architecture RTL of testbench is

    signal entrada: unsigned (3 downto 0) := (others => '0');
    signal output : unsigned (6 downto 0);

begin
    
    incremento : process is
    begin
        wait for 10 ns;
        if entrada < "1111" then
        entrada <= entrada + 1;
        else
            entrada <= "0000";
        end if;
    end process incremento;
    
    output <= bcd_to_7seg(entrada);

end architecture RTL;
