module top_module (
  input clk,
  input reset,
  input [31:0] in,
  output [31:0] out
);	

  reg [31:0] inLast;
  reg [31:0] edgeCap;

  always @(posedge clk) begin

    if (reset) begin
      inLast <= in;
      edgeCap <= 0;
    end else begin

      inLast <= in;
      for (int i = 0; i < 32; i = i + 1) begin
        if (inLast[i] & ~in[i])
          edgeCap[i] <= 1'b1;
      end

    end

  end

  assign out = edgeCap;

endmodule