library ieee;
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;

ENTITY BancoReg IS
	PORT(
		Ri , Rj :           IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		EndEsc :            IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		Dado :              IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		Controle , Clock :  IN STD_LOGIC;
		SaidaRi , SaidaRj : BUFFER STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END BancoReg;

ARCHITECTURE BancoReg_Arch OF BancoReg IS

	TYPE BancoRegisters is array(0 TO 15) of STD_LOGIC_VECTOR(15 DOWNTO 0);
	SIGNAL BancoDeRegistradores	: BancoRegisters;
	SIGNAL Intervalo : INTEGER RANGE 0 TO 15;
	
	BEGIN
		PROCESS(Controle , Clock , Ri)
			BEGIN
				CASE Controle IS
					WHEN '1' => 
							  Intervalo <= CONV_INTEGER(Ri);
							  SaidaRi <= BancoDeRegistradores( Intervalo )(15 DOWNTO 0);
							  
							  Intervalo <= CONV_INTEGER(Rj);
							  SaidaRj <= BancoDeRegistradores( Intervalo )(15 DOWNTO 0);
							  
					WHEN '0' =>
							  Intervalo <= CONV_INTEGER(EndEsc);
							  BancoDeRegistradores( Intervalo )(15 DOWNTO 0) <= Dado;
				END CASE;
		END PROCESS;

END BancoReg_Arch;