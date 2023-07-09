module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss);
    
    reg [2:0] ena_reg;
    assign ena_reg[0] = ena;
    assign ena_reg[1] = (ena && (ss == 8'h59)) ? 1'b1 : 1'b0;
    assign ena_reg[2] = (ena && (mm == 8'h59) && (ss == 8'h59)) ? 1'b1 : 1'b0;
                         
    ss_or_mm_counter css (.clk(clk), .reset(reset), .ena(ena_reg[0]), .q(ss));
    ss_or_mm_counter cmm (.clk(clk), .reset(reset), .ena(ena_reg[1]), .q(mm));
    hh_counter chh (.clk(clk), .reset(reset), .ena(ena_reg[2]), .q(hh));
    
    always @(posedge clk) begin
        if(reset) pm <=0;
        if(ena_reg[2]) begin // if its time to increment the hours' counter
            if(hh == 8'h11) pm <= ~pm; // PM->AM or AM->PM
        end
    end
                                                     
endmodule
   
// Need to count the units and dozens seperatly to match the simulator's testbench                                              
module ss_or_mm_counter(
	input clk,
    input reset,
    input ena,
    output [7:0] q);
    
    always @(posedge clk) begin
        if(reset) q <= 8'h0; // reset
        else begin
            if(ena) begin 
                if(q[3:0] == 4'h9) begin // units' digit = 9
                    if(q[7:4] == 4'h5) q <= 8'h0; // 59 seconds passed
                    else begin
                        q[7:4] <= q[7:4] + 1'h1;
                        q[3:0] <= 4'h0;
                    end 
                end
                else q[3:0] <= q[3:0] + 1'h1; // units < 9 , no need to change the dozens' digit
            end
            else q <= q; // not enabled
        end
    end
endmodule


// Need to count the units and dozens seperatly to match the simulator's testbench                         
module hh_counter  (
    input clk,
    input reset,
    input ena,
    output reg[7:0] q);
    
    // will count from 1 to 12
    
    always @(posedge clk) begin
        if(reset) q <= 8'h12; // reset
        else begin
            if(ena) begin
                if(q == 8'h12)  q <= 8'h1; // increment 12 to 1 (13 mod 12 = 1)
                else begin
                    if(q[3:0] == 4'h9) begin // units' digit = 9
                        q[3:0] <= 4'h0;
                        q[7:4] <= q[7:4] + 1'h1;
                    end
                    else q[3:0] = q[3:0] + 1'h1; // units < 9 , no need to change the dozens' digit
                end
            end
            else q <= q; // not enabled
        end
    end
    
endmodule

