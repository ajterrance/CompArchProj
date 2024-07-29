module alu (
    	input [3:0] a,           // 4-bit input A
    	input [3:0] b,           // 4-bit input B
    	input [3:0] op_code,     // Operation code to select the ALU operation
    	output reg [3:0] result, // 4-bit result
);

	wire [7:0] Divider, Multiplication
	
    	wire [3:0] Addition, Subtraction, and_result, nand_result, nor_result,
    	not_result, or_result, xor_result, xnor_result, shiftreg_result;
    	
    	wire nand1b_result, nor1b_result, not1b_result;

    	Addition adder_inst (
        	.A(a),
        	.B(b),
        	.sum(Addition)
    	);
	
    	Subtraction sub_inst (
        	.A(a),
        	.B(b),
        	.diff(Subtraction)
    	);
	
	Multiplication multiplier_inst (
        	.A(a),
        	.B(b),
        	.product(Multiplication)
    	);
    	
    	Division divider_inst (
        	.a(a),
        	.b(b),
        	.result(Divider)
    	);
 
    	and_4b(
        	.x(a),
        	.y(b),
        	.o(and_result)
    	);
    	
    	nand_4b(
        	.x(a),
        	.y(b),
        	.o(nand_result)
    	);
 	
 	nor_4b(
        	.x(a),
        	.y(b),
        	.o(nor_result)
    	);
	
	not_4b(
        	.A(a),
        	.Y(not_result)	
    	);
    	
    	or_4b(
        	.x(a),
        	.y(b),
        	.o(or_result)
    	);
    	
    	xnor_4b(
        	.A(a),
        	.B(b),
        	.Y(xnor_result)
    	);
    	
    	xor_4b(
        	.A(a),
        	.B(b),
        	.Y(or_result)
    	);
    	
    	shift_register(
    		.d(a),
    		.si(b),
    		.q(shiftreg_result)
    	)
    	//insert 4 bit shifter?
    	
    	nand_1b (
    		.x(a),
    		.y(b),
    		.o(nand1b_result)
    	)
    	
    	nor_1b (
    		.x(a),
    		.y(b),
    		.o(nor1b_result)
    	)
    	
    	not_1b (
    		.x(a),
    		.o(not1b_result)
    	)
    	
    	always @(*) begin
        	case (op_code)
            		4'b0000: begin
                	result = not_result;
            	end
            		4'b0001: begin
                	result = and_result;
            	end
            		4'b0010: begin
                	result = nand_result;
            	end
            		4'b0011: begin
                	result = or_result;
            	end
            		4'b0100: begin
                	result = nor_result;
            	end
            		4'b0101: begin
                	result = xor_result;
            	end
            	        4'b0110: begin
                	result = xnor_result;
            	end
            	        4'b0111: begin
                	result = shift_result;
            	end
            	        4'b1000: begin
                	result = Addition;
            	end
            	        4'b1001: begin
                	result = Subtraction;
            	end
            	        4'b1010: begin
                	result = Multiplication;
            	end
            	        4'b1011: begin
                	result = Divider;
            	end
            	default: begin
                	result = 4'b0000;
            	end
        endcase
end

endmodule
