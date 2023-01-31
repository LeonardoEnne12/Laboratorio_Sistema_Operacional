module Registradores(clock, regWrite, SJal, RJAL, R1, R2,RD, dadosEscrita, So_acess, leituraR1, leituraR2, leituraRD, resetPC);
	input [4:0] R1; 
	input [4:0] R2; 
	input [4:0] RD; 
	input [31:0] dadosEscrita, RJAL; // Dado Escrito no Registrador
	input So_acess;
	input resetPC;

	output [31:0] leituraR1; // Conteudo de R1
	output [31:0] leituraR2; // Conteudo de R2
	output [31:0] leituraRD; // Conteudo de R2

	input clock;
	input regWrite, SJal; // Sinal de Escrita

	reg [31:0] regs[31:0];
	reg [31:0] regsSO[31:0];
	
	integer i;
	initial begin
		for(i = 0; i < 32 ; i = i + 1)
			begin
			regs[i] = 0;
			regsSO[i] = 0;
			end
	end
	
	always @ (negedge clock) begin
		if(resetPC == 1'b1)
			begin

				if(So_acess == 1'b1)
					begin
						regsSO[RD] <= regWrite ? dadosEscrita : regsSO[RD];
						
						if( SJal == 1)
							regsSO[31] = RJAL;
						
					end
				else
					begin
						regs[RD] <= regWrite ? dadosEscrita : regs[RD];
						
						if( SJal == 1)
							regs[31] = RJAL;

					end
			
			end
		
	end
	
		assign leituraR1 = So_acess ? regsSO[R1] : regs[R1];
	   assign leituraR2 = So_acess ? regsSO[R2] : regs[R2];
	   assign leituraRD = So_acess ? regsSO[RD] : regs[RD];
		
endmodule

