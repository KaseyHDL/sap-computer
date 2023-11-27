//============================================================================//
// SAP-1 Buffer-Register
//----------------------------------------------------------------------------//
// Engineer: Kasey Hill
// Filename: buf_reg_bh.sv
// Modeling: behavioral
// Textbook: figure 8-24
//============================================================================//
module buf_reg_bh (
  // inputs
  input  logic       CLK, 
  input  logic       CLR,
  input  logic       ENABLE,
  input  logic       LOAD,
  input  logic [3:0] X,
  // outputs
  output logic [3:0] Y
);
  // logic
  logic [3:0] y_buf;

  always_ff @(posedge CLK, posedge CLR) begin
    if (CLR) begin
      y_buf    <= 0;
    end else begin
      y_buf[0] <= (X[0] & LOAD) | (y_buf[0] & ~LOAD);
      y_buf[1] <= (X[1] & LOAD) | (y_buf[1] & ~LOAD);
      y_buf[2] <= (X[2] & LOAD) | (y_buf[2] & ~LOAD);
      y_buf[3] <= (X[3] & LOAD) | (y_buf[3] & ~LOAD);                  
    end
  end

  assign Y[0] = ENABLE ? y_buf[0] : 1'bZ ;
  assign Y[1] = ENABLE ? y_buf[1] : 1'bZ ;
  assign Y[2] = ENABLE ? y_buf[2] : 1'bZ ;
  assign Y[3] = ENABLE ? y_buf[3] : 1'bZ ;      

endmodule
