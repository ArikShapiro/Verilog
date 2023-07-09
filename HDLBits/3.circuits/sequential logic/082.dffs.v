module top_module (
    input clk,
    input [7:0] d,
    output [7:0] q
);
    integer i;
    
    always @(posedge clk)
        begin
            for(i=0; i<8; i++)
                q[i] <= d[i];    
            
        end
endmodule
