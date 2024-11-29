--# ============================================================================
--# Name        : reg.vhd
--# Date        : Nov 17th 2024
--# Author      : Kenner Marqueti Couto
--# Version     : 0.1
--# Description : Register
--# ============================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg is
    port(
        clk : in std_logic; --clock
        sclr_n : in std_logic; -- clear
        clk_ena : in std_logic; -- bit que escolhe se o registrador vai gravar as entradas
        data_in : in unsigned(15 downto 0); -- entrada de dados do registrador
        reg_out : out unsigned (15 downto 0) -- register data out
    );
end entity reg;

architecture rtl of reg is -- behaviour description
begin
    process (sclr_n, clk)
    begin
        if sclr_n = '0' then
            reg_out <= to_unsigned(0, data_in'length );
        elsif rising_edge(clk)  and clk_ena = '1' then
            reg_out <= data_in;
        end if;
    end process;
end architecture rtl;
