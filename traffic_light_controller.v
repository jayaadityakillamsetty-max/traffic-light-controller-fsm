module traffic_light_controller(input clk,input reset, input pedestrian,output reg [1:0] state );
parameter S0 = 2'b00; // North-South Green
parameter S1 = 2'b01; // North-South Yellow
parameter S2 = 2'b10; // East-West Green
parameter S3 = 2'b11; // East-West Yellow
 reg [3:0] timer;
always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        state <= S0;
        timer <= 0;
    end
    else
    begin
        timer <= timer + 1;
      case(state)
        S0:
        if(timer == 5)
        begin
            state <= S1;
            timer <= 0;
        end
        S1:
        if(timer == 2)
        begin
            state <= S2;
            timer <= 0;
        end
        S2:
        if(pedestrian)
        begin
            state <= S3;
            timer <= 0;
        end
        else if(timer == 5)
        begin
            state <= S3;
            timer <= 0;
        end
        S3:
        if(timer == 2)
        begin
            state <= S0;
            timer <= 0;
        end
        endcase
    end
end
endmodule
