module top_module ( input clk, input d, output q );
    
  // Outputs from Modules:
  wire output1;
  wire output2;
  
  my_dff dff1(.clk(clk), .d(d), .q(output1));
  my_dff dff2(.clk(clk), .d(output1), .q(output2));
  my_dff dff3(.clk(clk), .d(output2), .q(q));
    
endmodule