module testbench();

reg enable;
reg reset;
reg clk;
reg D;
wire Q;
reg [1:0] D2;
wire [1:0] Q2;
reg [3:0] D3;
wire [3:0] Q3;



FFD F1(enable, reset, clk, D, Q);
FFD2 F2(enable, reset, clk, D2, Q2);
FFD4 F3(enable, reset, clk, D3, Q3);
integer i;

initial begin
clk = 1;
reset = 0;
#2 reset = 1;
#2 reset = 0;
#2 enable = 0;
#2 enable = 1;
#2 D = 1'b0; D2 = 2'b0; D3 = 4'd0;
#2 D = 1'b1; D2 = 2'd2; D3 =4'd5;


reset = 1;
#1 reset = 0;


#50 enable = 0;
#2 D = 1'b0; D2 = 2'd4; D3 =4'd12;


  #50 $finish;
end

always
#1 clk = !clk;




initial begin
       $dumpfile("Ejercicio1_tb.vcd");
       $dumpvars(0,testbench);
   end
endmodule
