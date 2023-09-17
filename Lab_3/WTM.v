module WTM(input [4:0] a, input [4:0] b, output [9:0] out, output cout);
	wire a1b0, a2b0, a3b0, a4b0, a0b1, a1b1, a2b1, a3b1, a4b1, a0b2, a1b2, a2b2, a3b2, a4b2, a0b3, a1b3, a2b3, a3b3, a4b3, a0b4, a1b4, a2b4, a3b4, a4b4;
	// temp sums
	wire [19:0] s;
	// temp carrys
	wire [19:0] c;
	wire [4:0] carry;
	
	and(out[0], a[0], b[0]); // a0b0 -> out[0]
	and(a0b1, a[0], b[1]);
	and(a0b2, a[0], b[2]);
	and(a0b3, a[0], b[3]);
	and(a0b4, a[0], b[4]);
	
	and(a1b0, a[1], b[0]);
	and(a1b1, a[1], b[1]);
	and(a1b2, a[1], b[2]);
	and(a1b3, a[1], b[3]);
	and(a1b4, a[1], b[4]);
	
	and(a2b0, a[2], b[0]);
	and(a2b1, a[2], b[1]);
	and(a2b2, a[2], b[2]);
	and(a2b3, a[2], b[3]);
	and(a2b4, a[2], b[4]);
	
	and(a3b0, a[3], b[0]);
	and(a3b1, a[3], b[1]);
	and(a3b2, a[3], b[2]);
	and(a3b3, a[3], b[3]);
	and(a3b4, a[3], b[4]);
	
	and(a4b0, a[4], b[0]);
	and(a4b1, a[4], b[1]);
	and(a4b2, a[4], b[2]);
	and(a4b3, a[4], b[3]);
	and(a4b4, a[4], b[4]);
	
	// Stage 1
	HA s0c0(a1b0, a1b1, out[1], c[0]);
	FA s1c1(a2b0, a1b1, a0b2, s[1], c[1]);
	FA s2c2(a2b1, a1b2, a0b3, s[2], c[2]);
	FA s3c3(a2b2, a1b3, a0b4, s[3], c[3]);
	FA s4c4(a3b2, a2b3, a1b4, s[4], c[4]);
	FA s5c5(a4b2, a3b3, a2b4, s[5], c[5]);
	HA s6c6(a4b3, a3b4, s[6], c[6]);
	
	// Stage 2
	HA s7c7(s[1], c[0], out[2], c[7]);
	FA s8c8(s[2], c[1], a3b0, s[8], c[8]);
	FA s9c9(s[3], c[2], a4b0, s[9], c[9]);
	FA s10c10(s[4], c[3], a4b1, s[10], c[10]);
	HA s11c11(s[5], c[4], s[11], c[11]);
	HA s12c12(s[6], c[5], s[12], c[12]);
	HA s13c13(a4b4, c[6], s[13], c[13]);
	
	// Stage 3
	HA s14c14(s[8], c[7], out[3], c[14]);
	FA s15c15(s[9], c[8], a4b1, s[15], c[15]);
	HA s16c16(s[10], c[9], s[16], c[16]);
	HA s17c17(s[11], c[10], s[17], c[17]);
	HA s18c18(s[12], c[11], s[18], c[18]);
	HA s19c19(s[13], c[12], s[19], c[19]);
	
	// Stage 4
	HA ha1(s[15], c[14], out[4], carry[0]);
	FA fa1(s[16], c[15], carry[0], out[5], carry[1]);
	FA fa2(s[17], c[16], carry[1], out[6], carry[2]);
	FA fa3(s[18], c[17], carry[2], out[7], carry[3]);
	FA fa4(s[19], c[18], carry[3], out[8], carry[4]);
	FA fa5(c[13], c[19], carry[4], out[9], cout);
endmodule