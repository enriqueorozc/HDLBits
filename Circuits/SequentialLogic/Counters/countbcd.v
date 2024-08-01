module decadecounter (
  input clk,
  input reset,  // Synchronous active-high reset
  input ena,
  output reg [3:0] q
);

  always @(posedge clk) begin

    if (reset)
      q <= 0;
    else if (ena)
      q <= ((q == 4'b1001) ? 0 : (q + 1));
    else
      q <= q;

  end

endmodule

module top_module (
  input clk,
  input reset,    // Synchronous active-high reset
  output [3:1] ena,
  output [15:0] q
);

  assign ena[1] = (q[3:0] == 4'd9);
  assign ena[2] = (q[3:0] == 4'd9 && q[7:4] == 4'd9);
  assign ena[3] = (q[3:0] == 4'd9 && q[7:4] == 4'd9 && q[11:8] == 4'd9);

  decadecounter digit1(clk, reset, 1'b1, q[3:0]);
  decadecounter digit2(clk, reset, ena[1], q[7:4]);
  decadecounter digit3(clk, reset, ena[2], q[11:8]);
  decadecounter digit4(clk, reset, ena[3], q[15:12]);

endmodule