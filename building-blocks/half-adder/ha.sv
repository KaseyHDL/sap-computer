//============================================================================//
// Half-Adder
//----------------------------------------------------------------------------//
// Engineer: Kasey Hill
// Filename: ha.sv
// Modeling: gate-level
// Textbook: figure 6-1
//============================================================================//
module ha (
  // inputs
  input  logic A, 
  input  logic B,
  // outputs
  output logic SUM,
  output logic CARRY
);
  // logic
  xor xor_0 (SUM,   A, B); // SUM   = A ^ B
  and and_0 (CARRY, A, B); // CARRY = A + B

endmodule
