module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss); 
	
    always @ (posedge clk) begin
        if (reset) begin
            hh <= {4'd1, 4'd2};
            mm <= {4'd0, 4'd0};
            ss <= {4'd0, 4'd0};
            pm <= 0;
        end
        else begin
            if (ena) begin
                if (hh == {4'd1, 4'd1} && mm == {4'd5, 4'd9} && ss == {4'd5, 4'd9}) begin
                    if (pm == 0) begin
                        hh <= {4'd1, 4'd2};
                        mm <= {4'd0, 4'd0};
                        ss <= {4'd0, 4'd0};
                        pm <= 1;
                    end
                    else begin
                   		hh <= {4'd1, 4'd2};
                        mm <= {4'd0, 4'd0};
                        ss <= {4'd0, 4'd0};
                        pm <= 0;
                    end
                end
                else if (hh == {4'd1, 4'd2} && mm == {4'd5, 4'd9} && ss == {4'd5, 4'd9}) begin
                    	hh <= {4'd0, 4'd1};
                        mm <= {4'd0, 4'd0};
                        ss <= {4'd0, 4'd0};
                end
                else if (mm == {4'd5, 4'd9} && ss == {4'd5, 4'd9}) begin
                    if (hh[3:0] == 9) begin
                        hh <= {4'd1, 4'd0};
                        mm <= 8'd0;
                        ss <= 8'd0;
                    end
                    else begin
                        hh[3:0] <= hh[3:0] + 4'd1;
                        mm <= 8'd0;
                        ss <= 8'd0;
                    end
                end
                else if (ss == {4'd5, 4'd9}) begin
                    if (mm[3:0] == 4'd9) begin
                        mm <= {mm[7:4]+1, 4'd0};
                        ss <= 8'd0;
                    end
                    else begin
                        mm[3:0] <= mm[3:0] + 4'd1;
                        ss <= 8'd0;
                    end
                end
                else if (ss[3:0] == 4'd9) begin
                    ss <= {ss[7:4] + 1, 4'd0};
                end
                else 
                    ss[3:0] <= ss[3:0] + 4'd1;
            end
        end
            
	end
endmodule

