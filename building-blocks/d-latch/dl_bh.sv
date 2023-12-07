//============================================================================//
// D-Latch
//----------------------------------------------------------------------------//
// Engineer: Kasey Hill
// Filename: dl.sv
// Modeling: behavioral
// Textbook: figure 7-7
//============================================================================//
module dl_bh (
  // inputs
  input  logic D,
  input  logic E,
  // outputs
  output logic Q,
  output logic Q_BAR
);
  // logic
  always_latch begin
    if (E) begin
      Q <= D;
    end
  end  

  assign Q_BAR = ~Q;

endmodule
