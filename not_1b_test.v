module not_1b_test;

  //clock 
  reg clk = 0;
  always #5 clk = !clk;
  
  reg x = 0;  //input
  wire o;     //output
  
  initial begin
    # 10 x = 1;
    # 10 x = 0;
    # 10 $finish;
  end

  not_1b a0 (x, o);
  
  initial begin
    $dumpfile("not_1b.vcd"); //waveform
    $dumpvars(0, clk);
    $dumpvars(1, x);
    $dumpvars(2, o);
  end
  
  initial begin
    $monitor("At time %t, !x(%b) = o(%b)", $time, x, o);
  end
  
endmodule
