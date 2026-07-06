`timescale 1ns/1ps
module simple_occupancy (
    input clk,
    input rst,
    input A,
    input B,
    output reg [2:0] count,
    output reg alert,
    output reg room_empty
);

parameter MAX_LIMIT = 5;

reg [1:0] state;

localparam IDLE       = 2'b00,
           A_DET      = 2'b01,
           B_DET      = 2'b10,
           WAIT_CLEAR = 2'b11;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        state      <= IDLE;
        count      <= 0;
        alert      <= 0;       
        room_empty <= 1;
    end else begin
        case (state)

            IDLE: begin
                if (A && !B)
                    state <= A_DET;
                else if (B && !A)
                    state <= B_DET;
            end

            A_DET: begin
                if (A && B) begin
                    if (count < MAX_LIMIT)
                        count <= count + 1;
                    state <= WAIT_CLEAR;
                end
                else if (!A)
                    state <= IDLE;
            end

            B_DET: begin
                if (A && B) begin
                    if (count > 0)
                        count <= count - 1;
                    state <= WAIT_CLEAR;
                end
                else if (!B)
                    state <= IDLE;
            end

            WAIT_CLEAR: begin
                if (!A && !B)
                    state <= IDLE;
            end

        endcase
    end

    alert      <= (count >= MAX_LIMIT);
    room_empty <= (count == 0);

end

endmodule