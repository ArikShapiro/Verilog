module top_module(
    input clk,
    input reset,    // Active-high synchronous reset to 32'h1
    output [31:0] q
);
    integer i;
    
    always @(posedge clk) begin
        if(reset) q <= 32'h1;
        else begin
            for(i=0; i<32; i++) begin
                if(i == 0| i==1 | i==21) q[i] <= q[i+1] ^ q[0];
                else if(i == 31) q[i] <= q[0] ^ 1'b0;
                else q[i] <= q[i+1];       
            end     
        end
    end

endmodule
