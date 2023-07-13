module top_module(
    input clk,
    input load,
    input [255:0] data,
    output [255:0] q ); 

    integer i;
    reg [255:0] next_state;
    reg [3:0] sum;

    always@(posedge clk) begin
        if(load) q <= data;
        else begin
            for(i=0; i<256; i++) begin
                
                if(i == 0) // upper left corner
                    sum = q[1] + q[16] + q[17] + q[240] + q[241] + q[15] + q[31] + q[255];
                else if(i == 15) // upper right corner
                    sum = q[14] + q[16] + q[0] + q[240] + q[254] + q[30] + q[31] + q[255];
                else if(i == 240) // lower left corner
                    sum = q[0] + q[15] + q[239] + q[241] + q[1] + q[224] + q[225] + q[255];
                else if(i == 255) // lower right corner
                    sum = q[0] + q[15] + q[14] + q[224] + q[238] + q[240] + q[239] + q[254];
                else if(0<i & i<15) // top line
                    sum = q[i-1] + q[i+1] + q[i+15] + q[i+16] + q[i+17] + q[i+239] + q[i+240] + q[i+241];
                else if(i%16 == 0) // left line
                    sum = q[i-1] + q[i+1] + q[i+15] + q[i+16] + q[i+17] + q[i-16] + q[i-15] + q[i+31];
                else if(i%16 == 15) // right line
                    sum = q[i-1] + q[i+1] + q[i+15] + q[i+16] + q[i-17] + q[i-16] + q[i-15] + q[i-31];
                else if(240<i & i<255) // lower line
                    sum = q[i-1] + q[i+1] + q[i-17] + q[i-16] + q[i-15] + q[i-239] + q[i-240] + q[i-241];
                else // mid section
                    sum = q[i-1] + q[i+1] + q[i-17] + q[i-16] + q[i-15] + q[i+15] + q[i+16] + q[i+17];
          		
                case(sum)
                    2:next_state[i] = q[i];
                    3:next_state[i] = 1;
                    default:next_state[i] = 0;
                endcase
                
            end
            	q = next_state;
        end
    end
    
endmodule
