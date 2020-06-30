module testbench();

reg  clk;
reg  rst;
reg  error_flag;

wire [31:0] y;

reg  [31:0] a;

initial
 begin
    $dumpfile("waveform.vcd");
    $dumpvars(0,testbench);
 end

// instantiate device under test
processor cpu(.a(a), .y(y), .clk(clk), .rst(rst));

initial
begin
  error_flag = 1'b0;
  clk = 1'b0;
  rst = 1'b1;
  a = 32'b 10000001010000000000000101001000;
  $display("0000.  a = %b. out = %b. rst = %b. clk = %b", a, y, rst, clk); // check

  #5;
  clk = ~clk;
  rst = 1'b0;
  $display("0001.  a = %b. out = %b. rst = %b. clk = %b", a, y, rst, clk); // check

  #5;
  clk = ~clk;
  $display("0010.  a = %b. out = %b. rst = %b. clk = %b", a, y, rst, clk); // check

  #5;
  clk = ~clk;
  $display("0011.  a = %b. out = %b. rst = %b. clk = %b", a, y, rst, clk); // check

  #5;
  clk = ~clk;
  rst = 1'b1;
  $display("0100.  a = %b. out = %b. rst = %b. clk = %b", a, y, rst, clk); // check

  #5;
  clk = ~clk;
  $display("0101.  a = %b. out = %b. rst = %b. clk = %b", a, y, rst, clk); // check

  #5;
  clk = ~clk;
  $display("0110.  a = %b. out = %b. rst = %b. clk = %b.", a, y, rst, clk); // check
  if ( y == (~a))
  begin
    $display("Success");
    error_flag = 0;
  end
  else
  begin
    $display("Error");
    error_flag = 1;
  end

  #5;
  clk = ~clk;
  $display("0111.  a = %b. out = %b. rst = %b. clk = %b", a, y, rst, clk); // check

  #5;
  clk = ~clk;
  $display("1000.  a = %b. out = %b. rst = %b. clk = %b", a, y, rst, clk); // check

  #5;
  clk = ~clk;
  $display("1001.  a = %b. out = %b. rst = %b. clk = %b", a, y, rst, clk); // check

  #5;
  clk = ~clk;
  $display("1010.  a = %b. out = %b. rst = %b. clk = %b", a, y, rst, clk); // check

  #5;
  clk = ~clk;
  $display("1011.  a = %b. out = %b. rst = %b. clk = %b", a, y, rst, clk); // check

  #5;
  clk = ~clk;
  $display("1100.  a = %b. out = %b. rst = %b. clk = %b", a, y, rst, clk); // check

  #5;
  clk = ~clk;
  $display("1101.  a = %b. out = %b. rst = %b. clk = %b", a, y, rst, clk); // check

  #5;
  clk = ~clk;
  $display("1100.  a = %b. out = %b. rst = %b. clk = %b", a, y, rst, clk); // check

  #5;
  clk = ~clk;
  $display("1101.  a = %b. out = %b. rst = %b. clk = %b", a, y, rst, clk); // check

  #5;
  clk = ~clk;
  $display("1110.  a = %b. out = %b. rst = %b. clk = %b", a, y, rst, clk); // check

  #5;
  clk = ~clk;
  $display("1111.  a = %b. out = %b. rst = %b. clk = %b", a, y, rst, clk); // check


  #5;
  clk = ~clk;
  #5;
  clk = ~clk;
  #5;
  clk = ~clk;
  #5;
  clk = ~clk;
  #5;
  clk = ~clk;
  #5;
  clk = ~clk;
  #5;
  clk = ~clk;
  #5;
  clk = ~clk;
  #5;
  clk = ~clk;
  #5;
  clk = ~clk;
  #5;
  clk = ~clk;
  #5;
  clk = ~clk;
  #5;
  clk = ~clk;
  #5;
  clk = ~clk;
end

endmodule
