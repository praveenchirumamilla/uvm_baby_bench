// author : Praveen Kumar Chirumamilla
// e-mail : prav.iiit@gmail.com

class output_packet extends uvm_sequence_item;
  `uvm_object_utils(output_packet)
  bit [15:0] out;

  function new(string name = "inst_output_packet");
    super.new(name);
  endfunction

  virtual function string convert2string();
    convert2string = $psprintf("OUT:0x%x", out);
  endfunction

endclass
