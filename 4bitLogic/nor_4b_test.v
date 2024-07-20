module nor_4b_test;

    //clock
    reg clk = 0;
    always #5 clk = !clk;

    //inputs
    reg [3:0] x = 4'b0000;
    reg [3:0] y = 4'b0000;

    //output
    wire [3:0] o;

   initial begin
        //changes every 10 seconds
        # 10 x = 4'b0000; y = 4'b0000;
        # 10 x = 4'b0000; y = 4'b0001;
        # 10 x = 4'b0001; y = 4'b0000;
        # 10 x = 4'b0001; y = 4'b0001;
        # 10 $finish;
    end

    nor_4b a0 (x, y, o);

    initial begin
        $dumpfile("nor_4b.vcd"); //waveform file
        $dumpvars(0, nor_4b_test);
    end

    initial begin
        //display to monitor
        $monitor("At time %t, !(x(%b) | y(%b)) = o(%b)", $time, x, y, o);
    end

endmodule;
