// author : Praveen Kumar Chirumamilla
// e-mail : prav.iiit@gmail.com

class env extends uvm_env;
  `uvm_component_utils(env)
  agent agnt;
  output_agent opAgent;
  scoreboard sb;

  function new(string name="env", uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agnt = agent::type_id::create("agt", this);
    opAgent = output_agent::type_id::create("opagt", this);
    sb = scoreboard::type_id::create("sb", this);
  endfunction

  virtual function void connect_phase(uvm_phase phase);
    agnt.analysis_port.connect(sb.input_export);
    opAgent.analysis_port.connect(sb.output_export);
  endfunction
endclass
