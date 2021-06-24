module mux2_32
				(
			input [31:0] in1, in2,
			input sel,
			output reg [31:0] out
			);

always @(*)
case(sel)
	0: out = in1;
	1: out = in2;
endcase
endmodule 