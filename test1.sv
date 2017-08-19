class packet1 extends packet;
  `uvm_object_utils(packet1)

  constraint pk1Con {op inside {OR, AND};}

  function new(string name = "packet1");
    super.new(name);
  endfunction
endclass

class test1 extends uvm_test;
  `uvm_component_utils(test1);
  env env1;

  function new(string name = "test1", uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env1 = env::type_id::create("env", this);
    uvm_config_db#(uvm_object_wrapper)::set(this, "env.agnt.sqr.main_phase", "default_sequence", base_seq::type_id::get());
    set_type_override_by_type(packet::get_type(), packet1::get_type());
  endfunction


endclass
