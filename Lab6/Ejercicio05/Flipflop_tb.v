// testbench de flip_flop
module testbench();

reg [3:0] d;
wire [3:0] out;
reg clk, reset, set;
flip_flop F0(clk, d, reset, set, out);

initial begin
clk =0;
reset = 0;
set = 0;
d = 4'b0000;
#1
d= 4'b0001;
#2
d=4'b0010;
#4
d=4'b1000;
#1

#1
d= 4'b000;
#1
d= 4'b0001;
#2
d=4'b0010;
#4
d=4'b1000;

end

  always
  #2 clk = ~clk;
  initial begin
  #10
  $dumpfile("flipflop_tb.vcd");
  $dumpvars(0, testbench);
end

initial
  #66 $finish;

endmodule
