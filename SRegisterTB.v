`timescale 1ns/1ps
module SRegisterTB();
	reg clk = 0;
	reg inc;
	reg reset;
	reg LDsignal;
	reg [15:0] Din;
	wire [15:0] Dout;
	
	SRegister register(clk, inc,Din, LDsignal,reset,Dout);
	
	always
		#(5) clk<=!clk;
		
		
	initial begin
	
		#(10);
		LDsignal = 1;
		Din = 16'b0100001000100100;
		#(10);
		reset = 1;
		#(10);
		reset = 0;
		LDsignal = 0;
		inc = 1;
		
	end 
endmodule
