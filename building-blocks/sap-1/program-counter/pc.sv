//============================================================================//
// SAP-1 Program-Counter
//----------------------------------------------------------------------------//
// Engineer: Kasey Hill
// Filename: pc.sv
// Modeling: gate-level
// Textbook: figure 8-11
//============================================================================//
module pc (
  // inputs
  input  logic CLK_BAR, 
  input  logic CLR_BAR,
  input  logic COUNT,
  // outputs
  output logic [3:0] Q
);
  // logic
  jkff jkff_0 (.CLK_N (CLK_BAR), .CLR_N (CLR_BAR), .J (COUNT), .K (COUNT), .Q (Q[0]));
  jkff jkff_1 (.CLK_N (Q[0]),    .CLR_N (CLR_BAR), .J (COUNT), .K (COUNT), .Q (Q[1]));
  jkff jkff_2 (.CLK_N (Q[1]),    .CLR_N (CLR_BAR), .J (COUNT), .K (COUNT), .Q (Q[2]));
  jkff jkff_3 (.CLK_N (Q[2]),    .CLR_N (CLR_BAR), .J (COUNT), .K (COUNT), .Q (Q[3]));    

endmodule
