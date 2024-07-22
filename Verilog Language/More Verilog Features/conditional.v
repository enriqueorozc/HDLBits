module top_module (
  input [7:0] a, b, c, d,
  output [7:0] min);
  
  wire [7:0] abLess;
  wire [7:0] cdLess;
  
  assign abLess = (a < b) ? a : b;
  assign cdLess = (c < d) ? c : d;
  assign min = (abLess < cdLess) ? abLess : cdLess;

endmodule