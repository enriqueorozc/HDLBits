module top_module(
  input [31:0] a,
  input [31:0] b,
  input sub,
  output [31:0] sum
);
    
  // Replication Operator:
  wire [31:0] bSub;
  assign bSub = b ^ {32{sub}};
  
  // Module Instantiation:
  wire lowerOut;
  
  add16 lowerBits(.a(a[15:0]), .b(bSub[15:0]), .cin(sub), .sum(sum[15:0]), .cout(lowerOut));
  add16 upperBits(.a(a[31:16]), .b(bSub[31:16]), .cin(lowerOut), .sum(sum[31:16]));

endmodule