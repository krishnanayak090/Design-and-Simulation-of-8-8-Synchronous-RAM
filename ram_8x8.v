module ram_8x8 (
    input clk,
    input reset,
    input [2:0] address,
    input [7:0] data_in,
    input write_enable,
    input read_enable,
    output reg [7:0] data_out
);

    reg [7:0] memory [7:0];
    integer i;

    // Synchronous reset and write
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            for (i = 0; i < 8; i = i + 1)
                memory[i] <= 8'd0;
        end else if (write_enable) begin
            memory[address] <= data_in;
        end
    end

    // Synchronous read
    always @(posedge clk) begin
        if (read_enable)
            data_out <= memory[address];
    end

endmodule
