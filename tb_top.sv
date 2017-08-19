// author : Praveen Kumar Chirumamilla
// e-mail : prav.iiit@gmail.com

`include "interface_dut.sv"
`include "alu.sv"

module tb_top;
  import uvm_pkg::*;
  import agent_pkg::*;
  import test_pkg::*;

  reg clk = 0;
  interface_dut intf(.clk(clk));
  ALU alu(.intf(intf.dut));

  // clock generation
  always
  #5 clk =~ clk;

  initial 
  begin
    uvm_config_db #(virtual interface_dut)::set(uvm_root::get(), "*", "interface_dut", intf);
    run_test();
  end
endmodule
