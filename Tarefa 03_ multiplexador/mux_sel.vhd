--# ============================================================================
--# Name        : mux_when.vhd
--# Author      : Kenner Marqueti Couto
--# Version     : 0.1
--# Description : Somador de n bits.
--# ============================================================================


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
	    
-- implementação de multiplexador através da atribuição condicional when

entity mux_sel is
    generic(
        datasize : integer := 4 --numero de bits do mux
    );
    port (
        a : in unsigned (datasize-1 downto 0); --entrada a do mux
        b : in unsigned (datasize-1 downto 0); -- entrada b do mux
        sel : in std_logic;                    --seletora do mux, é std_logic pq é controle
        result : out unsigned (datasize-1 downto 0) --saída do mux
    );
end entity mux_sel;

architecture rtl of mux_sel is -- descreve o comportamento
begin
    with sel select
        result <= a when '0',
        b when others;
end architecture rtl;

