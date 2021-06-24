module tb ();

wire [31:0] s_dataOut;
wire s_crOut;
reg [31:0] s_dataIn;
reg [2:0] s_func;
reg s_crIn, s_writeEn, s_selInput, s_clock;
reg [3:0] s_leftAddr, s_rightAddr, s_destAddr;

regFileWithAlu dut (
						.dataIn(s_dataIn),
						.func(s_func),
						.crIn(s_crIn),
						.leftAddr(s_leftAddr),
						.rightAddr(s_rightAddr),
						.destAddr(s_destAddr),
						.writeEn(s_writeEn),
						.selInput(s_selInput),
						.dataOut(s_dataOut),
						.crOut(s_crOut),
						.clock(s_clock)
						);

initial begin
s_clock = 0;
forever #2 s_clock = ~s_clock;
end
initial begin
s_writeEn = 1;
s_selInput = 0;
s_destAddr = 4;
s_leftAddr = 4; // ca sa avem output
s_dataIn = 17;
s_func = 7;
s_crIn = 0;
#5
s_writeEn = 1;
s_selInput = 0;
s_destAddr = 6;
s_leftAddr = 6; //tot pentru output
s_rightAddr = 4;
s_dataIn = 2;
s_func = 0;
s_crIn = 0;
#4
s_writeEn = 1;
s_selInput = 1;
s_destAddr = 1;
s_leftAddr = 4; 
s_rightAddr = 6;
s_dataIn = 0;
s_func = 0;
s_crIn = 0;
#4
s_writeEn = 0;
s_leftAddr = 1;
#4 
s_writeEn = 1;
s_selInput = 1;
s_destAddr = 8;
s_leftAddr = 1;
s_rightAddr = 0;
s_dataIn = 0;
s_func = 6;
s_crIn = 0;
#4
s_writeEn = 0;
s_leftAddr = 8;
#4
s_writeEn = 1;
s_selInput = 1;
s_destAddr = 2;
s_leftAddr = 4; 
s_rightAddr = 4;
s_dataIn = 0;
s_func = 5;
s_crIn = 0;
#4
s_writeEn = 1;
s_selInput = 1;
s_destAddr = 4;
s_leftAddr = 4;
s_rightAddr = 2;
s_dataIn = 0;
s_func = 2;
s_crIn = 0;
#4
s_writeEn = 0;
#4
$stop;

end
						
						
						
endmodule 