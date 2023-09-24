// moore
//module counter(input clock, input w, output count, output [2:0] STATE);
//
//	reg [2:0] state;
//	reg c;
//	localparam
//		A = 3'b000,
//		B = 3'b001,
//		C = 3'b010,
//		D = 3'b011,
//		E = 3'b100,
//		F = 3'b101,
//		G = 3'b110,
//		H = 3'b111;
//	
//	initial begin
//		state = A;
//	end
//
//	always @(posedge clock) begin
//		if (w) begin
//			case (state)
//				A: begin
//					state <= B;
//					c <= 0;
//				end
//				B: begin
//					state <= C;
//					c <= 0;
//				end
//				C: begin
//					state <= D;
//					c <= 0;
//				end
//				D: begin
//					state <= E;
//					c <= 1;
//				end
//				E: begin
//					state <= A;
//					c <= 0;
//				end
//				F: begin
//					state <= A;
//					c <= 0;
//				end
//				G: begin
//					state <= A;
//					c <= 0;
//				end
//				H: begin
//					state <= A;
//					c <= 0;
//				end
//			endcase
//		end else begin
//			case (state)
//				A: begin
//					state <= A;
//					c <= 0;
//				end
//				B: begin
//					state <= B;
//					c <= 0;
//				end
//				C: begin
//					state <= C;
//					c <= 0;
//				end
//				D: begin
//					state <= D;
//					c <= 0;
//				end
//				E: begin
//					state <= E;
//					c <= 1;
//				end
//				F: begin
//					state <= F;
//					c <= 0;
//				end
//				G: begin
//					state <= G;
//					c <= 0;
//				end
//				H: begin
//					state <= H;
//					c <= 0;
//				end
//			endcase
//		end
//	end
//	
//	assign STATE = state;
//	assign count = c;
//	
//endmodule


// mealy
module counter(input clock, input w, output count, output [2:0] STATE);

	reg [2:0] state;
	reg c;
	localparam
		A = 3'b000,
		B = 3'b001,
		C = 3'b010,
		D = 3'b011,
		E = 3'b100,
		F = 3'b101,
		G = 3'b110,
		H = 3'b111;
	
	initial begin
		state = A;
	end

	always @(posedge clock) begin
			case (state)
				A: begin
					if (w)
						begin
							state <= B;
							c <= 0;
						end
				end
				B: begin
					if (w) begin
					state <= C;
					c <= 0;
					end
				end
				C: begin
					if (w) begin
					state <= D;
					c <= 0;
					end
				end
				D: begin
					if (w) begin
					state <= E;
					c <= 1;
					end
				end
				E: begin
					if (w) begin
					state <= A;
					c <= 0;
					end
				end
				F: begin
					if (w) begin
					state <= A;
					c <= 0;
					end
				end
				G: begin
					if (w) begin
					state <= A;
					c <= 0;
					end
				end
				H: begin
					if (w) begin
					state <= A;
					c <= 0;
					end
				end
			endcase
		end
	
	assign STATE = state;
	assign count = c;
	
endmodule