//============================================================================//
// SAP-1 Adder-Subtractor
//----------------------------------------------------------------------------//
// Engineer: Kasey Hill
// Filename: add_sub.sv
// Modeling: gate-level
// Textbook: figure 6-8
//============================================================================//
module add_sub (
  // inputs
  input  logic [7:0] A, 
  input  logic [7:0] B,
  input  logic       S_U,
  // outputs
  output logic [7:0] S
);
  // logic
  logic       fba_carry;
  logic [7:0] xor_b;

  xor xor_0 (xor_b[0], B[0], S_U);
  xor xor_1 (xor_b[1], B[1], S_U);
  xor xor_2 (xor_b[2], B[2], S_U);
  xor xor_3 (xor_b[3], B[3], S_U);   
  xor xor_4 (xor_b[4], B[4], S_U);
  xor xor_5 (xor_b[5], B[5], S_U);
  xor xor_6 (xor_b[6], B[6], S_U);
  xor xor_7 (xor_b[7], B[7], S_U);      

  fba fba_0 (.A (A[3:0]), .B (xor_b[3:0]), .C (S_U),       .SUM (S[3:0]), .CARRY (fba_carry));
  fba fba_1 (.A (A[7:4]), .B (xor_b[7:4]), .C (fba_carry), .SUM (S[7:4]), .CARRY (/*open*/));

endmodule
