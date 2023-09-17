module rca(input [3:0] a, input [3:0] b, input cin, output [3:0] sum, output cout);
	wire [2:0] carry;
	fa f1(a[0], b[0], cin, sum[0], carry[0]);
	fa f2(a[1], b[1], carry[0], sum[1], carry[1]);
	fa f3(a[2], b[2], carry[1], sum[2], carry[2]);
	fa f4(a[3], b[3], carry[2], sum[3], cout);
endmodule