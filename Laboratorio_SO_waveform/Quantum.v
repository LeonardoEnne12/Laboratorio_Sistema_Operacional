module Quantum	(PcNormal, instru , resetPC, clk, So_acess, PcSeguinte, counter, PcStore);									
	input [31:0] PcNormal;
	input [4:0] instru;
	input resetPC;
	input clk;
	output reg So_acess;
	output reg [31:0]PcSeguinte;
	output reg [31:0]counter;
	output reg [31:0]PcStore;
	

	parameter posicaoSo = 127; // Posicao que ira retornar o Pc no SO 
	parameter Linhatermina_SO = 258; // Linha que termina o SO
	parameter auxCounter = 45;

	
	always @(negedge clk) 
		begin
			if(resetPC == 1'b0)
				begin
					So_acess = 1'b1;
					counter = 31'b0;
					PcSeguinte = 31'b0;
				end
				
			else
				begin
						
					if( PcNormal < Linhatermina_SO)
						begin
							if(instru == 5'b11100 || instru == 5'b11111) // Intruçao para mexer no regs do programa no SO formato HLT/NOP
								So_acess = 1'b0;
								
							if(instru == 5'b11101)
								So_acess = 1'b1;
								
							counter = 0;	
							PcSeguinte = PcNormal;
						end
					
				
				
					else
						begin
						
							if(counter < auxCounter) //&& instru != 5'b11000 && instru != 5'b11001)
								begin
									counter = counter +  32'd1;
								end
								
							if(counter < auxCounter)
								begin
									PcSeguinte = PcNormal;	
									So_acess = 1'b0;
								end
								
							if(instru == 5'b11011 || counter == auxCounter)
								begin
									PcSeguinte = posicaoSo;
									So_acess = 1'b1;
									counter =  0;
								end
							
							PcStore = PcNormal;
							
						end		


		
				end
		
		
		
		end
	
endmodule


