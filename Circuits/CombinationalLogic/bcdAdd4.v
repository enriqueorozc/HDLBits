module top_module ( 
  input [15:0] a, b,
  input cin,
  output cout,
  output [15:0] sum 
);
    
  wire [2:0] coutTemp;
  bcd_fadd fa0(a[3:0], b[3:0], cin, coutTemp[0], sum[3:0]);
    
  genvar i;
  generate
    for (i = 1; i < 3; i = i + 1) begin : bcd_fadd
      bcd_fadd fa(a[(i*4) +: 4], b[(i*4) +: 4], coutTemp[i-1], coutTemp[i], sum[(i*4) +: 4]);
    end
  endgenerate
    
  bcd_fadd fa1(a[15:12], b[15:12], coutTemp[2], cout, sum[15:12]);

endmodule