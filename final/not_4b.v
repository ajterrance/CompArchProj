module not_4b(
    input wire [3:0] A, //4-bit input
    output wire [3:0] Y //4-bit output
);
    assign Y = ~A;
endmodule