//============================================================================//
// SAP-1 Adder-Subtractor
//----------------------------------------------------------------------------//
// Engineer: Kasey Hill
// Filename: add_sub_bh.sv
// Modeling: behavioral
// Textbook: figure 6-8
//============================================================================//
module add_sub_bh (
  // inputs
  input  logic [7:0] A, 
  input  logic [7:0] B,
  input  logic       S_U,
  // outputs
  output logic [7:0] S
);
  // logic
  always_comb begin
    case (S_U)
      0 : S = A + B;
      1 : S = A - B;
    endcase
  end

endmodule
