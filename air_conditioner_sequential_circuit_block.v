`include "constant.vh"

module air_conditioner(
    input clk,
    input reset,
    input [`temperature_sensor_data_width-1:0] temp,
    input [`motion_sensor_data_width-1:0] presence,
    input [`window_sensor_data_width-1:0] window,
    input [`heating_system_on_off_data_width-1:0] heating_system,            
    output reg ac_cool
    );

    wire high_temp = (temp > temp_treshold);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            ac_cool <= 0;
        end else begin
            ac_cool <= (~heating_system) & (high_temp & presence & ~window);
        end
    end
endmodule
