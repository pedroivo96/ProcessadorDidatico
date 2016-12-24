library ieee;
use ieee.std_logic_1164.all;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY Mux2To1_16Bits IS
	PORT(
		Entrada1 , Entrada2 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		Saida :               BUFFER STD_LOGIC_VECTOR(15 DOWNTO 0);
		Controle :            IN STD_LOGIC
	);
END Mux2To1_16Bits;

ARCHITECTURE Mux2To1_16Bits_Arch OF Mux2To1_16Bits IS

	BEGIN
		PROCESS(Controle , Saida , Entrada1 , Entrada2)
			BEGIN
			
				CASE Controle IS
					WHEN '0' => Saida <= Entrada1;
					WHEN '1' => Saida <= Entrada2;
				END CASE;
		END PROCESS;
			

END Mux2To1_16Bits_Arch;