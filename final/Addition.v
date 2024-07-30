module Addition(
	input [3:0] A, B,
	output reg [3:0] sum
);


	always @*
	begin
		sum = A + B;
	end

endmodule
