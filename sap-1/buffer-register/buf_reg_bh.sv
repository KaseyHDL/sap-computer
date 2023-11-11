//============================================================================//
// SAP-1 Buffer-Register
//----------------------------------------------------------------------------//
// Engineer: Kasey Hill
// Filename: buf_reg_bh.sv
// Modeling: behavioral
// Textbook: figure 8-2
//============================================================================//
module buf_reg_bh (
  // inputs
  input  logic       CLK, 
  input  logic       CLR,
  input  logic       LOAD,
  input  logic [3:0] X,
  // outputs
  output logic [3:0] R
);
  // logic
  always_ff @(posedge CLK, posedge CLR) begin
    if (CLR) begin
      R    <= 0;
    end else begin
      R[0] <= (X[0] & LOAD) | (R[0] & ~LOAD);
      R[1] <= (X[1] & LOAD) | (R[1] & ~LOAD);
      R[2] <= (X[2] & LOAD) | (R[2] & ~LOAD);
      R[3] <= (X[3] & LOAD) | (R[3] & ~LOAD);                  
    end
  end

endmodule
