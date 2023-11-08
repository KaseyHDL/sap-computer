//============================================================================//
// D-Flip-Flop
//----------------------------------------------------------------------------//
// Engineer: Kasey Hill
// Filename: dff.sv
// Modeling: behavioral
// Textbook: figure 7-10
//============================================================================//
module dff_bh (
  // inputs
  input  logic CLK, 
  input  logic CLR,
  input  logic D,
  // outputs
  output logic Q,
  output logic Q_BAR
);
  // logic
  always_ff @(posedge CLK, posedge CLR) begin
    if (CLR) begin
      Q     <=  0;
      Q_BAR <=  1;
    end else begin
      Q     <=  D;
      Q_BAR <= ~D;
    end
  end  

endmodule
