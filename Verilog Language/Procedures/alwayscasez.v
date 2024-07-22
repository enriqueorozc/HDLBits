module top_module (
  input [7:0] in,
  output reg [2:0] pos );
    
  always @(*) begin
      
    casez (in[7:0])
      8'bzzzzzzz1: pos = 8'b00000000;
      8'bzzzzzz1z: pos = 8'b00000001;
      8'bzzzzz1zz: pos = 8'b00000010;
      8'bzzzz1zzz: pos = 8'b00000011;
      8'bzzz1zzzz: pos = 8'b00000100;
      8'bzz1zzzzz: pos = 8'b00000101;
      8'bz1zzzzzz: pos = 8'b00000110;
      8'b1zzzzzzz: pos = 8'b00000111;
      default: pos = 8'b00000000;
    endcase
      
  end

endmodule
