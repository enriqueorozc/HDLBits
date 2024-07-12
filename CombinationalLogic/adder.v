module fullAdder (
  input a, b, cin,
  output cout, sum
);
  assign sum = (a ^ b) ^ cin;
  assign cout = ((a ^ b) & cin) | (a & b);
endmodule

module top_module (
  input [3:0] x,
  input [3:0] y,
  output [4:0] sum
);

  wire [2:0] cout;
  fullAdder fa0(x[0], y[0], 1'b0, cout[0], sum[0]);

  genvar i;
  generate
    for (i = 1; i < 3; i = i + 1) begin : fullAdder
      fullAdder fa(x[i], y[i], cout[i-1], cout[i], sum[i]);
    end
  endgenerate

  fullAdder fa1(x[3], y[3], cout[2], sum[4], sum[3]);

endmodule