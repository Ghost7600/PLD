--# ============================================================================
--# Name        : adder.vhd
--# Author      : Renan Augusto Starke
--# Version     : 0.1
--# Copyright   : Renan, Departamento de Eletrônica, Florianópolis, IFSC
--# Description : Somador de n bits.
--# Adapted by  : Kenner Marqueti Couto
--# ============================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity adder is
    generic(
        datasize : integer := 4 --numero de bits do somador
    );
    port (
        a : in unsigned (datasize-1 downto 0); -- entrada a do somador
        b : in unsigned (datasize-1 downto 0); -- entrada b do somador
        sum : out unsigned (datasize-1 downto 0) -- saída sum do somador
    );
end entity adder;

architecture rtl of adder is    --descreve o comportamento
begin
    sum <= a + b; --lógica de soma
end architecture rtl;