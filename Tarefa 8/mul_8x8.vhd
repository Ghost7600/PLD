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
        product8x8 : out unsigned (2 * datasize - 1 downto 0) --saída do multiplicador
        done_flag : out std_logic;
        seg_a : out std_logic;
        seg_b : out std_logic;
        seg_c : out std_logic;
        seg_d : out std_logic;
        seg_e : out std_logic;
        seg_f : out std_logic;
        seg_g : out std_logic
    );
end entity mul8x8;

architecture rtl of mul8x8 is -- descreve o comportamento

    signal startb : std_logic;    
    signal start : std_logic; 
    signal sel : std_logic_vector(1 downto 0);   
    signal count : std_logic_vector(1 downto 0);   
    signal sel0 : std_logic;    
    signal sel1 : std_logic;    
    signal clk : std_logic;    
    signal reset_a : std_logic;   
    signal count : std_logic_vector(1 downto 0);
    signal input_sel : std_logic_vector(1 downto 0);
    signal shift_sel : std_logic_vector(1 downto 0);
    signal state_out : std_logic_vector(2 downto 0);
    signal done : std_logic;
    signal clk_ena : std_logic;
    signal sclr_n : std_logic;
    signal dataa30 : std_logic_vector(3 downto 0);
    signal dataa74 : std_logic_vector(7 downto 4);
    signal datab30 : std_logic_vector(3 downto 0);
    signal datab74 : std_logic_vector(7 downto 4);
    signal shift_out : std_lohigic_vector(15 downto 0);
    signal aout : std_logic_vector(3 downto 0);
    signal bout : std_logic_vector(3 downto 0);
    signal product : std_logic_vector(7 downto 0);
    signal shift : std_logic_vector(1 downto 0);
    signal product8x8 : std_logic_vector(15 downto 0);
    signal state_out : std_logic_vector(2 downto 0);
    signal done_flag : std_logic;
    
begin

    adder_inst : entity work.adder
        generic map(
            datasize = "16"
        )
        port map(
            a   => shift_out,
            b   => product8x8,
            sum => sum,
        );
    
    mult_control_inst : entity work.mult_control
        port map(
            clk       => clk,
            reset_a   => reset_a,
            start     => start,
            count     => count,
            input_sel => sel,
            shift_sel => shift_sel,
            state_out => state_out,
            done      => done,
            clk_ena   => clk_ena,
            sclr_n    => sclr_n
        );
    
    
    
    
    
    
        






begin
    
end architecture rtl;
