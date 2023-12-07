//============================================================================//
// SAP-1 Random-Access-Memory
//----------------------------------------------------------------------------//
// Engineer: Kasey Hill
// Filename: ram_bh.sv
// Modeling: behavioral
// Textbook: figure 9-7
//============================================================================//
module ram_bh (
  // inputs
  input  logic       CE_N, 
  input  logic       WE_N,
  input  logic [3:0] A,  
  input  logic [3:0] D,
  // outputs
  output logic [3:0] S
);
  // logic
  logic [15:0][3:0] mem;

  always_latch begin
    if (~CE_N & ~WE_N) begin
      mem[A] <= D;
    end
  end

  always_comb begin
    case ({CE_N, WE_N}) 
      2'b00 : S = 4'bZ;
      2'b01 : S = ~mem[A];
      2'b10 : S = 4'bZ;
      2'b11 : S = 4'bZ;
    endcase
  end

endmodule
