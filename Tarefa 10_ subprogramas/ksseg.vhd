-------------------------------------------------------------------
-- name        		: my_package.vhd
-- author	   		: Kenner Marqueti Couto
-- based on file by	: Renan Augusto Starke
-- version     		: 0.1
-- copyright   		: Instituto Federal de Santa Catarina
-- description 		: Package creating and operator overload
-------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package ksseg is

	--declarando tipo tabela
	type tabela is array (0 to 15) of unsigned (6 downto 0);
	
	-- Declaração da função
	function bcd_to_7seg (bcd : unsigned(3 downto 0)) return unsigned ;
end package ksseg;

package body ksseg is
	
	
	
	
		-- Corpo da função
		function bcd_to_7seg (bcd : unsigned (3 downto 0)) return unsigned is		
			--declarando a variavel 
			variable sseg : unsigned (6 downto 0);
			--declarando a constante
			constant lut : tabela := (
				"1000000", -- 0
				"1111001", -- 1
				"0100100", -- 2
				"0110000", -- 3
				"0011001", -- 4
				"0010010", -- 5
				"0000010", -- 6
				"1111000", -- 7
				"0000000", -- 8
				"0010000", -- 9
				"0001000", -- A
				"0000011", -- b
				"1000110", -- C
				"0100001", -- d
				"0000110", -- E
				"0001110"  -- F
			);
			
		begin
			sseg := lut(to_integer(bcd));
			return sseg;
	end bcd_to_7seg;

end package body ksseg;
