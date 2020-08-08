//Ejercicio 05

module gateLevelSOP(input wire A, B, C, output wire Y);

    wire notA, notB, w1, w2, w3;

    not(notA, A);
    not(notB, B);
    and(w1, notA, notB, C);
    and(w2, notA, B, C);
    and(w3, A, B, C);
    or (Y, w1, w2, w3);

endmodule

module gateLevelPOS(input wire A, B, C, output wire Y);

    wire notA, notB, notC, w1, w2, w3, w4, w5;

    not(notA, A);
    not(notB, B);
    not(notC, C);
    or(w1, A, B, C);
    or(w2, A, notB, C);
    or(w3, notA, B, C);
    or(w4, notA, B, notC);
    or(w5, notA, notB, C);
    and(Y, w1, w2, w3, w4, w5);

endmodule


module gateLevelKarnaugh(input wire A, B, C, output wire Y);

  wire notA, w1, w2;

  not(notA, A);
  and(w1, notA, C);
  and(w2, B, C);
  or(Y, w1, w2);

endmodule


module operadoresSOP(input wire A, B, C, output wire Y);

  assign Y = (~A & B & C | ~A & B & C | A & B & C);

endmodule

module operadoresPOS(input wire A, B, C, output wire Y);

  assign Y = ((A | B | C) & (A | ~B | C) & (~A | B | C) & (~A | B |~C) & (~A | ~B | C));

endmodule

module operadoresKarnaugh(input wire A, B, C, output wire Y);

  assign Y = (~A & C | B & C);

endmodule
