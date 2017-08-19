// author : Praveen Kumar Chirumamilla
// e-mail : prav.iiit@gmail.com

class packet2 extends packet;
  `uvm_object_utils(packet2)

  constraint fewCon {op inside {ADD, SUB};}

  function new(string name="packet2");
    super.new(name);
  endfunction

  virtual function string conver2string();
    conver2string = $psprintf("Packet2 a: %0h b: %0h opcode: %s", a,b, op);
  endfunction

endclass
