//============================================================================//
// Half-Adder
//----------------------------------------------------------------------------//
// Engineer: Kasey Hill
// Filename: ha_bh.sv
// Modeling: behavioral
// Textbook: figure 6-1
//============================================================================//
module ha_bh (
  // inputs
  input  logic A, 
  input  logic B,
  // outputs
  output logic SUM,
  output logic CARRY
);
  // logic
  assign {CARRY, SUM} = A + B;

endmodule
