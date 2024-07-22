module top_module( 
  input [99:0] in,
  output [99:0] out
);
    
  always @(*) begin
    for (int i = 0, j = 99; i < 100; i = i + 1, j = j - 1) begin
      out[i] = in[j];
    end
  end

endmodule