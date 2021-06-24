module regfile
	(input [31:0] data,
	input clock, writeEn,
	input [3:0] destAddr, rightAddr, leftAddr,
	output reg [31:0] leftOut, rightOut
	);

reg [31:0] file [0:15];

always @(*)
begin
leftOut = file[leftAddr];
rightOut = file[rightAddr];
end 
always @(posedge clock) 
if (writeEn) file[destAddr] <= data;
endmodule
