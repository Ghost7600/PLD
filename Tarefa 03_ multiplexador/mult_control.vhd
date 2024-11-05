library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mult_control is
    port(
        clk : in std_logic;
        reset_a : in std_logic;
        start : in std_logic;
        count : in unsigned(1 downto 0);

        input_sel : out std_logic_vector(1 downto 0); -- controle do mux, portanto std_logic_vector
        shift_sel : out std_logic_vector(1 downto 0);
        state_out : out std_logic_vector(2 downto 0);

        done      : out std_logic;
        clk_ena   : out std_logic;
        sclr_n    : out std_logic

    );
end entity mult_control;

architecture RTL of mult_control is
    type stateType is (IDLE, LSB, MID, MSB, CALC_DONE, ERR);
    signal state : stateType;
begin
    process(clk, reset_a) is
    begin
        if reset_a = '1' then
            state <= IDLE;
        elsif rising_edge(clk) then
            case state is
                when IDLE =>
                    if start = '1' then
                        state <= LSB;
                    end if;
                when LSB =>
                    if start = '0' and count = "00" then
                        state <= MID;
                    else
                        state <= ERR;
                    end if;
                when MID =>
                    if start = '0' and count = "10" then
                        state <= MSB;
                    elsif start = '0' and count = "01" then
                        state <= MID;
                    else
                        state <= ERR;
                    end if;
                when MSB =>
                    if start = '0' and count = "11" then
                        state <= CALC_DONE;
                    else
                        state <= ERR;
                    end if; 
                when CALC_DONE =>
                    if start='0' then
                        state <= IDLE;
                    elsif start = '1' then
                        state <= ERR;
                    end if;
                when ERR =>
                    if start = '1' then
                        state <= LSB;
                    end if;
            end case;
        end if;
    end process;

mealy : process (state, start, count)
begin
    input_sel <= "00";
    shift_sel <= "00";
    done <= '0';
    clk_ena <= '0';
    sclr_n <= '0';

    case state is
        when IDLE =>
            if start = '1' then
                clk_ena <= '1';
                sclr_n <= '0';
            end if;
            null;
        when LSB =>
            if start = '0' and count = "00" then
                input_sel <= "00";
                shift_sel <= "00";
                done <= '0';
                clk_ena <= '1';
                sclr_n <= '1';
            else
                done <= '0';
                clk_ena <= '0';
                sclr_n <= '1';
            end if;
        when MID =>
            if start = '0' and count = "01" then
                input_sel <= "01";
                shift_sel <= "01";
                clk_ena <= '1';
                sclr_n <= '1';
            elsif start = '0' and count = "10" then
                input_sel <= "10";
                shift_sel <= "01";
                done <= '0';
                clk_ena <= '1';
                sclr_n <= '1';
            else 
                done <= '0';
                clk_ena = '0';
                sclr_n = '1';
            end if;
            when MSB => 
                if start = '0' and count = "11" then
                    input_sel <= "11";
                    shift_sel <= "00";
                    done <= 0;
                    clk_ena <= '1';
                    sclr_n <= '1';
                else 
                    done
        when CALC_DONE =>
            null;
        when ERR =>
            null;
    end case;
end process mealy;


moore : process(state) is
begin
    state_out <= "000";
        case state is
            when IDLE =>
                null;
            when LSB =>
                null;
            when MID =>
                null;
            when MSB =>
                null;
            when CALC_DONE =>
                null;
            when ERR =>
                null;
        end case;
end process moore;



end architecture RTL;
