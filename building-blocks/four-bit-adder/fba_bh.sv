//============================================================================//
// Four-Bit-Adder
//----------------------------------------------------------------------------//
// Engineer: Kasey Hill
// Filename: fba_bh.sv
// Modeling: behavioral
// Textbook: figure 6-3
//============================================================================//
module fba_bh (
  // inputs
  input  logic [3:0] A, 
  input  logic [3:0] B,
  input  logic       C,
  // outputs
  output logic [3:0] SUM,
  output logic       CARRY
);
  // logic
  assign {CARRY, SUM} = A + B + C;

endmodule
