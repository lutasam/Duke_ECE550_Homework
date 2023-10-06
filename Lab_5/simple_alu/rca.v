module rca(input [15:0] a, input [15:0] b, input cin, output [15:0] sum, output cout);
	wire [14:0] carry;
	genvar i;
	
	fa f0(a[0], b[0], cin, sum[0], carry[0]);
	
	generate
		for(i = 1; i < 15; i = i + 1)
			begin: fa_loop
				fa f1(a[i], b[i], carry[i-1], sum[i], carry[i]);
			end
	endgenerate
	
	fa f15(a[15], b[15], carry[14], sum[15], cout);
	
endmodule