// author : Praveen Kumar Chirumamilla
// e-mail : prav.iiit@gmail.com

module ALU(interface_dut.dut intf);
reg [15:0] tmp_out;
//always @(posedge intf.clk) begin
always @(*) begin
  //if(intf.reset) begin
  //  intf.out <= 0;
  //end
  //else begin
  //if(intf.vld) begin
    case(intf.opcode) 
      1: begin // add
        tmp_out = intf.a + intf.b;
        //intf.opVld <= intf.vld;
      end
      2: begin // sub
        tmp_out = intf.a - intf.b;
        //intf.opVld <= intf.vld;
      end
      3: begin // bit wise or
        tmp_out = intf.a | intf.b;
        //intf.opVld <= intf.vld;
      end
      4: begin // bit wise and
        tmp_out = intf.a & intf.b;
        //intf.opVld <= intf.vld;
      end
      5: begin // bit wise xor
        tmp_out = intf.a ^ intf.b;
        //intf.opVld <= intf.vld;
      end
      6 : begin // not
        tmp_out = ~intf.a;
        //intf.opVld <= intf.vld;
      end
    endcase
  //end
end

always @(posedge intf.clk) begin
  if(intf.vld) begin
    intf.out <= tmp_out;
    intf.opVld <= intf.vld;
  end

end
endmodule: ALU
