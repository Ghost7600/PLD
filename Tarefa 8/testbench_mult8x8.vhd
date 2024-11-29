-------------------------------------------------------------------
-- Name        : mul_8x8.vhd
-- Author      : Paulo Cezar
-- Version     : 1.0.0
-- Description : testbench for Multiplicador 8x8
-------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-------------------------------------
entity testbench_mult8x8 is
end entity testbench_mult8x8;
------------------------------

architecture mul_8x8 of testbench_mult8x8 is
    signal data_a : unsigned (7 downto 0);
    signal data_b : unsigned (7 downto 0);
    signal start : std_logic;
    signal reset_a : std_logic;
    signal clk : std_logic;
    signal done_flag : std_logic;
    signal seg7 : unsigned (7 downto 0);
    signal out_8x8 : unsigned (15 downto 0) := (others => '0');


    
begin
    mult8x8: entity work.mul_8x8
        port map(
            clk            => clk,
            start          => start,
            reset_a        => reset_a,
            data_a         => data_a,
            data_b         => data_b,
            done_flag      => done_flag,
            seg7           => seg7,
            out_8x8        => out_8x8
        );
        
    process
    begin
        clk <= '0';
        wait for 1 ns;
        clk <= '1';
        wait for 1 ns;
    end process;
    -- clock process

    process
    begin
        reset_a <= '1';
        wait for 1 ns;
        reset_a <= '0';
        wait;
    end process;
    -- reset process

    process
    begin
        data_a <= x"02";
        data_b <= x"05";
        start <= '0';
        wait for 15 ns;
        start <= '1';
        wait for 5 ns;
        start <= '0';
        wait for 5 ns;
        -- start <= '1';
        -- wait for 10 ns;
        
        data_a <= x"FA";
        data_b <= x"FA";
        start <= '0';
        wait for 5 ns;
        start <= '1';
        wait for 5 ns;
        start <= '0';
        wait;
        
    end process;
    
end architecture mul_8x8;