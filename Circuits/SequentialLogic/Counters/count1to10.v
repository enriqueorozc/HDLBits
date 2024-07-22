module top_module (
  input clk,
  input reset,
  output reg [3:0] q
);
    
  always @(posedge clk) begin
      
    if (reset)
      q <= 1;
    else
      q <= ((q == 4'b1010) ? 1 : (q + 1));
      
  end

endmodule