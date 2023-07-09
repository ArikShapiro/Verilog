module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
    
    assign ena[1] = (q[3:0] == 4'd9) ? 1'b1:1'b0;
    assign ena[2] = (q[7:4] == 4'd9 && q[3:0] == 4'd9) ? 1'b1:1'b0;
    assign ena[3] = (q[11:8] == 4'd9 && q[7:4] == 4'd9 && q[3:0] == 4'd9) ? 1'b1:1'b0;
              
    counter ones_counter(.clk(clk), .reset(reset), .ena(1'b1), .q(q[3:0]));
    counter tens_counter(.clk(clk), .reset(reset), .ena(ena[1]), .q(q[7:4]));
    counter hundreds_counter(.clk(clk), .reset(reset), .ena(ena[2]), .q(q[11:8]));
    counter thousands_counter(.clk(clk), .reset(reset), .ena(ena[3]), .q(q[15:12]));
   
endmodule

module counter  (
    input clk,
    input reset,
    input ena,
    output reg[3:0] q);
    
    always @(posedge clk) begin
        if(reset) q <= 4'd0;
        else begin
            if(ena) begin
                if(q == 4'd9) q <= 4'd0;
                else q <= q + 4'd1;
            end
        end
    end
    
endmodule
