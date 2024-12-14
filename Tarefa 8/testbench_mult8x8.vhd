-------------------------------------------------------------------
-- Name        : mul_8x8.vhd
-- Description : testbench for Multiplicador 8x8
-------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-------------------------------------
entity testbench_mult8x8 is
end entity testbench_mult8x8;
------------------------------
-- conexões externas
architecture rtl of testbench_mult8x8 is
    signal data_a : unsigned (7 downto 0);
    signal data_b : unsigned (7 downto 0);
    signal start : std_logic;
    signal reset_a : std_logic;
    signal clk : std_logic;
    signal done_flag : std_logic;
    signal s_sseg_unsigned : unsigned (7 downto 0);
    signal out_8x8 : unsigned (15 downto 0) := (others => '0');


    
begin
    mul8x8_inst : entity work.mul8x8
        generic map(
            datasize => 8
        )
        port map(
            dataa        => data_a,
            datab        => data_b,
            start        => start,
            reset_a      => reset_a,
            clk          => clk,
            product8x8_out   => out_8x8,
            done_flag    => done_flag,
            sseg_vec_out => s_sseg_unsigned
        );
    
        
    process
    begin
        clk <= '0';
        wait for 2 ns;
        clk <= '1';
        wait for 2 ns;
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
        data_a <= x"FA";
        data_b <= x"FA";
        start <= '0';
        wait for 16 ns;
        start <= '1';
        wait for 4 ns;
        start <= '0';
        wait for 5 ns;
        -- start <= '1';
        -- wait for 10 ns;
        
        --data_a <= x"FA";
        --data_b <= x"FA";
        start <= '0';
        wait for 5 ns;
        --start <= '1';
        wait for 4 ns;
        start <= '0';
        wait;
        
    end process;
    
end architecture rtl;