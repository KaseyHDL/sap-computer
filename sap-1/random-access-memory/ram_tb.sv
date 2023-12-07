//============================================================================//
// SAP-1 Random-Access-Memory
//----------------------------------------------------------------------------//
// Engineer: Kasey Hill
// Filename: ram_tb.sv
// Modeling: simulation
// Textbook: figure 9-7
//============================================================================//
module ram_tb ();
  // inputs
  logic       CE_N; 
  logic       WE_N;
  logic [3:0] A;  
  logic [3:0] D;
  // outputs
  logic [3:0] S;
  logic [3:0] S_BH;
  logic [3:0] S_MATCH;

  // gate-level unit under test
  ram ram_uut (
    .CE_N (CE_N),
    .WE_N (WE_N),
    .A    (A),  
    .D    (D),
    .S    (S)
  );

  // behavioral unit under test
  ram_bh ram_bh_uut (
    .CE_N (CE_N),
    .WE_N (WE_N),
    .A    (A),  
    .D    (D),
    .S    (S_BH)
  );  

  // create vcd file
  initial begin
    $dumpfile("ram.vcd");
    $dumpvars(0, ram_tb);
  end

  // initialize and iterate inputs
  initial begin
    CE_N = 0;
    WE_N = 0;
    A    = 0;
    D    = 0;

    for (int i = 0; i < 1024; i = i + 1) begin
      {D, A, CE_N, WE_N} = i;
      #1;
    end 

    $finish;
  end

  assign S_MATCH = S === S_BH;

endmodule
