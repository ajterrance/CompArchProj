module Tdivide;
	reg [3:0] A, B;
	wire [7:0] result;

	Divide divider_inst(
		.A(A),
		.B(B),
		.result(result)
	);

	initial begin
		//monitor
		$monitor("At time %t: result = %b, A = %b, B = %b",
		$time, A, B, result);
		
	//test 1
		A = 4'b0101;  // Example: A = 5
		B = 4'b0011;  // Example: B = 3
        #10;
        //test 2
        	A = 4'b1010;  // Example: A = 10
		B = 4'b0010;  // Example: B = 2
        #10;
        
        //test 3
        	A = 4'b0010;  // Example: A = 2
		B = 4'b0111;  // Example: B = 7
        #10;
        
	//test 4 Divide by zero >:)
        	A = 4'b0010;  // Example: A = 2
		B = 4'b0000;  // Example: B = 0
        #10;
        
		
	end
	
	initial begin
		$dumpfile("Divide.vcd");
		$dumpvars(0, Tdivide);
	end
	

endmodule
