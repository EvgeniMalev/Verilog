/*
This is an example of 555 timer with clock time 
of 100 ms
*/


module timer_555 (
    input wire clk,         
    input wire rst_n,       
    output reg out          
);

    parameter HIGH_TIME = 10;  
    parameter LOW_TIME = 10;   

    parameter HIGH = 1'b0;
    parameter LOW  = 1'b1;

    reg state;
    reg [3:0] counter;  

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state <= HIGH;
            counter <= 0;
            out <= 0;
        end else begin
            case (state)
                HIGH: begin
                    if (counter < HIGH_TIME - 1) begin
                        counter <= counter + 1;
                    end else begin
                        counter <= 0;
                        state <= LOW;
                        out <= 0;
                    end
                end
                LOW: begin
                    if (counter < LOW_TIME - 1) begin
                        counter <= counter + 1;
                    end else begin
                        counter <= 0;
                        state <= HIGH;
                        out <= 1;
                    end
                end
            endcase
        end
    end

endmodule
