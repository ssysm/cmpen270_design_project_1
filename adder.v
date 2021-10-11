module full_adder(a,b,cin,sum,carry);
	input a;
	input b;
	input cin;
	output sum;
	output carry;
	
	wire a_xor_b = a ^ b;
	wire a_xor_b_xor_carry = a_xor_b ^ cin;
	wire a_xor_b_and_carry = a_xor_b & cin;
	wire a_and_b = a & b;
	wire a_xor_b_and_carry_or_a_and_b = a_xor_b_and_carry | a_and_b;
	
	assign sum = a_xor_b_xor_carry;
	assign carry = a_xor_b_and_carry_or_a_and_b;
	
endmodule


module adder_3b(a,b,out,carry);
	input [2:0] a;
	input [2:0] b;
	output [2:0] out;
	output carry;
	
	wire [1:0]carry_wire;
	
	full_adder adder0(
		.a(a[0]),
		.b(b[0]),
		.cin(0),
		.sum(out[0]),
		.carry(carry_wire[0])
	);
	
	full_adder adder1(
		.a(a[1]),
		.b(b[1]),
		.cin(carry_wire[0]),
		.sum(out[1]),
		.carry(carry_wire[1])
	);
	
	full_adder adder2(
		.a(a[2]),
		.b(b[2]),
		.cin(carry_wire[1]),
		.sum(out[2]),
		.carry(carry)
	);
	
endmodule
