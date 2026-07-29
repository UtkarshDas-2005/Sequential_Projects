//==============================================================
// Pulse Generator
//==============================================================

module pulse_generator #(
    parameter COUNT_MAX = 49
)(
    input  wire clk,
    input  wire reset,
    output reg  pulse
);

    reg [31:0] count;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            count <= 32'd0;
            pulse <= 1'b0;
        end
        else begin
            if (count == COUNT_MAX) begin
                count <= 32'd0;
                pulse <= 1'b1;
            end
            else begin
                count <= count + 1'b1;
                pulse <= 1'b0;
            end
        end
    end

endmodule

//==============================================================
// Testbench for Pulse Generator
//==============================================================

module tb_pulse_generator;

    reg clk;
    reg reset;
    wire pulse;

    //==========================================================
    // Instantiate Pulse Generator
    //==========================================================

    pulse_generator #(
        .COUNT_MAX(4)
    ) uut (
        .clk(clk),
        .reset(reset),
        .pulse(pulse)
    );

    //==========================================================
    // Clock Generation
    // Clock Period = 10 ns
    //==========================================================

    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end

    //==========================================================
    // Test Sequence
    //==========================================================

    initial begin
        reset = 1'b1;

        #20;
        reset = 1'b0;

        #200;

        $finish;
    end

    //==========================================================
    // Waveform Generation
    //==========================================================

    initial begin
        $dumpfile("pulse_generator.vcd");
        $dumpvars(0, tb_pulse_generator);
    end

    //==========================================================
    // Monitor Output
    //==========================================================

    initial begin
        $monitor("Time = %0t | Reset = %b | Pulse = %b",
                 $time, reset, pulse);
    end

endmodule
