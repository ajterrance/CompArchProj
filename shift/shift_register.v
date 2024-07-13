module shift_register(
    input clk,       
    input reset,  
    input load,   
    input [3:0] d,
    input si,   
    output reg [3:0] q 
    //formatting the modules inputs and outputs
);

	always @(posedge clk or posedge reset) begin
	        if (reset) begin
			q <= 4'b0000;  // Reset shift register on reset signal
		end else if (load) begin
			q<=d; //updates with the value of d?
		end else begin
			q<={si,q[3:1]}; //shift bits to right
		end
	end
endmodule
