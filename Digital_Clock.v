//==============================================================
// Digital Clock 
//==============================================================

module digital_clock(
    input clk,          // 1 Hz clock
    input reset,
    output reg [5:0] sec,
    output reg [5:0] min,
    output reg [4:0] hour
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        sec  <= 0;
        min  <= 0;
        hour <= 0;
    end
    else begin
        if (sec == 59) begin
            sec <= 0;

            if (min == 59) begin
                min <= 0;

                if (hour == 23)
                    hour <= 0;
                else
                    hour <= hour + 1;
            end
            else
                min <= min + 1;
        end
        else
            sec <= sec + 1;
    end
end

endmodule

//==============================================================
// Testbench for Digital Clock
//==============================================================

`timescale 1ns/1ps

module digital_clock_tb;

reg clk;
reg reset;

wire [5:0] sec;
wire [5:0] min;
wire [4:0] hour;

// Instantiate DUT
digital_clock uut (
    .clk(clk),
    .reset(reset),
    .sec(sec),
    .min(min),
    .hour(hour)
);

// Clock Generation (10 ns period)
always #5 clk = ~clk;

initial begin
    clk = 0;
    reset = 1;

    #10 reset = 0;

    // Run for enough time to observe clock operation
    #700000;

    $finish;
end

// Monitor Output
initial begin
    $display(" Time(ns)\tHour\tMin\tSec");
    $monitor("%8t\t%2d\t%2d\t%2d",
              $time, hour, min, sec);
end

endmodule
