//============================================================================//
// JK-Flip-Flop
//----------------------------------------------------------------------------//
// Engineer: Kasey Hill
// Filename: jkff_bh.sv
// Modeling: behavioral
// Textbook: figure 7-14
//============================================================================//
module jkff_bh (
  // inputs
  input  logic CLK_N, 
  input  logic CLR_N,
  input  logic J,
  input  logic K,
  // outputs
  output logic Q,
  output logic Q_BAR
);
  // logic
  always_ff @(negedge CLK_N, negedge CLR_N) begin
    if (!CLR_N) begin
      Q <= 0;
    end else begin
      case ({J, K})
        2'b00 : Q <= Q;
        2'b01 : Q <= 0;
        2'b10 : Q <= 1;
        2'b11 : Q <= ~Q;
      endcase
    end
  end  

  assign Q_BAR = ~Q;

endmodule
