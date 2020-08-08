// Ecuación a implementar: Y = A'C'+AC+AB';

module gateLevel(input wire A, B, C, output wire Y);

  wire notA, notB, notC, w1, w2, w3;

  not(notA, A);
  not(notB, B);
  not(notC, C);
  and(w1, notA, notC);
  and(w2, A, C);
  and(w3, A, notB);
  or (Y, w1, w2, w3);

endmodule


module gateLevel1(input wire A, B, C, output wire Y);

  wire notB;
  not(Y, B);

endmodule

module gateLevel2(input wire A, B, C, D, output wire Y);

  wire notA, notB, notC, notD, w1, w2, w3, w4, w5, w6, w7, w8;

  not(notA, A);
  not(notB, B);
  not(notC, C);
  not(notD, D);
  and(w1, notA, notB, notC, notD);
  and(w2, notA, notB, C, D);
  and(w3, notA, B, notC, D);
  and(w4, notA, B, C, notD);
  and(w5, A, B, notC, notD);
  and(w6, A, B, C, D);
  and(w7, A, notB, notC, D);
  and(w8, A, notB, C, notD);
  or(Y, w1, w2, w3, w4, w5, w6, w7, w8);

endmodule

module gateLevel3(input wire A, B, C, D, output wire Y);

  wire notC, notD, w1, w2, w3;

  not(notC, C);
  not(notD, D);
  and(w1, A, B);
  and(w2, A, C, D);
  and(w3, A, notC, notD);
  or(Y, w1, w2, w3);

endmodule

module operadores(input wire A, B, C, D, output wire Y);

  assign Y = (A & ~C) | (A & ~B) | (A & ~D) | (~B & ~C & ~D);

endmodule

module operadores1(input wire A, B, C, D, output wire Y);

  assign Y = (B | (~C & D) | (A & D));
endmodule


module operadores2(input wire A, B, C, output wire Y);

  assign Y = (~B | C);

endmodule


module operadores3(input wire A, B, C, output wire Y);

  assign Y = (B | (~A & ~C));

endmodule
