module top_module (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
);
    integer i;
    reg [7:0] in_reg;
    
    always @(posedge clk) begin
        for(i=0;i<8;i++) begin
            if ((in[i] == 1'b1)&(in_reg[i] == 1'b0)) begin anyedge[i] <= 1'b1; end
            else if ((in[i] == 1'b0)&(in_reg[i] == 1'b1)) begin anyedge[i] <= 1'b1; end
            else begin anyedge[i] <= 1'b0; end
        end
        in_reg <= in;
    end

endmodule
