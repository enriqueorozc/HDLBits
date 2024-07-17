module top_module (
  input clk,
  input slowena,
  input reset,
  output reg [3:0] q
);
    
  always @(posedge clk) begin   
    q <= q;		// Prevent Latches
      
    if (reset)
      q <= 0;
    else if (slowena)
      q <= ((q == 4'b1001) ? 0 : (q + 1));
      
  end

endmodule