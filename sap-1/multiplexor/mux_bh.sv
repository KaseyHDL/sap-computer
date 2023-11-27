//============================================================================//
// SAP-1 Multiplexor
//----------------------------------------------------------------------------//
// Engineer: Kasey Hill
// Filename: mux_bh.sv
// Modeling: behavioral
// Textbook: figure 10-20
//============================================================================//
module mux_bh (
  // inputs
  input  logic [3:0] A, 
  input  logic [3:0] B,
  input  logic       E,  
  input  logic       S,
  // outputs
  output logic [3:0] Y
);
  // logic
  always_comb begin
    case (S)
      0 : Y = E ? A : 0;
      1 : Y = E ? B : 0;
    endcase
  end

endmodule
