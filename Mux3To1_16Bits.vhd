library ieee;
use ieee.std_logic_1164.all;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY Mux3To1_16Bits IS
	PORT(
		Entrada1 , Entrada2 , Entrada3 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		Saida :                          BUFFER STD_LOGIC_VECTOR(15 DOWNTO 0);
		Controle :                       IN STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END Mux3To1_16Bits;

ARCHITECTURE Mux3To1_16Bits_Arch OF Mux3To1_16Bits IS

	BEGIN
		PROCESS(Controle , Saida , Entrada1 , Entrada2)
			BEGIN
			
				CASE Controle IS
					WHEN "00" => Saida <= Entrada1;
					WHEN "01" => Saida <= Entrada2;
					WHEN "10" => Saida <= Entrada3;
					WHEN "11" => Saida <= "XXXXXXXXXXXXXXXX";
				END CASE;
		END PROCESS;
			

END Mux3To1_16Bits_Arch;