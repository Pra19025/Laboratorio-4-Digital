module FFT (input wire enable, reset, clk, output wire Q);

FFD F1(enable, reset, clk, ~Q, Q);

endmodule

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
