`timescale 1ns/1ps
module RegisterTB();
	reg clk = 0;
	reg LDsignal;
	reg [15:0] Din;
	wire [15:0] Dout;
	
	Register register(clk, LDsignal,Din,Dout);
	
	always
		#(5) clk<=!clk;
		
		
	initial begin
	
		#(10);
		LDsignal = 1;
		Din = 16'b0100001000100100;
		
	end 
endmodule
