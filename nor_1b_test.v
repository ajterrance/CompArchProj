module nor_1b_test;
  
  //clock
  reg clk = 0;
  always #5 clk = !clk;
  
  reg x = 0;
  reg y = 0;
  wire o;
  
  initial begin
    # 10 x = 0; y = 0;
    # 10 x = 1; y = 0;
    # 10 x = 0; y = 1;
    # 10 x = 1; y = 1;
    # 10 $finish;
  end

  nor_1b a0 (x, y, o);
  
  initial begin
    $dumpfile("nor_1b.vcd"); //waveform
    $dumpvars(0, clk);
    $dumpvars(1, x);
    $dumpvars(2, y);
    $dumpvars(3, o);
  end
  
  initial begin
    $monitor("At time %t, !(x(%b) | y(%b)) = o(%b)", $time, x, y, o);
  end
  
endmodule
