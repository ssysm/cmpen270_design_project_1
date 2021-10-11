module DE0_Nano(
	LED,
	SW,
);

output		     [7:0]		LED;
input 		     [3:0]		SW;

wire [2:0] sw_input;
assign sw_input = SW[2:0];

wire invert_enable = SW[2]; // Sign bit
assign LED[7] = invert_enable;

wire [4:0] decoder_output;
assign LED[4:0] = decoder_output;

wire [2:0] c_inverter_wire;
wire [2:0] adder_wire;

conditional_inverter_3b c_inverter_inst(
	.in(sw_input),
	.out(c_inverter_wire),
	.enable(invert_enable)
);
	
adder_3b adder_inst(
	.a(c_inverter_wire),
	.b(invert_enable),
	.out(adder_wire),.carry()
);

decoder_3to8_1hot decoder_inst(
	.in(adder_wire),
	.out(decoder_output)
);


endmodule
