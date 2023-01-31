module DivFreq(clk,OUT);
input clk;
output reg OUT;
reg[19:0] CONT;
always @(posedge clk)
if(CONT == 19'd1 ) 
	begin
		CONT<= 19'd0;
		OUT<= 1;
	end
else 
begin
		CONT<= CONT + 1;
		OUT<= 0;
	end
endmodule