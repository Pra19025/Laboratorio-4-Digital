module testbench();

reg enable;
reg reset;
reg clk;
wire Q;



FFT T1(enable, reset, clk, Q);


initial begin
#2 enable = 0;
#2 enable = 1;
clk = 1;
reset = 0;
#2 reset = 1;
#2 reset = 0;



reset = 1;
#1 reset = 0;


#50 enable = 0;
  #500 $finish;
end

always
#1 clk = !clk;




initial begin
       $dumpfile("Ejercicio2_tb.vcd");
       $dumpvars(0,testbench);
   end
endmodule
