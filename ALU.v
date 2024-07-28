module alu (
    	input [3:0] a,           // 4-bit input A
    	input [3:0] b,           // 4-bit input B
    	input [2:0] op_code,     // Operation code to select the ALU operation
    	output reg [3:0] result, // 4-bit result
);


    	wire [3:0] Addition, Subtraction, Divider, Multiplication, 
    	and_result, nand_result, nor_result, not_result, or_result, xor_result,	
    	xnor_result, shiftreg_result;
    	
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
            		3'b000: begin
                	result = add_result;
            	end
            		3'b001: begin
                	result = sub_result;
            	end
            		3'b010: begin
                	result = and_result;
            	end
            	// Add more cases for other operations
            	default: begin
                	result = 4'b0000;
            	end
        endcase
end

endmodule
