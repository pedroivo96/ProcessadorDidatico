library ieee;
use ieee.std_logic_1164.all;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY ULA IS
	PORT(
		Entrada1 , Entrada2 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		Saida :               BUFFER STD_LOGIC_VECTOR(15 DOWNTO 0);
		ControleULA :         IN STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END ULA;

ARCHITECTURE ULA_Arch OF ULA IS

	BEGIN
		PROCESS(ControleULA , Saida , Entrada1 , Entrada2)
			BEGIN
			
				CASE ControleULA IS
					WHEN "000" => Saida <= Entrada1;
					WHEN "001" => Saida <= Entrada1 + Entrada2;
					WHEN "010" => Saida <= Entrada1 - Entrada2;
					WHEN "011" => Saida <= NOT Entrada1;
					WHEN "100" => Saida <= Entrada1 AND Entrada2;
					WHEN "101" => Saida <= Entrada1 OR Entrada2;
					WHEN OTHERS => Saida <= "0000000000000000";
				END CASE;
		END PROCESS;
			

END ULA_Arch;