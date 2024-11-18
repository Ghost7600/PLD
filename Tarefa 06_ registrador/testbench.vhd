--# ============================================================================
--# Name        : testbench.vhd
--# Author      : Kenner Marqueti Couto
--# Version     : 0.1
--# Description : 16bit register testbench
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
    signal sclr_n_tb : std_logic;
    signal clk_ena_tb : std_logic;
    signal data_in_tb : unsigned(15 downto 0);
    signal reg_out_tb : unsigned(15 downto 0);

begin
    reg_inst : entity work.reg --instancia o registrador
        port map( --conecta portas do reg interno ao tb
            clk     => clk_tb,
            sclr_n  => sclr_n_tb,
            clk_ena => clk_ena_tb,
            data_in => data_in_tb,
            reg_out => reg_out_tb
        );
    --gerando valores de entrada
    
    --clk_ena_tb <= '0';
    --sclr_n_tb <= '1';
    --clk_tb <= '0';

    process
    begin
        data_in_tb <= to_unsigned(43690, data_in_tb'length);
        wait for 20 ns;
        data_in_tb <= to_unsigned(61680, data_in_tb'length);
        wait for 20 ns;
    end process;
    


    process 
    begin
        wait for 2 ns;
        clk_tb <= '1';
        wait for 2 ns;
        clk_tb <= '0';
    end process;

    process 
    begin
        wait for 3 ns;
        clk_ena_tb <= '1';
        wait for 4 ns;
        sclr_n_tb <= '0';
        wait for 4 ns;
        sclr_n_tb <= '1';
        wait for 4 ns;
        clk_ena_tb <= '0';
        
    end process;
 
end architecture RTL;
