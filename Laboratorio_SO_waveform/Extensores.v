module Extensor_Entrada(entrada, dadoExtendido);
	input [4:0] entrada; 

	output reg [31:0] dadoExtendido; // Dado extendido de 32 bits	
	
	always @ (entrada) begin			
			if	(entrada[4] == 1'b1)
				dadoExtendido = entrada + 32'b11111111111111111111111111100000;
			else
				dadoExtendido = entrada + 32'b0;
	end
	
endmodule

module ExtensorBit(entrada, dadoExtendido);
	input [26:0] entrada; 

	output reg [31:0] dadoExtendido; // Dado extendido de 32 bits	
	
	always @ (entrada) begin			
			if	(entrada[26] == 1'b1)
				dadoExtendido = entrada + 32'b11111000000000000000000000000000;
			else
				dadoExtendido = entrada + 32'b0;
	end
	
endmodule

module Extensor_bitsB(entrada, dadoExtendido);
	input [16:0] entrada; 

	output reg [31:0] dadoExtendido; // Dado extendido de 32 bits	
	
	always @ (entrada) begin			
			if	(entrada[16] == 1'b1)
				dadoExtendido = entrada +  32'b11111111111111100000000000000000;
			else
				dadoExtendido = entrada + 32'b0;
	end
	
endmodule