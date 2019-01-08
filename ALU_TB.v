`timescale 1ns/1ns

module ALU_TB();
	reg clk=0;
	reg [15:0] A;
	reg [15:0] B;
	reg [2:0] operation;
	wire z;
	wire [15:0] C;
	
ALU alu(clk,A,B,operation,z,C);

	always
		#(5) clk<=!clk;
	initial begin
	#10;//Pass
		//A=16'b0000000000000010;
		//B=16'b0000000000000010;
		//operation=3'd1;
		
		//ADD
		//A=16'b0000000000000010;
		//B=16'b0000000000000100;
		//operation=3'd2;
				
		//SUB
		//A=16'b0000000000000010;
		//B=16'b0000000000000100;
		//operation=3'd3;
		
		//LEFTSHIFT
		//B=16'b0000000000000100;
		//operation=3'd4;
		
		//RIGHTSHIFT
		A = 16'b0000000000010100;
		B=16'b0000000000000100;
		operation=3'd6;

		
		end
endmodule
