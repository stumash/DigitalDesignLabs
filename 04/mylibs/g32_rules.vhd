-- this circuit implements the Rules Module circuit from lab 4
--
-- entity name: g32_rules

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity g32_rules is
	port(
		-- the sum of the values of the cards so far dealt to the player
		play_pile_top_card : in  std_logic_vector(5 downto 0);
		-- the card being played by the player
		card_to_play       : in  std_logic_vector(5 downto 0);
		-- false if play_pile_top_card + floor(card_to_play/13) > 21
		legal_play 			 : out std_logic
		);
end g32_rules;

architecture structural of g32_rules is
	signal tmp : std_logic_vector(9 downto 0);
	signal card_to_play_face_value : std_logic_vector(3 downto 0);

	component g32_Amod13
		port(
			Input	 :	 in  std_logic_vector(5 downto 0);
			Floor	 :	 out std_logic_vector(9 downto 0);
			Modulo :	 out std_logic_vector(3 downto 0)
		);
	end component;
begin
	card: g32_Amod13 port map(card_to_play, tmp, card_to_play_face_value);
	
	process(play_pile_top_card, card_to_play)
	begin
		if unsigned(play_pile_top_card) > 21 then
			legal_play <=  '0';
		elsif unsigned(card_to_play_face_value) + unsigned(play_pile_top_card) > 21 then
			legal_play <= '0';
		else
			legal_play <= '1';
		end if;
	end process;
end structural;

