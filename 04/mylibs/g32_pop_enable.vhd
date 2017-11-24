-- this circuit implements the pop_enable function described in lab 2 part 2 using a ROM
-- entity name: g32_pop_enable
--
-- Author: Stuart Mashaal  stuart.mashaal@mail.mcgill.ca
--         Philippe Rivard philippe.rivard@mail.mcgill.ca
-- Date: Friday Octover 20th 2017

library ieee;
use ieee.std_logic_1164.all;
library lpm;
use lpm.lpm_components.all;

entity g32_pop_enable is
    port (
        N    : in  std_logic_vector(5 downto 0);
        P_EN : out std_logic_vector(51 downto 0);
        clk  : in  std_logic
    );
end entity g32_pop_enable;

architecture sim of g32_pop_enable is
begin
    rom_lut : lpm_rom -- use altera rom library macrocell
        generic map (
            lpm_widthad => 6, -- number of bits of ROM address bus
            lpm_numwords => 64, -- number of datum stored in ROM (2^6 = 64)
            lpm_outdata => "UNREGISTERED", -- no register on the input
            lpm_address_control => "REGISTERED", -- register on the input
            lpm_file => "rom_lut.mif", -- the ascii file containing the ROM data
            lpm_width => 52 -- the width (in bits) of each datum stored in ROM
        )
        port map (
            address => N,
            q => P_EN,
            inclock => clk
        );
end architecture sim;
