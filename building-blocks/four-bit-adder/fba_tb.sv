//============================================================================//
// Four-Bit-Adder
//----------------------------------------------------------------------------//
// Engineer: Kasey Hill
// Filename: fba_tb.sv
// Modeling: simulation
// Textbook: figure 6-3
//============================================================================//
module fba_tb ();
  // inputs
  logic [3:0] A; 
  logic [3:0] B;
  logic C;
  // outputs
  logic [3:0] SUM;
  logic       CARRY;
  logic [3:0] SUM_BH;
  logic       CARRY_BH;  

  // gate-level unit under test
  fba fa_uut (
    .A     (A), 
    .B     (B),
    .C     (C),
    .SUM   (SUM),
    .CARRY (CARRY)
  );

  // behavioral unit under test
  fba_bh fa_bh_uut (
    .A     (A), 
    .B     (B),
    .C     (C),
    .SUM   (SUM_BH),
    .CARRY (CARRY_BH)
  );  

  // create vcd file
  initial begin
    $dumpfile("fba.vcd");
    $dumpvars(0, fba_tb);
  end

  // initialize and iterate inputs
  initial begin
    for (int i = 0; i < 512; i = i + 1) begin
      {A, B, C} = i;
      #10;
    end 
  end

endmodule
