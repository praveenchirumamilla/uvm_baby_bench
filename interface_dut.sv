// author : Praveen Kumar Chirumamilla
// e-mail : prav.iiit@gmail.com
interface interface_dut(input logic clk);
  logic reset;
  logic [7:0] a;
  logic [7:0] b;
  logic [2:0] opcode;
  logic [15:0] out;
  logic       vld;
  logic       opVld;

  // clocking block
  //    i. Creates synchronous behavior
  //clocking cb @(posedge clk);
  //  output reset;
  //  output a;
  //  output b;
  //  output opcode;
  //  input  out;
  //endclocking

  clocking driverCb @(posedge clk);
    output reset,a,b,opcode, vld;
  endclocking

  clocking monitorCb @(posedge clk);
    input a, b, opcode, out, vld, opVld;
  endclocking

  // modport
  //  i. to define direction of signals for each
  //     module/component
  modport dut (input reset, a, b, opcode, clk, vld,
               output out, opVld);


endinterface: interface_dut
