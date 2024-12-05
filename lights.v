`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.11.2024 01:35:08
// Design Name: 
// Module Name: lights
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

module lights(
input [`daylight_sensor_data_width-1:0] daylight,
input [`motion_sensor_data_width-1:0] presence,
output lights
    );
    //Data Flow Modelling
    wire low_light = (daylight < light_threshold);
    assign lights = low_light & presence;
endmodule
    
    //Behavioral Modelling
always @(*) begin
        if (daylight < `light_threshold && presence) begin
            lights = 1;
        end else begin
            lights = 0;
        end
    end   
endmodule
