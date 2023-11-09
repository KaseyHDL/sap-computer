//============================================================================//
// D-Flip-Flop
//----------------------------------------------------------------------------//
// Engineer: Kasey Hill
// Filename: jkff_tb.sv
// Modeling: simulation
// Textbook: figure 7-14
//============================================================================//
module jkff_tb ();
  // inputs
  logic CLK_N;
  logic CLR_N;
  logic J;
  logic K;
  // outputs
  logic Q;
  logic Q_BAR;
  logic Q_BH;
  logic Q_BAR_BH;

  // gate-level unit under test
  jkff jkff_uut (
    .CLK_N (CLK_N),
    .CLR_N (CLR_N),
    .J     (J),
    .K     (K),    
    .Q     (Q),
    .Q_BAR (Q_BAR)
  );

  // behavioral unit under test
  jkff_bh jkff_bh_uut (
    .CLK_N (CLK_N),
    .CLR_N (CLR_N),
    .J     (J),
    .K     (K),    
    .Q     (Q_BH),
    .Q_BAR (Q_BAR_BH)
  );

  // create vcd file
  initial begin
    $dumpfile("jkff.vcd");
    $dumpvars(0, jkff_tb);
  end

  // initialize and iterate inputs
  initial begin
    CLK_N = 1;
    CLR_N = 0;
    J   = 0;
    K   = 0;    
    #1 CLR_N = 1;
       J = 0;
       K = 0;
    #3 J = 0;
       K = 1;
    #3 J = 1;
       K = 0;
    #3 J = 1;
       K = 1; 
    #5   
    $finish;
  end

  // generate clock
  always #2 CLK_N <= ~CLK_N;

endmodule
