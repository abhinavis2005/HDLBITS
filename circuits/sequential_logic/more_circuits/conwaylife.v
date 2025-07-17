module top_module(
    input clk,
    input load,
    input [255:0] data,
    output [255:0] q ); 
	
    logic [15:0] unpacked [15:0];
    reg [2:0] count;
      function automatic logic [2:0] num_neighbors(
        int x, int y,
        input logic [15:0] data [15:0]
    );
        logic [3:0] a, b;
        logic [2:0] count = 0;

        // grid size
        const int N = 16;

        begin
            a = (x + 1 + N) % N; b = (y     + N) % N; count += data[a][b];
            a = (x     + N) % N; b = (y + 1 + N) % N; count += data[a][b];
            a = (x + 1 + N) % N; b = (y + 1 + N) % N; count += data[a][b];
            a = (x - 1 + N) % N; b = (y + 1 + N) % N; count += data[a][b];
            a = (x - 1 + N) % N; b = (y     + N) % N; count += data[a][b];
            a = (x     + N) % N; b = (y - 1 + N) % N; count += data[a][b];
            a = (x - 1 + N) % N; b = (y - 1 + N) % N; count += data[a][b];
            a = (x + 1 + N) % N; b = (y - 1 + N) % N; count += data[a][b];
        end

        return count;
    endfunction

        
    
    always @ (*) begin
        for (int i = 0; i <16; i++) begin
        	unpacked[i] = q[16*(i+1)-1 -: 16];
        end
    end
    
     
    
    always @ (posedge clk) begin
        if (load)
            q <= data;
        else begin
            for (int i = 0; i <16; i++) begin
                for (int j = 0; j <16; j++) begin
                    count = num_neighbors(i, j, unpacked);
                    case (count)
                        0 : q[16*i + j]  <= 0;
                        1 : q[16*i + j] <= 0;
                        2 : q[16*i + j] <= q[16*i + j];
                        3 : q[16*i + j]  <= 1;
                        default : q[16*i + j] <= 0;
                    endcase
                end
            end
        end
    end
            
endmodule

