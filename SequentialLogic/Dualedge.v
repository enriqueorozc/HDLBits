module top_module (
  input clk,
  input d,
  output q
);
    
  reg posFlip, negFlip;
  
  always @(posedge clk) begin
    posFlip <= d;
  end
  
  always @(negedge clk) begin
    negFlip <= d;
  end
  
  assign q = (posFlip & clk) | (negFlip & ~clk);

endmodule