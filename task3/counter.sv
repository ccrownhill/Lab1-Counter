module counter #(
  parameter WIDTH = 8
)(
  // interface signals
  input  logic              clk,
  input  logic              rst,
  input  logic              ld,
  input  logic [WIDTH-1:0]  v,
  output logic [WIDTH-1:0]  count
);

// initial
//   count = {{WIDTH-5{1'b0}}, 5'b11111};

always_ff @ (posedge clk)
  if (rst) count <= {WIDTH{1'b0}};
  //else     count <= ld ? v : count + {{WIDTH-1{1'b0}},1'b1}; // need this line for setting arbitrary value
  else if (ld) count <= count + {{WIDTH-1{1'b0}},1'b1}; // this is for single stepping (challenge of task 3)
endmodule
