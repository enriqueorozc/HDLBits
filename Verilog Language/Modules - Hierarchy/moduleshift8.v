module top_module ( 
  input clk, 
  input [7:0] d, 
  input [1:0] sel, 
  output [7:0] q 
);
    
  // Output from Modules:
  wire [7:0] q1;
  wire [7:0] q2;
  wire [7:0] q3;
  
  // Module Instantiation:
  my_dff8 dut1(.clk(clk), .d(d), .q(q1));
  my_dff8 dut2(.clk(clk), .d(q1), .q(q2));
  my_dff8 dut3(.clk(clk), .d(q2), .q(q3));
  
  // MUX Creation:
  assign q = (sel == 2'b11) ? (q3) :
    ((sel == 2'b10) ? (q2) : ((sel == 2'b01) ? (q1) : (d) ));

endmodule