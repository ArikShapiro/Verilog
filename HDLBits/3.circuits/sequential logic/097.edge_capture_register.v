module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
        integer i;
    reg [31:0] in_reg;
    
    always @(posedge clk) begin
        if(reset) out <= 32'b0;
        else begin
            for(i=0;i<32;i++) begin
            if ((in[i] == 1'b0)&(in_reg[i] == 1'b1)) begin out[i] <= 1'b1; end
            end
        end
        
        in_reg <= in;
    end

endmodule
