module top_module (
    input [3:0] SW,
    input [3:0] KEY, // clk = key0, E = key1, L = key2, w = key3
    output [3:0] LEDR 
);  
    MUXDFF mff3 (.clk(KEY[0]), .w(KEY[3]), .R(SW[3]), .E(KEY[1]), .L(KEY[2]), .Q(LEDR[3]));
    MUXDFF mff2 (.clk(KEY[0]), .w(LEDR[3]), .R(SW[2]), .E(KEY[1]), .L(KEY[2]), .Q(LEDR[2]));
    MUXDFF mff1 (.clk(KEY[0]), .w(LEDR[2]), .R(SW[1]), .E(KEY[1]), .L(KEY[2]), .Q(LEDR[1]));
    MUXDFF mff0 (.clk(KEY[0]), .w(LEDR[1]), .R(SW[0]), .E(KEY[1]), .L(KEY[2]), .Q(LEDR[0]));
    
endmodule


module MUXDFF (
    input clk,
    input w, R, E, L,
    output Q
);
    wire e_mux;
    assign e_mux = (E)?w:Q;
    wire l_mux;
    assign l_mux = (L)?R:e_mux; 
    
    always @(posedge clk) begin
    Q <= l_mux;
    end

endmodule