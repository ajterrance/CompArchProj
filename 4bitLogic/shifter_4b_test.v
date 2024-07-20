module shifter_4b_test;

    //clock
    reg clk = 0;
    always #5 clk = !clk;

    reg [3:0] A;    //first 4-bit input, number to be shifted
    reg [3:0] B;    //second 4-bit input, number that determines shift
    wire [3:0] X;   //4-bit shifted result
    wire [3:0] Y;   //4-bit number that was shifted out

    shifter_4b uut (
        .A(A),
        .B(B),
        .X(X),
        .Y(Y)
    );

    initial begin
        $monitor("At time %t, A = %b, B = %b, X = %b, Y = %b", $time, A, B, X, Y);

        // Test cases
        #10 A = 4'b0111; B = 4'b0010; //test case 1, shift left by 1, fill 0
        #10 A = 4'b0111; B = 4'b0110; //test case 2, shift left by 3, fill 0
        #10 A = 4'b0111; B = 4'b1011; //test case 3, shift right by 1, fill 1
        #10 A = 4'b0111; B = 4'b1110; //test case 4, shift right by 3, fill 0

        #10 $finish;
    end

    //waveform
    initial begin
        $dumpfile("shifter_4b.vcd"); 
        $dumpvars(0, clk);
        $dumpvars(1, A);
        $dumpvars(2, B);
        $dumpvars(3, X);
        $dumpvars(4, Y);
    end
endmodule