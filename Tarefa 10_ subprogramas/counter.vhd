--# ============================================================================
--# Name        : counter.vhd
--# Author      : Kenner Marqueti Couto
--# Version     : 0.1
--# Description : Contador 24 bits
--# ============================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter is
    port(
        clk : in std_logic;
        aclr_n : in std_logic;
        count_out : out unsigned(23 downto 0)
    );
end entity counter;

architecture RTL of counter is
    
begin

    proc : process (aclr_n, clk) is
        variable value : unsigned (23 downto 0) := (others => '0');
    begin
        if aclr_n = '0' then
            value := (others => '0');
        elsif rising_edge(clk) then
            value := value + 1;
        end if;
        count_out <= value;
    end process proc;

end architecture RTL;