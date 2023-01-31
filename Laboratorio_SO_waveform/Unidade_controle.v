module Unidade_controle(
								
	input [4:0]Instr,
	input FalseUla,
	
	input Instru_In_Out,
	input x,

	output reg [4:0]ControleUla,
	output reg SinalMux,
	output reg regSinalEscritaMem,
	output reg SinalEscritaReg,
	output reg Sdadoext, 
	output reg Smuxula, 
	output reg Sdesv, 
	output reg SelPC,
	output reg SJal,
	output reg OutWrite,
	output reg SIn,
	output reg SHlt,
	
	output reg S_Out_IN,
	output reg S_crtl,
	
	output reg S_StorePC,
	
	output reg NotFound
);
	always@*
		
	case(Instr)
	
	// ADD
	5'b00000: 
	begin
		ControleUla = Instr;
		SinalMux = 1'b1;
		regSinalEscritaMem = 1'b0;
		SinalEscritaReg = 1'b1;
		Sdadoext= 1'b0;
		Smuxula = 1'b1;
		Sdesv = 1'b0;
		SelPC = 1'b1;
		SJal = 1'b0;
		OutWrite = 1'b0;
		SIn = 1'b0;
		SHlt = 1'b0;
		
		S_Out_IN = 1'b0;
		S_crtl = 1'b0;
		
		S_StorePC = 1'b0;
		
		NotFound = 1'b0;	
	end
	
	// ADDI
	5'b00001: 
	begin
		ControleUla = Instr;
		SinalMux = 1'b1;
		regSinalEscritaMem = 1'b0;
		SinalEscritaReg = 1'b1;
		Sdadoext= 1'b1;
		Smuxula = 1'b0;
		Sdesv = 1'b0;
		SelPC = 1'b1;
		SJal = 1'b0;
		OutWrite = 1'b0;
		SIn = 1'b0;
		SHlt = 1'b0;
		
		S_Out_IN = 1'b0;
		S_crtl = 1'b0;
		
		S_StorePC = 1'b0;
		
		NotFound = 1'b0;
	end	
	
	// SUB
	5'b00010:
	begin
		ControleUla = Instr;
		SinalMux = 1'b1;
		regSinalEscritaMem = 1'b0;
		SinalEscritaReg = 1'b1;
		Sdadoext= 1'b0;
		Smuxula = 1'b1;
		Sdesv = 1'b0;
		SelPC = 1'b1;
		SJal = 1'b0;
		OutWrite = 1'b0;
		SIn = 1'b0;
		SHlt = 1'b0;
		
		S_Out_IN = 1'b0;
		S_crtl = 1'b0;
		
		S_StorePC = 1'b0;
		
		NotFound = 1'b0;
	end
	
	// SUBI
	5'b00011: 
	begin
		ControleUla = Instr;
		SinalMux = 1'b1;
		regSinalEscritaMem = 1'b0;
		SinalEscritaReg = 1'b1;
		Sdadoext= 1'b1;
		Smuxula = 1'b0;
		Sdesv = 1'b0;
		SelPC = 1'b1;
		SJal = 1'b0;
		OutWrite = 1'b0;
		SIn = 1'b0;
		SHlt = 1'b0;
		
		S_Out_IN = 1'b0;
		S_crtl = 1'b0;
		
		S_StorePC = 1'b0;
		
		NotFound = 1'b0;
	end
	
	// MUL
	5'b00100: 
	begin
		ControleUla = Instr;
		SinalMux = 1'b1;
		regSinalEscritaMem = 1'b0;
		SinalEscritaReg = 1'b1;
		Sdadoext= 1'b0;
		Smuxula = 1'b1;
		Sdesv = 1'b0;
		SelPC = 1'b1;
		SJal = 1'b0;
		OutWrite = 1'b0;
		SIn = 1'b0;
		SHlt = 1'b0;
		
		S_Out_IN = 1'b0;
		S_crtl = 1'b0;
		
		S_StorePC = 1'b0;
		
		NotFound = 1'b0;
	end	
	
	// DIV
	5'b00101:
	begin
		ControleUla = Instr;
		SinalMux = 1'b1;
		regSinalEscritaMem = 1'b0;
		SinalEscritaReg = 1'b1;
		Sdadoext= 1'b0;
		Smuxula = 1'b1;
		Sdesv = 1'b0;
		SelPC = 1'b1;
		SJal = 1'b0;
		OutWrite = 1'b0;
		SIn = 1'b0;
		SHlt = 1'b0;
		
		S_Out_IN = 1'b0;
		S_crtl = 1'b0;
		
		S_StorePC = 1'b0;
		
		NotFound = 1'b0;
	end	

	// AND
	5'b00110: 
	begin
		ControleUla = Instr;
		SinalMux = 1'b1;
		regSinalEscritaMem = 1'b0;
		SinalEscritaReg = 1'b1;
		Sdadoext= 1'b0;
		Smuxula = 1'b1;
		Sdesv = 1'b0;
		SelPC = 1'b1;
		SJal = 1'b0;
		OutWrite = 1'b0;
		SIn = 1'b0;
		SHlt = 1'b0;
		
		S_Out_IN = 1'b0;
		S_crtl = 1'b0;
		
		S_StorePC = 1'b0;
		
		NotFound = 1'b0;
	end	
	
	// XOR
	5'b00111: 
	begin
		ControleUla = Instr;
		SinalMux = 1'b1;
		regSinalEscritaMem = 1'b0;
		SinalEscritaReg = 1'b1;
		Sdadoext= 1'b0;
		Smuxula = 1'b1;
		Sdesv = 1'b0;
		SelPC = 1'b1;
		SJal = 1'b0;
		OutWrite = 1'b0;
		SIn = 1'b0;
		SHlt = 1'b0;
		
		S_Out_IN = 1'b0;
		S_crtl = 1'b0;
		
		S_StorePC = 1'b0;
		
		NotFound = 1'b0;
	end
	
	// OR
	5'b01000: 
	begin
		ControleUla = Instr;
		SinalMux = 1'b1;
		regSinalEscritaMem = 1'b0;
		SinalEscritaReg = 1'b1;
		Sdadoext= 1'b0;
		Smuxula = 1'b1;
		Sdesv = 1'b0;
		SelPC = 1'b1;
		SJal = 1'b0;
		OutWrite = 1'b0;
		SIn = 1'b0;
		SHlt = 1'b0;
		
		S_Out_IN = 1'b0;
		S_crtl = 1'b0;
		
		S_StorePC = 1'b0;
		
		NotFound = 1'b0;
	end	 
	
	// NOT
	5'b01001: 
	begin
		ControleUla = Instr;
		SinalMux = 1'b1;
		regSinalEscritaMem = 1'b0;
		SinalEscritaReg = 1'b1;
		Sdadoext= 1'b0;
		Smuxula = 1'b1;
		Sdesv = 1'b0;
		SelPC = 1'b1;
		SJal = 1'b0;
		OutWrite = 1'b0;
		SIn = 1'b0;
		SHlt = 1'b0;
		
		S_Out_IN = 1'b0;
		S_crtl = 1'b0;
		
		S_StorePC = 1'b0;
		
		NotFound = 1'b0;
	end
	
	// SLT
	5'b01010:
	begin
		ControleUla = Instr;
		SinalMux = 1'b1;
		regSinalEscritaMem = 1'b0;
		SinalEscritaReg = 1'b1;
		Sdadoext= 1'b0;
		Smuxula = 1'b1;
		Sdesv = 1'b0;
		SelPC = 1'b1;
		SJal = 1'b0;
		OutWrite = 1'b0;
		SIn = 1'b0;
		SHlt = 1'b0;
		
		S_Out_IN = 1'b0;
		S_crtl = 1'b0;
		
		S_StorePC = 1'b0;
		
		NotFound = 1'b0;
	end	

	// SLET
	5'b01011: 
	begin
		ControleUla = Instr;
		SinalMux = 1'b1;
		regSinalEscritaMem = 1'b0;
		SinalEscritaReg = 1'b1;
		Sdadoext= 1'b0;
		Smuxula = 1'b1;
		Sdesv = 1'b0;
		SelPC = 1'b1;
		SJal = 1'b0;
		OutWrite = 1'b0;
		SIn = 1'b0;
		SHlt = 1'b0;
		
		S_Out_IN = 1'b0;
		S_crtl = 1'b0;
		
		S_StorePC = 1'b0;
		
		NotFound = 1'b0;
	end	
	
	// SGT
	5'b01100: 
	begin
		ControleUla = Instr;
		SinalMux = 1'b1;
		regSinalEscritaMem = 1'b0;
		SinalEscritaReg = 1'b1;
		Sdadoext= 1'b0;
		Smuxula = 1'b1;
		Sdesv = 1'b0;
		SelPC = 1'b1;
		SJal = 1'b0;
		OutWrite = 1'b0;
		SIn = 1'b0;
		SHlt = 1'b0;
		
		S_Out_IN = 1'b0;
		S_crtl = 1'b0;
		
		S_StorePC = 1'b0;
		
		NotFound = 1'b0;
	end	
	
	// SGET
	5'b01101: 
	begin
		ControleUla = Instr;
		SinalMux = 1'b1;
		regSinalEscritaMem = 1'b0;
		SinalEscritaReg = 1'b1;
		Sdadoext= 1'b0;
		Smuxula = 1'b1;
		Sdesv = 1'b0;
		SelPC = 1'b1;
		SJal = 1'b0;
		OutWrite = 1'b0;
		SIn = 1'b0;
		SHlt = 1'b0;
		
		S_Out_IN = 1'b0;
		S_crtl = 1'b0;
		
		S_StorePC = 1'b0;
		
		NotFound = 1'b0;
	end
	
	// SET
	5'b01110: 
	begin
		ControleUla = Instr;
		SinalMux = 1'b1;
		regSinalEscritaMem = 1'b0;
		SinalEscritaReg = 1'b1;
		Sdadoext= 1'b0;
		Smuxula = 1'b1;
		Sdesv = 1'b0;
		SelPC = 1'b1;
		SJal = 1'b0;
		OutWrite = 1'b0;
		SIn = 1'b0;
		SHlt = 1'b0;
		
		S_Out_IN = 1'b0;
		S_crtl = 1'b0;
		
		S_StorePC = 1'b0;
		
		NotFound = 1'b0;
	end
	
	// SR
	5'b01111:
	begin
		ControleUla = Instr;
		SinalMux = 1'b1;
		regSinalEscritaMem = 1'b0;
		SinalEscritaReg = 1'b1;
		Sdadoext= 1'b0;
		Smuxula = 1'b1;
		Sdesv = 1'b0;
		SelPC = 1'b1;
		SJal = 1'b0;
		OutWrite = 1'b0;
		SIn = 1'b0;
		SHlt = 1'b0;
		
		S_Out_IN = 1'b0;
		S_crtl = 1'b0;
		
		S_StorePC = 1'b0;
		
		NotFound = 1'b0;
	end
	
	// SL
	5'b10000: 
	begin
		ControleUla = Instr;
		SinalMux = 1'b1;
		regSinalEscritaMem = 1'b0;
		SinalEscritaReg = 1'b1;
		Sdadoext= 1'b0;
		Smuxula = 1'b1;
		Sdesv = 1'b0;
		SelPC = 1'b1;
		SJal = 1'b0;
		OutWrite = 1'b0;
		SIn = 1'b0;
		SHlt = 1'b0;
		
		S_Out_IN = 1'b0;
		S_crtl = 1'b0;
		
		S_StorePC = 1'b0;
		
		NotFound = 1'b0;
	end
	
	// JR
	5'b10001: 
	begin
		ControleUla = Instr;
		SinalMux = 1'b1;
		regSinalEscritaMem = 1'b0;
		SinalEscritaReg = 1'b0;
		Sdadoext= 1'b0;
		Smuxula = 1'b1;
		Sdesv = 1'b0;
		SelPC = 1'b0;
		SJal = 1'b0;
		OutWrite = 1'b0;
		SIn = 1'b0;
		SHlt = 1'b0;
		
		S_Out_IN = 1'b0;
		S_crtl = 1'b0;
		
		S_StorePC = 1'b0;
		
		NotFound = 1'b0;
	end
	
	// J
	5'b10010: 
	begin
		ControleUla = Instr;
		SinalMux = 1'b1;
		regSinalEscritaMem = 1'b0;
		SinalEscritaReg = 1'b0;
		Sdadoext= 1'b1;
		Smuxula = 1'b1;
		Sdesv = 1'b1;
		SelPC = 1'b0;
		SJal = 1'b0;
		OutWrite = 1'b0;
		SIn = 1'b0;
		SHlt = 1'b0;
		
		S_Out_IN = 1'b0;
		S_crtl = 1'b0;
		
		S_StorePC = 1'b0;
		
		NotFound = 1'b0;
	end		
	
	// JAL
	5'b10011: 
	begin	
		ControleUla = Instr;
		SinalMux = 1'b1;
		regSinalEscritaMem = 1'b0;
		SinalEscritaReg = 1'b0;
		Sdadoext= 1'b1;
		Smuxula = 1'b1;
		Sdesv = 1'b1;
		SelPC = 1'b0;
		SJal = 1'b1;
		OutWrite = 1'b0;
		SIn = 1'b0;
		SHlt = 1'b0;
		
		S_Out_IN = 1'b0;
		S_crtl = 1'b0;
		
		S_StorePC = 1'b0;
		
		NotFound = 1'b0;
	end	
	
	// BEQ
	5'b10100: 
	begin
		ControleUla = Instr;
		SinalMux = 1'b1;
		regSinalEscritaMem = 1'b0;
		SinalEscritaReg = 1'b0;
		Sdadoext= 1'b1;
		Smuxula = 1'b1;
		Sdesv = 1'b1;
		begin
		
		if(FalseUla)
			SelPC = 1'b0;
		else
			SelPC = 1'b1;
		end
		
		SJal = 1'b0;
		OutWrite = 1'b0;
		SIn = 1'b0;
		SHlt = 1'b0;
		
		S_Out_IN = 1'b0;
		S_crtl = 1'b0;
		
		S_StorePC = 1'b0;
		
		NotFound = 1'b0;

	end
	
	// BNEQ
	5'b10101: 
	begin
		ControleUla = Instr;
		SinalMux = 1'b1;
		regSinalEscritaMem = 1'b0;
		SinalEscritaReg = 1'b0;
		Sdadoext= 1'b1;
		Smuxula = 1'b1;
		Sdesv = 1'b1;
		begin
		
		if(FalseUla)
			SelPC = 1'b0;
		else
			SelPC = 1'b1;
		end
		
		SJal = 1'b0;
		OutWrite = 1'b0;
		SIn = 1'b0;
		SHlt = 1'b0;
		
		S_Out_IN = 1'b0;
		S_crtl = 1'b0;
		
		S_StorePC = 1'b0;
		
		NotFound = 1'b0;

	end
	
	// LOAD
	5'b10110:
	begin
		ControleUla = Instr;
		SinalMux = 1'b0;
		regSinalEscritaMem = 1'b0;
		SinalEscritaReg = 1'b1;
		Sdadoext= 1'b1;
		Smuxula = 1'b0;
		Sdesv = 1'b0;
		SelPC = 1'b1;
		SJal = 1'b0;
		OutWrite = 1'b0;
		SIn = 1'b0;
		SHlt = 1'b0;
		
		S_Out_IN = 1'b0;
		S_crtl = 1'b0;
		
		S_StorePC = 1'b0;
		
		NotFound = 1'b0;
	end 
	
	// STORE
	5'b10111: 
	begin
		ControleUla = Instr;
		SinalMux = 1'b0;
		regSinalEscritaMem = 1'b1;
		SinalEscritaReg = 1'b0;
		Sdadoext= 1'b1;
		Smuxula = 1'b0;
		Sdesv = 1'b0;
		SelPC = 1'b1;
		SJal = 1'b0;
		OutWrite = 1'b0;
		SIn = 1'b0;
		SHlt = 1'b0;
		
		S_Out_IN = 1'b0;
		S_crtl = 1'b0;
		
		S_StorePC = 1'b0;
		
		NotFound = 1'b0;
	end
	
	// IN
	5'b11000:
	begin
		ControleUla = Instr;
		SinalMux = 1'b1;
		regSinalEscritaMem = 1'b0;
		SinalEscritaReg = 1'b1;
		Sdadoext= 1'b0;
		Smuxula = 1'b1;
		Sdesv = 1'b0;
		SelPC = 1'b1;
		SJal = 1'b0;
		OutWrite = 1'b0;
		SIn = 1'b1;
		SHlt = 1'b0;
		
		begin
		if(Instru_In_Out == x)begin
			S_Out_IN = 1'b0;
			S_crtl = 1'b1;
			end
		else begin
			S_Out_IN = 1'b1;
			S_crtl = 1'b0;
			end
		end
		
		S_StorePC = 1'b0;
		
		NotFound = 1'b0;
	end
	
	// OUT
	5'b11001:
	begin
		ControleUla = Instr;
		SinalMux = 1'b1;
		regSinalEscritaMem = 1'b0;
		SinalEscritaReg = 1'b0;
		Sdadoext= 1'b1;
		Smuxula = 1'b0;
		Sdesv = 1'b0;
		SelPC = 1'b1;
		SJal = 1'b0;
		OutWrite = 1'b1;
		SIn = 1'b0;
		SHlt = 1'b0;
		
		begin
		if(Instru_In_Out == x)begin
			S_Out_IN = 1'b0;
			S_crtl = 1'b1;
			end
		else begin
			S_Out_IN = 1'b1;
			S_crtl = 1'b0;
			end
		end
		
		S_StorePC = 1'b0;
		
		NotFound = 1'b0;
	end
	
	// NOP
	5'b11010:
	begin
		ControleUla = Instr;
		SinalMux = 1'b1;
		regSinalEscritaMem = 1'b0;
		SinalEscritaReg = 1'b0;
		Sdadoext= 1'b0;
		Smuxula = 1'b1;
		Sdesv = 1'b0;
		SelPC = 1'b1;
		SJal = 1'b0;
		OutWrite = 1'b0;
		SIn = 1'b0;
		SHlt = 1'b0;
		
		S_Out_IN = 1'b0;
		S_crtl = 1'b0;
		
		S_StorePC = 1'b0;
		
		NotFound = 1'b0;
	end
	
	// HLT
	5'b11011:
	begin
		ControleUla = Instr;
		SinalMux = 1'b1;
		regSinalEscritaMem = 1'b0;
		SinalEscritaReg = 1'b0;
		Sdadoext= 1'b0;
		Smuxula = 1'b1;
		Sdesv = 1'b0;
		SelPC = 1'b1;
		SJal = 1'b0;
		OutWrite = 1'b0;
		SIn = 1'b0;
		SHlt = 1'b1;
		
		S_Out_IN = 1'b0;
		S_crtl = 1'b0;
		
		S_StorePC = 1'b0;
		
		NotFound = 1'b0;
	end
	
	
	// Intruçao para mudar o banco no SO para salvar "PROGREG"
	5'b11100:
	begin
		ControleUla = Instr;
		SinalMux = 1'b1;
		regSinalEscritaMem = 1'b0;
		SinalEscritaReg = 1'b0;
		Sdadoext= 1'b0;
		Smuxula = 1'b1;
		Sdesv = 1'b0;
		SelPC = 1'b1;
		SJal = 1'b0;
		OutWrite = 1'b0;
		SIn = 1'b0;
		SHlt = 1'b0;
		
		S_Out_IN = 1'b0;
		S_crtl = 1'b0;
		
		S_StorePC = 1'b0;
		
		NotFound = 1'b0;
	end
	
	// Intruçao para voltar o banco do SO "SOREG"
	5'b11101:
	begin
		ControleUla = Instr;
		SinalMux = 1'b1;
		regSinalEscritaMem = 1'b0;
		SinalEscritaReg = 1'b0;
		Sdadoext= 1'b0;
		Smuxula = 1'b1;
		Sdesv = 1'b0;
		SelPC = 1'b1;
		SJal = 1'b0;
		OutWrite = 1'b0;
		SIn = 1'b0;
		SHlt = 1'b0;
		
		S_Out_IN = 1'b0;
		S_crtl = 1'b0;
		
		S_StorePC = 1'b0;
		
		NotFound = 1'b0;
	end
	
	
	// STORE_PC
	5'b11110: 
	begin
		ControleUla = Instr;
		SinalMux = 1'b0;
		regSinalEscritaMem = 1'b1;
		SinalEscritaReg = 1'b0;
		Sdadoext= 1'b1;
		Smuxula = 1'b0;
		Sdesv = 1'b0;
		SelPC = 1'b1;
		SJal = 1'b0;
		OutWrite = 1'b0;
		SIn = 1'b0;
		SHlt = 1'b0;
		
		S_Out_IN = 1'b0;
		S_crtl = 1'b0;
		
		S_StorePC = 1'b1;
		
		NotFound = 1'b0;
		
	end	
	
	// JR do SO "JRSO"
	5'b11111: 
	begin
		ControleUla = Instr;
		SinalMux = 1'b1;
		regSinalEscritaMem = 1'b0;
		SinalEscritaReg = 1'b0;
		Sdadoext= 1'b0;
		Smuxula = 1'b1;
		Sdesv = 1'b0;
		SelPC = 1'b0;
		SJal = 1'b0;
		OutWrite = 1'b0;
		SIn = 1'b0;
		SHlt = 1'b0;
		
		S_Out_IN = 1'b0;
		S_crtl = 1'b0;
		
		S_StorePC = 1'b0;
		
		NotFound = 1'b0;
	end

	default: NotFound = 1'b1;
	endcase
	
endmodule