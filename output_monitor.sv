// author : Praveen Kumar Chirumamilla
// e-mail : prav.iiit@gmail.com

class output_monitor extends uvm_monitor;
  `uvm_component_utils(output_monitor);

  uvm_analysis_port #(output_packet) analysis_port;
  virtual interface_dut intf;

  function new(string name = "output_monitor", uvm_component parent);
    super.new(name, parent);
  endfunction
  
  // recommended phases
  virtual function void build_phase(uvm_phase phase);
    analysis_port = new("analysis_port", this);
  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    uvm_config_db #(virtual interface_dut):: get(this, "", "interface_dut", intf);
  endfunction

  virtual task run_phase(uvm_phase phase);
    output_packet pkt;
    forever begin
      @intf.monitorCb;
      if(intf.monitorCb.opVld == 1'b1) begin
        pkt = output_packet::type_id::create("pkt", this);
        pkt.out = intf.monitorCb.out;
        `uvm_info(get_full_name(), $psprintf("%s", pkt.convert2string()), UVM_LOW);
        analysis_port.write(pkt);
      end
    end
  endtask
endclass
