--# ============================================================================
--# Name        : mux_when.vhd
--# Author      : Kenner Marqueti Couto
--# Version     : 0.1
--# Description : Bit-shifter
--# ============================================================================


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
	    
-- Implementação de bit-shifter:

    -- Se shift_cntrl é zero, shift_out[7:0] igual a input[7:0]
    -- Se shift_cntrl é 1, shift_out[11:4] igual input[7:0] -- shift de 4-bits.
    -- Se shift_cntrl é 2,  shift_out[15:8] igual input[7:0] -- shift de 8-bits
    -- Se shift_cntrl is 3, shift_out[7:0] igual input[7:0]).


entity shifter is
    port (
        input : in unsigned (7 downto 0); --entrada de 8 bits
        shift_cntrl : in  std_logic_vector (1 downto 0); -- controle
        shift_out : out unsigned (15 downto 0) --saída do shifter
    );
end entity shifter;

architecture rtl of shifter is -- descreve o comportamento
begin
    process (shift_cntrl, input)
    begin
        -- trocar with select por if else

        --with shift_cntrl select shift_out <= 
        if shift_cntrl = "01" then
            shift_out <= "0000" & input(7 downto 0) & "0000";
        elsif shift_cntrl = "10" then
            shift_out <= input (7 downto 0) & "00000000";
        else 
            shift_out <= "00000000" & input(7 downto 0);
        end if;
    end process;
end architecture rtl;


