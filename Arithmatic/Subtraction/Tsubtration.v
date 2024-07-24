module Tsubtraction;
	reg [3:0] A, B;
	wire [3:0] sum;

	Subtraction subtractor_inst(
		.A(A),
		.B(B),
		.sum(sum)
	);

	initial begin
		//monitor
		$monitor("At time %t: sum = %b, A = %b, B = %b",
		$time, A, B, sum);
		
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

		
	end
	
	initial begin
		$dumpfile("Subtraction.vcd");
		$dumpvars(0, Tsubtraction);
	end
	

endmodule
