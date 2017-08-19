class base_seq extends uvm_sequence #(packet);
  `uvm_object_utils(base_seq);

  function new(string name = "base_seq");
    super.new(name);
    `ifdef UVM_POST_VERSION_1_1
      set_automatic_phase_objection(1);
    `endif
  endfunction

  task pre_start();
    `ifndef UVM_POST_VERSION_1_1
      if(starting_phase != null) begin
        `uvm_info(get_type_name(), $psprintf("\n%s pre_start() raising %s objection", get_sequence_path(), starting_phase.get_name()), UVM_MEDIUM);
        starting_phase.raise_objection(this);
      end
    `endif
  endtask

  task post_start();
    `ifndef UVM_POST_VERSION_1_1
      if(starting_phase != null) begin
        `uvm_info(get_type_name(), $psprintf("\n%s post_start() raising %s objection", get_sequence_path(), starting_phase.get_name()), UVM_MEDIUM);
        starting_phase.drop_objection(this);
      end
    `endif
  endtask

  task body();
    repeat(500)
    begin
      `uvm_do(req);
    end
  endtask

endclass
