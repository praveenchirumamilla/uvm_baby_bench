// author : Praveen Kumar Chirumamilla
// e-mail : prav.iiit@gmail.com

class test_base extends uvm_test;
  `uvm_component_utils(test_base);
  env tbEnv;

  function new(string name = "test_base", uvm_component parent);
    super.new(name, parent);
  endfunction

  //recommended UVM phases
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    tbEnv = env::type_id::create("tbEnv", this);
    // confirm about sequencer.
    uvm_config_db#(uvm_object_wrapper)::set(this, "env.agnt.sqr.main_phase", "default_sequence", base_seq::type_id::get());
  endfunction

  //print the topology
  function void start_of_simulation_phase(uvm_phase phase);
    uvm_root::get().print_topology();
  endfunction
endclass
