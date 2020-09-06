//ejercici03 en verilog
module MaquinaMoore(input Direccion, clk, reset, output wire [2:0]salida);
    reg [2:0] estado_actual;
    wire [2:0] estado_siguiente;
    //cables utilizados como las compuertas intermedias
    wire n1,n2,n3;
    wire n4,n5,n6;
    wire n7,n8,n9,n10;
    // implementacion de las ecuaciones de la FSM
    // para S0 prima
    assign   n1 = ~estado_actual[1] & ~estado_actual[0] &  ~Direccion;
    assign   n2 = estado_actual[1] &  ~estado_actual[0] & Direccion;
    assign   n3 = estado_actual[2] & estado_actual[0];
    // para S1 prima
    assign    n4 = ~estado_actual[2] & estado_actual[0] & Direccion;
    assign    n5 = estado_actual[2] & estado_actual[0] & ~Direccion;
    assign    n6 = estado_actual[1] & ~estado_actual[0];
    // para S2 prima
    assign    n7 = ~estado_actual[2] & ~estado_actual[1] & Direccion;
    assign    n8 = estado_actual[2] & ~estado_actual[1] & ~Direccion;
    assign    n9 = ~estado_actual[2] & estado_actual[1] & ~Direccion;
    assign    n10= estado_actual[2] & estado_actual[1] & Direccion;

    assign estado_siguiente = {n1 | n2 | n3, n4 | n5 | n6, n7| n8 | n9 |n10 };

    assign salida = estado_actual;


    always @(posedge clk , posedge reset) estado_actual <= reset ? 3'b000 : estado_siguiente;

endmodule
