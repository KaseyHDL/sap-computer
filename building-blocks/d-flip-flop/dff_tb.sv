//============================================================================//
// D-Flip-Flop
//----------------------------------------------------------------------------//
// Engineer: Kasey Hill
// Filename: dff.sv
// Modeling: simulation
// Textbook: figure 7-10
//============================================================================//
module dff_tb ();
  // inputs
  logic CLK;
  logic CLR;
  logic D;
  // outputs
  logic Q;
  logic Q_BAR;
  logic Q_BH;
  logic Q_BAR_BH;

  // gate-level unit under test
  dff dff_uut (
    .CLK   (CLK),
    .CLR   (CLR),
    .D     (D),
    .Q     (Q),
    .Q_BAR (Q_BAR)
  );

  // behavioral unit under test
  dff_bh dff_bh_uut (
    .CLK   (CLK),
    .CLR   (CLR),
    .D     (D),
    .Q     (Q_BH),
    .Q_BAR (Q_BAR_BH)
  );

  // create vcd file
  initial begin
    $dumpfile("dff.vcd");
    $dumpvars(0, dff_tb);
  end

  // initialize and iterate inputs
  initial begin
    CLK = 1;
    CLR = 1;
    D   = 0;
    #2 CLR = 0;
    #2 D = 1;
    #3 D = 0;
    #2 D = 1;
    #3 D = 0;    
    $finish;
  end

  // generate clock
  always #1 CLK <= ~CLK;

endmodule
