--# ============================================================================
--# Name        : seven_segment_cntrl.vhd
--# Date        : Nov 11th 2024
--# Author      : Kenner Marqueti Couto
--# Version     : 0.1
--# Description : Bit-shifter
--# ============================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- implementação de conversor binário 7seg anodo comum. Nivel lógico 0 ascende o segmento.
-- deve utilizar implementação switch-case

entity sseg_d is
    port(
        input   :   in unsigned(3 downto 0); --entrada do número em binário
        output  :   out unsigned(7 downto 0) -- saída, cada bit um segmento
    );
end entity sseg_d;

--observar ordem do kit - 1 up to 10 - vcc-f-g-e-d-vcc-dp-c-b-a

-- inicialmente armazena-se a informação dos segmentos em variáveis para faciliar correção de erros de atribuião de pinos no kit
architecture RTL of sseg_d is
begin
    process (input)
    begin
        case input is
            when "0000" => output <= "11000000"; -- Display 0
            when "0001" => output <= "11111001"; -- Display 1
            when "0010" => output <= "10100100"; -- Display 2
            when "0011" => output <= "10110000"; -- Display 3
            when "0100" => output <= "10011001"; -- Display 4
            when "0101" => output <= "10010010"; -- Display 5
            when "0110" => output <= "10000010"; -- Display 6
            when "0111" => output <= "11111000"; -- Display 7
            when "1000" => output <= "10000000"; -- Display 8
            when "1001" => output <= "10010000"; -- Display 9
            when others => output <= "11111111"; -- Default off
        end case;
    end process;    
    

--resolver mapping ou com variáveis ou com um bloco mapper no tesbench, ver com renan.

end architecture RTL;
