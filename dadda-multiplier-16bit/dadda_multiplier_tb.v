module dadda_tb();
  reg [15:0] memory [1:200]; 
  reg [15:0] A;
  reg [15:0] B;
  wire [31:0] Product;
  integer i, file;


  dadda_tree_multiplier dadda(.A(A), .B(B), .Y(Product));
  
  // Expected result wire
  wire [31:0] exp_res;
  assign exp_res = A * B;

  // Open the stimulus file for reading
  initial begin
    $readmemb("C:\\Users\\hp\\Desktop\\ITU\\EHB436E\\MID1\\stimulus_file.txt", memory);
    file = $fopen("C:\\Users\\hp\\Desktop\\ITU\\EHB436E\\MID1\\results.txt","a");

    $fmonitor(file, "A = (%0b) %0d , B =(%0b) %0d, Product Result = (%0b) %0d , Expected Result =(%0b) %0d , Status = %0s\n", A,A, B, B, Product,Product, exp_res, exp_res, (exp_res == Product) ? "TRUE" : "FALSE");
    $monitor("A =(%0b) %0d, B =(%0b) %0d, Product Result = (%0b)%0d, Expected Result =(%0b) %0d , Status = %0s", A,A,B, B, Product,Product, exp_res, exp_res, (exp_res == Product) ? "TRUE" : "FALSE");

    for (i = 1; i <= 200; i = i + 2) begin
      A = memory[i];
      B = memory[i + 1];
      #10; 
    end

    $finish;
  end
endmodule
