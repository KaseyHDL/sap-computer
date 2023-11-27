//============================================================================//
// SAP-1 Multiplexor
//----------------------------------------------------------------------------//
// Engineer: Kasey Hill
// Filename: mux_tb.sv
// Modeling: simulation
// Textbook: figure 10-20
//============================================================================//
module mux_tb ();
  // inputs
  logic [3:0] A;
  logic [3:0] B;
  logic       E;  
  logic       S;
  // outputs
  logic [3:0] Y;
  logic [3:0] Y_BH;
  logic [3:0] Y_MATCH;

  // gate-level unit under test
  mux mux_uut (
    .A (A),
    .B (B),
    .E (E),  
    .S (S),
    .Y (Y)
  );

  // behavioral unit under test
  mux_bh mux_bh_uut (
    .A (A),
    .B (B),
    .E (E),  
    .S (S),
    .Y (Y_BH)
  );  

  // create vcd file
  initial begin
    $dumpfile("mux.vcd");
    $dumpvars(0, mux_tb);
  end

  // initialize and iterate inputs
  initial begin
    E    = 0;
    S    = 0;  
    A    = 0;  
    B    = 0;      
    #1 E = 1;

    for (int i = 0; i < 255; i = i + 1) begin
      {A, B} = i;
      #10;
    end 

    S = 1;
    for (int i = 0; i < 255; i = i + 1) begin
      {A, B} = i;
      #10;
    end 

    $finish;
  end

  assign Y_MATCH = Y ~^ Y_BH;

endmodule
