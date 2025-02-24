library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity testbench is
end entity testbench;

architecture RTL of testbench is
    signal clk_tb :  std_logic;
    signal reset_a_tb : std_logic;
    signal start_tb : std_logic; 
    signal ns_tb : std_logic_vector (1 downto 0); --semaforo 1, norte sul (ambos são sincronizados)
    signal ew_tb : std_logic_vector (1 downto 0);  --semaforo 2, leste oeste
    -- 00 VERMELHO / 01 AMARELO / 10 VERDE / 11 PISCANDO VERMELHO
begin

    semaforo_inst : entity work.semaforo
        port map(
            clk     => clk_tb,
            reset_a => reset_a_tb,
            start   => start_tb,
            ns      => ns_tb,   --semaforo 1, via Norte sul
            ew      => ew_tb  -- semaforo 2 via leste oeste
        );
    
    

    name : process is
    begin
        reset_a_tb <= '1';
        wait for 5 ns;
        reset_a_tb <= '0';
        wait for 140 ns;
    end process name;
    

    clk : process begin
        clk_tb <= '1';
        wait for 2 ns;
        clk_tb <= '0';
        wait for 2 ns;
    end process clk;

    process begin
        wait for 10 ns;
        start_tb <= '1';
    end process;

    

end architecture RTL;
