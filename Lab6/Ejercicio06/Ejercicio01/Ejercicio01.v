//Ejercicio01 en verilog
module Ejercicio01(input A,B,clk,reset, output y);
    reg [1:0]estado_actual; // el estado actual esta dado en 2 bits
    wire [1:0]estado_siguiente; // igual que el estado siguiente
    wire n1;

    assign n1 = estado_actual[1] & A & B ; //debido a que en esta fsm se podia ver
    //que y era igual a s1, este cable es usado para ambos
    assign estado_siguiente[0]= ~estado_actual[1] & ~estado_actual[0] & A;
    assign estado_siguiente[1]=  n1 | (estado_actual[0] & B);
    assign y = n1;

    always @ (posedge clk, posedge reset) estado_actual <= reset? 2'b00 : estado_siguiente;

endmodule
