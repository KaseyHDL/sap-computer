//============================================================================//
// D-Latch
//----------------------------------------------------------------------------//
// Engineer: Kasey Hill
// Filename: dl.sv
// Modeling: gate-level
// Textbook: figure 7-7
//============================================================================//
module dl (
  // inputs
  input  logic D,
  input  logic E,
  // outputs
  output logic Q,
  output logic Q_BAR
);
  // logic
  logic d_bar;
  logic w_nand_0;
  logic w_nand_1;

  not  not_0  (d_bar, D);

  nand nand_0 (w_nand_0, D, E);
  nand nand_1 (w_nand_1, d_bar, E); 
  nand nand_2 (Q, w_nand_0, Q_BAR);
  nand nand_3 (Q_BAR, w_nand_1, Q); 

endmodule