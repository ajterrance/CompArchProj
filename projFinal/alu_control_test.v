module alu_control_test;

    reg [3:0] A;
    reg [3:0] B;
    reg [3:0] control;
    wire [3:0] result;
    wire [3:0] extra;

    alu_control uut (
        .A(A),
        .B(B),
        .control(control),
        .result(result),
        .extra(extra)
    );

    initial begin
        $monitor("A = %b, B = %b, control = %b | result = %b, extra = %b", A, B, control, result, extra);
        
        //test addition
        A = 4'b0011; B = 4'b0101; control = 4'b0000;
        #10;
        
        //test subtraction
        control = 4'b0001;
        #10;
        
        //test multiplication
        control = 4'b0010;
        #10;
        
        //test division
        control = 4'b0011;
        #10;
        
        //test XOR
        control = 4'b0100;
        #10;
        
        //test XNOR
        control = 4'b0101;
        #10;
        
        //test NOT
        control = 4'b0110;
        #10;
        
        //test shift
        control = 4'b0111;
        #10;
        
        //test AND
        control = 4'b1000;
        #10;
        
        //test NAND
        control = 4'b1001;
        #10;
        
        //test OR
        control = 4'b1010;
        #10;
        
        //test NOR
        control = 4'b1011;
        #10;

        $finish;
    end

    initial begin
        $dumpfile("alu_control.vcd"); 
        $dumpvars(0, alu_control_test);
    end
endmodule