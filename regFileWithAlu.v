module regFileWithAlu
      ( input  [31:0] dataIn   , // data input 
        input  [2:0]  func     , // function code for ALU
        input         crIn     , // carry input for arithmetic operations
        input  [3:0]  leftAddr , // selects left operand (leftOp) from register file
        input  [3:0]  rightAddr, // selects right operand (rightOp) from register file
        input  [3:0]  destAddr , // selects destination of result in register file
		  input	       writeEn	 , // write enable in register file
        input         selInput , // selects dataIn as leftOp
        output [31:0] dataOut  , // data output: leftOp from register file
        output        crOut    , // carry output from ALU
        input         clock    );
					
	wire [31:0] ALUoutput,rightOut,muxOut;
	
	regfile register (
							.data(ALUoutput),
							.writeEn(writeEn),
							.destAddr(destAddr),
							.leftAddr(leftAddr),
							.rightAddr(rightAddr),
							.clock(clock),
							.leftOut(dataOut),
							.rightOut(rightOut)
							);
	mux2_32 mux2 (
							.in1(dataIn),
							.in2(dataOut),
							.sel(selInput),
							.out(muxOut)
							);
	alu aritmunit (
						.leftOp(muxOut),
						.rightOp(rightOut),
						.crIn(crIn),
						.crOut(crOut),
						.func(func),
						.result(ALUoutput)
						);
						
endmodule

