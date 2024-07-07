module subtractor_4bit(
    input [3:0] A,     
    input [3:0] B,     
    output [3:0] Diff, 
    output Borrow      
);

wire [3:0] B_comp; 
wire [3:0] sum;   
wire borrow_out;   

assign B_comp = ~B + 4'b0001;

assign {borrow_out, sum} = A + B_comp;

assign Diff = sum;
assign Borrow = borrow_out;

endmodule
