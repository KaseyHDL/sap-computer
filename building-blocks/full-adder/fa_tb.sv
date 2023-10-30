//============================================================================//
// Full-Adder Testbench
//----------------------------------------------------------------------------//
// Engineer: Kasey Hill
// Filename: fa_tb.sv
// Modeling: simulation
// Textbook: figure 6-2
//============================================================================//
module fa_tb ();
  // inputs
  logic A; 
  logic B;
  logic C;
  // outputs
  logic SUM;
  logic CARRY;
  logic SUM_BH;
  logic CARRY_BH;  

  // gate-level unit under test
  fa fa_uut (
    .A     (A), 
    .B     (B),
    .C     (C),
    .SUM   (SUM),
    .CARRY (CARRY)
  );

  // behavioral unit under test
  fa_bh fa_bh_uut (
    .A     (A), 
    .B     (B),
    .C     (C),
    .SUM   (SUM_BH),
    .CARRY (CARRY_BH)
  );  

  // create vcd file
  initial begin
    $dumpfile("fa.vcd");
    $dumpvars(0, fa_tb);
  end

  // initialize and iterate inputs
  initial begin
    for (int i = 0; i < 16; i = i + 1) begin
      {A, B, C} = i;
      #10;
    end 
  end

endmodule
