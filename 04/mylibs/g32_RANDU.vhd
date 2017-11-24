-- This circuit implements the IBM RANDU version of a linear congruential generator
-- entity name: g32_RANDU
--
-- Authors: Stuart Mashaal  stuart.mashaal@mail.mcgill.ca
--          Philippe Rivard philippe.rivard@mail.mcgill.ca
-- Date: Friday October 20th 2017

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; -- needed for shift_left()
library lpm;
use lpm.lpm_components.all;

entity g32_RANDU is
    port (
        seed : in  std_logic_vector(31 downto 0);
        rand : out std_logic_vector(31 downto 0)
    );
end entity g32_RANDU;

architecture sim of g32_RANDU is
    -- intermediate signals
    signal sum1 : std_logic_vector(31 downto 0);
    signal sum2 : std_logic_vector(31 downto 0);
	 signal shift1 : std_logic_vector(31 downto 0);
	 signal shift2 : std_logic_vector(31 downto 0);
begin
    shift1(31 downto 1) <= seed(30 downto 0);
	 shift1(0) <= '0';

    adder1 : lpm_add_sub
        generic map (
            LPM_WIDTH => 32
        )
        port map (
            dataa => seed,
            datab => shift1,
            result => sum1
        );

	 shift2(31 downto 16) <= seed(15 downto 0);
	 shift2(15 downto 0) <= x"0000"; 

    adder2 : lpm_add_sub
        generic map (
            LPM_WIDTH => 32
        )
        port map (
            dataa => sum1,
            datab => shift2,
            result => sum2
        );

    rand(30 downto 0) <= sum2(30 downto 0);
    rand(31) <= '0';
end architecture sim;
