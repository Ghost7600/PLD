library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity semaforo is
    port(
        clk : in std_logic;
        reset_a : in std_logic;
        start : in std_logic;

        ns : out std_logic_vector (1 downto 0); --semaforo 1, norte sul (ambos são sincronizados)
        ew : out std_logic_vector (1 downto 0)  --semaforo 2, leste oeste
        -- 00 VERMELHO / 01 AMARELO / 10 VERDE / 11 PISCANDO VERMELHO
    );
end entity semaforo;

architecture RTL of semaforo is
    type stateType is (GR, YR, RG, RY, RR, BLINK);
    signal state : stateType;
    signal counter : integer range 0 to 3;  
    signal proximo : stateType;
    constant VERMELHO : std_logic_vector(1 downto 0) := "00";
    constant VERDE : std_logic_vector(1 downto 0) := "01";
    constant AMARELO : std_logic_vector(1 downto 0) := "10";
    constant PISCA : std_logic_vector(1 downto 0) := "11";

begin
    fsm : process(clk, reset_a) is
    begin
        if reset_a = '1' then
            state <= BLINK;
            counter <= 0;
            proximo <= BLINK;
        elsif rising_edge(clk) then
            case state is
                when BLINK =>
                    counter <= 0;
                    if start = '1' then
                        state <= GR;
                    end if;

                when GR =>
                    if counter = 3 then
                        counter <= 0;
                        state <= YR;
                    else 
                        counter <= counter+1;
                    end if;
                when YR =>
                    if counter = 3 then
                        counter <= 0;
                        proximo <= RG;
                        state <= RR;
                    else 
                        counter <= counter+1;
                    end if;
                when RR =>
                    if counter = 3 then
                        counter <= 0;
                        state <= proximo;
                        proximo <= BLINK;
                    else 
                        counter <= counter+1;
                    end if;
                when RG =>
                    if counter = 3 then
                        counter <= 0;
                        state <= RY;
                    else 
                        counter <= counter+1;
                    end if;
                when RY =>
                    if counter = 3 then
                        counter <= 0;
                        state <= RR;
                        proximo <= GR;
                    else 
                        counter <= counter+1;
                    end if;
            end case;
        end if;
    end process fsm;



moore : process(state) is
begin
    ns <= PISCA;
    ew <= PISCA;

        case state is
            when BLINK => 
                ns <= PISCA;
                ew <= PISCA;
                null;
            when GR =>
                ns <= VERDE;
                ew <= VERMELHO;
                null;
            when YR =>
                ns <= VERDE;
                ew <= AMARELO;
                null;
            when RR =>
                ns <= VERMELHO;
                ew <= VERMELHO;
                null;
            when RG =>
                ns <= VERMELHO;
                ew <= VERDE;
                null;
            when RY =>
                ns <= VERMELHO;
                ew <= AMARELO;
                null;
        end case;
end process moore;



end architecture RTL;