--# ============================================================================
--# Name        : testbench.vhd
--# Author      : Kenner Marqueti Couto
--# Version     : 0.1
--# Description : counter tesbench
--# ============================================================================


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity testbench is
    -- vazio, no hardware interface
end entity testbench;

architecture RTL of testbench is
    --conexões externas
    signal clk_tb : std_logic;
    signal aclr_n_tb : std_logic;
    signal count_out_tb : unsigned(1 downto 0);

begin
    count_inst : entity work.counter --instancia o contador
        port map( --conecta portas do contador interno ao tb
            clk     => clk_tb,
            aclr_n  => aclr_n_tb,
            count_out => count_out_tb
        );
        
        
--gerando valores de entrada

    process --generate clock
    begin
        wait for 1 ns;
        clk_tb <= '1';
        wait for 1 ns;
        clk_tb <= '0';
    end process;
    
    process --resets every so often
    begin
        aclr_n_tb <= '1';
        wait for 12 ns;
        aclr_n_tb <= '0';
        wait for 4 ns;
        
    end process;
 
end architecture RTL;
