module flit_crossbar5 #(
    parameter integer DATA_W = 32
) (
    input  wire                     clk,
    input  wire                     rst_n,
    input  wire [5*DATA_W-1:0]      s_data,
    input  wire [4:0]               s_valid,
    output reg  [4:0]               s_ready,
    output reg  [5*DATA_W-1:0]      m_data,
    output reg  [4:0]               m_valid,
    input  wire [4:0]               m_ready
);
    reg [2:0] next_priority [0:4];
    reg [2:0] winner [0:4];
    reg [4:0] winner_valid;
    integer out_port, step, candidate, source_port;

    always @* begin
        s_ready = 0;
        m_data = 0;
        m_valid = 0;
        winner_valid = 0;
        for (out_port=0; out_port<5; out_port=out_port+1) begin
            winner[out_port] = 0;
            for (step=0; step<5; step=step+1) begin
                candidate = next_priority[out_port] + step;
                if (candidate >= 5) candidate = candidate - 5;
                if (!winner_valid[out_port] && s_valid[candidate] &&
                    s_data[candidate*DATA_W + DATA_W-1 -: 3] == out_port[2:0]) begin
                    winner_valid[out_port] = 1;
                    winner[out_port] = candidate[2:0];
                    m_data[out_port*DATA_W +: DATA_W] = s_data[candidate*DATA_W +: DATA_W];
                    m_valid[out_port] = 1;
                    s_ready[candidate] = m_ready[out_port];
                end
            end
        end
    end

    integer j;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            for (j=0; j<5; j=j+1) next_priority[j] <= 0;
        end else begin
            for (j=0; j<5; j=j+1) begin
                if (m_valid[j] && m_ready[j])
                    next_priority[j] <= (winner[j] == 4) ? 0 : winner[j]+1'b1;
            end
        end
    end
endmodule
