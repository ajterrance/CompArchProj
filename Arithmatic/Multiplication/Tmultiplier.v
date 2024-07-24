module Tmultiplier;
	reg [3:0] A, B;
	wire [7:0] Product;

	Multiplier multiplier_inst(
		.A(A),
		.B(B),
		.Product(Product)
	);

	initial begin
		//monitor
		$monitor("At time %t: Product = %b, A = %b, B = %b",
		$time, A, B, Product);
		
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
		$dumpfile("Multiplier.vcd");
		$dumpvars(0, Tmultiplier);
	end
	

endmodule
