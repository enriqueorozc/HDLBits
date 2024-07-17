module top_module (
  input clk,
  input [7:0] in,
  output [7:0] anyedge
);
    
  reg [7:0] inLast;
  
  always @(posedge clk) begin
    inLast <= in;
    anyedge = inLast ^ in;
  end

endmodule