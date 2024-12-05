`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.11.2024 02:13:04
// Design Name: 
// Module Name: air_conditioner
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

module air_conditioner(
input [`temperature_sensor_data_width-1:0] temp,
input [`motion_sensor_data_width-1:0] presence,
input [`window_sensor_data_width-1:0] window,
input [`heating_system_on_off_data_width-1:0] heating_system,            
output ac_cool
    );
    //Data Flow Modelling
    wire high_temp = (temp > temp_treshold);
    assign ac_cool = (~heating_system) & (high_temp & presence & ~window);
endmodule

    //Behavioral Modelling
always @(*) begin
        if (~heating_system && (temp > `temp_treshold) && presence && ~window) begin
            ac_cool = 1;
        end else begin
            ac_cool = 0;
        end
    end    
endmodule
