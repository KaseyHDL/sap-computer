//============================================================================//
// SAP-1 Buffer-Register
//----------------------------------------------------------------------------//
// Engineer: Kasey Hill
// Filename: buf_reg.sv
// Modeling: gate-level
// Textbook: figure 8-2
//============================================================================//
module buf_reg (
  // inputs
  input  logic       CLK, 
  input  logic       CLR,
  input  logic       LOAD,
  input  logic [3:0] X,
  // outputs
  output logic [3:0] R
);
  // logic
  logic load_bar;
  logic w_and_0;
  logic w_and_1;
  logic w_and_2;
  logic w_and_3;
  logic w_and_4;
  logic w_and_5;
  logic w_and_6;
  logic w_and_7;   
  logic w_or_0;
  logic w_or_1;
  logic w_or_2;
  logic w_or_3;   

  not not_0 (load_bar, LOAD);

  and and_0 (w_and_0, X[0], LOAD);
  and and_1 (w_and_1, R[0], load_bar);
  and and_2 (w_and_2, X[1], LOAD);
  and and_3 (w_and_3, R[1], load_bar); 
  and and_4 (w_and_4, X[2], LOAD);
  and and_5 (w_and_5, R[2], load_bar); 
  and and_6 (w_and_6, X[3], LOAD);
  and and_7 (w_and_7, R[3], load_bar);

  or or_0 (w_or_0, w_and_1, w_and_0);
  or or_1 (w_or_1, w_and_3, w_and_2);
  or or_2 (w_or_2, w_and_5, w_and_4);
  or or_3 (w_or_3, w_and_7, w_and_6);            
  
  dff dff_0 (.CLK (CLK), .CLR (CLR), .D (w_or_0), .Q (R[0]));
  dff dff_1 (.CLK (CLK), .CLR (CLR), .D (w_or_1), .Q (R[1]));
  dff dff_2 (.CLK (CLK), .CLR (CLR), .D (w_or_2), .Q (R[2]));
  dff dff_3 (.CLK (CLK), .CLR (CLR), .D (w_or_3), .Q (R[3]));

endmodule
