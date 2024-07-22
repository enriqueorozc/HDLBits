module top_module(
  input [31:0] a,
  input [31:0] b,
  output [31:0] sum
);
    
  wire select;
  wire [15:0] output1;
  wire [15:0] output2;
  
  // Lower Bits:
  add16 lowerBits (.a(a[15:0]), .b(b[15:0]), .cin(1'b0), .sum(sum[15:0]), .cout(select));
  
  // Upper Bits:
  add16 upperBits0 (.a(a[31:16]), .b(b[31:16]), .cin(1'b0), .sum(output1));
  add16 upperBits1 (.a(a[31:16]), .b(b[31:16]), .cin(1'b1), .sum(output2));
  
  // MUX:
  assign sum[31:16] = (select) ? output2 : output1;

endmodule