// author : Praveen Kumar Chirumamilla
// e-mail : prav.iiit@gmail.com

class output_agent extends uvm_agent;
  `uvm_component_utils(output_agent)

  uvm_analysis_port #(output_packet) analysis_port;
  output_monitor mon;

  function new(string name = "output_agent", uvm_component parent);
    super.new(name, parent);
  endfunction

  // recommended phases
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    analysis_port = new("analysis_port", this);
    mon = output_monitor::type_id::create("mon", this);
  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    mon.analysis_port.connect(this.analysis_port);
  endfunction
  
endclass
