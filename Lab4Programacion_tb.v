// Ecuación a implementar: Y = A'C'+AC+AB';
module testbench();

  reg p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14;
  wire led1, led2, led3, led4, led5, led6, led7,led8;

  gateLevel  G0(p1, p2, p3, led1);
  gateLevel1 G1(p1, p2, p3, led2);
  gateLevel2 G2(p4, p5, p6, p7, led3);
  gateLevel3 G3(p4, p5, p6, p7, led4);

  operadores OP0(p8, p9, p10, p11, led5);
  operadores1 OP1(p8, p9, p10, p11, led6);
  operadores2 OP2(p12, p13, p14, led7);
  operadores3 OP3(p12, p13, p14, led8);

  initial begin
    $display(" Tabla 1 y 2");
    $display("A B C | Y1 Y2");
    $display("------|------");
    $monitor("%b %b %b | %b  %b", p1, p2, p3, led1, led2);
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
   #9
   $display("\n");
   $display(" Tabla 3 y 4");
   $display("A B C D | Y1 Y2");
   $display("--------|------");
   $monitor("%b %b %b %b | %b  %b", p4, p5, p6, p7, led3, led4);
      p4 = 0; p5 = 0; p6 = 0; p7 = 0;
   #1 p4 = 0; p5 = 0; p6 = 0; p7 = 1;
   #1 p4 = 0; p5 = 0; p6 = 1; p7 = 0;
   #1 p4 = 0; p5 = 0; p6 = 1; p7 = 1;
   #1 p4 = 0; p5 = 1; p6 = 0; p7 = 0;
   #1 p4 = 0; p5 = 1; p6 = 0; p7 = 1;
   #1 p4 = 0; p5 = 1; p6 = 1; p7 = 0;
   #1 p4 = 0; p5 = 1; p6 = 1; p7 = 1;
   #1 p4 = 1; p5 = 0; p6 = 0; p7 = 0;
   #1 p4 = 1; p5 = 0; p6 = 0; p7 = 1;
   #1 p4 = 1; p5 = 0; p6 = 1; p7 = 0;
   #1 p4 = 1; p5 = 0; p6 = 1; p7 = 1;
   #1 p4 = 1; p5 = 1; p6 = 0; p7 = 0;
   #1 p4 = 1; p5 = 1; p6 = 0; p7 = 1;
   #1 p4 = 1; p5 = 1; p6 = 1; p7 = 0;
   #1 p4 = 1; p5 = 1; p6 = 1; p7 = 1;
 end

 initial begin
  #25
  $display("\n");
  $display(" Operacion 1 y 3, debido a que son las de 4 entradas");
  $display("A B C D | Y1 Y2");
  $display("--------|------");
  $monitor("%b %b %b %b | %b  %b", p8, p9, p10, p11, led5, led6);
     p8 = 0; p9 = 0; p10 = 0; p11 = 0;
  #1 p8 = 0; p9 = 0; p10 = 0; p11 = 1;
  #1 p8 = 0; p9 = 0; p10 = 1; p11 = 0;
  #1 p8 = 0; p9 = 0; p10 = 1; p11 = 1;
  #1 p8 = 0; p9 = 1; p10 = 0; p11 = 0;
  #1 p8 = 0; p9 = 1; p10 = 0; p11 = 1;
  #1 p8 = 0; p9 = 1; p10 = 1; p11 = 0;
  #1 p8 = 0; p9 = 1; p10 = 1; p11 = 1;
  #1 p8 = 1; p9 = 0; p10 = 0; p11 = 0;
  #1 p8 = 1; p9 = 0; p10 = 0; p11 = 1;
  #1 p8 = 1; p9 = 0; p10 = 1; p11 = 0;
  #1 p8 = 1; p9 = 0; p10 = 1; p11 = 1;
  #1 p8 = 1; p9 = 1; p10 = 0; p11 = 0;
  #1 p8 = 1; p9 = 1; p10 = 0; p11 = 1;
  #1 p8 = 1; p9 = 1; p10 = 1; p11 = 0;
  #1 p8 = 1; p9 = 1; p10 = 1; p11 = 1;
end

initial begin
#41
  $display(" Operacion 2 y 4 debido a que son las de 3 entradas se muestran juntas");
  $display("A B C | Y1 Y2");
  $display("------|------");
  $monitor("%b %b %b | %b  %b", p12, p13, p14, led7, led8);
     p12 = 0; p13 = 0; p14 = 0;
  #1 p12 = 0; p13 = 0; p14 = 1;
  #1 p12 = 0; p13 = 1; p14 = 0;
  #1 p12 = 0; p13 = 1; p14 = 1;
  #1 p12 = 1; p13 = 0; p14 = 0;
  #1 p12 = 1; p13 = 0; p14 = 1;
  #1 p12 = 1; p13 = 1; p14 = 0;
  #1 p12 = 1; p13 = 1; p14 = 1;
end

initial
  #66 $finish;

initial begin
#8
  $dumpfile("Lab4Programacion_tb.vcd");
  $dumpvars(0, testbench);
end

endmodule
