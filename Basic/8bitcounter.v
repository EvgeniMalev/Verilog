module test_counter;
    reg preset, clear, clock, data;
    wire [7:0] q;

    counter ci1(q, clock, preset, clear);
    counter_behav ci2(q, clock, preset, clear);

    initial begin
        clock = 0;
        forever #50 clock = ~clock; 
    end

    initial begin
        $monitor("time=%d preset=%d clear=%d clock=%d q[0]=%d q[1]=%d q[2]=%d q[3]=%d q[4]=%d q[5]=%d q[6]=%d q[7]=%d",
                 $time, preset, clear, clock, q[0], q[1], q[2], q[3], q[4], q[5], q[6], q[7]);
        preset = 0;
        clear = 1;
        #200; 

        preset = 1;
        clear = 0;
        #200;

        preset = 1;
        clear = 1;
        #200;

        #200;

        data = 0;
        #1600;

        $finish;
    end
endmodule
