`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.03.2024 13:35:58
// Design Name: 
// Module Name: testbench
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

module tb_tx_buff;

    // Inputs
    reg clk;
    reg g_rst;
    reg [7:0] data_in;
    reg [9:0] tx_buff_ld;
    reg tx_success;

    // Outputs
    wire frame_gen_intl;
    wire tx_buff_busy;
    wire [7:0] tx_buff_1, tx_buff_2, tx_buff_3, tx_buff_4, tx_buff_5;
    wire [7:0] tx_buff_6, tx_buff_7, tx_buff_8, tx_buff_9, tx_buff_10;
    wire rtr;
    wire [3:0] dlc;

    // Instantiate the tx_buff module
    tx_buff dut (
        .clk(clk),
        .g_rst(g_rst),
        .data_in(data_in),
        .tx_buff_ld(tx_buff_ld),
        .tx_success(tx_success),
        .frame_gen_intl(frame_gen_intl),
        .tx_buff_busy(tx_buff_busy),
        .tx_buff_1(tx_buff_1),
        .tx_buff_2(tx_buff_2),
        .tx_buff_3(tx_buff_3),
        .tx_buff_4(tx_buff_4),
        .tx_buff_5(tx_buff_5),
        .tx_buff_6(tx_buff_6),
        .tx_buff_7(tx_buff_7),
        .tx_buff_8(tx_buff_8),
        .tx_buff_9(tx_buff_9),
        .tx_buff_10(tx_buff_10),
        .rtr(rtr),
        .dlc(dlc)
    );

    // Clock generation
    always begin
        #5 clk = ~clk; // Toggle clock every 5 time units
    end

    // Initial stimulus
    initial begin
        // Initialize inputs
        clk = 0;
        g_rst = 1;
        data_in = 8'h01;
        tx_buff_ld = 10'b0000000001;
        tx_success = 0;

        // Apply reset
        #10 g_rst = 0;

        // Wait for a few clock cycles
        #20;

        // Apply some test values
        data_in = 8'hAA;
        tx_buff_ld = 10'b0000000010;

        // Wait for simulation to finish
        #10 g_rst = 0;
        
        #30;
        
        data_in = 8'hCC;
        tx_buff_ld = 10'b0000000100;
        
        #10 g_rst = 0;
        
        #40;     
        data_in = 8'hAB;
        tx_buff_ld = 10'b0000001000;
        
        #10 g_rst = 0;
        
        #100;
        
        
        // End simulation
        $finish;
    end

endmodule