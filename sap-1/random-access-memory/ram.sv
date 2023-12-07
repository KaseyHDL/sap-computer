//============================================================================//
// SAP-1 Random-Access-Memory
//----------------------------------------------------------------------------//
// Engineer: Kasey Hill
// Filename: ram.sv
// Modeling: gate-level
// Textbook: figure 9-7
//============================================================================//
module ram (
  // inputs
  input  logic       CE_N, 
  input  logic       WE_N,
  input  logic [3:0] A,  
  input  logic [3:0] D,
  // outputs
  output logic [3:0] S
);
  // logic
  logic             ce;
  logic             we;
  logic [3:0]       a_bar;
  logic [3:0]       w_read_nor;
  logic [3:0]       w_buf_and;  
  logic [15:0]      w_addr_and;
  logic [15:0]      w_write_and;
  logic [15:0][3:0] w_read_and;
  logic [15:0][3:0] mem;

  // address compliments
  not not_0 (a_bar[0], A[0]);
  not not_1 (a_bar[1], A[1]);
  not not_2 (a_bar[2], A[2]);
  not not_3 (a_bar[3], A[3]);    

  // enable compliments
  not not_4 (ce, CE_N);
  not not_5 (we, WE_N);      

  // address enables
  and addr_and_0  (w_addr_and[0],  a_bar[3], a_bar[2], a_bar[1], a_bar[0]); 
  and addr_and_1  (w_addr_and[1],  a_bar[3], a_bar[2], a_bar[1],     A[0]); 
  and addr_and_2  (w_addr_and[2],  a_bar[3], a_bar[2],     A[1], a_bar[0]); 
  and addr_and_3  (w_addr_and[3],  a_bar[3], a_bar[2],     A[1],     A[0]);    
  and addr_and_4  (w_addr_and[4],  a_bar[3],     A[2], a_bar[1], a_bar[0]); 
  and addr_and_5  (w_addr_and[5],  a_bar[3],     A[2], a_bar[1],     A[0]); 
  and addr_and_6  (w_addr_and[6],  a_bar[3],     A[2],     A[1], a_bar[0]); 
  and addr_and_7  (w_addr_and[7],  a_bar[3],     A[2],     A[1],     A[0]);      
  and addr_and_8  (w_addr_and[8],      A[3], a_bar[2], a_bar[1], a_bar[0]); 
  and addr_and_9  (w_addr_and[9],      A[3], a_bar[2], a_bar[1],     A[0]); 
  and addr_and_10 (w_addr_and[10],     A[3], a_bar[2],     A[1], a_bar[0]); 
  and addr_and_11 (w_addr_and[11],     A[3], a_bar[2],     A[1],     A[0]);    
  and addr_and_12 (w_addr_and[12],     A[3],     A[2], a_bar[1], a_bar[0]); 
  and addr_and_13 (w_addr_and[13],     A[3],     A[2], a_bar[1],     A[0]); 
  and addr_and_14 (w_addr_and[14],     A[3],     A[2],     A[1], a_bar[0]); 
  and addr_and_15 (w_addr_and[15],     A[3],     A[2],     A[1],     A[0]);

  // write controls
  and write_and_0  (w_write_and[0],  w_addr_and[0],  ce, we); 
  and write_and_1  (w_write_and[1],  w_addr_and[1],  ce, we); 
  and write_and_2  (w_write_and[2],  w_addr_and[2],  ce, we); 
  and write_and_3  (w_write_and[3],  w_addr_and[3],  ce, we);    
  and write_and_4  (w_write_and[4],  w_addr_and[4],  ce, we); 
  and write_and_5  (w_write_and[5],  w_addr_and[5],  ce, we); 
  and write_and_6  (w_write_and[6],  w_addr_and[6],  ce, we); 
  and write_and_7  (w_write_and[7],  w_addr_and[7],  ce, we);      
  and write_and_8  (w_write_and[8],  w_addr_and[8],  ce, we); 
  and write_and_9  (w_write_and[9],  w_addr_and[9],  ce, we); 
  and write_and_10 (w_write_and[10], w_addr_and[10], ce, we); 
  and write_and_11 (w_write_and[11], w_addr_and[11], ce, we);    
  and write_and_12 (w_write_and[12], w_addr_and[12], ce, we); 
  and write_and_13 (w_write_and[13], w_addr_and[13], ce, we); 
  and write_and_14 (w_write_and[14], w_addr_and[14], ce, we); 
  and write_and_15 (w_write_and[15], w_addr_and[15], ce, we);  
 
  // latch memory cells
  dl  dl_0_0  (.D (D[0]), .E (w_write_and[0]),  .Q (mem[0][0] ), .Q_BAR (/*open*/));
  dl  dl_0_1  (.D (D[1]), .E (w_write_and[0]),  .Q (mem[0][1] ), .Q_BAR (/*open*/));
  dl  dl_0_2  (.D (D[2]), .E (w_write_and[0]),  .Q (mem[0][2] ), .Q_BAR (/*open*/));
  dl  dl_0_3  (.D (D[3]), .E (w_write_and[0]),  .Q (mem[0][3] ), .Q_BAR (/*open*/));  
  dl  dl_1_0  (.D (D[0]), .E (w_write_and[1]),  .Q (mem[1][0] ), .Q_BAR (/*open*/));
  dl  dl_1_1  (.D (D[1]), .E (w_write_and[1]),  .Q (mem[1][1] ), .Q_BAR (/*open*/));
  dl  dl_1_2  (.D (D[2]), .E (w_write_and[1]),  .Q (mem[1][2] ), .Q_BAR (/*open*/));
  dl  dl_1_3  (.D (D[3]), .E (w_write_and[1]),  .Q (mem[1][3] ), .Q_BAR (/*open*/));  
  dl  dl_2_0  (.D (D[0]), .E (w_write_and[2]),  .Q (mem[2][0] ), .Q_BAR (/*open*/));
  dl  dl_2_1  (.D (D[1]), .E (w_write_and[2]),  .Q (mem[2][1] ), .Q_BAR (/*open*/));
  dl  dl_2_2  (.D (D[2]), .E (w_write_and[2]),  .Q (mem[2][2] ), .Q_BAR (/*open*/));
  dl  dl_2_3  (.D (D[3]), .E (w_write_and[2]),  .Q (mem[2][3] ), .Q_BAR (/*open*/)); 
  dl  dl_3_0  (.D (D[0]), .E (w_write_and[3]),  .Q (mem[3][0] ), .Q_BAR (/*open*/));
  dl  dl_3_1  (.D (D[1]), .E (w_write_and[3]),  .Q (mem[3][1] ), .Q_BAR (/*open*/));
  dl  dl_3_2  (.D (D[2]), .E (w_write_and[3]),  .Q (mem[3][2] ), .Q_BAR (/*open*/));
  dl  dl_3_3  (.D (D[3]), .E (w_write_and[3]),  .Q (mem[3][3] ), .Q_BAR (/*open*/));   
  dl  dl_4_0  (.D (D[0]), .E (w_write_and[4]),  .Q (mem[4][0] ), .Q_BAR (/*open*/));
  dl  dl_4_1  (.D (D[1]), .E (w_write_and[4]),  .Q (mem[4][1] ), .Q_BAR (/*open*/));
  dl  dl_4_2  (.D (D[2]), .E (w_write_and[4]),  .Q (mem[4][2] ), .Q_BAR (/*open*/));
  dl  dl_4_3  (.D (D[3]), .E (w_write_and[4]),  .Q (mem[4][3] ), .Q_BAR (/*open*/));  
  dl  dl_5_0  (.D (D[0]), .E (w_write_and[5]),  .Q (mem[5][0] ), .Q_BAR (/*open*/));
  dl  dl_5_1  (.D (D[1]), .E (w_write_and[5]),  .Q (mem[5][1] ), .Q_BAR (/*open*/));
  dl  dl_5_2  (.D (D[2]), .E (w_write_and[5]),  .Q (mem[5][2] ), .Q_BAR (/*open*/));
  dl  dl_5_3  (.D (D[3]), .E (w_write_and[5]),  .Q (mem[5][3] ), .Q_BAR (/*open*/));  
  dl  dl_6_0  (.D (D[0]), .E (w_write_and[6]),  .Q (mem[6][0] ), .Q_BAR (/*open*/));
  dl  dl_6_1  (.D (D[1]), .E (w_write_and[6]),  .Q (mem[6][1] ), .Q_BAR (/*open*/));
  dl  dl_6_2  (.D (D[2]), .E (w_write_and[6]),  .Q (mem[6][2] ), .Q_BAR (/*open*/));
  dl  dl_6_3  (.D (D[3]), .E (w_write_and[6]),  .Q (mem[6][3] ), .Q_BAR (/*open*/)); 
  dl  dl_7_0  (.D (D[0]), .E (w_write_and[7]),  .Q (mem[7][0] ), .Q_BAR (/*open*/));
  dl  dl_7_1  (.D (D[1]), .E (w_write_and[7]),  .Q (mem[7][1] ), .Q_BAR (/*open*/));
  dl  dl_7_2  (.D (D[2]), .E (w_write_and[7]),  .Q (mem[7][2] ), .Q_BAR (/*open*/));
  dl  dl_7_3  (.D (D[3]), .E (w_write_and[7]),  .Q (mem[7][3] ), .Q_BAR (/*open*/)); 
  dl  dl_8_0  (.D (D[0]), .E (w_write_and[8]),  .Q (mem[8][0] ), .Q_BAR (/*open*/));
  dl  dl_8_1  (.D (D[1]), .E (w_write_and[8]),  .Q (mem[8][1] ), .Q_BAR (/*open*/));
  dl  dl_8_2  (.D (D[2]), .E (w_write_and[8]),  .Q (mem[8][2] ), .Q_BAR (/*open*/));
  dl  dl_8_3  (.D (D[3]), .E (w_write_and[8]),  .Q (mem[8][3] ), .Q_BAR (/*open*/));  
  dl  dl_9_0  (.D (D[0]), .E (w_write_and[9]),  .Q (mem[9][0] ), .Q_BAR (/*open*/));
  dl  dl_9_1  (.D (D[1]), .E (w_write_and[9]),  .Q (mem[9][1] ), .Q_BAR (/*open*/));
  dl  dl_9_2  (.D (D[2]), .E (w_write_and[9]),  .Q (mem[9][2] ), .Q_BAR (/*open*/));
  dl  dl_9_3  (.D (D[3]), .E (w_write_and[9]),  .Q (mem[9][3] ), .Q_BAR (/*open*/));  
  dl  dl_10_0 (.D (D[0]), .E (w_write_and[10]), .Q (mem[10][0]), .Q_BAR (/*open*/));
  dl  dl_10_1 (.D (D[1]), .E (w_write_and[10]), .Q (mem[10][1]), .Q_BAR (/*open*/));
  dl  dl_10_2 (.D (D[2]), .E (w_write_and[10]), .Q (mem[10][2]), .Q_BAR (/*open*/));
  dl  dl_10_3 (.D (D[3]), .E (w_write_and[10]), .Q (mem[10][3]), .Q_BAR (/*open*/)); 
  dl  dl_11_0 (.D (D[0]), .E (w_write_and[11]), .Q (mem[11][0]), .Q_BAR (/*open*/));
  dl  dl_11_1 (.D (D[1]), .E (w_write_and[11]), .Q (mem[11][1]), .Q_BAR (/*open*/));
  dl  dl_11_2 (.D (D[2]), .E (w_write_and[11]), .Q (mem[11][2]), .Q_BAR (/*open*/));
  dl  dl_11_3 (.D (D[3]), .E (w_write_and[11]), .Q (mem[11][3]), .Q_BAR (/*open*/)); 
  dl  dl_12_0 (.D (D[0]), .E (w_write_and[12]), .Q (mem[12][0]), .Q_BAR (/*open*/));
  dl  dl_12_1 (.D (D[1]), .E (w_write_and[12]), .Q (mem[12][1]), .Q_BAR (/*open*/));
  dl  dl_12_2 (.D (D[2]), .E (w_write_and[12]), .Q (mem[12][2]), .Q_BAR (/*open*/));
  dl  dl_12_3 (.D (D[3]), .E (w_write_and[12]), .Q (mem[12][3]), .Q_BAR (/*open*/));  
  dl  dl_13_0 (.D (D[0]), .E (w_write_and[13]), .Q (mem[13][0]), .Q_BAR (/*open*/));
  dl  dl_13_1 (.D (D[1]), .E (w_write_and[13]), .Q (mem[13][1]), .Q_BAR (/*open*/));
  dl  dl_13_2 (.D (D[2]), .E (w_write_and[13]), .Q (mem[13][2]), .Q_BAR (/*open*/));
  dl  dl_13_3 (.D (D[3]), .E (w_write_and[13]), .Q (mem[13][3]), .Q_BAR (/*open*/));  
  dl  dl_14_0 (.D (D[0]), .E (w_write_and[14]), .Q (mem[14][0]), .Q_BAR (/*open*/));
  dl  dl_14_1 (.D (D[1]), .E (w_write_and[14]), .Q (mem[14][1]), .Q_BAR (/*open*/));
  dl  dl_14_2 (.D (D[2]), .E (w_write_and[14]), .Q (mem[14][2]), .Q_BAR (/*open*/));
  dl  dl_14_3 (.D (D[3]), .E (w_write_and[14]), .Q (mem[14][3]), .Q_BAR (/*open*/)); 
  dl  dl_15_0 (.D (D[0]), .E (w_write_and[15]), .Q (mem[15][0]), .Q_BAR (/*open*/));
  dl  dl_15_1 (.D (D[1]), .E (w_write_and[15]), .Q (mem[15][1]), .Q_BAR (/*open*/));
  dl  dl_15_2 (.D (D[2]), .E (w_write_and[15]), .Q (mem[15][2]), .Q_BAR (/*open*/));
  dl  dl_15_3 (.D (D[3]), .E (w_write_and[15]), .Q (mem[15][3]), .Q_BAR (/*open*/)); 

  // latch data outs for reads
  and read_and_0_0  (w_read_and[0][0],  w_addr_and[0], mem[0][0]);
  and read_and_0_1  (w_read_and[0][1],  w_addr_and[0], mem[0][1]);
  and read_and_0_2  (w_read_and[0][2],  w_addr_and[0], mem[0][2]);
  and read_and_0_3  (w_read_and[0][3],  w_addr_and[0], mem[0][3]);  
  and read_and_1_0  (w_read_and[1][0],  w_addr_and[1], mem[1][0]);
  and read_and_1_1  (w_read_and[1][1],  w_addr_and[1], mem[1][1]);
  and read_and_1_2  (w_read_and[1][2],  w_addr_and[1], mem[1][2]);
  and read_and_1_3  (w_read_and[1][3],  w_addr_and[1], mem[1][3]);  
  and read_and_2_0  (w_read_and[2][0],  w_addr_and[2], mem[2][0]);
  and read_and_2_1  (w_read_and[2][1],  w_addr_and[2], mem[2][1]);
  and read_and_2_2  (w_read_and[2][2],  w_addr_and[2], mem[2][2]);
  and read_and_2_3  (w_read_and[2][3],  w_addr_and[2], mem[2][3]); 
  and read_and_3_0  (w_read_and[3][0],  w_addr_and[3], mem[3][0]);
  and read_and_3_1  (w_read_and[3][1],  w_addr_and[3], mem[3][1]);
  and read_and_3_2  (w_read_and[3][2],  w_addr_and[3], mem[3][2]);
  and read_and_3_3  (w_read_and[3][3],  w_addr_and[3], mem[3][3]);   
  and read_and_4_0  (w_read_and[4][0],  w_addr_and[4], mem[4][0]);
  and read_and_4_1  (w_read_and[4][1],  w_addr_and[4], mem[4][1]);
  and read_and_4_2  (w_read_and[4][2],  w_addr_and[4], mem[4][2]);
  and read_and_4_3  (w_read_and[4][3],  w_addr_and[4], mem[4][3]);  
  and read_and_5_0  (w_read_and[5][0],  w_addr_and[5], mem[5][0]);
  and read_and_5_1  (w_read_and[5][1],  w_addr_and[5], mem[5][1]);
  and read_and_5_2  (w_read_and[5][2],  w_addr_and[5], mem[5][2]);
  and read_and_5_3  (w_read_and[5][3],  w_addr_and[5], mem[5][3]);  
  and read_and_6_0  (w_read_and[6][0],  w_addr_and[6], mem[6][0]);
  and read_and_6_1  (w_read_and[6][1],  w_addr_and[6], mem[6][1]);
  and read_and_6_2  (w_read_and[6][2],  w_addr_and[6], mem[6][2]);
  and read_and_6_3  (w_read_and[6][3],  w_addr_and[6], mem[6][3]); 
  and read_and_7_0  (w_read_and[7][0],  w_addr_and[7], mem[7][0]);
  and read_and_7_1  (w_read_and[7][1],  w_addr_and[7], mem[7][1]);
  and read_and_7_2  (w_read_and[7][2],  w_addr_and[7], mem[7][2]);
  and read_and_7_3  (w_read_and[7][3],  w_addr_and[7], mem[7][3]); 
  and read_and_8_0  (w_read_and[8][0],  w_addr_and[8], mem[8][0]);
  and read_and_8_1  (w_read_and[8][1],  w_addr_and[8], mem[8][1]);
  and read_and_8_2  (w_read_and[8][2],  w_addr_and[8], mem[8][2]);
  and read_and_8_3  (w_read_and[8][3],  w_addr_and[8], mem[8][3]);  
  and read_and_9_0  (w_read_and[9][0],  w_addr_and[9], mem[9][0]);
  and read_and_9_1  (w_read_and[9][1],  w_addr_and[9], mem[9][1]);
  and read_and_9_2  (w_read_and[9][2],  w_addr_and[9], mem[9][2]);
  and read_and_9_3  (w_read_and[9][3],  w_addr_and[9], mem[9][3]);  
  and read_and_10_0 (w_read_and[10][0], w_addr_and[10], mem[10][0]);
  and read_and_10_1 (w_read_and[10][1], w_addr_and[10], mem[10][1]);
  and read_and_10_2 (w_read_and[10][2], w_addr_and[10], mem[10][2]);
  and read_and_10_3 (w_read_and[10][3], w_addr_and[10], mem[10][3]); 
  and read_and_11_0 (w_read_and[11][0], w_addr_and[11], mem[11][0]);
  and read_and_11_1 (w_read_and[11][1], w_addr_and[11], mem[11][1]);
  and read_and_11_2 (w_read_and[11][2], w_addr_and[11], mem[11][2]);
  and read_and_11_3 (w_read_and[11][3], w_addr_and[11], mem[11][3]); 
  and read_and_12_0 (w_read_and[12][0], w_addr_and[12], mem[12][0]);
  and read_and_12_1 (w_read_and[12][1], w_addr_and[12], mem[12][1]);
  and read_and_12_2 (w_read_and[12][2], w_addr_and[12], mem[12][2]);
  and read_and_12_3 (w_read_and[12][3], w_addr_and[12], mem[12][3]);  
  and read_and_13_0 (w_read_and[13][0], w_addr_and[13], mem[13][0]);
  and read_and_13_1 (w_read_and[13][1], w_addr_and[13], mem[13][1]);
  and read_and_13_2 (w_read_and[13][2], w_addr_and[13], mem[13][2]);
  and read_and_13_3 (w_read_and[13][3], w_addr_and[13], mem[13][3]);  
  and read_and_14_0 (w_read_and[14][0], w_addr_and[14], mem[14][0]);
  and read_and_14_1 (w_read_and[14][1], w_addr_and[14], mem[14][1]);
  and read_and_14_2 (w_read_and[14][2], w_addr_and[14], mem[14][2]);
  and read_and_14_3 (w_read_and[14][3], w_addr_and[14], mem[14][3]); 
  and read_and_15_0 (w_read_and[15][0], w_addr_and[15], mem[15][0]);
  and read_and_15_1 (w_read_and[15][1], w_addr_and[15], mem[15][1]);
  and read_and_15_2 (w_read_and[15][2], w_addr_and[15], mem[15][2]);
  and read_and_15_3 (w_read_and[15][3], w_addr_and[15], mem[15][3]);

  // combine read signals and negate
  nor read_nor_0 (w_read_nor[0], w_read_and[0][0], w_read_and[1][0], w_read_and[2][0], w_read_and[3][0], w_read_and[4][0], w_read_and[5][0], w_read_and[6][0], w_read_and[7][0], w_read_and[8][0], w_read_and[9][0], w_read_and[10][0], w_read_and[11][0], w_read_and[12][0], w_read_and[13][0], w_read_and[14][0], w_read_and[15][0]);
  nor read_nor_1 (w_read_nor[1], w_read_and[0][1], w_read_and[1][1], w_read_and[2][1], w_read_and[3][1], w_read_and[4][1], w_read_and[5][1], w_read_and[6][1], w_read_and[7][1], w_read_and[8][1], w_read_and[9][1], w_read_and[10][1], w_read_and[11][1], w_read_and[12][1], w_read_and[13][1], w_read_and[14][1], w_read_and[15][1]);
  nor read_nor_2 (w_read_nor[2], w_read_and[0][2], w_read_and[1][2], w_read_and[2][2], w_read_and[3][2], w_read_and[4][2], w_read_and[5][2], w_read_and[6][2], w_read_and[7][2], w_read_and[8][2], w_read_and[9][2], w_read_and[10][2], w_read_and[11][2], w_read_and[12][2], w_read_and[13][2], w_read_and[14][2], w_read_and[15][2]);
  nor read_nor_3 (w_read_nor[3], w_read_and[0][3], w_read_and[1][3], w_read_and[2][3], w_read_and[3][3], w_read_and[4][3], w_read_and[5][3], w_read_and[6][3], w_read_and[7][3], w_read_and[8][3], w_read_and[9][3], w_read_and[10][3], w_read_and[11][3], w_read_and[12][3], w_read_and[13][3], w_read_and[14][3], w_read_and[15][3]);        

  // buffer controls
  and buf_and_0 (w_buf_and[0], ce, WE_N); 
  and buf_and_1 (w_buf_and[1], ce, WE_N); 
  and buf_and_2 (w_buf_and[2], ce, WE_N); 
  and buf_and_3 (w_buf_and[3], ce, WE_N); 

  // data out buffers
  bufif1 buf_0 (S[0], w_read_nor[0], w_buf_and[0]);
  bufif1 buf_1 (S[1], w_read_nor[1], w_buf_and[1]);
  bufif1 buf_2 (S[2], w_read_nor[2], w_buf_and[2]);
  bufif1 buf_3 (S[3], w_read_nor[3], w_buf_and[3]);    

endmodule
