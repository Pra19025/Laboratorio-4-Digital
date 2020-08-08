module testbench();

reg p1, p2, p3;
wire led1, led2, led3, led4, led5, led6;

gateLevelSOP G0(p1, p2, p3, led1);
gateLevelPOS G1(p1, p2, p3, led2);
gateLevelKarnaugh G2(p1, p2, p3, led3);

operadoresSOP OP0(p1, p2, p3, led4);
operadoresPOS OP1(p1, p2, p3, led5);
operadoresKarnaugh OP2(p1, p2, p3, led6);

initial begin
  $display(" Se muestran todos los resultados debido a que es el mismo varias veces");
  $display("A B C | Y1 Y2 Y3 Y4 Y5 Y6");
  $display("------|------------------");
  $monitor("%b %b %b | %b  %b  %b  %b  %b  %b", p1, p2, p3, led1, led2, led3, led4, led5, led6);
     p1 = 0; p2 = 0; p3 = 0;
  #1 p1 = 0; p2 = 0; p3 = 1;
  #1 p1 = 0; p2 = 1; p3 = 0;
  #1 p1 = 0; p2 = 1; p3 = 1;
  #1 p1 = 1; p2 = 0; p3 = 0;
  #1 p1 = 1; p2 = 0; p3 = 1;
  #1 p1 = 1; p2 = 1; p3 = 0;
  #1 p1 = 1; p2 = 1; p3 = 1;
end

initial begin
#8
  $dumpfile("Ejercicio5_tb.vcd");
  $dumpvars(0, testbench);
end

endmodule
