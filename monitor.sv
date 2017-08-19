// author : Praveen Kumar Chirumamilla
// e-mail : prav.iiit@gmail.com

class monitor extends uvm_monitor;
  `uvm_component_utils(monitor)
  uvm_analysis_port #(packet) analysis_port;

  virtual interface_dut intf;

  function new(string name="monitor", uvm_component parent);
    super.new(name, parent);
  endfunction

  // recommended phases
  virtual function void build_phase(uvm_phase phase);
    analysis_port = new("analysis_port", this);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    if(!uvm_config_db #(virtual interface_dut)::get(this,"", "interface_dut", intf))
      `uvm_fatal(get_full_name(), $sformatf("interface_dut not found in the factory"));
  endfunction

  //it will be an infinite loop in the monitor
  virtual task run_phase(uvm_phase phase);
    packet pkt;
    forever begin
      @intf.monitorCb;
      if(intf.monitorCb.vld == 1) begin
      pkt = packet::type_id::create("pkt", this);
      pkt.op = opcode_e'(intf.monitorCb.opcode);
      pkt.a = intf.monitorCb.a;
      pkt.b = intf.monitorCb.b;
      `uvm_info(get_full_name(), $psprintf("%s", pkt.conver2string()), UVM_LOW);
      analysis_port.write(pkt);
      end
    end
  endtask

endclass
