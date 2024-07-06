module simple_register (
    input wire clk,         
    input wire reset,      
    input wire enable,      
    input wire [7:0] d,     
    output reg [7:0] q      
);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            q <= 8'b0; 
        end else if (enable) begin
            q <= d;   
        end
    end

endmodule
