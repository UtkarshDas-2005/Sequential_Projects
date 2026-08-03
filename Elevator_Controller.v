//==============================================================
// Elevator Controller (4-Floor FSM)
//==============================================================

module elevator_controller(
    input clk,
    input reset,

    input [1:0] request_floor,   // Requested floor (0-3)
    input request,               // Request button

    output reg [1:0] current_floor,
    output reg door_open,

    output reg moving_up,
    output reg moving_down
);

parameter IDLE      = 2'b00;
parameter MOVE      = 2'b01;
parameter OPEN_DOOR = 2'b10;

reg [1:0] state;
reg [1:0] target_floor;

always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        state <= IDLE;
        current_floor <= 2'd0;
        target_floor <= 2'd0;
        moving_up <= 0;
        moving_down <= 0;
        door_open <= 0;
    end

    else
    begin
        case(state)

        IDLE:
        begin
            moving_up <= 0;
            moving_down <= 0;
            door_open <= 0;

            if(request)
            begin
                target_floor <= request_floor;

                if(request_floor == current_floor)
                    state <= OPEN_DOOR;
                else
                    state <= MOVE;
            end
        end

          
        MOVE:
        begin

            if(current_floor < target_floor)
            begin
                moving_up <= 1;
                moving_down <= 0;
                current_floor <= current_floor + 1;
            end

            else if(current_floor > target_floor)
            begin
                moving_up <= 0;
                moving_down <= 1;
                current_floor <= current_floor - 1;
            end

            if(current_floor == target_floor)
            begin
                moving_up <= 0;
                moving_down <= 0;
                state <= OPEN_DOOR;
            end
        end

    
        OPEN_DOOR:
        begin
            door_open <= 1;
            state <= IDLE;
        end

        default:
            state <= IDLE;

        endcase
    end
end

endmodule

//==============================================================
// Testbench for Elevator Controller
//==============================================================

`timescale 1ns/1ps

module tb_elevator_controller;

reg clk;
reg reset;
reg [1:0] request_floor;
reg request;

wire [1:0] current_floor;
wire door_open;
wire moving_up;
wire moving_down;

elevator_controller uut(
    .clk(clk),
    .reset(reset),
    .request_floor(request_floor),
    .request(request),
    .current_floor(current_floor),
    .door_open(door_open),
    .moving_up(moving_up),
    .moving_down(moving_down)
);

always #5 clk = ~clk;

initial
begin
    clk = 0;
    reset = 1;
    request = 0;
    request_floor = 0;

    #10 reset = 0;

    // Move Ground -> Floor 3
    #10;
    request_floor = 2'd3;
    request = 1;
    #10 request = 0;

    #60;

    // Move Floor 3 -> Floor 1
    request_floor = 2'd1;
    request = 1;
    #10 request = 0;

    #50;

    // Move Floor 1 -> Ground
    request_floor = 2'd0;
    request = 1;
    #10 request = 0;

    #50;

    $finish;
end

initial
begin
    $display("-------------------------------------------------------------");
    $display("Time\tFloor\tUP\tDOWN\tDoor");
    $display("-------------------------------------------------------------");

    $monitor("%0t\t%d\t%b\t%b\t%b",
             $time,
             current_floor,
             moving_up,
             moving_down,
             door_open);
end

endmodule
