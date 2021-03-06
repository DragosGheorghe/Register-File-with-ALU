module alu
			(input [31:0] leftOp, rightOp,
			 input [2:0] func,
			 input crIn, 
			 output reg crOut,
			 output reg [31:0] result
			 );
always @(*)			
case(func)
0: {crOut, result} = leftOp + rightOp + crIn;
1: {crOut, result} = leftOp - rightOp - crIn;
2: result = leftOp & rightOp;
3: result = leftOp | rightOp;
4: result = leftOp ^ rightOp;
5: result = ~leftOp;
6: {crOut, result} = {leftOp[0], {leftOp[31], leftOp[31:1]}};
7: result = leftOp;
endcase

endmodule

			 
			 