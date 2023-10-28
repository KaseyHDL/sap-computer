//============================================================================//
// Full-Adder
//----------------------------------------------------------------------------//
// Engineer: Kasey Hill
// Filename: fa_bh.sv
// Modeling: behavioral
// Textbook: figure 6-2
//============================================================================//
module fa_bh (
  // inputs
  input  logic A, 
  input  logic B,
  input  logic C,
  // outputs
  output logic SUM,
  output logic CARRY
);
  // logic
  assign {CARRY, SUM} = A + B + C;

endmodule
