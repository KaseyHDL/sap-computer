//============================================================================//
// SAP-1 Adder-Subtractor
//----------------------------------------------------------------------------//
// Engineer: Kasey Hill
// Filename: add_sub_tb.sv
// Modeling: simulation
// Textbook: figure 6-8
//============================================================================//
module add_sub_tb ();
  // inputs
  logic [7:0] A; 
  logic [7:0] B;
  logic       S_U;
  // outputs
  logic [7:0] S;
  logic [7:0] S_BH;
  logic [7:0] S_MATCH;

  // gate-level unit under test
  add_sub fa_uut (
    .A     (A), 
    .B     (B),
    .S_U   (S_U),
    .S     (S)
  );

  // behavioral unit under test
  add_sub_bh fa_bh_uut (
    .A     (A), 
    .B     (B),
    .S_U   (S_U),
    .S     (S_BH)
  );  

  // create vcd file
  initial begin
    $dumpfile("add_sub.vcd");
    $dumpvars(0, add_sub_tb);
  end

  // initialize and iterate inputs
  initial begin
    for (int i = 0; i < 131072; i = i + 1) begin
      {A, B, S_U} = i;
      #10;
    end 
  end

  assign S_MATCH = S ~^ S_BH;

endmodule
