module tb_flit_crossbar5;
    timeunit 1ns; timeprecision 1ps;
    reg clk=0;
    always #5 clk=~clk;
    reg rst_n=0;
    reg [159:0] s_data=0;
    reg [4:0] s_valid=0;
    wire [4:0] s_ready, m_valid;
    wire [159:0] m_data;
    reg [4:0] m_ready=5'b00100;
    integer i, accepted=0;
    flit_crossbar5 dut(
        .clk(clk), .rst_n(rst_n),
        .s_data(s_data), .s_valid(s_valid), .s_ready(s_ready),
        .m_data(m_data), .m_valid(m_valid), .m_ready(m_ready)
    );
    always @(posedge clk) if (rst_n) begin
        if (m_valid[2] && m_ready[2] && accepted < 5) begin
            if (m_data[2*32 +: 5] !== accepted[4:0])
                $fatal(1, "Round-robin ordering failed at %0d", accepted);
            accepted <= accepted + 1;
            s_valid[accepted] <= 0;
        end
    end
    initial begin
        for (i=0; i<5; i=i+1)
            s_data[i*32 +:32] = {3'd2, 24'd0, i[4:0]};
        #23; rst_n=1;
        @(negedge clk); s_valid=5'b11111; m_ready=0;
        repeat (3) @(posedge clk);
        if (!m_valid[2] || s_ready != 0 || m_data[2*32 +:5] !== 5'd0)
            $fatal(1, "Backpressure failed");
        @(negedge clk); m_ready=5'b00100;
        wait (accepted==5);
        @(negedge clk);
        if (s_valid != 0) $fatal(1, "Input handshakes missing");
        $display("PASS: five-port flit arbitration, round-robin order and backpressure");
        $finish;
    end
    initial begin #15000; $fatal(1, "Watchdog timeout"); end
endmodule
