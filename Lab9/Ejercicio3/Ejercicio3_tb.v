module testbench();

wire Q;
reg enable;
reg reset;
reg clk;
reg J;
reg K;



FFJK F1(enable, reset, clk, J, K, Q);


initial begin
clk = 1;
reset = 0;
#2 reset = 1; J = 1; K = 0;
#2 reset = 0;
#2 enable = 0;
#2 enable = 1;


#10 J = 0; K = 1;
#10 J = 1; K = 1;
#10 J = 0; K = 0;

#50 enable = 0;
  #10 $finish;
end

always
#1 clk = !clk;




initial begin
       $dumpfile("Ejercicio3_tb.vcd");
       $dumpvars(0,testbench);
   end
endmodule
