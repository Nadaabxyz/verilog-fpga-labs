`timescale 1ns / 1ps
module CLA16(a,b, cin, sum,cout);
input [15:0] a,b;
input cin;
output [15:0] sum;
output cout;
    wire c1,c2,c3;

CLA cla1 (.X(a[3:0]), .Y(b[3:0]), .c0(cin), .S(sum[3:0]), .cout(c1));
CLA cla2 (.X(a[7:4]), .Y(b[7:4]), .c0(c1), .S(sum[7:4]), .cout(c2));
CLA cla3(.X(a[11:8]), .Y(b[11:8]), .c0(c2), .S(sum[11:8]), .cout(c3));
CLA cla4(.X(a[15:12]), .Y(b[15:12]), .c0(c3), .S(sum[15:12]), .cout(cout));

endmodule

//Structural Multiplier - Unsigned
module MULTS(
    input [7:0]A,
    input [7:0]X,
    output [15:0]result
    );
     wire [15:0] PP [0:7];
     wire [15:0] sum[0:6];
   genvar i;

generate
    for (i = 0; i < 8; i = i + 1) begin : PP_gen
        assign PP[i] = (X[i]) ? (A << i) : 0;
    end
endgenerate
     //1st stage
    CLA16 cla_1 (.a(PP[0]),.b(PP[1]),.cin(1'b0),.sum(sum[0]));
    CLA16 cla_2 (.a(PP[2]),.b(PP[3]),.cin(1'b0),.sum(sum[1]));

    CLA16 cla_3(.a(PP[4]),.b(PP[5]),.cin(1'b0),.sum(sum[2]));
    CLA16 cla_4(.a(PP[6]),.b(PP[7]),.cin(1'b0),.sum(sum[3]));


    //2nd stage
    CLA16 cla_5(.a(sum[0]),.b(sum[1]),.cin(1'b0),.sum(sum[4]));
    CLA16 cla_6(.a(sum[2]),.b(sum[3]),.cin(1'b0),.sum(sum[5]));


    //3rd stage
    CLA16 cla_7(.a(sum[5]),.b(sum[4]),.cin(1'b0),.sum(sum[6]));

    assign result = sum[6];
endmodule 


//Structural Multiplier - signed
module MULTS_signed(
    output [15:0] result,
    input [7:0] A, X
    );
    
    wire [7:0] PP[7:0];
    wire [15:0] PP_shifted[7:0];
    wire [15:0] sum[6:0];
    
    genvar i;
    generate
        for (i=0; i< 7; i=i+1)begin
            assign PP[i][6:0]= (X[i]*A[6:0]); 
            assign PP[i][7] = ~(X[i] * A[7]);
        end 
        assign PP[7][6:0] = ~(X[7] * A[6:0]); 
        assign PP[7][7] = X[7]*A[7];   
    endgenerate 
    
    generate
        for(i=0; i<=7; i=i+1)
        begin
        if(i==0)   begin
        assign PP_shifted[i][7:0] = PP[i][7:0];
        assign PP_shifted[i][8]=1'b1;
        assign PP_shifted[i][15:9] = 7'd0;
            end
        else
        assign PP_shifted[i] = PP[i] << i;
        end
    endgenerate
    wire cout[6:0]; 
    genvar j; 
    generate
        for(j=0; j<4; j = j+1) 
        begin
        CLA16 cla0(.a(PP_shifted[j]), .b(PP_shifted[j+4]), .cin(1'b0), .sum(sum[j]), .cout(cout[j]));
        end
    endgenerate
    CLA16 cl1(.a(sum[0]), .b(sum[1]), .cin(1'b0),  .sum(sum[4]),.cout(cout[4])); 
    CLA16 cl2(.a(sum[2]), .b(sum[3]), .cin(1'b0), .sum(sum[5]),.cout(cout[5])); 
    CLA16 cl3(.a(sum[4]), .b(sum[5]), .cin(1'b0),  .sum(sum[6]),.cout(cout[6])); 
    assign result[14:0] = sum[6][14:0] ;
    assign result[15] = ~sum[6][15]; 
    
endmodule
////////////////////////////////////////////////////////////////////



module MULTB(
    input signed [7:0]A,
    input signed [7:0]B,
    output reg signed [15:0]result
);
    always @(*) begin
        result=A*B;
    end
endmodule


/////////////////////////////////////////////////////////////////////////


module ADDS_B(
    output signed [15:0]result,
    input signed [15:0]A,B
);
    assign result = A+B;
endmodule

module MAC(
    output reg signed [19:0] result,
    input clk,rst,
    input signed [23:0]data,
    input signed [23:0]weight
    
);

    wire signed [15:0] product[2:0];
    wire signed [15:0] sum[1:0];
    
    reg [1:0] count= 2'd0;
    
    initial
    begin
        result = 20'd0;
    end
    
    MULTB mult1(product[0], data[7:0], weight[7:0]);
    MULTB mult2(product[1], data[15:8], weight[15:8]);
    MULTB mult3(product[2], data[23:16], weight[23:16]);
    ADDS_B as1(sum[0],product[0],product[1]);
    ADDS_B as2(sum[1],sum[0],product[2]);

    always @(posedge clk) begin
        
        if (rst ==1) begin 
            result <= 20'd0;
            count <= 2'd0;
        end
        else begin
            result <= result + sum[1];
            count <= count + 1'b1;
        end
    end
    
    always @(posedge rst) begin
        
      result <= 20'd0;
      count <= 2'd0;
    end

endmodule