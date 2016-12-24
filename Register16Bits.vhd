library ieee;
use ieee.std_logic_1164.all;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY Register16Bits IS
	PORT(
		Entrada   : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		Saida     : BUFFER STD_LOGIC_VECTOR(15 DOWNTO 0);
		Controle  : IN STD_LOGIC;
		Clock     : IN STD_LOGIC;
		Reset     : IN STD_LOGIC
	);
END Register16Bits;

ARCHITECTURE Register16Bits_Arch OF Register16Bits IS

	BEGIN
		PROCESS(Clock , Reset , Controle)
			BEGIN
			
				IF(Reset = '1') THEN
					Saida <= "0000000000000000";
				ELSIF(Clock'EVENT AND Clock = '1' AND Controle = '1') THEN
					Saida <= Entrada;
				END IF;
		END PROCESS;
			

END Register16Bits_Arch;