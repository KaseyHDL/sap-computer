//============================================================================//
// SAP-1 Program-Counter
//----------------------------------------------------------------------------//
// Engineer: Kasey Hill
// Filename: pc_bh.sv
// Modeling: behavioral
// Textbook: figure 8-11
//============================================================================//
module pc_bh (
  // inputs
  input  logic CLK_BAR, 
  input  logic CLR_BAR,
  input  logic COUNT,
  // outputs
  output logic [3:0] Q
);
  // logic
  always_ff @(negedge CLK_BAR, negedge CLR_BAR) begin
    if      (!CLR_BAR) Q <= 0;
    else if (COUNT)    Q <= Q + 1;
  end

endmodule
