module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
); //

    wire [3:0] Q0,Q1,Q2;
    assign c_enable[0] = 1'b1; // fastest counter
    assign c_enable[1] = (Q0 == 4'd9)? 1'b1:1'b0;
    assign c_enable[2] = ((Q0 == 4'd9) & (Q1 == 4'd9))? 1'b1:1'b0; // slowest counter
    
    bcdcount counter0 (clk, reset, c_enable[0], Q0);
    bcdcount counter1 (clk, reset, c_enable[1], Q1);
    bcdcount counter2 (clk, reset, c_enable[2], Q2);
    
    assign OneHertz = ((Q0 == 4'd9) & (Q1 == 4'd9) & (Q2 == 4'd9))? 1'b1:1'b0;
    
endmodule
