module alu(x, y, opcode, o, product);

    input [3:0] x, y, opcode;
    output reg [3:0] o;
    output reg [7:0] product;

    //outputs for all modules
    wire [3:0] and_output, nand_output, or_output, nor_output, 
        xor_output, xnor_output, not_output, shift_output, 
        add_output, sub_output;
    wire [7:0] mult_output, div_output;


    //instantiate modules
    and_4b and0 (.x(x), .y(y), .o(and_output));
    nand_4b nand1 (.x(x), .y(y), .o(nand_output));
    or_4b or2 (.x(x), .y(y), .o(or_output));
    nor_4b nor3  (.x(x), .y(y), .o(nor_output));
    xor_4b xor4 (.A(x), .B(y), .Y(xor_output));
    xnor_4b xnor5 (.A(x), .B(y), .Y(xnor_output));
    not_4b not6 (.A(x), .Y(not_output));
    shifter_4b shifter7 (.A(x), .B(y), .X(shift_output), .Y());
    Addition add8 (.A(x), .B(y), .sum(add_output));
    Subtraction sub9 (.A(x), .B(y), .sum(sub_output));
    Divide div10 (.A(x), .B(y), .result(div_output));
    Multiplier mult11 (.A(x), .B(y), .Product(mult_output));

    always @(*) begin
        case (opcode)
        
            //opcodes  
            4'b0000: o = not_output; 
            4'b0001: o = and_output;
            4'b0010: o = nand_output;
            4'b0011: o = or_output;
            4'b0100: o = nor_output;
            4'b0101: o = xor_output;
            4'b0110: o = xnor_output;
            4'b0111: o = shift_output;
            4'b1000: o = add_output;
            4'b1001: o = sub_output;
            4'b1010: begin
                product = mult_output[7:0];
            end
            4'b1011: begin
                product = div_output[7:0];
            end

        endcase
    end

endmodule