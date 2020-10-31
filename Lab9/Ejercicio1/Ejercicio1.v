module FFD(input enable, reset, clk, D, output  reg Q);

always @ (posedge clk, posedge reset)
begin
  begin
  if (reset)
    Q <= 0;
  else if (~enable)
    Q <=Q;
  else
  Q <= D;
  end
end
  endmodule


module FFD2 (input enable, reset, clk, input [1:0] D2, output wire [1:0] Q2 );

  FFD FFDA(enable, reset, clk, D2[0], Q2[0]);
  FFD FFDB(enable, reset, clk, D2[1], Q2[1]);

    endmodule

module FFD4 (input enable, reset, clk, input [3:0] D3, output wire [3:0] Q3);
  FFD2 FFD2A(enable, reset, clk, D3[1:0], Q3[1:0]);
  FFD2 FFD2B(enable, reset, clk, D3[3:2], Q3[3:2]);

  endmodule
