module top_module (
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
