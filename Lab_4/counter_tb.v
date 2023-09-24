`timescale 1 ns / 100 ps
module counter_tb();
	reg w;
	reg clock;
	wire [2:0] STATE;
	wire count;
	reg [2:0] state;
	reg [2:0] next_state;
	
	counter test_counter(clock, w, count, STATE);
	
	initial begin
		$display($time, " simulation start ");
		clock = 1'b0;
		@(negedge clock);
		w = 1'b0;
		@(negedge clock);
		w = 1'b1;
		@(negedge clock);
		w = 1'b1;
		@(negedge clock);
		w = 1'b1;
		@(negedge clock);
		w = 1'b1;
		@(negedge clock);
		w = 1'b1;
		@(negedge clock);
		w = 1'b1;
		@(negedge clock);
		w = 1'b1;
		#100 w=1'b0;
		#40 w=1'b1;
		@(negedge clock);
		$stop;
	end
	always
			#10 clock = ~clock;
endmodule