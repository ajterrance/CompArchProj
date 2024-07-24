module Divide(
    	input [3:0] A,
    	input [3:0] B,
    	output reg [7:0] result
);
	reg [3:0] numerator;
	reg [3:0] remainder;
	
    	always @* begin
        	if (B != 4'b000) begin
        		numerator = A / B;
        		remainder = A % B;
       	end else begin
       	//uh oh we divided by zero
       		numerator = 4'b000;
       		remainder = 4'b000;
    		end
	result = {numerator, remainder};
	end
	
endmodule
