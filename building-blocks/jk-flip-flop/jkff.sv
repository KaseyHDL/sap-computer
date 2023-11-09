//============================================================================//
// JK-Flip-Flop
//----------------------------------------------------------------------------//
// Engineer: Kasey Hill
// Filename: jkff.sv
// Modeling: gate-level
// Textbook: figure 7-14
//============================================================================//
module jkff (
  // inputs
  input  logic CLK_N, 
  input  logic CLR_N,
  input  logic J,
  input  logic K,
  // outputs
  output logic Q,
  output logic Q_BAR
);
  // logic
  logic w_nand_0;
  logic w_nand_1;
  logic w_nand_2;
  logic w_nand_3;  
  logic w_nand_4;
  logic w_nand_5;  
  logic w_nand_6;
  logic w_nand_7;             
  logic clk;

  not  not_0  (clk, CLK_N);

  // master
  nand nand_0 (w_nand_0, J, CLK_N, Q_BAR);
  nand nand_1 (w_nand_1, K, CLK_N, Q);

  nand nand_2 (w_nand_2, w_nand_0, w_nand_3);
  nand nand_3 (w_nand_3, w_nand_1, w_nand_2, CLR_N);

  // slave
  nand nand_4 (w_nand_4, w_nand_2, clk);
  nand nand_5 (w_nand_5, w_nand_3, clk);

  nand nand_6 (Q, w_nand_4, Q_BAR);
  nand nand_7 (Q_BAR, w_nand_5, Q, CLR_N);

endmodule
