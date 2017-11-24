-- this circuit implements the Dealer Finite State Machine circuit from lab 4
--
-- entity name: g32_dealer_fsm

library ieee;
use ieee.std_logic_1164.all;

entity g32_dealer_fsm is
	port(
		Request_Deal : in  std_logic;
		RAND_LT_NUM  : in  std_logic;
		reset        : in  std_logic;
		clk          : in  std_logic;
		Stack_Enable : out std_logic;
		Rand_Enable  : out std_logic
	);
end entity;

architecture structural of g32_dealer_fsm is
	type state_type is (A, B, C, D);
	signal state : state_type;
begin
	process(clk, reset)
	begin
		if reset = '1' then
			state <= A;
		elsif rising_edge(clk) then
			case state is
				when A =>
					Stack_Enable <= '0';
					Rand_Enable <= '0';
					if Request_Deal = '0' then
						state <= B;
					end if;
				when B =>
					Stack_Enable <= '0';
					Rand_Enable <= '0';
					if Request_Deal = '1' then
						state <= C;
					end if;
				when C =>
					Rand_Enable <= '1';
					Stack_Enable <= '0';
					if RAND_LT_NUM = '1' then
						state <= D;
					end if;
				when D =>
					Rand_Enable <= '0';
					Stack_Enable <= '1';
					state <= A;
			end case;
		end if;
	end process;
end architecture;