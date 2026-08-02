//=========================================================
// Stopwatch
//=========================================================

module stopwatch (
    input clk,
    input rst,
    input start,
    input stop,
    output reg [6:0] count
);

reg running;

always @(posedge clk or posedge rst)
begin
    if (rst)
    begin
        count <= 0;
        running <= 0;
    end
    else
    begin
        if(start)
            running <= 1;

        if(stop)
            running <= 0;

        if(running)
        begin
            if(count == 99)
                count <= 0;
            else
                count <= count + 1;
        end
    end
end

endmodule

//=========================
// Testbench : Stopwatch
//=========================

`timescale 1ns/1ps

module tb_stopwatch;

reg clk;
reg rst;
reg start;
reg stop;

wire [6:0] count;

stopwatch dut(
    .clk(clk),
    .rst(rst),
    .start(start),
    .stop(stop),
    .count(count)
);

// Clock Generation
initial
begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial
begin

    $display("--------------------------------------");
    $display(" Time\tStart Stop Reset Count");
    $display("--------------------------------------");

    $monitor("%4t\t%b\t%b\t%b\t%d",
              $time,start,stop,rst,count);

    rst = 1;
    start = 0;
    stop = 0;

    #15 rst = 0;

    // Start stopwatch
    #10 start = 1;
    #10 start = 0;

    // Count for some time
    #150;

    // Stop stopwatch
    stop = 1;
    #10 stop = 0;

    // Pause
    #50;

    // Start again
    start = 1;
    #10 start = 0;

    #100;

    // Reset
    rst = 1;
    #10 rst = 0;

    #50;

    $finish;

end

endmodule
