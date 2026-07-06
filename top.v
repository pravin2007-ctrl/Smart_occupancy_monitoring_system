`timescale 1ns/1ps
module top (
    input clk,
    input rst_n,
    input sensor_a,
    input sensor_b,
    output [2:0] occupancy,
    output max_limit,
    output empty_alarm
);

parameter MAX_CAPACITY = 5;

wire [2:0] count;
wire alert;
wire room_empty;

simple_occupancy u1 (
    .clk(clk),
    .rst(~rst_n),
    .A(~sensor_a),
    .B(~sensor_b),
    .count(count),
    .alert(alert),
    .room_empty(room_empty)
);

assign occupancy   = count;
assign max_limit   = alert;
assign empty_alarm = room_empty;

endmodule