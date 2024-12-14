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
	    

entity mul8x8 is
    generic(
        datasize : integer := 8 --numero de bits do somador
    );
    port (
        dataa : in unsigned (datasize-1 downto 0); --entrada a do multiplicador
        datab : in unsigned (datasize-1 downto 0); -- entrada b do multiplicador
        start : in std_logic;
        reset_a : in std_logic;
        clk : in std_logic;
        product8x8_out : out unsigned (15 downto 0); --saída do multiplicador
        done_flag : out std_logic;
        seg_a : out std_logic;
        seg_b : out std_logic;
        seg_c : out std_logic;
        seg_d : out std_logic;
        seg_e : out std_logic;
        seg_f : out std_logic;
        seg_g : out std_logic;
        sseg_vec_out : out unsigned (7 downto 0)
    );
end entity mul8x8;

architecture rtl of mul8x8 is -- descreve o comportamento

    signal s_start : std_logic;    
    signal s_sel : std_logic_vector(1 downto 0);   
    signal s_count : unsigned(1 downto 0);  
    --signal s_count_us : unsigned(1 downto 0);  
    --signal s_clk : std_logic;    
    --signal s_reset_a : std_logic; 
    signal s_n_start : std_logic;  
    signal s_input_sel : std_logic_vector(1 downto 0);
    signal s_shift_sel : std_logic_vector(1 downto 0);
    signal s_state_out : std_logic_vector(2 downto 0);
    --signal s_done : std_logic;
    signal s_clk_ena : std_logic;
    signal s_sclr_n : std_logic;
    signal s_dataa30 : std_logic_vector(3 downto 0);
    signal s_dataa74 : std_logic_vector(7 downto 4);
    signal s_datab30 : std_logic_vector(3 downto 0);
    signal s_datab74 : std_logic_vector(7 downto 4);
    signal s_shift_out : unsigned(15 downto 0);
    signal s_aout : unsigned(3 downto 0);
    signal s_bout : unsigned(3 downto 0);
    signal s_product : unsigned(7 downto 0);
    signal s_shift : std_logic_vector(1 downto 0);
    signal s_product8x8 : unsigned(15 downto 0);
    signal s_done_flag : std_logic;
    signal s_sum : unsigned (15 downto 0);
    signal s_state_out_unsigned : unsigned(3 downto 0);
    signal s_sseg_unsigned : unsigned (7 downto 0);

    
begin

    adder_inst : entity work.adder
        generic map(
            datasize => 16
            )
        port map(
            a   => s_shift_out,
            b   => s_product8x8,
            sum => s_sum
        );
    
    mult_control_inst : entity work.mult_control
        port map(
          clk       => clk       ,
          reset_a   => reset_a   ,
          start     => s_start    ,
          count     => s_count     ,
          input_sel => s_sel ,
          shift_sel => s_shift ,
          state_out => s_state_out ,
          done      => done_flag      ,
          clk_ena   => s_clk_ena   ,
          sclr_n    => s_sclr_n    
        );
    
    shifter_inst : entity work.shifter
        port map(
            input       => s_product,
            shift_cntrl => s_shift,
            shift_out   => s_shift_out
        );

    counter_inst : entity work.counter
        port map(
            clk       => clk,
            aclr_n    => s_n_start,
            count_out => s_count
        );
    s_start <= start;
    s_n_start <= not s_start;
    --s_count_us <= unsigned(s_count);
    --s_count <= std_logic_vector(s_count_us);
    
    reg16_inst : entity work.reg
        port map(
            clk     => clk,
            sclr_n  => s_sclr_n,
            clk_ena => s_clk_ena,
            data_in => s_sum,
            reg_out => s_product8x8
        );
    
    mux4_1 : entity work.mux_when
        generic map(
            datasize => 4
        )
        port map(
            a      => datab (3 downto 0),
            b      => datab(7 downto 4),
            sel    => s_sel (0),
            result => s_bout
        );
    
    mux4_2 : entity work.mux_when
        generic map(
            datasize => 4
        )
        port map(
            a      => dataa (3 downto 0),
            b      => dataa(7 downto 4),
            sel    => s_sel (1),
            result => s_aout
        );   
    
    mult4x4_inst : entity work.mult
        generic map(
            datasize => 4
        )
        port map(
            a       => s_aout,
            b       => s_bout,
            product => s_product
        );
    
    seven_segment_cntrl_inst : entity work.sseg_d
        port map(
            input  => s_state_out_unsigned,
            output => s_sseg_unsigned
        );

    sseg_vec_out <= s_sseg_unsigned;
    product8x8_out <= s_product8x8;
    s_state_out_unsigned <= "0" & unsigned(s_state_out);

end architecture rtl;
