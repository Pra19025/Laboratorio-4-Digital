module buffer (input [3:0]A, input enabled, output reg [3:0] Y);

  always @(A or enabled)
    begin
      if (enabled)
        Y <= A;
      else
        Y = 1'bZ;
    end
endmodule
