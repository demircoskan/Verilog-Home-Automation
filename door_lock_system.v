`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.11.2024 02:49:27
// Design Name: 
// Module Name: door_lock_system
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
`include "constant.vh"

module door_lock_system(
input [`door_motion_sensor_data_width-1:0] door_motion_sensor,
output reg lock_door
    );
    //Data Flow Modelling
    assign lock_door = (door_motion_sensor == 1'b0) ? 1'b1 : 1'b0; 
endmodule

    //Behavioral Modelling
  always @(door_motion_sensor) begin
    if (door_motion_sensor == 1'b0)
        lock_door = 1'b1;
    else  
        lock_door = 1'b0;
  end
endmodule
