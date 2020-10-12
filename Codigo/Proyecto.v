module main(input wire [1:0] tiempo, billete,
               input wire ticket, reset,sensor,clk,
               output wire factura, talanquera);
wire [3:0] ea;
wire [3:0] se;
wire [1:0] ns;
wire [1:0] as;
wire ticket_sellado;
wire ingresado;
wire timeup;
wire [2:0] vuelto;
wire [2:0] saldo;


FSM1 F1 (ea, billete, tiempo, ticket,ingresado, clk, reset,
         se, vuelto, saldo, factura, ticket_sellado, motor);

         FFD3 FF(clk, reset, se, ea);
         timer3s t0(clk, reset, motor, ingresado);


FSM2 F2 (ticket_sellado,sensor, timeup, as,clk, reset,
         ns, talanquera, contar);
        FFD1 FF1(clk, reset, ns, as);

timer7s t1(clk, reset, motor, timeup);

endmodule
//Primera maquina
module Logica_FSM1(input wire [3:0] ea, input wire [1:0] billete, tiempo, input wire ticket, ingresado,
            output wire [3:0] se, output wire [2:0] vuelto, saldo,
            output wire factura, ticket_sellado, motor);


  //cables utilizados como las compuertas intermedias
  wire n1,n2,n3, n4;
  wire n5, n6 , n7, n8, n9, n10, n11;
  wire n12, n13, n14, n15, n16, n17, n18, n19, n20;
  wire n21, n22, n23, n24, n25, n26, n27, n28, n29;
  wire n30, n31;
  wire n32, n33, n34, n35, n36, n37, n38, n39;
  wire n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50;
  wire n51, n52, n53, n54, n55, n56, n57, n58, n59, n60;
  wire n61, n62, n63, n64, n65, n66, n67, n68, n69, n70;
  wire n71, n72, n73, n74, n75, n76, n77;

  // implementacion de las ecuaciones de la FSM

  // para SN3

assign n1 = ea[3] & ~ea[2] & ~ea[1] & ~ingresado;
assign n2 = ea[3] & ~ea[2] & ~ea[0] & ~ingresado;
assign n3 = ~ea[3] & ea[1] & ~ea[0] & billete[0] & billete[1] & ingresado;
assign n4 = ~ea[3] & ea[2] & ~ea[1] & ea[0] &  billete[0] & billete[1] & ingresado;

// para SN2

assign n5  =  ~ea[3] & ea[2] & ~ingresado;
assign n6 =  ~ea[3] & ea[2] & ~ea[1] & ~ea[0] & billete[1];
assign n7 =  ~ea[3] & ea[2] & ~ea[1] & ea[0] & billete[1];
assign n8 =  ~ea[3] & ea[2] & ea[1] & ~ea[0] & ~billete[1];
assign n9 =  ~ea[3] & ~ea[2] & ea[1] & ~billete[0] & billete[1] & ingresado;
assign n10 = ~ea[3] & ~ea[2] & ea[1] & ea[0] & billete[0] & ~billete[1] & ingresado;
assign n11 = ~ea[3] & ea[2] & ~ea[0] & ~billete[0] & ~billete[1];

// para SN1
assign n12  =  ~ea[3] & ea[1] & ~ingresado;
assign n13 =  ~ea[3] & ea[1] & ~ea[0] & ~ingresado;
assign n14 =  ~ea[3] & ~ea[2] & ea[1] & ~ea[0] & billete[1];
assign n15 =  ~ea[3] & ~ea[2] & ea[1] & ~billete[0] & ~billete[1];
assign n16 =  ~ea[3] & ea[2] & ~ea[1] & ~ea[0] & billete[0] & ingresado;
assign n17 = ~ea[3] & ea[2] & ~ea[1] & billete[0] & ~billete[1] & ingresado;
assign n18 = ~ea[3] & ea[2] & ~ea[1] & ea[0] & ~billete[0] & billete[1] & ingresado;
assign n19 = ~ea[3] & ea[2] & ea[1] & ~ea[0] & ~billete[1];
assign n20 = ~ea[3] & ~ea[2] & ~ea[1] & ~ea[0] & ticket & tiempo[0];

//para SN0
assign n21 = ~ea[3] & ea[0] & ~ingresado;
assign n22 =  ~ea[2] & ~ea[1] & ea[0] & ~ingresado;
assign n23 =  ~ea[3] & ~ea[2] & ea[1] & ea[0] & billete[0];
assign n24 = ~ea[3] & ~ea[2] & ea[1] & ea[0] & ~billete[1];
assign n25 = ~ea[3] & ea[2] & ~ea[0] & billete[1] & ingresado;
assign n26 = ~ea[3] & ea[2] & ~ea[1] & ea[0] & ~billete[0] & ~billete[1];
assign n27 = ~ea[3] & ~ea[2] & ~ea[1] & ~ea[0] & ticket& tiempo[0] & tiempo[1];
assign n28 = ~ea[3] & ~ea[2] & ~ea[1] & ~ea[0] & ticket & ~tiempo[0] & ~tiempo[1];
assign n29 = ~ea[3] & ea[1] & ~ea[0] & billete[0] & ~billete[1] & ingresado;

assign se = {n1| n2 | n3 | n4,
             n5 | n6 | n7 | n8 | n9 | n10 | n11,
             n12 | n13 | n14 | n15 | n16 | n17 | n18 | n19 | n20,
             n21 | n22 | n23 | n24 | n25 | n26 | n27 | n28 | n29};

//para los vueltos
assign n30 =  ~ea[3] & ~ea[2] & ~ea[1] & ea[0] & ~ingresado;
assign n31 =  ~ea[3] & ea[2] & ea[1] & ~ea[0] & billete[0] & billete[1]& ingresado;

assign n32 =  ea[3] & ~ea[2] & ~ea[0] & ~ingresado;
assign n33 = ~ea[3] & ea[2] & ~ea[1] & ea[0] & billete[0] & billete[1] & ingresado;
assign n34 = ~ea[3] & ~ea[2] & ea[1] & ~ea[0] & billete[0] & billete[1] & ingresado;

assign n35 = ~ea[3] & ea[2] & ea[1] & ea[0] & ~ingresado;
assign n36 = ea[3] & ~ea[2] & ea[1] & ~ea[0] & ~ingresado;
assign n37 = ~ea[3] & ~ea[2] & ea[1] & ~ea[0] & billete[0] & billete[1] & ingresado;
assign n38 = ~ea[3] & ea[2] & ~ea[1] & ~ea[0] & billete[0] & billete[1] & ingresado;
assign n39 = ~ea[3] & ea[2] & ea[1] & ~ea[0] & billete[0] & ~billete[1] & ingresado;

assign vuelto[2] = {n30 | n31};
assign vuelto[1] = {n32 | n33 | n34};
assign vuelto[0] = {n35 | n36 | n37 | n38 | n39};

//para saldo
//Saldo2
assign n40 = ~ea[3] & ~ea[2] & ea[1] & ea[0] &  ~billete[0];
assign n41 = ~ea[3] & ~ea[2] & ea[1] & ea[0] &  ~ingresado;
assign n42 = ~ea[3] & ea[2] & ~ea[1] & ~ea[0] &  ~ingresado;
assign n43 = ~ea[3] & ea[2] & ~ea[1] & ~ea[0] & ~billete[0] & ~billete[1];
assign n44 = ~ea[3] & ~ea[2] & ~ea[1] & ~ea[0] & ticket & tiempo[0] & tiempo[1];

//Saldo 1
assign n45 = ~ea[3] & ea[2] & ~ea[1] & ea[0] &  ~billete[0];
assign n46 = ~ea[3] & ea[2] & ~ea[1] & ea[0] &  ~ingresado;
assign n47 = ~ea[3] & ~ea[2] & ea[1] & ~ea[0] &  ~ingresado;
assign n48 = ~ea[3] & ~ea[2] & ea[1] & ~ea[0] &  ~billete[0] & ~billete[1];
assign n49 = ~ea[3] & ea[2] & ~ea[1] &  ~billete[0] & billete[1] & ingresado;
assign n50 = ~ea[3] & ~ea[2] & ~ea[1] & ~ea[0] & ticket & tiempo[0] & ~tiempo[1];
assign n51 = ~ea[3] & ~ea[2] & ea[1] & ea[0] & billete[0] & ~billete[1] & ingresado;
assign n52 = ~ea[3] & ea[2] & ~ea[1] & ~ea[0] & billete[0] & ~billete[1] & ingresado;

//Saldo0
assign n53 = ~ea[3] & ~ea[2] & ea[1] & ea[0] &  ~billete[1];
assign n54 = ~ea[3] & ea[2] & ~ea[1] & ea[0] &  ~billete[1];
assign n55 = ~ea[3] & ~ea[2] & ea[1] & ea[0] &  ~ingresado;
assign n56 = ~ea[3] & ea[2] & ~ea[1] & ea[0] &  ~ingresado;
assign n57 = ~ea[3] & ea[2] & ea[1] & ~ea[0] &  ~ingresado;
assign n58 = ~ea[3] & ea[2] & ea[1] & ~ea[0] &  ~billete[0] & ~billete[1];
assign n59 = ~ea[3] & ~ea[2] & ~ea[1] & ~ea[0] & ticket & tiempo[0] & tiempo [1];
assign n60 = ~ea[3] & ~ea[2] & ea[1] & ~ea[0] & ~billete[0] & billete[1] & ingresado;
assign n61 = ~ea[3] & ea[2] & ~ea[1] & ~ea[0] & ~billete[0] & billete[1] & ingresado;

assign saldo[2] = n40 | n41| n42| n43| n44;
assign saldo[1] = n45| n46| n47 | n48| n49 | n50 | n51 | n52;
assign saldo[0] = n53| n54| n55| n56| n57| n58| n59| n60| n61;

//Para factura y ticket_sellado (es lo mismo porque cuando se da factura se da el ticket sellado)

assign n62 = ~ea[2] & ~ea[1] & ea[0] & ~ingresado;
assign n63 = ea[3] & ~ea[2] & ~ea[0] & ~ingresado;
assign n64 = ~ea[3] & ea[1] & ~ea[0] & billete[0] & ingresado;
assign n65 = ~ea[3] & ea[2] & ea[1] & ea[0] & ~ingresado;
assign n66 = ~ea[3] & ea[2] & ea[1] & ~ea[0] & billete[1] & ingresado;
assign n67 = ~ea[3] & ~ea[2] & ea[1] & billete[0] & billete[1] & ingresado;
assign n68 = ~ea[3] & ea[2] & ~ea[1] & billete[0] & billete[1] & ingresado;
assign n69 = ~ea[3] & ~ea[2] & ~ea[1] & ~ea[0] & ticket & ~tiempo[0] & ~tiempo[1];

assign factura = {n62 | n63 | n64 | n65 | n66 | n67 | n68 | n69};
assign ticket_sellado = {n62 | n63 | n64 | n65 | n66 | n67 | n68 | n69};

//para motor billete
assign n70 = ~ea[3] & ~ea[2] & ea[1];
assign n71 = ~ea[3] & ea[2] & ~ea[1];
assign n72 = ~ea[3] & ~ea[0] & ticket & tiempo[0];
assign n73 = ~ea[3] & ~ea[0] & ticket & ~tiempo[1];
assign n74 = ~ea[3] & ea[1] & ~ea[0];
assign n75 = ~ea[3] & ea[0] & ~ingresado;
assign n76 = ~ea[2] & ~ea[1] & ea[0] & ~ingresado;
assign n77 = ea[3] & ~ea[2] & ~ea[0] & ~ingresado;

assign motor = {n70 | n71 | n72 | n73 | n74 | n75 | n76 | n77};

endmodule

module FSM1(input wire [3:0] ea, input wire [1:0] billete, tiempo, input wire ticket, ingresado,clk, reset,
            output wire [3:0] se, output wire [2:0] vuelto, saldo,
            output wire factura, ticket_sellado, motor);

Logica_FSM1 Logic1(ea, billete, tiempo, ticket, ingresado,
  se, vuelto, saldo, factura, ticket_sellado, motor);




endmodule


module FFD0 (input wire clk, reset,input wire D, output reg Q);
always @ (posedge clk or posedge reset) begin
if(reset)begin
Q <= 1'b0;
end
else begin
Q <= D;
end
end
endmodule

module FFD1 (input wire clk, reset, input wire [1:0]D, output reg [1:0]Q);
always@(posedge clk or posedge reset) begin
if(reset)begin
Q <= 2'b0;
end
else begin
Q <= D;
end
end
endmodule


module FFD2(input wire clk, reset, input wire [2:0] D, output reg [2:0] Q);
always@(posedge clk or posedge reset) begin
if(reset)begin
Q <= 3'b0;
end
else begin
Q <= D;
end
end
endmodule


module FFD3(input wire clk, reset, input wire [3:0] D, output reg [3:0] Q);
always@(posedge clk or posedge reset) begin
if(reset)begin
Q <= 4'b0;
end
else begin
Q <= D;
end
end
endmodule


module Logica_FSM2(input wire [1:0]as, input wire ticket_sellado, sensor, timeup,
                   output wire [1:0]ns, output wire talanquera, contar);

wire m1, m2, m3, m4, m5, m6, m7, m8;

//siguiente estado bit 1
assign m1 = as[1] & ~as[0];
assign m2 = as[0] & sensor;
assign m3 = as[1] & ~timeup;

//siguiente estado bit 0
assign m4 = ~as[1] & ~as[0] & ticket_sellado;
assign m5 = ~as[1] & as[0] & ~sensor;
assign m6 = as[1] & ~as[0] & timeup;
assign m7 = as[1] & as[0] & sensor;
assign m8 = as[1] & as[0] & ~timeup;

assign ns[1] = m1 | m2 | m3;
assign ns[0] = m4 | m5 | m6 | m7 | m8;

assign contar = as[1];
assign talanquera = {as[1] & as[0]};

endmodule

module FSM2(input wire ticket_sellado, sensor, timeup, input wire [1:0]as, input wire clk, reset,
            output wire [1:0]ns, output wire talanquera, contar);

        Logica_FSM2 Logica(as, ticket_sellado, sensor, timeup,
          ns, talanquera, contar);

endmodule

module timer3s(input wire clk, reset, motor, output reg ingresado);
reg [3:0] Q;

always @(posedge clk,posedge reset) begin Q <= (reset ? 4'b0 : Q+1);
if(Q[1] & Q[2]) begin
ingresado  <= 1'b1;
end
else begin
ingresado <= 1'b0;
end
end
endmodule

module timer7s(input clk, reset, contar, output reg timeup);
reg [3:0] Q;
always @(posedge clk,posedge reset) begin Q <= (reset ? 4'b0 : Q+1);
if(Q[1] & Q[2] & Q[3]) begin
timeup  <= 1'b1;
//reset <= 1'b1;
end
else begin
timeup <= 1'b0;
end
end

endmodule
