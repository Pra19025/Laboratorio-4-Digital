
module mux2(input wire s, d0, d1, output wire y);

  assign y = s ? d0 : d1;

endmodule

module mux4(input wire s0, s1, d0, d1, d2, d3, output wire y);
  wire y1, y2;
  mux2 m0(s0, d0, d1, y1);
  mux2 m1(s0, d2, d3, y2);
  mux2 m2(s1, y1, y2, y);

endmodule

module mux8(input wire s0, s1, s2, d0, d1, d2, d3, d4, d5, d6, d7,
  output wire y);

wire y1, y2;

  mux4 m0(s0, s1, d0, d1, d2, d3, y1);
  mux4 m1(s0, s1, d4, d5, d6, d7, y2);
  mux2 m3(s2, y1, y2, y);

endmodule

module Tabla1Mux2(input wire a, b, c, output wire y);
  wire XORBC, XNORBC;
  assign XORBC = (b & c)|(~b*~c);
  assign XNORBC= ~XORBC;

  mux2 m0(a, XORBC, XNORBC, y);

endmodule

module Tabla1Mux4(input wire  a, b, c, output wire y);
  wire notC;
  assign notC = ~c;

  mux4 m0(a, b, c, notC, notC, c, y);

endmodule

module Tabla1Mux8(input wire  a, b, c, output wire y);

mux8 m0(a, b, c, 1'b0, 1'b1, 1'b1, 1'b0, 1'b1, 1'b0, 1'b0, 1'b1, y);

endmodule


module Tabla2Mux2(input wire a, b, c, output wire y);

  wire NORBC, XORBC;
  assign NORBC = ~(b|c);
  assign XORBC = b & ~c | ~b&c;

  mux2 m0(a, NORBC, XORBC, y);

endmodule


module Tabla2Mux4(input wire  a, b, c, output wire y);
  wire notC;
  assign notC = ~c;

  mux4 m0(a, b, 1'b1, 1'b0, 1'b1, notC, y);

endmodule

module Tabla2Mux8(input wire  a, b, c, output wire y);
mux8 m0(a, b, c, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b1, 1'b0, y);
endmodule
