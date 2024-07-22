module add1 ( input a, input b, input cin,   output sum, output cout );
  assign sum = cin ^ (a ^ b);
  assign cout = ((a & b) | (cin & (a ^ b)) );
endmodule

module top_module (
  input [31:0] a,
  input [31:0] b,
  output [31:0] sum
);

  wire cout;
  
  add16 lowerAdder(.a(a[15:0]), .b(b[15:0]), .cin(1'b0), .sum(sum[15:0]), .cout(cout));
  add16 upperAdder(.a(a[31:16]), .b(b[31:16]), .cin(cout), .sum(sum[31:16]));

endmodule