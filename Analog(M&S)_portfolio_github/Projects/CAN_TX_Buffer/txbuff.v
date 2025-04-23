
module tx_buff (
    input clk,
    input g_rst,                 // Global reset signal (active low)
    input [7:0] data_in,         // Data input from host controller
    input [9:0] tx_buff_ld,      // Load transmit buffer signals for each buffer
    input tx_success,            // Transmission success signal
    output reg frame_gen_intl,   // Buffer status: 1 if full, 0 if empty
    output reg tx_buff_busy,     // Buffer status: 1 if loaded, 0 if empty
    output reg [7:0] tx_buff_1,  // Transmit buffers
    output reg [7:0] tx_buff_2,  // Transmit buffers
    output reg [7:0] tx_buff_3,  // Transmit buffers
    output reg [7:0] tx_buff_4,  // Transmit buffers
    output reg [7:0] tx_buff_5,  // Transmit buffers
    output reg [7:0] tx_buff_6,  // Transmit buffers
    output reg [7:0] tx_buff_7,  // Transmit buffers
    output reg [7:0] tx_buff_8,  // Transmit buffers
    output reg [7:0] tx_buff_9,  // Transmit buffers
    output reg [7:0] tx_buff_10, // Transmit buffers
    output reg rtr,              // Remote transfer request bit
    output reg [3:0] dlc         // Data length code
);

    // Internal signals
    reg [7:0] tx_data[9:0];       // Transmit buffer data for each buffer
    reg [1:0] state[9:0];          // State register for FSM for each buffer
    reg [3:0] buffer_index[9:0];   // Index to current buffer slot for each buffer
    reg [7:0] data_reg[9:0];       // Register to store incoming data for each buffer

    // FSM states
    parameter IDLE = 2'b00;
    parameter BUFFER_LOAD = 2'b01;
    parameter TRANSMIT = 2'b10;
    

    // FSM for each buffer
    integer i;
    always @ (posedge clk or posedge g_rst) begin
        if (g_rst) begin
            for (i = 0; i < 10; i = i + 1) begin
                state[i] <= IDLE;
                buffer_index[i] <= 0;
                data_reg[i] <= 8'd0;
                tx_data[i] <= 8'd0;
            end
            frame_gen_intl <= 1'b0;
            tx_buff_busy <= 1'b0;
            tx_buff_1 <= 8'd0;
            tx_buff_2 <= 8'd0;
            // Continue for tx_buff_3 to tx_buff_10
            rtr <= 1'b0;
            dlc <= 4'd0;
        end else begin
            for (i = 0; i < 10; i = i + 1) begin
                case (state[i])
                    IDLE: begin
                        if (tx_buff_ld[i]) begin
                            state[i] <= BUFFER_LOAD;
                            data_reg[i] <= data_in;
                        end
                    end
                    BUFFER_LOAD: begin
                        if (buffer_index[i] < 10) begin
                            tx_data[i] <= data_reg[i];
                            buffer_index[i] <= buffer_index[i] + 1;
                            frame_gen_intl<=1'b0;
                        end
                        if (buffer_index[i] == 10) begin
                            frame_gen_intl <= 1'b1;
                            state[i] <= TRANSMIT;
                        end
                    end
                    TRANSMIT: begin
                        if (tx_success) begin
                            tx_buff_busy <= 1'b1;
                            buffer_index[i] <= 0;
                            state[i] <= IDLE;
                        end
                    end
                    default: state[i] <= IDLE;
                endcase
            end
        end
    end

    // Assign outputs for each buffer
    always @* begin
        for (i = 0; i < 10; i = i + 1) begin
            case (i)
                0: begin tx_buff_1 = tx_data[i]; rtr = tx_data[i][4]; dlc = tx_data[i][3:0]; end
                1: begin tx_buff_2 = tx_data[i]; rtr = tx_data[i][4]; dlc = tx_data[i][3:0]; end
                2: begin tx_buff_3 = tx_data[i]; rtr = tx_data[i][4]; dlc = tx_data[i][3:0]; end
                3: begin tx_buff_4 = tx_data[i]; rtr = tx_data[i][4]; dlc = tx_data[i][3:0]; end
                4: begin tx_buff_5 = tx_data[i]; rtr = tx_data[i][4]; dlc = tx_data[i][3:0]; end
                5: begin tx_buff_6 = tx_data[i]; rtr = tx_data[i][4]; dlc = tx_data[i][3:0]; end
                6: begin tx_buff_7 = tx_data[i]; rtr = tx_data[i][4]; dlc = tx_data[i][3:0]; end
                7: begin tx_buff_8 = tx_data[i]; rtr = tx_data[i][4]; dlc = tx_data[i][3:0]; end
                8: begin tx_buff_9 = tx_data[i]; rtr = tx_data[i][4]; dlc = tx_data[i][3:0]; end
                9: begin tx_buff_10= tx_data[i]; rtr = tx_data[i][4]; dlc = tx_data[i][3:0]; end
           
                // Continue for the rest of the buffers
            
            endcase
        end
    end

endmodule

