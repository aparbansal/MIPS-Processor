module processor_tb();

  initial
  begin
    $dumpfile("waveform.vcd");
    $dumpvars(0,processor_tb);
  end

  processor cpu();

endmodule
