
module Mux(A, B, S, Y);
	// Entradas
	input [31:0] A; 
	input [31:0] B; 
	
	input S; // Sinal de controle 
	
	output [31:0] Y; 
	
	assign Y = S ? A : B;
endmodule

module Somador_Padrao(pc, HLT ,pcAtual);
	
	output [31:0] pcAtual;						// Endereco do contador de programa do proximo ciclo
	input [31:0] pc;								// Endereco do contador de programa atual
	input HLT;										// Instrucao final
	
	
	function [31:0] select;
	input [31:0] pc;						
	input HLT;										
	case(HLT)
		1'b0: select = pc + 32'd1; 
		1'b1: select = pc; 
	default: select = 32'd0;
	endcase
	endfunction

	assign pcAtual = select(pc,HLT);
	
endmodule


module ULA(inst, A, B, RD, Resul, isFalse);
	// Entradas
	input [4:0] inst; // Operacao que sera realizada
	input [31:0] A; // Primeiro registrador
	input [31:0] B; // Segundo registrador
	input [31:0] RD; // Registrador RD
	parameter C=1;                         // Deslocamento    


	// Saidas
	output [31:0] Resul; // Resultado da operacao
	output isFalse;

	// Logica sequencial
	function [31:0] select;
	input signed[31:0] A, B, RD;
	input[4:0] inst;
	case(inst)
	// Aritmeticas
	5'b00000: select = A + B; // ADD
	5'b00001: select = A + B; // ADDI
	5'b00010: select = A - B; // SUB
	5'b00011: select = A - B; // SUBI
	5'b00100: select = A * B; // MUL
	5'b00101: select = A / B; // DIV

	// Logicas
	5'b00110: select = A & B; // AND
	5'b00111: select = A ^ B; // XOR
	5'b01000: select = A | B; // OR 
	5'b01001: select = ~A; // NOT

	// Deslocamentos
	5'b01111: select = A >> C; // SR
	5'b10000: select = A << C; // SL

	// Atribuicao 
	5'b10110: select = A + B; // LOAD
	5'b10111: select = A + B; // STORE
	5'b11110: select = A + B; // STOREPC
	
	
	// Comparacao
	5'b10100: select = A == RD ? 32'd1 : 32'd0;  //BEQ
	5'b10101: select = A != RD ? 32'd1 : 32'd0;  //BNEQ
	
	5'b01010: select = A < B  ? 32'd1 : 32'd0;  // SLT
	5'b01011: select = A <= B  ? 32'd1 : 32'd0;  // SLET
	5'b01100: select = A > B  ? 32'd1 : 32'd0;  // SGT
	5'b01101: select = A >= B  ? 32'd1 : 32'd0;  // SGET
	5'b01110: select = A == B  ? 32'd1 : 32'd0;  // SET
	
	// Entrada e saida de dados
	5'b11000: select = RD;  // IN
	5'b11001: select = RD;  // OUT

	default: select = 32'd0;
	endcase
	endfunction

	assign isFalse = select(A, B, RD, inst) == 32'd1 ? 1'b1 : 1'b0;
	assign Resul = select(A, B, RD, inst);
endmodule


module Mem_instr
#(parameter DATA_WIDTH=32, parameter ADDR_WIDTH=10)
(
	input [(DATA_WIDTH-1):0] addr,
	input clk, 
	output reg [(DATA_WIDTH-1):0] q
);

	// Declare the ROM variable
	reg [DATA_WIDTH-1:0] rom[2**ADDR_WIDTH-1:0];

	initial
	begin
		$readmemb("instrucao.txt", rom);
	end

	always @ (posedge clk)
	begin
		q <= rom[addr];
	end
//	always @ (posedge clk)
//	begin
//		q <= 1;
//	end


endmodule

module Mem_dados
#(parameter DATA_WIDTH=32, parameter ADDR_WIDTH=10)
(
	input [(DATA_WIDTH-1):0] data,
	input [(DATA_WIDTH-1):0] read_addr, write_addr,
	input we, read_clock, write_clock,
	output reg [(DATA_WIDTH-1):0] q
);
	
	// Declare the RAM variable
	reg [DATA_WIDTH-1:0] ram[2**ADDR_WIDTH-1:0];
	
//	initial 
//	begin : INIT
//		integer i;
//		for(i = 0; i < 2**ADDR_WIDTH; i = i + 1)
//			ram[i] = {DATA_WIDTH{1'b0}};
//	end 
	
	always @ (negedge write_clock)
	begin
		// Write
		if (we)
			ram[write_addr] <= data;
	end
	
	always @ (posedge read_clock)
	begin
		// Read 
		q <= ram[read_addr];
	end
	
endmodule


// Parte de saida de dados

module instru_out(RD, Out);

input [31:0] RD;
output [31:0] Out;

assign Out = RD;

endmodule


// Terminou parte de saida de dados

//Entrada de dados

module Mux_IN(
	input [31:0] INinstru,
	input [31:0] Regis,									
	input ctrl,								
	output [31:0] addrout);
	

	
	assign addrout = ctrl ? INinstru : Regis;
endmodule

module aux(									
	input ctrl,
	input clk,
	output x);
	
	reg count;
	
	initial begin
			count = 1;
	end

	always @ (posedge clk) begin
			
			if (ctrl)
				count = ~count;
		
	end
	
	
	assign x = count;
endmodule

module Debounce(									
	input in,
	input clk,
	output x);
	
	reg Q1,Q2,Q3,Q4;

	always @ (posedge clk) begin
			
			Q1<=in;
			Q2<=Q1;
			Q3<=Q2;
			Q4<=Q3;
		
	end
	
	
	assign x = Q1 & Q2 & Q3 & Q4;
endmodule


// Para rodar na placa FPGA
module CPU( clk1, resetPC, resetDis, Display1, Display2, Display3, Display4,LEDs, instruIN, enter, out_in_sign,Display1PC, Display2PC, Display3PC, Display4PC, inst, out, so_acess, pc);

	input clk1, resetPC, resetDis;
	input [4:0] instruIN;

	//teste in out
	input enter;
	Debounce debounce(enter,clk_s,enter_Deboun); // Talvez nao precise do enter_Deboun
	
	wire clk;
	DivFreq freq(clk1,clk);
	
	
	output reg out_in_sign; 
	
	always @(*)begin
		if(inst[31:27] == 5'b11000 || inst[31:27] == 5'b11001)
			out_in_sign = 1'b1;
		else
			out_in_sign = 1'b0;
	end

	
	wire [4:0]CULA;
	wire SEscritaMem, SEscritaReg,Sddext,Smula,SPC,SHlt, FalseUla,SJal,SIn, S_Out_IN, x, S_crtl, enter_Deboun;
	wire S_StorePC;
	wire[1:0]SinalM;
	
	wire clk_s;
	
	wire OutWrite; // Sinal de escrita no display
	wire[31:0] inExt;
	
	
	output [31:0] inst;
	output [31:0]out;
	output [31:0] so_acess;
	output [31:0] pc;
//	wire [31:0] inst;
//	wire [31:0]out;
//	wire [31:0]so_acess;
	
	wire NotF;

	output [6:0] Display1, Display2, Display3, Display4, LEDs;
	
	
	// Numero da Instruçao no Display
	//wire [31:0]pc;
	output [6:0] Display1PC, Display2PC, Display3PC, Display4PC;
	SaidaDadosPC PCNum(pc, out_in_sign, clk, resetDis, Display1PC, Display2PC, Display3PC, Display4PC);
	
	
	
	aux auxiliar(S_crtl,clk_s,x);
	
	Extensor_Entrada ExteIn(instruIN, inExt);
	
	SaidaDados SaidaData(out, OutWrite, clk, resetDis, Display1, Display2, Display3, Display4,LEDs);
	
	//Unidade_controle UC(inst[31:27], FalseUla, enter_Deboun, x, CULA, SinalM,SEscritaMem,SEscritaReg,Sddext, Smula, Sdes, SPC, SJal, OutWrite, SIn, SHlt, S_Out_IN, S_crtl,NotF);
	
	Unidade_controle UC(inst[31:27], FalseUla, enter, x, CULA, SinalM,SEscritaMem,SEscritaReg,Sddext, Smula, Sdes, SPC, SJal, OutWrite, SIn, SHlt, S_Out_IN, S_crtl, S_StorePC, NotF);
	
	datapath data(CULA,SinalM,SEscritaMem,clk,SEscritaReg,Sddext, Smula, Sdes, SPC,resetPC,SHlt,FalseUla,SJal, inExt,SIn, out,inst, S_Out_IN, S_StorePC, clk_s, pc, so_acess);
  
  
endmodule


module datapath (ControleUla,SinalMux,SinalEscritaMem,clk,SinalEscritaReg,Sdadoext, Smuxula, Sdesv, SelPC,resetPC,SHlt, FalseUla, SJal, inExt, SIn, saida,Instru, S_Out_IN,  S_StorePC,clk_s, saidaPC, so_acess);
	
	input[31:0] inExt;
	
	input [4:0]ControleUla;
	input SinalMux;
	input SinalEscritaMem,clk,SinalEscritaReg;
	input Sdadoext, Smuxula, Sdesv, SelPC, SHlt , SJal, SIn , resetPC, S_Out_IN;
	input S_StorePC;
	
	wire [31:0] Dado1, Dado2, DadoRD,Dado2MUX,ResultULA, outMD,outmuxMD;
	wire [31:0] outmuxExte, Exte16, Exte26, DadosIM;

	wire [31:0] Desv, Nextinst, Nextinter;
	wire [31:0] Sumpc, pcSumdesv;
	
	wire [31:0] regWritedata;
	
	output [31:0] saida;
	output[31:0] Instru;
	output FalseUla;
	
	//Alteracoes
	
	wire [31:0]data_store;
	wire So_acess;
	output [31:0] saidaPC;
	output [31:0] so_acess;
	
	wire [31:0] AdressPC,PcStore;
	wire [31:0] counter;
	
	
	
	reg[1:0] reduz;
	output clk_s;
  	always @ (posedge clk) begin
		reduz = reduz + 1;
	end
	assign clk_s = reduz[1];
	
	
	
	Mem_instr minst(AdressPC , clk_s, Instru);
	
	Registradores Regis(clk_s, SinalEscritaReg , SJal, Sumpc, Instru[21:17], Instru[16:12] , Instru[26:22], regWritedata, So_acess, Dado1, Dado2, DadoRD,resetPC);
	
	ULA ula(ControleUla, Dado1, Dado2MUX, DadoRD, ResultULA, FalseUla);     
	
	Mem_dados md( data_store , ResultULA, ResultULA, SinalEscritaMem, clk, clk_s, outMD);
	  
	Extensor_bitsB dezesseis(Instru[16:0], Exte16);
	ExtensorBit vinteseis(Instru[26:0], Exte26);
	
	Mux muxexteout(Exte16, Exte26, Sdadoext, DadosIM); // Com o sinal 1 sai dado estendido de 16 bits(multiplex que recebe dos extensores de bits)
	Mux muxULA(Dado2, DadosIM, Smuxula, Dado2MUX); // Com o sinal 0 sai dado que veio do extensor de bits(multiplex entre Banco de regs e Ula)
	Mux muxdesv(DadosIM, DadoRD, Sdesv, Desv);// Com o sinal 1 sai dado estendido
	Mux muxout(ResultULA, outMD, SinalMux, outmuxMD); // Com o sinal 1 sai o resultado da ula, 0 memoria de dados(multiplex depois da memoria de dado)
	
	Mux muxpc(Sumpc , Desv , SelPC, Nextinter);// Com o sinal 0 sai Desv (Resultado que vai para PC)
	
	//Mux muxinputbreak(AdressPC, Nextinter, S_Out_IN, Nextinst);
	Mux muxinputbreak(AdressPC, Nextinter, s, Nextinst);
	parameter s = 0;
	
	Mux store_pc(PcStore, DadoRD, S_StorePC, data_store); // Com o sinal 0 sai o DadoRD e 1 sai PcStore
	
	
	// Teste Quantum
	Quantum quantum(Nextinst, Instru[31:27], resetPC, clk_s,So_acess, AdressPC,counter, PcStore);
	instru_out So_Flag(So_acess, so_acess);
	instru_out PCout(AdressPC, saidaPC); //Serve para receber o numero PC
	
	
	
	Mux_IN muxinput(inExt, outmuxMD, SIn, regWritedata); // Com o sinal 0 sai outmuxMD
	
	Somador_Padrao SumP(AdressPC, SHlt, Sumpc);  
	
	instru_out t(regWritedata , saida); //saida sempre fica no teste , final regWritedata

endmodule


