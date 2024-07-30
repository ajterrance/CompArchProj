module shifter_4b(
    input wire [3:0] A,  //first 4-bit input, number to be shifted
    input wire [3:0] B,  //second 4-bit input, number that determines shift
    output reg [3:0] X,  //4-bit shifted result
    output reg [3:0] Y   //4-bit number that was shifted out
);
    always @(*) begin
        X = A;          //assign X to the original value
        Y = 4'b0000;    //assign Y to 0000 to take in shifted out bits from X

        case (B[2:1])
            2'b00: begin
                //no shift
                X = A;
                Y = 4'b0000;
            end
            2'b01: begin
                //shift by 1
                if (B[3]) begin //right shift
                    X = A;
                    Y = {3'b000, B[0]};
                end else begin //left shift
                    X = {A[2:0], B[0]};
                    Y = {3'b000, A[3]};
                end
            end
            2'b10: begin
                //shift by 2
                if (B[3]) begin //right shift
                    X = A;
                    Y = {2'b00, B[0], B[0]};
                end else begin //left shift
                    X = {A[1:0], B[0], B[0]};
                    Y = {2'b00, A[3:2]};
                end
            end
            2'b11: begin
                //shift by 3
                if (B[3]) begin //right shift
                    X = A;
                    Y = {1'b0, B[0], B[0], B[0]};
                end else begin //left shift
                    X = {A[0], B[0], B[0], B[0]};
                    Y = {1'b0, A[3:1]};
                end
            end
        endcase
    end
endmodule