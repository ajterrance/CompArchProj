module xnor_4b(
    input wire [3:0] A, //first 4-bit input 
    input wire [3:0] B, //second 4-bit input
    output wire [3:0] Y //4-bit output
);
    assign Y = ~(A ^ B);
endmodule