LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY TrabalhoFinalCircuitos IS
PORT(
	a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z		:		IN BIT;							-- Entradas: Letras do alfabeto
	Cod																		:		INOUT bit_vector(0 TO 7);	-- Codificador das letras
	clock																		:		IN BIT;							-- Clock para o funcionamento
	Saida																		:		INOUT bit;						-- Saída da FSM
	Cont																		:		INOUT bit_vector(0 to 2);	-- Contador de sequência
	Q1, Q2, Q3																:		INOUT bit						-- Utilizadas para o contador
);

END trabalhoFinalCircuitos;

ARCHITECTURE State_Machine OF TRAbalhoFinalCircuitos IS
BEGIN
---------------------------- Codificador -----------------------------------------------------------------------------------
	Cod(0) <= '0';
	Cod(1) <= '1';
	Cod(2) <= '1';
	Cod(3) <= p or q or r or s or t or u or v or w or x or y or z;
	Cod(4) <= h or i or j or k or l or m or n or o or x or y or z;
	Cod(5) <= d or e or f or g or l or m or n or o or t or u or v or w;
	Cod(6) <= b or c or f or g or j or k or n or o or r or s or v or w or z;
	Cod(7) <= a or c or e or g or i or k or m or o or q or s or u or w or y;
	
------------------------------- FSM ---------------------------------------------------------------------------------------
	PROCESS(Cod, clock)
	variable estados: bit_vector(0 to 3);					-- Estados da FSM
	variable Z_Out: bit;											-- Saída da FSM
	BEGIN
	estados := "0000";											-- Inicialização dos estados com o valor 0
	
	if(Clock'event and clock = '0') then					-- Clock em borda de descida
		for i in 0 to 7 loop
			case estados is
				when "0000" =>										-- Estado A
					if(Cod(i) = '0') then
						estados := "0001";
						Z_Out := '0';
					else
						estados := "1000";
						Z_Out := '0';
					end if;
					
					when "0001" =>									-- Estado B
					if(Cod(i) = '0') then
						estados := "1001";
						Z_Out := '0';
					else
						estados := "0010";
						Z_Out := '0';
					end if;
					
					when "0010" =>									-- Estado C
					if(Cod(i) = '0') then
						estados := "1010";
						Z_Out := '0';
					else
						estados := "0011";
						Z_Out := '0';
					end if;
					
					when "0011" =>									-- Estado D
					if(Cod(i) = '0') then
						estados := "0100";
						Z_Out := '0';
					else
						estados := "1011";
						Z_Out := '0';
					end if;
					
					when "0100" =>									-- Estado E
					if(Cod(i) = '0') then
						estados := "1100";
						Z_Out := '0';
					else
						estados := "0101";
						Z_Out := '0';
					end if;
					
					when "0101" =>									-- Estado F
					if(Cod(i) = '0') then
						estados := "0110";
						Z_Out := '0';
					else
						estados := "1101";
						Z_Out := '0';
					end if;
					
					when "0110" =>									-- Estado G
					if(Cod(i) = '0') then
						estados := "0111";
						Z_Out := '0';
					else
						estados := "1110";
						Z_Out := '0';
					end if;
					
					when "0111" =>									-- Estado H
					if(Cod(i) = '0') then
						estados := "0000";
						Z_Out := '1';
					else
						estados := "0000";
						Z_Out := '0';
					end if;
					
					when "1000" =>									-- Estado A1
					if(Cod(i) = '0') then
						estados := "1001";
						Z_Out := '0';
					else
						estados := "1001";
						Z_Out := '0';
					end if;
					
					when "1001" =>									-- Estado B1
					if(Cod(i) = '0') then
						estados := "1010";
						Z_Out := '0';
					else
						estados := "1010";
						Z_Out := '0';
					end if;
					
					when "1010" =>									-- Estado C1
					if(Cod(i) = '0') then
						estados := "1011";
						Z_Out := '0';
					else
						estados := "1011";
						Z_Out := '0';
					end if;
					
					when "1011" =>									-- Estado D1
					if(Cod(i) = '0') then
						estados := "1100";
						Z_Out := '0';
					else
						estados := "1100";
						Z_Out := '0';
					end if;
					
					when "1100" =>									-- Estado E1
					if(Cod(i) = '0') then
						estados := "1101";
						Z_Out := '0';
					else
						estados := "1101";
						Z_Out := '0';
					end if;
					
					when "1101" =>									-- Estado F1
					if(Cod(i) = '0') then
						estados := "1110";
						Z_Out := '0';
					else
						estados := "1110";
						Z_Out := '0';
					end if;
					
					when "1110" =>									-- Estado G1
					if(Cod(i) = '0') then
						estados := "0000";
						Z_Out := '0';
					else
						estados := "0000";
						Z_Out := '0';
					end if;
					
					when "1111" =>									-- Estado FON
					if(Cod(i) = '0') then
						estados := "0000";
						Z_Out := '0';
					else
						estados := "0000";
						Z_Out := '0';
					end if;
				END case;
			Saida <= Z_Out;
			end loop;
-------------------------------- Contador ----------------------------------------------------------------------------------
		if(Z_Out = '1') then																	-- Se encontrar a letra h, incrementa o contador
			cont(0) <= (Q1 and not Q3) or (Q and not Q2) or (not Q1 and Q2 and Q3);	-- Expressões do contador, deduzidas
			cont(1) <= Q2 xor Q3;																	-- a partir da tabela-verdade
			cont(2) <= not Q3;
			Q1 <= cont(0);
			Q2 <= cont(1);
			Q3 <= cont(2);
		end if;
----------------------------------------------------------------------------------------------------------------------------
	END IF;
		
	END PROCESS;
END state_Machine;