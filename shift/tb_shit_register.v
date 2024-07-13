module tb_shift_register;

	/* Create a regular pulsing clock. */
	reg clk = 0;
	always #5 clk = ~clk; // Toggle clock every 5 time units

	// Test inputs
	reg reset = 0;
	reg load = 0;
	reg si = 0;
	reg [3:0] d = 0;

	// Output wire
	wire [3:0] q;

	// Instantiate the shift register
	shift_register uut (
		.clk(clk),
		.reset(reset),
		.load(load),
		.d(d),
		.si(si),
		.q(q)
	);

	// Initial block for stimulus
	initial begin
		// Monitor changes
		$monitor("At time %t: reset = %b, load = %b, si = %b, d = %b, q = %b",
			$time, reset, load, si, d, q);

	// Reset the shift register
	reset = 1; #10;
	reset = 0; #10;

	// Load data into the shift register
	load = 1; d = 4'b1001; #10;
	load = 0; si = 1; #10;

	// Shift operation
	#10;
	si = 0; #10;
	si = 1; #10;

	// Final reset
	reset = 1; #10;
	reset = 0; #10;

	// Finish simulation
	$finish;
end

	// VCD dump for waveform generation
	initial begin
		$dumpfile("shift_register.vcd");
		$dumpvars(0, tb_shift_register);
	end
endmodule 
