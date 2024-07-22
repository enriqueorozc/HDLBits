module top_module( 
  input [399:0] a, b,
  input cin,
  output cout,
  output [399:0] sum );
  
  reg [98:0] coutTemp;
  bcd_fadd fadd0(a[3:0], b[3:0], cin, coutTemp[0], sum[3:0]);
    
  genvar i;
  generate
    for (i = 1; i < 99; i = i + 1) begin : bcd_fadd
      bcd_fadd fadd(a[(i * 4) + 3:(i * 4)], b[(i * 4) + 3:(i * 4)], coutTemp[i-1], coutTemp[i], sum[(i * 4) + 3:(i * 4)]);
  end
  endgenerate
    
  bcd_fadd done(a[399:396], b[399:396], coutTemp[98], cout, sum[399:396]);

endmodule