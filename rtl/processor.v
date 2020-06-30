module processor (
  output reg  [31:0] y,
  input  wire [31:0] a,
  input  wire        clk,
  input  wire        rst);

always@(posedge clk or negedge rst)
begin
  if(!rst)
  begin
    y <= 32'b0;
  end
  else
  begin
    y <= ~a;
  end
end

endmodule
