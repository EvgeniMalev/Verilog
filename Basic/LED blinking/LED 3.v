module led_blink (
    input wire clk,        
    input wire rst,        
    output reg [2:0] led   
);
    parameter LED0_DIV = 25_000_000; 
    parameter LED1_DIV = 50_000_000; 
    parameter LED2_DIV = 75_000_000; 
  
    reg [31:0] counter0 = 0;
    reg [31:0] counter1 = 0;
    reg [31:0] counter2 = 0;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            counter0 <= 0;
            counter1 <= 0;
            counter2 <= 0;
            led <= 3'b000;
        end else begin

            if (counter0 >= LED0_DIV) begin
                counter0 <= 0;
                led[0] <= ~led[0];
            end else begin
                counter0 <= counter0 + 1;
            end

            if (counter1 >= LED1_DIV) begin
                counter1 <= 0;
                led[1] <= ~led[1];
            end else begin
                counter1 <= counter1 + 1;
            end

            if (counter2 >= LED2_DIV) begin
                counter2 <= 0;
                led[2] <= ~led[2];
            end else begin
                counter2 <= counter2 + 1;
            end
        end
    end

endmodule
