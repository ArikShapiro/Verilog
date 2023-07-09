module top_module (
    input clk,
    input x,
    output z
);
    wire [2:0] d,q;
    assign d[0] = x ^ q[0];
    assign d[1] = x & (~(q[1]));
    assign d[2] = x | (~(q[2]));
    
    always @(posedge clk) begin
        q[0] <= d[0];
        q[1] <= d[1];
        q[2] <= d[2];
    end
    assign z = ~(|q);

endmodule