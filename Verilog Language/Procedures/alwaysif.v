module top_module(
  input a,
  input b,
  input sel_b1,
  input sel_b2,
  output wire out_assign,
  output reg out_always   ); 
    
  assign out_assign = (sel_b1 & sel_b2) ? b : (
    (sel_b1 & ~sel_b2) ? a : (
      (~sel_b1 & sel_b2) ? a : a));
  
  always @(*) begin
      
    if (sel_b1 & sel_b2)
      out_always <= b;
    
    else if (sel_b1 & ~sel_b2)
      out_always <= a;
        
    else if (~sel_b1 & sel_b2)
      out_always <= a;
    
    else
      out_always <= a;
      
  end

endmodule