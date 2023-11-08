//============================================================================//
// D-Flip-Flop
//----------------------------------------------------------------------------//
// Engineer: Kasey Hill
// Filename: dff.sv
// Modeling: gate-level
// Textbook: figure 7-10
//============================================================================//
module dff (
  // inputs
  input  logic CLK, 
  input  logic CLR,
  input  logic D,
  // outputs
  output logic Q,
  output logic Q_BAR
);
  // logic
  logic clr_bar;
  logic w_nand_0;
  logic w_nand_1;
  logic w_nand_2;
  logic w_nand_3;

  not  not_0  (clr_bar, CLR);

  nand nand_0 (w_nand_0, w_nand_3, w_nand_1);
  nand nand_1 (w_nand_1, w_nand_0, clr_bar, CLK);
  nand nand_2 (w_nand_2, w_nand_1, CLK, w_nand_3);
  nand nand_3 (w_nand_3, w_nand_2, D, clr_bar);

  nand nand_4 (Q, w_nand_1, Q_BAR);   
  nand nand_5 (Q_BAR, Q, w_nand_2, clr_bar);     

endmodule
