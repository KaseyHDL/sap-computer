//============================================================================//
// D-Latch
//----------------------------------------------------------------------------//
// Engineer: Kasey Hill
// Filename: dl.sv
// Modeling: simulation
// Textbook: figure 7-7
//============================================================================//
module dl_tb ();
  // inputs
  logic D;
  logic E;
  // outputs
  logic Q;
  logic Q_BAR;
  logic Q_BH;
  logic Q_BAR_BH;  

  // gate-level unit under test
  dl dl_uut (
    .D     (D),
    .E     (E),
    .Q     (Q),
    .Q_BAR (Q_BAR)
  );

  // behavioral unit under test
  dl_bh dl_bh_uut (
    .D     (D),
    .E     (E),
    .Q     (Q_BH),
    .Q_BAR (Q_BAR_BH)
  );

  // create vcd file
  initial begin
    $dumpfile("dl.vcd");
    $dumpvars(0, dl_tb);
  end

  // initialize and iterate inputs
  initial begin
    D    = 0;
    E    = 0;
    #2 
    E = 1;
    D = 1;
    #3 D = 0;
    #2 D = 1;
    #3 D = 0;    
    $finish;
  end

endmodule
