module top_module (
    input clk,
    input reset,            // Synchronous reset
    input [7:0] d,
    output [7:0] q
);
        integer i;
    
    always @(posedge clk)
        if(reset) q <= 8'b0;
    else
        begin
            for(i=0; i<8; i++)
                q[i] <= d[i];    
            
        end
    

endmodule
