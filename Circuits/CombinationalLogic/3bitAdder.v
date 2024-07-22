module fullAdder (
  input a, b, cin,
  output cout, sum
);
  assign sum = (a ^ b) ^ cin;
  assign cout = ((a ^ b) & cin) | (a & b);
endmodule

module top_module (
  input [2:0] a, b,
  input cin,
  output [2:0] cout,
  output [2:0] sum
); 

  fullAdder fa0(a[0], b[0], cin, cout[0], sum[0]);

  genvar i;
  generate
    for (i = 1; i < 3; i = i + 1) begin : fullAdder
      fullAdder fa(a[i], b[i], cout[i-1], cout[i], sum[i]);
    end
  endgenerate

endmodule