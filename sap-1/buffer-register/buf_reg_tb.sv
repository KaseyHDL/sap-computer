//============================================================================//
// SAP-1 Buffer-Register
//----------------------------------------------------------------------------//
// Engineer: Kasey Hill
// Filename: buf_reg_tb.sv
// Modeling: simulation
// Textbook: figure 8-24
//============================================================================//
module buf_reg_tb ();
  // inputs
  logic       CLK; 
  logic       CLR;
  logic       ENABLE;
  logic       LOAD;
  logic [3:0] X;
  // outputs
  logic [3:0] Y;
  logic [3:0] Y_BH;  

  // gate-level unit under test
  buf_reg buf_reg_uut (
    .CLK    (CLK), 
    .CLR    (CLR),
    .ENABLE (ENABLE),
    .LOAD   (LOAD),
    .X      (X),
    .Y      (Y)
  );

  // behavioral unit under test
  buf_reg_bh buf_reg_bh_uut (
    .CLK    (CLK), 
    .CLR    (CLR),
    .ENABLE (ENABLE),
    .LOAD   (LOAD),
    .X      (X),
    .Y      (Y_BH)
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
    ENABLE   = 0;
    LOAD     = 0;  
    X        = 0;  
    #1 CLR   = 0;
    ENABLE   = 1;

    for (int i = 0; i < 32; i = i + 1) begin
      {X, LOAD} = i;
      #10;
    end 
    $finish;
  end

  // generate clock
  always #2 CLK <= ~CLK;

endmodule
