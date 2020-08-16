
module testbench();

  reg a, b, c, d, e, f;
  wire y1, y2, y3, y4, y5, y6;

  Tabla1Mux8 m0(a, b, c, y1);
  Tabla1Mux4 m1(a, b, c, y2);
  Tabla1Mux2 m2(a, b, c, y3);
  Tabla2Mux8 m3(d, e, f, y4);
  Tabla2Mux4 m4(d, e, f, y5);
  Tabla2Mux2 m5(d, e, f, y6);

initial begin
  $display("Tabla 1");
  $display(" Mux 8:1         Mux 4:1          Mux 2:1");
  $display(" ----------     ---------         ---------");
  $monitor("%b  %b  %b | %b    %b  %b  %b | %b     %b  %b  %b | %b",
  a, b, c, y1, a, b, c, y2, a, b, c, y3);


     a = 0; b = 0; c = 0;
  #1 a = 0; b = 0; c = 1;
  #1 a = 0; b = 1; c = 0;
  #1 a = 0; b = 1; c = 1;
  #1 a = 1; b = 0; c = 0;
  #1 a = 1; b = 0; c = 1;
  #1 a = 1; b = 1; c = 0;
  #1 a = 1; b = 1; c = 1;
end

initial begin
#8
  $display("Tabla 2");
  $display(" Mux 8:1         Mux 4:1          Mux 2:1");
  $display(" ----------     ---------         ---------");
  $monitor("%b  %b  %b | %b    %b  %b  %b | %b     %b  %b  %b | %b",
  d, e, f, y4, d, e, f, y5, d, e, f, y6);


     d = 0; e = 0; f = 0;
  #1 d = 0; e = 0; f = 1;
  #1 d = 0; e = 1; f = 0;
  #1 d = 0; e = 1; f = 1;
  #1 d = 1; e = 0; f = 0;
  #1 d = 1; e = 0; f = 1;
  #1 d = 1; e = 1; f = 0;
  #1 d = 1; e = 1; f = 1;
end


initial
  #66 $finish;

initial begin
#16
  $dumpfile("Lab5_tb.vcd");
  $dumpvars(0, testbench);
end

endmodule
