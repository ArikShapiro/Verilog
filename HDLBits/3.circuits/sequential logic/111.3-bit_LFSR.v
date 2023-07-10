module top_module (
	input [2:0] SW,      // R
    input [1:0] KEY,     // L and clk (clk = key[0] , L = key[1])
	output [2:0] LEDR);  // Q
    
    wire q0,q1,q2;
    
    mux_and_dff mff0 (.clk(KEY[0]), .L(KEY[1]), .r_in(SW[0]), .q_in(q2), .Q(q0));
    mux_and_dff mff1 (.clk(KEY[0]), .L(KEY[1]), .r_in(SW[1]), .q_in(q0), .Q(q1));
    mux_and_dff mff2 (.clk(KEY[0]), .L(KEY[1]), .r_in(SW[2]), .q_in(q1^q2), .Q(q2));
    assign LEDR = {q2,q1,q0};

endmodule

module mux_and_dff (
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
