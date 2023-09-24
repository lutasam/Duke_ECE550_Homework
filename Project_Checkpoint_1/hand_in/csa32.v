module csa32(input [31:0] a, input [31:0] b, input cin, output [31:0] sum, output cout, output overflow);

	wire select, cout0, cout1;
	wire [15:0] sum31_16_0, sum31_16_1;
	
	rca r(a[15:0], b[15:0], cin, sum[15:0], select);
	rca r0(a[31:16], b[31:16], 0, sum31_16_0, cout0);
	rca r1(a[31:16], b[31:16], 1, sum31_16_1, cout1);
	
	// 2 to 1 MUX
	assign sum[31:16] = select ? sum31_16_1 : sum31_16_0;
	assign cout = select ? cout1 : cout0;
	
	// judge overflow
	wire not_a, not_b, not_sum;
	not n1(not_a, a[31]);
	not n2(not_b, b[31]);
	not n3(not_sum, sum[31]);
	
	and and1(a1, not_a, not_b, sum[31]);
	and and2(a2, a[31], b[31], not_sum);
	xor or1(overflow, a1, a2);
	
endmodule