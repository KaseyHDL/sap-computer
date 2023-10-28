//============================================================================//
// Full-Adder Testbench
//----------------------------------------------------------------------------//
// Engineer: Kasey Hill
// Filename: fa_tb.sv
// Modeling: simulation
// Textbook: figure 6-2
//============================================================================//
module ha_tb ();
  // inputs
  logic A; 
  logic B;
  // outputs
  logic SUM;
  logic CARRY;
  logic SUM_BH;
  logic CARRY_BH;  

  // gate-level unit under test
  ha ha_uut (
    .A     (A), 
    .B     (B),
    .SUM   (SUM),
    .CARRY (CARRY)
  );

  // behavioral unit under test
  ha_bh ha_bh_uut (
    .A     (A), 
    .B     (B),
    .SUM   (SUM_BH),
    .CARRY (CARRY_BH)
  );  

  // create vcd file
  initial begin
    $dumpfile("ha.vcd");
    $dumpvars(0, ha_tb);
  end

  // initialize and iterate inputs
  initial begin
    A = 0;
    B = 0;
    #10;
    A = 0;
    B = 1;
    #10;
    A = 1;
    B = 0;
    #10;
    A = 1;
    B = 1;
    #10 $finish;    
  end

endmodule
