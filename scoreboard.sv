// author : Praveen Kumar Chirumamilla
// e-mail : prav.iiit@gmail.com

`uvm_analysis_imp_decl(_input)
`uvm_analysis_imp_decl(_output)

class scoreboard extends uvm_scoreboard;
  `uvm_component_utils(scoreboard)

  uvm_analysis_imp_input #(packet, scoreboard) input_export;
  uvm_analysis_imp_output #(output_packet, scoreboard) output_export;
  packet inPakQ[$];

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  //recommended phases
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    input_export = new("input_export", this);
    output_export = new("output_export", this);
  endfunction

  virtual function write_input(packet pkt);
    $display("Scoreboard received a input packet : %s", pkt.conver2string());
    inPakQ.push_back(pkt);
  endfunction

  virtual function write_output(output_packet pkt);
    packet inPkt;

    inPkt = inPakQ.pop_front();
    $display("INPUT: %s", inPkt.conver2string());
    $display("OUTPUT: %s", pkt.convert2string());
  endfunction

endclass
