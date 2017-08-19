// author : Praveen Kumar Chirumamilla
// e-mail : prav.iiit@gmail.com

typedef enum bit [2:0] {ADD, SUB, OR, AND, XOR, NOT} opcode_e;
class packet extends uvm_sequence_item;
  `uvm_object_utils(packet)

  rand opcode_e op;
  rand bit [7:0] a;
  rand bit [7:0] b;

  function new(string name="inst_packet");
    super.new(name);
  endfunction

  virtual function string conver2string();
    conver2string = $psprintf("a:%0h b:%0h opcode:%s",a,b, op);
  endfunction
endclass: packet
