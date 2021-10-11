module conditional_inverter_3b(in,out,enable);
	input [2:0] in;
	output [2:0] out;
	input enable;
	
	assign out[0] = in[0] ^ enable;
	assign out[1] = in[1] ^ enable;
	assign out[2] = in[2] ^ enable;
	
endmodule
