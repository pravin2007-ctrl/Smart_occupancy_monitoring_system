`timescale 1ns/1ps

module tb_occupancy;

reg clk;
reg rst_n;
reg A;
reg B;

wire [2:0] occupancy;
wire max_limit;
wire empty_alarm;

// DUT
top uut (
    .clk(clk),
    .rst_n(rst_n),
    .sensor_a(A),
    .sensor_b(B),
    .occupancy(occupancy),
    .max_limit(max_limit),
    .empty_alarm(empty_alarm)
);

// CLOCK
initial clk = 0;
always #5 clk = ~clk;

// ---------------- TASKS ----------------

// ENTRY
task person_enter;
begin
    @(posedge clk); A=1; B=0;
    @(posedge clk); A=1; B=1;
    @(posedge clk); A=0; B=1;
    @(posedge clk); A=0; B=0;
end
endtask

// EXIT
task person_exit;
begin
    @(posedge clk); A=0; B=1;
    @(posedge clk); A=1; B=1;
    @(posedge clk); A=1; B=0;
    @(posedge clk); A=0; B=0;
end
endtask

// INVALID: A only
task only_A;
begin
    @(posedge clk); A=1; B=0;
    @(posedge clk); A=0; B=0;
end
endtask

// INVALID: B only
task only_B;
begin
    @(posedge clk); A=0; B=1;
    @(posedge clk); A=0; B=0;
end
endtask

// SIMULTANEOUS
task simultaneous_AB;
begin
    @(posedge clk); A=1; B=1;
    @(posedge clk); A=0; B=0;
end
endtask

// DOUBLE A
task double_A;
begin
    @(posedge clk); A=1; B=0;
    @(posedge clk); A=0; B=0;
    @(posedge clk); A=1; B=0;
    @(posedge clk); A=0; B=0;
end
endtask

// DOUBLE B EXIT
task double_B_exit;
begin
    @(posedge clk); A=0; B=1;
    @(posedge clk); A=0; B=0;
    @(posedge clk); A=0; B=1;
    @(posedge clk); A=1; B=1;
    @(posedge clk); A=1; B=0;
    @(posedge clk); A=0; B=0;
end
endtask

// ---------------- MONITOR ----------------
initial begin
    $dumpfile("final.vcd");
    $dumpvars(0, tb_occupancy);

    $monitor("T=%0t | A=%b B=%b | Count=%0d | MaxLimit=%b | Empty=%b",
              $time, A, B, occupancy, max_limit, empty_alarm);
end

// ---------------- TEST SEQUENCE ----------------
initial begin

    $display("\n===== FULL FUNCTIONAL TEST =====");

    // INIT
    rst_n = 0; A = 0; B = 0;
    repeat(2) @(posedge clk);
    rst_n = 1;

    // NORMAL ENTRY / EXIT
    person_enter;
    person_enter;
    person_exit;

    // MAX LIMIT
    repeat(5) person_enter;

    // OVERFLOW CHECK
    person_enter;

    // UNDERFLOW CHECK
    repeat(6) person_exit;

    // INVALID CASES
    only_A;
    only_B;
    double_A;
    simultaneous_AB;

    // NOISE CASE
    person_enter;
    double_B_exit;

    // EMPTY FLAG CHECK
    repeat(5) person_exit;

    // RESET CHECK
    repeat(3) person_enter;
    rst_n = 0;
    repeat(2) @(posedge clk);
    rst_n = 1;

    #50;
    $display("===== END TEST =====");
    $finish;
end

endmodule