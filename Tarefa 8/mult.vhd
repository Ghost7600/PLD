--# ============================================================================
--# Name        : mult.vhd
--# Author      : Renan Augusto Starke
--# Version     : 0.1
--# Copyright   : Renan, Departamento de Eletrônica, Florianópolis, IFSC
--# Description : Somador de n bits.
--# Adapted by  : Kenner Marqueti Couto
--# ============================================================================


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
	    

entity mult is
    generic(
        datasize : integer := 4 --numero de bits do somador
    );
    port (
        a : in unsigned (datasize-1 downto 0); --entrada a do multiplicador
        b : in unsigned (datasize-1 downto 0); -- entrada b do multiplicador
        product : out unsigned (2*datasize-1 downto 0) --saída do multiplicador
    );
end entity mult;

architecture rtl of mult is -- descreve o comportamento
begin
    product <= a * b; --lógica da multiplicação
end architecture rtl;
