// author : Praveen Kumar Chirumamilla
// e-mail : prav.iiit@gmail.com

class agent extends uvm_agent;
  `uvm_component_utils(agent)

  uvm_analysis_port #(packet) analysis_port;

  // declare agent components : driver, monitor, sequencer
  driver drv;
  monitor mon;
  //typedef uvm_sequencer #(packet) packet_sequencer;
  //packet_sequencer sqr;
  uvm_sequencer #(packet) sqr;

  function new(string name="agent", uvm_component parent);
    super.new(name, parent);
  endfunction

  // recommended phases
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    analysis_port = new("analysis_port", this);

    drv = driver::type_id::create("drv", this);
    mon = monitor::type_id::create("mon", this);
    //sqr = packet_sequencer::type_id::create("sqr", this);
    sqr = uvm_sequencer#(packet)::type_id::create("sqr",this);

  endfunction

  // connect phase
  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    drv.seq_item_port.connect(sqr.seq_item_export);
    mon.analysis_port.connect(this.analysis_port);
  endfunction
endclass
