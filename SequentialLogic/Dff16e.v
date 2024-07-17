module top_module (
  input clk,
  input resetn,
  input [1:0] byteena,
  input [15:0] d,
  output [15:0] q
);
    
  localparam ALL = 2'b11;
  localparam UPPER = 2'b10;
  localparam LOWER = 2'b01;
  localparam STAY = 2'b00;
    
  always @(posedge clk) begin
      
    if (!resetn)
        q <= 0;
    else begin
        
      case (byteena)
          
        ALL:
          q <= d;
        UPPER:
          q[15:8] <= d[15:8];
        LOWER:
          q[7:0] <= d[7:0];
        STAY:
          q <= q;
          
      endcase
        
    end
      
  end

endmodule