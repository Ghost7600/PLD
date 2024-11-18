--# ============================================================================
--# Name        : counter.vhd
--# Author      : Kenner Marqueti Couto
--# Version     : 0.1
--# Description : Contador 2 bits
--# ============================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter is
    port(
        clk : in std_logic;
        aclr_n : in std_logic;
        count_out : out unsigned(1 downto 0)
    );
end entity counter;

architecture RTL of counter is
    
begin

    proc : process (aclr_n, clk) is
        variable value : unsigned (1 downto 0) := "00";
    begin
        if aclr_n = '0' then
            value := "00";
        elsif rising_edge(clk) then
            value := value + 1;
        end if;
        count_out <= value;
    end process proc;

end architecture RTL;


