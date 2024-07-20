module xnor_4b_test;
   
    //clock
    reg clk = 0;
    always #5 clk = !clk; 

    reg [3:0] A;    //4-bit register for input A
    reg [3:0] B;    //4-bit register for input B
    wire [3:0] Y;   // 4-bit wire for output Y

    xnor_4b uut ( 
        .A(A),
        .B(B),
        .Y(Y)
    );

    initial begin
        $monitor("At time %t, A = %b, B = %b, Y = %b", $time, A, B, Y);
        
        // Test cases
        #10 A = 4'b1100; B = 4'b1010;   //test case 1
        #10 A = 4'b0011; B = 4'b0101;   //test case 2
        #10 A = 4'b1111; B = 4'b0000;   //test case 3
        #10 A = 4'b0001; B = 4'b0011;   //test case 4

        #10 $finish; 
    end

    //waveform
    initial begin
        $dumpfile("xnor_4b.vcd"); 
        $dumpvars(0, clk);
        $dumpvars(1, A);
        $dumpvars(2, B);
        $dumpvars(3, Y);
    end
endmodule