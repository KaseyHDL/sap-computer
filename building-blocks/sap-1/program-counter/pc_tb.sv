//============================================================================//
// SAP-1 Program-Counter
//----------------------------------------------------------------------------//
// Engineer: Kasey Hill
// Filename: pc_tb.sv
// Modeling: simulation
// Textbook: figure 8-11
//============================================================================//
module pc_tb ();
  // inputs
  logic CLK; 
  logic CLR;
  logic COUNT;
  // outputs
  logic [3:0] Q;
  logic [3:0] Q_BH;

  // gate-level unit under test
  pc pc_uut (
    .CLK_BAR (~CLK),
    .CLR_BAR (~CLR),
    .COUNT   (COUNT),   
    .Q       (Q)
  );

  // behavioral unit under test
  pc_bh pc_bh_uut (
    .CLK_BAR (~CLK),
    .CLR_BAR (~CLR),
    .COUNT   (COUNT),   
    .Q       (Q_BH)
  );

  // create vcd file
  initial begin
    $dumpfile("pc.vcd");
    $dumpvars(0, pc_tb);
  end

  // initialize and iterate inputs
  initial begin
    CLK      = 1;
    CLR      = 1;
    COUNT    = 0;    
    #1 CLR   = 0;
    #3 COUNT = 1;
    #70
    $finish;
  end

  // generate clock
  always #2 CLK <= ~CLK;

endmodule
