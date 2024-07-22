module fullAdder (
  input a, b, cin,
  output cout, sum
);
  assign sum = (a ^ b) ^ cin;
  assign cout = ((a ^ b) & cin) | (a & b);
endmodule

module top_module (
  input [7:0] a,
  input [7:0] b,
  output [7:0] s,
  output overflow
);

  wire [7:0] cout;
  fullAdder fa0(a[0], b[0], 1'b0, cout[0], s[0]);

  genvar i;
  generate
    for (i = 1; i < 8; i = i + 1) begin : fullAdder
      fullAdder fa(a[i], b[i], cout[i-1], cout[i], s[i]);
    end
  endgenerate

  assign overflow = ((s[7] ^ a[7]) & (a[7] ~^ b[7]));

endmodule