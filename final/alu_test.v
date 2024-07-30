module alu_test;

    //clock
    reg clk = 0;
    always #5 clk = !clk;

    //inputs
    reg [3:0] x = 4'b0000;
    reg [3:0] y = 4'b0000;
    reg [3:0] opcode = 4'b0000;

    //outputs
    wire [3:0] o;
    wire [3:0] remainder;
    wire [7:0] product;

    alu a0 (.x(x), .y(y), .opcode(opcode), .o(o), .product(product));

    //waveform file
    initial begin
        $dumpfile("alu.vcd");
        $dumpvars(0, alu_test);
    end


    initial begin
        //display to monitor
        $monitor("At time %t, x = %b, y = %b, opcode = %b, o = %b, product = %b", 
            $time, x, y, opcode, o, product);

        //tests NOT
        #10 x = 4'b0000; opcode = 4'b0000;
        
        //tests AND
        #10 x = 4'b0000; y = 4'b1111; opcode = 4'b0001;

         //tests NAND
        #10 x = 4'b0000; y = 4'b1111; opcode = 4'b0010;
        
         //tests OR
        #10 x = 4'b0000; y = 4'b1111; opcode = 4'b0011;

         //tests NOR
        #10 x = 4'b0000; y = 4'b1111; opcode = 4'b0100;

         //tests XOR
        #10 x = 4'b0000; y = 4'b1111; opcode = 4'b0101;

         //tests XNOR
        #10 x = 4'b0000; y = 4'b0000; opcode = 4'b0110;

         //tests SHIFT
        #10 x = 4'b0000; y = 4'b1111; opcode = 4'b0111;

         //tests ADDITION
        #10 x = 4'b0000; y = 4'b1111; opcode = 4'b1000;

         //tests SUBTRACTION
        #10 x = 4'b0000; y = 4'b1111; opcode = 4'b1001;

         //tests MULTIPLICATION
        #10 x = 4'b1111; y = 4'b1111; opcode = 4'b1010;

         //tests DIVISION
        #10 x = 4'b1111; y = 4'b1111; opcode = 4'b1011;

        //FINISH
        #10 $finish;
    end
    
endmodule