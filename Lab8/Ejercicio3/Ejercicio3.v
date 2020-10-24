//ejercicio 3
module alu(input [3:0] A, B, input [2:0] F,
           output [3:0] Y);

reg [3:0] salida_alu;
assign Y = salida_alu;

always @(*)
begin
  case(F)
  3'b000:
  salida_alu = A & B;
  3'b001:
  salida_alu = A | B;
  3'b010:
  salida_alu = A + B;
  3'b100:
  salida_alu = A & ~B;
  3'b101:
  salida_alu = A | ~B;
  3'b110:
  salida_alu = A - B;
  3'b111:
  salida_alu = (A<B?4'd1:4'd0);
  default salida_alu = A + B;
  endcase

end



endmodule
