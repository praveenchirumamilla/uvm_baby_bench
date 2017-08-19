// author : Praveen Kumar Chirumamilla
// e-mail : prav.iiit@gmail.com

class driver extends uvm_driver #(packet);
  `uvm_component_utils(driver)
  virtual interface_dut intf;

  function new(string name="driver", uvm_component parent);
    super.new(name, parent);
  endfunction

  // recommended phases
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    if(!uvm_config_db #(virtual interface_dut)::get(this, "", "interface_dut", intf))
      `uvm_fatal(get_full_name(), $sformatf("interface_dut not found in the factory"));
  endfunction

  // driver implements run_phase as infinite loop
  // to process all sequence items
  virtual task run_phase(uvm_phase phase);
    forever begin
      seq_item_port.get_next_item(req);
      @intf.driverCb;
      intf.driverCb.vld <= 1;
      intf.driverCb.opcode <= req.op;
      intf.driverCb.a <= req.a;
      intf.driverCb.b <= req.b;
      seq_item_port.item_done();
    end
  endtask


endclass
