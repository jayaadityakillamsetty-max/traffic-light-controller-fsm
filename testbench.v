`timescale 1ns/1ps
module traffic_light_controller_tb;
reg clk;
reg reset;
reg pedestrian;
  wire [1:0] state;
  // Instantiating the DUT
  traffic_light_controller uut (.clk(clk),.reset(reset),.pedestrian(pedestrian),.state(state));
always #5 clk = ~clk;
// Monitor signals
initial
begin
    $monitor("Time=%0t | reset=%b | pedestrian=%b | state=%b",
              $time, reset, pedestrian, state);
end
// Dump waveform for simulation
initial
begin
    $dumpfile("traffic_light.vcd");
    $dumpvars(0, traffic_light_controller_tb);
end
// Test sequence
initial
begin
    // Initializing the signals
    clk = 0;
    reset = 1;
    pedestrian = 0;
    // Apply reset
    #10 reset = 0;
    // Let system run normally
    #50;
    // Pedestrian request event
    pedestrian = 1;
    #20;
    pedestrian = 0;
    // Another pedestrian request later
    #40;
    pedestrian = 1;
    #15;
    pedestrian = 0;
    // Continue simulation
    #80;
    // End simulation
    $finish;
end
endmodule
