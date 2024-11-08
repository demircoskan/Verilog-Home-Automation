`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.11.2024 02:28:28
// Design Name: 
// Module Name: heating_system
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

module heating_system(
input [`temperature_sensor_data_width-1:0] temp,
input [`motion_sensor_data_width-1:0] presence,
input [`window_sensor_data_width-1:0] window,
input [`ac_cool_data_width-1:0] heating_system,            
output heating_system
    );
    wire low_temp = (temp < temp_treshold);
    assign heating_system = ~ac_cool & low_temp & presence & ~window;
endmodule
