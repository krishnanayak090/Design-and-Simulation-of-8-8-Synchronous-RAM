`timescale 1ns / 1ps

module tb_ram_8x8;

    reg clk;
    reg reset;
    reg [2:0] address;
    reg [7:0] data_in;
    reg write_enable;
    reg read_enable;
    wire [7:0] data_out;

    ram_8x8 uut (
        .clk(clk),
        .reset(reset),
        .address(address),
        .data_in(data_in),
        .write_enable(write_enable),
        .read_enable(read_enable),
        .data_out(data_out)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(1, tb_ram_8x8);

        clk = 0;
        reset = 1;
        write_enable = 0;
        read_enable = 0;
        address = 3'd0;
        data_in = 8'd0;

        #10 reset = 0;

        // Write operations
        #10 address = 3'd1; data_in = 8'hA5; write_enable = 1;
        #10 write_enable = 0;

        #10 address = 3'd2; data_in = 8'h3C; write_enable = 1;
        #10 write_enable = 0;

        #10 address = 3'd4; data_in = 8'hF0; write_enable = 1;
        #10 write_enable = 0;

        // Read operations
        #10 address = 3'd1; read_enable = 1;
        #10 read_enable = 0;

        #10 address = 3'd2; read_enable = 1;
        #10 read_enable = 0;

        #10 address = 3'd4; read_enable = 1;
        #10 read_enable = 0;

        #20 $finish;
    end

endmodule
