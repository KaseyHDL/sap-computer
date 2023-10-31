//============================================================================//
// Four-Bit-Adder
//----------------------------------------------------------------------------//
// Engineer: Kasey Hill
// Filename: fba.sv
// Modeling: gate-level
// Textbook: figure 6-3
//============================================================================//
module fba (
  // inputs
  input  logic [3:0] A, 
  input  logic [3:0] B,
  input  logic       C,
  // outputs
  output logic [3:0] SUM,
  output logic       CARRY
);
  // logic
  logic [2:0] fa_c; 

  fa fa_0 (.A (A[0]), .B (B[0]), .C (C),       .SUM (SUM[0]), .CARRY (fa_c[0]));
  fa fa_1 (.A (A[1]), .B (B[1]), .C (fa_c[0]), .SUM (SUM[1]), .CARRY (fa_c[1]));
  fa fa_2 (.A (A[2]), .B (B[2]), .C (fa_c[1]), .SUM (SUM[2]), .CARRY (fa_c[2]));
  fa fa_3 (.A (A[3]), .B (B[3]), .C (fa_c[2]), .SUM (SUM[3]), .CARRY (CARRY));

endmodule
