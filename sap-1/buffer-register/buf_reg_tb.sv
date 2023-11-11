//============================================================================//
// SAP-1 Buffer-Register
//----------------------------------------------------------------------------//
// Engineer: Kasey Hill
// Filename: buf_reg_tb.sv
// Modeling: simulation
// Textbook: figure 8-2
//============================================================================//
module buf_reg_tb ();
  // inputs
  logic       CLK; 
  logic       CLR;
  logic       LOAD;
  logic [3:0] X;
  // outputs
  logic [3:0] R;
  logic [3:0] R_BH;  

  // gate-level unit under test
  buf_reg buf_reg_uut (
    .CLK  (CLK), 
    .CLR  (CLR),
    .LOAD (LOAD),
    .X    (X),
    .R    (R)
  );

  // behavioral unit under test
  buf_reg_bh buf_reg_bh_uut (
    .CLK  (CLK), 
    .CLR  (CLR),
    .LOAD (LOAD),
    .X    (X),
    .R    (R_BH)
  );  

  // create vcd file
  initial begin
    $dumpfile("buf_reg.vcd");
    $dumpvars(0, buf_reg_tb);
  end

  // initialize and iterate inputs
  initial begin
    CLK      = 1;
    CLR      = 1;
    LOAD     = 0;  
    X        = 0;  
    #1 CLR   = 0;

    for (int i = 0; i < 32; i = i + 1) begin
      {X, LOAD} = i;
      #10;
    end 
    $finish;
  end

  // generate clock
  always #2 CLK <= ~CLK;

endmodule
