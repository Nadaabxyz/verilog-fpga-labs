module Machine(
    output reg y,
    input x,
    input clk,rst
    );
    
    localparam state_size=4;
    
    localparam A=4'd0, 
    B=4'd1, 
    C=4'd3, 
    D=4'd5, 
    E=4'd15, 
    F=4'd14, 
    G=4'd12, 
    H=4'd8, 
    I=4'd9; 
    
    reg [state_size-1:0] state_d =0;
    reg y1 =0 ,y2 =0;
    reg z =0 ;
    
    initial begin
//        state_d = 0;
//        y1 = 0;
//        y2 = 0;
        y = 0;
//        z = 0;
    end
    
    always @(posedge clk, posedge rst) 
    begin
       
       if (rst) begin 
            state_d <= 0;
            y1 <= 0;
            y2 <= 0;
            y <= 0;
            z <= 0;
       end 
       else if (!rst) 
       begin
        
       if (!z) begin
            
            case (state_d)
            A: begin
                if (x) begin
                    state_d <= F;
                end else if (!x) begin
                    state_d <= B;
                end
                
            end
            B: begin
                if (x) begin
                    state_d <= F;
                end else if (!x) begin
                    state_d <= C;
                end
                
            end
            C: begin
                if (x) begin
                    state_d <= F;
                end else if (!x) begin
                    state_d <= D;
                end
            end
            D: begin
                if (x) begin
                    state_d <= F;
                end else if (!x) begin
                    state_d <= E;
                end
            end
            E: begin
                if (x) begin
                    state_d <= F;
                end else if (!x) begin
                    state_d <= B;
                end
            end
            F: begin
                if (x) begin
                    state_d <= F;
                end else if (!x) begin
                    state_d <= G;
                end
            end
            G: begin
                if (x) begin
                    state_d <= F;
                end else if (!x) begin
                    state_d <= H;
                end
            end
            H: begin
                if (x) begin
                    state_d <= F;
                end else if (!x) begin
                    state_d <= I;
                end
            end
            I: begin
                if (x) begin
                    state_d <= F;
                end else if (!x) begin
                    state_d <= E;
                end
            end
           endcase     
           
           case (state_d)
           B: begin
                if (y1) begin
                    z <= 1;
                    y <= 1;
                end
           end
           E: begin
                if (y1) begin
                    z <= 1;
                    y <= 1;
                end else if (!y1) begin
                    y1 <= 1;
                    y <= 1;
                end
           end
           I: begin
                if (y2) begin
                    z <= 1;
                    y <= 1;
                end else if (!y2) begin
                    y2 <= 1;
                    y <= 1;
                end        
           end
           default: begin
                y <= 0;
                z <=0;
           end
           endcase
        
            
            
        end else if(z) begin
            y <= 1;
        end
        
        end
    end
    
    
endmodule