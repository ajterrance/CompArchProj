module not_4b_test;

    //clock
    reg clk = 0;
    always #5 clk = !clk;

    reg [3:0] A;    //4-bit register for input
    wire [3:0] Y;   //4-bit wire for output

    not_4b uut (
        .A(A),
        .Y(Y)
    );

    initial begin
       $monitor("At time %t, A = %b, Y = %b", $time, A, Y);

        // Test cases
        #10 A = 4'b1100;    //test case 1
        #10 A = 4'b0011;    //test case 2
        #10 A = 4'b1111;    //test case 3
        #10 A = 4'b0001;    //test case 4

        #10 $finish; // End simulation
    end

    //waveform
    initial begin
        $dumpfile("not_4b.vcd");
        $dumpvars(0, clk);
        $dumpvars(1, A);
        $dumpvars(2, Y);
    end
endmodule