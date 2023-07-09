module top_module (
	input clk,
	input L,
	input r_in,
	input q_in,
	output reg Q);
    
    wire in;
    assign in = (L)?r_in:q_in;
    always @(posedge clk) begin
    Q <= in;
    end

endmodule
