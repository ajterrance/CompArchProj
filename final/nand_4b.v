module nand_4b(x, y, o);

    //4-bit inputs and output
    output [3:0] o;
    input [3:0] x;
    input [3:0] y;

    assign o = !(x & y);

endmodule;