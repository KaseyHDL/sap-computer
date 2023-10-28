//============================================================================//
// Full-Adder
//----------------------------------------------------------------------------//
// Engineer: Kasey Hill
// Filename: fa.sv
// Modeling: gate-level
// Textbook: figure 6-2
//============================================================================//
module fa (
  // inputs
  input  logic A, 
  input  logic B,
  input  logic C,
  // outputs
  output logic SUM,
  output logic CARRY
);
  // logic
  logic sum_ha_0;
  logic carry_ha_0;

  ha ha_0 ();
  ha ha_1 ();
  xor xor_0 (SUM,   A, B); // SUM   = A ^ B
  and and_0 (CARRY, A, B); // CARRY = A + B

endmodule
