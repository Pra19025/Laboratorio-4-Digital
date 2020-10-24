module testbench();

reg [11:0] d;
reg clk;
reg rst;
reg load;
reg enabled;
wire [11:0] contador;



contador12 C1(d, clk, rst, load,enabled, contador);

initial begin
clk = 1;
rst = 0;
#2 rst = 1;
#2 rst = 0;
#2 load = 0;
#2 enabled = 1;
#2 d = 12'b101;
#8190
rst = 1;
#1 rst = 0;
load = 1;

#50 enabled = 0;
#500 $finish;
end

always
#1 clk = !clk;




initial begin
       $dumpfile("Ejercicio1_tb.vcd");
       $dumpvars(0,testbench);
   end
endmodule
