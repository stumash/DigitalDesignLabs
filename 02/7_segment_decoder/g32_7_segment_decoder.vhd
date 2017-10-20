-- this circuit implements the 7-segment LED decoder from lab 2 part 3
-- entity: g32_7_segment_decoder
--
-- Author: Stuart Mashaal  stuart.mashaal@mail.mcgill.ca
--         Philippe Rivard philippe.rivard@mail.mcgill.ca
-- Date: Friday October 20th 2017

library ieee;
use ieee.std_logic_1164.all;

entity g32_7_segment_decoder is
    port (
        code         : in std_logic_vector(3 downto 0);
        mode         : in std_logic;
        segments_out : out std_logic_vector(6 downto 0)
    )
end entity g32_7_segment_decoder;

architecture sim of g32_7_segment_decoder is
    -- prepend mode to code to collect inputs into single signal
    -- for convenience as shown below
    signal mcode : std_logic_vector(4 downto 0);
begin
    mcode(4) <= mode;
    mcode(3 downto 0) <= code;

    -- 7 segment LED. Active-Low. Map of input bits to segments.
    --
    --       0
    --     -----        so, for example,
    --    |     |
    --  5 |     | 1     'A' would be 0001000
    --    |  6  |       '8' would be 0000000
    --     -----        '5' would be 0100100
    --    |     |
    --  4 |     | 2     ...and so on
    --    |     |
    --     -----
    --       3

    with mcode select
    segments_out <=
        -- mode=0
        -- hex digits (0, 1, ..., 9, A, B, ...)
        -- TODO: reverse all outputs!
        "0000001" when "00000", -- "0" when mode=0, code=0
        "1001111" when "00001", -- "1" when mode=0, code=1
        "0010010" when "00010", -- "2" when mode=0, code=2
        "0000110" when "00011", -- "3" when mode=0, code=3
        "1001100" when "00100", -- "4" when mode=0, code=4
        "0100100" when "00101", -- "5" when mode=0, code=5
        "0100000" when "00110", -- "6" when mode=0, code=6
        "0001111" when "00111", -- "7" when mode=0, code=7
        "0000000" when "01000", -- "8" when mode=0, code=8
        "0000100" when "01001", -- "9" when mode=0, code=9
        "0001000" when "01010", -- "A" when mode=0, code=10
        "1100000" when "01011", -- "b" when mode=0, code=11
        "0110001" when "01100", -- "C" when mode=0, code=12
        "1000010" when "01101", -- "d" when mode=0, code=13
        "0110000" when "01110", -- "E" when mode=0, code=14
        "0111000" when "01111", -- "F" when mode=0, code=15
        -- mode=1
        -- card ranks (A, 2, ...,     J, Q, K)
        "0001000" when "10000", -- "A" when mode=1, code=0
        "0010010" when "10001", -- "2" when mode=1, code=1
        "0000110" when "10010", -- "3" when mode=1, code=2
        "1001100" when "10011", -- "4" when mode=1, code=3
        "0100100" when "10100", -- "5" when mode=1, code=4
        "0100000" when "10101", -- "6" when mode=1, code=5
        "0001111" when "10110", -- "7" when mode=1, code=6
        "0000000" when "10111", -- "8" when mode=1, code=7
        "0000100" when "11000", -- "9" when mode=1, code=8
        "0000001" when "11001", -- "0" when mode=1, code=9
        "1000011" when "11010", -- "J" when mode=1, code=10
        "1100010" when "11011", -- "q" when mode=1, code=11
        "1001000" when "11100", -- "K" when mode=1, code=12
        "1111110" when "11101", -- "-" when mode=1, code=13
        "1111110" when "11110", -- "-" when mode=1, code=14
        "1111110" when "11111", -- "-" when mode=1, code=15
end architecture sim;
