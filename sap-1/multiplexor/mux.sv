//============================================================================//
// SAP-1 Multiplexor
//----------------------------------------------------------------------------//
// Engineer: Kasey Hill
// Filename: mux.sv
// Modeling: gate-level
// Textbook: figure 10-20
//============================================================================//
module mux (
  // inputs
  input  logic [3:0] A, 
  input  logic [3:0] B,
  input  logic       E,  
  input  logic       S,
  // outputs
  output logic [3:0] Y
);
  // logic
  logic s_bar;
  logic w_and_0;
  logic w_and_1;
  logic w_and_2;
  logic w_and_3;
  logic w_and_4;
  logic w_and_5;
  logic w_and_6;
  logic w_and_7;    
  logic w_and_8;
  logic w_and_9;         

  not not_0 (s_bar, S);

  and and_0 (w_and_0, A[0], w_and_8);
  and and_1 (w_and_1, B[0], w_and_9);
  and and_2 (w_and_2, A[1], w_and_8);
  and and_3 (w_and_3, B[1], w_and_9);    
  and and_4 (w_and_4, A[2], w_and_8);
  and and_5 (w_and_5, B[2], w_and_9);
  and and_6 (w_and_6, A[3], w_and_8);
  and and_7 (w_and_7, B[3], w_and_9);    

  and and_8 (w_and_8, E, s_bar);
  and and_9 (w_and_9, E, S);   

  or  or_0 (Y[0], w_and_0, w_and_1);
  or  or_1 (Y[1], w_and_2, w_and_3);
  or  or_2 (Y[2], w_and_4, w_and_5);
  or  or_3 (Y[3], w_and_6, w_and_7);    

endmodule
