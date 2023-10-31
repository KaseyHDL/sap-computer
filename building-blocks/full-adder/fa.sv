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
  logic carry_ha_0;
  logic sum_ha_1;
  logic carry_ha_1;  

  ha ha_0 (.A (A), .B (sum_ha_1), .SUM (SUM),      .CARRY (carry_ha_0));
  ha ha_1 (.A (B), .B (C),        .SUM (sum_ha_1), .CARRY (carry_ha_1));

  or or_0 (CARRY, carry_ha_0, carry_ha_1);

endmodule
