module top_module(
    input clk,
    input load,
    input [511:0] data,
    output reg [511:0] q
); 
    function automatic bit find_out(input int i, input [511:0] data);
        reg [2:0] x;
        bit result;
        begin
            if (i == 0) 
                x = {data[1], data[0], 1'b0};
            else if (i == 511)
                x = {1'b0, data[511], data[510]};
            else
                x = {data[i+1], data[i], data[i-1]};
            case (x)
                3'b111: result = 0;
                3'b110: result = 1;
                3'b101: result = 1;
                3'b100: result = 0;
                3'b011: result = 1;
                3'b010: result = 1;
                3'b001: result = 1;
                3'b000: result = 0;
                default: result = 0;
            endcase
            return result;
        end
    endfunction

    reg [511:0] next_q;
    always @ (posedge clk) begin
        if (load)
            q <= data;
        else begin
            for (int i = 0; i < 512; i++)
                q[i] <= find_out(i, q);
        end
    end
endmodule

