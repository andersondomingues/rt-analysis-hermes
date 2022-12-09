module ddma_driver_tb4 #()(
  input logic clock,
  input logic reset,
  interface_router_port.ROUTER router_if,
  interface_memory.DUT mem_if,
  interface_ddma.TCD ddma_if
);


integer counter = 0;
always @(posedge clock) begin
  counter <= counter + 1;
end


initial begin

  router_if.clock_tx = clock;
  router_if.data_o = counter;
  #0;  // wait 0 cycles

  // source_node:  4
  // target_node:  8
  // source_xy:    {'X': 0, 'Y': 1}
  // target_xy:    {'X': 0, 'Y': 2}
  // data_size:    16384
  // release_time: 40000
  #2;
  mem_if.enable_in = 1;
  mem_if.wb_in = 1;
  mem_if.data_in = (0 << 16) & 2;  // header flit
  mem_if.addr_in = 'h0;

  #2;
  mem_if.enable_in = 1;
  mem_if.wb_in = 1;
  mem_if.data_in = 4096;  // 16384 bytes, size flit
  mem_if.addr_in = 'h0 + 'h4;

  #2;
  ddma_if.addr_in = 'h0;
  ddma_if.nbytes = 16384;
  ddma_if.cmd_in = 1;

  mem_if.wb_in = 0;  // lock memory write


  #2;
  #16384;  // wait 8192 cycles

  // source_node:  4
  // target_node:  5
  // source_xy:    {'X': 0, 'Y': 1}
  // target_xy:    {'X': 1, 'Y': 1}
  // data_size:    153600
  // release_time: 96250
  #2;
  mem_if.enable_in = 1;
  mem_if.wb_in = 1;
  mem_if.data_in = (1 << 16) & 1;  // header flit
  mem_if.addr_in = 'h0;

  #2;
  mem_if.enable_in = 1;
  mem_if.wb_in = 1;
  mem_if.data_in = 38400;  // 153600 bytes, size flit
  mem_if.addr_in = 'h0 + 'h4;

  #2;
  ddma_if.addr_in = 'h0;
  ddma_if.nbytes = 153600;
  ddma_if.cmd_in = 1;

  mem_if.wb_in = 0;  // lock memory write


  #2;
  #153600;  // wait 76800 cycles

  // source_node:  4
  // target_node:  5
  // source_xy:    {'X': 0, 'Y': 1}
  // target_xy:    {'X': 1, 'Y': 1}
  // data_size:    153600
  // release_time: 192500
  #2;
  mem_if.enable_in = 1;
  mem_if.wb_in = 1;
  mem_if.data_in = (1 << 16) & 1;  // header flit
  mem_if.addr_in = 'h0;

  #2;
  mem_if.enable_in = 1;
  mem_if.wb_in = 1;
  mem_if.data_in = 38400;  // 153600 bytes, size flit
  mem_if.addr_in = 'h0 + 'h4;

  #2;
  ddma_if.addr_in = 'h0;
  ddma_if.nbytes = 153600;
  ddma_if.cmd_in = 1;

  mem_if.wb_in = 0;  // lock memory write


  #2;
  #153600;  // wait 76800 cycles

  // source_node:  4
  // target_node:  5
  // source_xy:    {'X': 0, 'Y': 1}
  // target_xy:    {'X': 1, 'Y': 1}
  // data_size:    153600
  // release_time: 288750
  #2;
  mem_if.enable_in = 1;
  mem_if.wb_in = 1;
  mem_if.data_in = (1 << 16) & 1;  // header flit
  mem_if.addr_in = 'h0;

  #2;
  mem_if.enable_in = 1;
  mem_if.wb_in = 1;
  mem_if.data_in = 38400;  // 153600 bytes, size flit
  mem_if.addr_in = 'h0 + 'h4;

  #2;
  ddma_if.addr_in = 'h0;
  ddma_if.nbytes = 153600;
  ddma_if.cmd_in = 1;

  mem_if.wb_in = 0;  // lock memory write


  #2;
  #153600;  // wait 76800 cycles

  // source_node:  4
  // target_node:  5
  // source_xy:    {'X': 0, 'Y': 1}
  // target_xy:    {'X': 1, 'Y': 1}
  // data_size:    153600
  // release_time: 385000
  #2;
  mem_if.enable_in = 1;
  mem_if.wb_in = 1;
  mem_if.data_in = (1 << 16) & 1;  // header flit
  mem_if.addr_in = 'h0;

  #2;
  mem_if.enable_in = 1;
  mem_if.wb_in = 1;
  mem_if.data_in = 38400;  // 153600 bytes, size flit
  mem_if.addr_in = 'h0 + 'h4;

  #2;
  ddma_if.addr_in = 'h0;
  ddma_if.nbytes = 153600;
  ddma_if.cmd_in = 1;

  mem_if.wb_in = 0;  // lock memory write


  #2;
  #153600;  // wait 76800 cycles

  // source_node:  4
  // target_node:  5
  // source_xy:    {'X': 0, 'Y': 1}
  // target_xy:    {'X': 1, 'Y': 1}
  // data_size:    153600
  // release_time: 481250
  #2;
  mem_if.enable_in = 1;
  mem_if.wb_in = 1;
  mem_if.data_in = (1 << 16) & 1;  // header flit
  mem_if.addr_in = 'h0;

  #2;
  mem_if.enable_in = 1;
  mem_if.wb_in = 1;
  mem_if.data_in = 38400;  // 153600 bytes, size flit
  mem_if.addr_in = 'h0 + 'h4;

  #2;
  ddma_if.addr_in = 'h0;
  ddma_if.nbytes = 153600;
  ddma_if.cmd_in = 1;

  mem_if.wb_in = 0;  // lock memory write


  #2;
  #153600;  // wait 76800 cycles

  // source_node:  4
  // target_node:  5
  // source_xy:    {'X': 0, 'Y': 1}
  // target_xy:    {'X': 1, 'Y': 1}
  // data_size:    153600
  // release_time: 577500
  #2;
  mem_if.enable_in = 1;
  mem_if.wb_in = 1;
  mem_if.data_in = (1 << 16) & 1;  // header flit
  mem_if.addr_in = 'h0;

  #2;
  mem_if.enable_in = 1;
  mem_if.wb_in = 1;
  mem_if.data_in = 38400;  // 153600 bytes, size flit
  mem_if.addr_in = 'h0 + 'h4;

  #2;
  ddma_if.addr_in = 'h0;
  ddma_if.nbytes = 153600;
  ddma_if.cmd_in = 1;

  mem_if.wb_in = 0;  // lock memory write


  #2;
  #153600;  // wait 76800 cycles

  // source_node:  4
  // target_node:  5
  // source_xy:    {'X': 0, 'Y': 1}
  // target_xy:    {'X': 1, 'Y': 1}
  // data_size:    153600
  // release_time: 673750
  #2;
  mem_if.enable_in = 1;
  mem_if.wb_in = 1;
  mem_if.data_in = (1 << 16) & 1;  // header flit
  mem_if.addr_in = 'h0;

  #2;
  mem_if.enable_in = 1;
  mem_if.wb_in = 1;
  mem_if.data_in = 38400;  // 153600 bytes, size flit
  mem_if.addr_in = 'h0 + 'h4;

  #2;
  ddma_if.addr_in = 'h0;
  ddma_if.nbytes = 153600;
  ddma_if.cmd_in = 1;

  mem_if.wb_in = 0;  // lock memory write


  #2;
  #153600;  // wait 76800 cycles

  // source_node:  4
  // target_node:  5
  // source_xy:    {'X': 0, 'Y': 1}
  // target_xy:    {'X': 1, 'Y': 1}
  // data_size:    153600
  // release_time: 770000
  #2;
  mem_if.enable_in = 1;
  mem_if.wb_in = 1;
  mem_if.data_in = (1 << 16) & 1;  // header flit
  mem_if.addr_in = 'h0;

  #2;
  mem_if.enable_in = 1;
  mem_if.wb_in = 1;
  mem_if.data_in = 38400;  // 153600 bytes, size flit
  mem_if.addr_in = 'h0 + 'h4;

  #2;
  ddma_if.addr_in = 'h0;
  ddma_if.nbytes = 153600;
  ddma_if.cmd_in = 1;

  mem_if.wb_in = 0;  // lock memory write


  #2;
  #153600;  // wait 76800 cycles

  // source_node:  4
  // target_node:  5
  // source_xy:    {'X': 0, 'Y': 1}
  // target_xy:    {'X': 1, 'Y': 1}
  // data_size:    153600
  // release_time: 866250
  #2;
  mem_if.enable_in = 1;
  mem_if.wb_in = 1;
  mem_if.data_in = (1 << 16) & 1;  // header flit
  mem_if.addr_in = 'h0;

  #2;
  mem_if.enable_in = 1;
  mem_if.wb_in = 1;
  mem_if.data_in = 38400;  // 153600 bytes, size flit
  mem_if.addr_in = 'h0 + 'h4;

  #2;
  ddma_if.addr_in = 'h0;
  ddma_if.nbytes = 153600;
  ddma_if.cmd_in = 1;

  mem_if.wb_in = 0;  // lock memory write


  #2;
  #153600;  // wait 76800 cycles

  // source_node:  4
  // target_node:  5
  // source_xy:    {'X': 0, 'Y': 1}
  // target_xy:    {'X': 1, 'Y': 1}
  // data_size:    153600
  // release_time: 962500
  #2;
  mem_if.enable_in = 1;
  mem_if.wb_in = 1;
  mem_if.data_in = (1 << 16) & 1;  // header flit
  mem_if.addr_in = 'h0;

  #2;
  mem_if.enable_in = 1;
  mem_if.wb_in = 1;
  mem_if.data_in = 38400;  // 153600 bytes, size flit
  mem_if.addr_in = 'h0 + 'h4;

  #2;
  ddma_if.addr_in = 'h0;
  ddma_if.nbytes = 153600;
  ddma_if.cmd_in = 1;

  mem_if.wb_in = 0;  // lock memory write


  #2;
  #153600;  // wait 76800 cycles

  // source_node:  4
  // target_node:  5
  // source_xy:    {'X': 0, 'Y': 1}
  // target_xy:    {'X': 1, 'Y': 1}
  // data_size:    153600
  // release_time: 1058750
  #2;
  mem_if.enable_in = 1;
  mem_if.wb_in = 1;
  mem_if.data_in = (1 << 16) & 1;  // header flit
  mem_if.addr_in = 'h0;

  #2;
  mem_if.enable_in = 1;
  mem_if.wb_in = 1;
  mem_if.data_in = 38400;  // 153600 bytes, size flit
  mem_if.addr_in = 'h0 + 'h4;

  #2;
  ddma_if.addr_in = 'h0;
  ddma_if.nbytes = 153600;
  ddma_if.cmd_in = 1;

  mem_if.wb_in = 0;  // lock memory write


  #2;
  #153600;  // wait 76800 cycles

  // source_node:  4
  // target_node:  5
  // source_xy:    {'X': 0, 'Y': 1}
  // target_xy:    {'X': 1, 'Y': 1}
  // data_size:    153600
  // release_time: 1155000
  #2;
  mem_if.enable_in = 1;
  mem_if.wb_in = 1;
  mem_if.data_in = (1 << 16) & 1;  // header flit
  mem_if.addr_in = 'h0;

  #2;
  mem_if.enable_in = 1;
  mem_if.wb_in = 1;
  mem_if.data_in = 38400;  // 153600 bytes, size flit
  mem_if.addr_in = 'h0 + 'h4;

  #2;
  ddma_if.addr_in = 'h0;
  ddma_if.nbytes = 153600;
  ddma_if.cmd_in = 1;

  mem_if.wb_in = 0;  // lock memory write


  #2;
  #153600;  // wait 76800 cycles

  // source_node:  4
  // target_node:  5
  // source_xy:    {'X': 0, 'Y': 1}
  // target_xy:    {'X': 1, 'Y': 1}
  // data_size:    153600
  // release_time: 1251250
  #2;
  mem_if.enable_in = 1;
  mem_if.wb_in = 1;
  mem_if.data_in = (1 << 16) & 1;  // header flit
  mem_if.addr_in = 'h0;

  #2;
  mem_if.enable_in = 1;
  mem_if.wb_in = 1;
  mem_if.data_in = 38400;  // 153600 bytes, size flit
  mem_if.addr_in = 'h0 + 'h4;

  #2;
  ddma_if.addr_in = 'h0;
  ddma_if.nbytes = 153600;
  ddma_if.cmd_in = 1;

  mem_if.wb_in = 0;  // lock memory write


  #2;
  #153600;  // wait 76800 cycles

  // source_node:  4
  // target_node:  5
  // source_xy:    {'X': 0, 'Y': 1}
  // target_xy:    {'X': 1, 'Y': 1}
  // data_size:    153600
  // release_time: 1347500
  #2;
  mem_if.enable_in = 1;
  mem_if.wb_in = 1;
  mem_if.data_in = (1 << 16) & 1;  // header flit
  mem_if.addr_in = 'h0;

  #2;
  mem_if.enable_in = 1;
  mem_if.wb_in = 1;
  mem_if.data_in = 38400;  // 153600 bytes, size flit
  mem_if.addr_in = 'h0 + 'h4;

  #2;
  ddma_if.addr_in = 'h0;
  ddma_if.nbytes = 153600;
  ddma_if.cmd_in = 1;

  mem_if.wb_in = 0;  // lock memory write


  #2;
  #153600;  // wait 76800 cycles

  // source_node:  4
  // target_node:  5
  // source_xy:    {'X': 0, 'Y': 1}
  // target_xy:    {'X': 1, 'Y': 1}
  // data_size:    153600
  // release_time: 1443750
  #2;
  mem_if.enable_in = 1;
  mem_if.wb_in = 1;
  mem_if.data_in = (1 << 16) & 1;  // header flit
  mem_if.addr_in = 'h0;

  #2;
  mem_if.enable_in = 1;
  mem_if.wb_in = 1;
  mem_if.data_in = 38400;  // 153600 bytes, size flit
  mem_if.addr_in = 'h0 + 'h4;

  #2;
  ddma_if.addr_in = 'h0;
  ddma_if.nbytes = 153600;
  ddma_if.cmd_in = 1;

  mem_if.wb_in = 0;  // lock memory write


  #2;
  #153600;  // wait 76800 cycles

  // source_node:  4
  // target_node:  5
  // source_xy:    {'X': 0, 'Y': 1}
  // target_xy:    {'X': 1, 'Y': 1}
  // data_size:    153600
  // release_time: 1540000
  #2;
  mem_if.enable_in = 1;
  mem_if.wb_in = 1;
  mem_if.data_in = (1 << 16) & 1;  // header flit
  mem_if.addr_in = 'h0;

  #2;
  mem_if.enable_in = 1;
  mem_if.wb_in = 1;
  mem_if.data_in = 38400;  // 153600 bytes, size flit
  mem_if.addr_in = 'h0 + 'h4;

  #2;
  ddma_if.addr_in = 'h0;
  ddma_if.nbytes = 153600;
  ddma_if.cmd_in = 1;

  mem_if.wb_in = 0;  // lock memory write


  #2;
  #153600;  // wait 76800 cycles

  // source_node:  4
  // target_node:  5
  // source_xy:    {'X': 0, 'Y': 1}
  // target_xy:    {'X': 1, 'Y': 1}
  // data_size:    153600
  // release_time: 1636250
  #2;
  mem_if.enable_in = 1;
  mem_if.wb_in = 1;
  mem_if.data_in = (1 << 16) & 1;  // header flit
  mem_if.addr_in = 'h0;

  #2;
  mem_if.enable_in = 1;
  mem_if.wb_in = 1;
  mem_if.data_in = 38400;  // 153600 bytes, size flit
  mem_if.addr_in = 'h0 + 'h4;

  #2;
  ddma_if.addr_in = 'h0;
  ddma_if.nbytes = 153600;
  ddma_if.cmd_in = 1;

  mem_if.wb_in = 0;  // lock memory write


  #2;
  #153600;  // wait 76800 cycles

  // source_node:  4
  // target_node:  5
  // source_xy:    {'X': 0, 'Y': 1}
  // target_xy:    {'X': 1, 'Y': 1}
  // data_size:    153600
  // release_time: 1732500
  #2;
  mem_if.enable_in = 1;
  mem_if.wb_in = 1;
  mem_if.data_in = (1 << 16) & 1;  // header flit
  mem_if.addr_in = 'h0;

  #2;
  mem_if.enable_in = 1;
  mem_if.wb_in = 1;
  mem_if.data_in = 38400;  // 153600 bytes, size flit
  mem_if.addr_in = 'h0 + 'h4;

  #2;
  ddma_if.addr_in = 'h0;
  ddma_if.nbytes = 153600;
  ddma_if.cmd_in = 1;

  mem_if.wb_in = 0;  // lock memory write


  #2;
  #153600;  // wait 76800 cycles

  // source_node:  4
  // target_node:  5
  // source_xy:    {'X': 0, 'Y': 1}
  // target_xy:    {'X': 1, 'Y': 1}
  // data_size:    153600
  // release_time: 1828750
  #2;
  mem_if.enable_in = 1;
  mem_if.wb_in = 1;
  mem_if.data_in = (1 << 16) & 1;  // header flit
  mem_if.addr_in = 'h0;

  #2;
  mem_if.enable_in = 1;
  mem_if.wb_in = 1;
  mem_if.data_in = 38400;  // 153600 bytes, size flit
  mem_if.addr_in = 'h0 + 'h4;

  #2;
  ddma_if.addr_in = 'h0;
  ddma_if.nbytes = 153600;
  ddma_if.cmd_in = 1;

  mem_if.wb_in = 0;  // lock memory write


  #2;
  #153600;  // wait 76800 cycles

  // source_node:  4
  // target_node:  5
  // source_xy:    {'X': 0, 'Y': 1}
  // target_xy:    {'X': 1, 'Y': 1}
  // data_size:    153600
  // release_time: 1925000
  #2;
  mem_if.enable_in = 1;
  mem_if.wb_in = 1;
  mem_if.data_in = (1 << 16) & 1;  // header flit
  mem_if.addr_in = 'h0;

  #2;
  mem_if.enable_in = 1;
  mem_if.wb_in = 1;
  mem_if.data_in = 38400;  // 153600 bytes, size flit
  mem_if.addr_in = 'h0 + 'h4;

  #2;
  ddma_if.addr_in = 'h0;
  ddma_if.nbytes = 153600;
  ddma_if.cmd_in = 1;

  mem_if.wb_in = 0;  // lock memory write


  #2;
  #153600;  // wait 76800 cycles

  // source_node:  4
  // target_node:  5
  // source_xy:    {'X': 0, 'Y': 1}
  // target_xy:    {'X': 1, 'Y': 1}
  // data_size:    153600
  // release_time: 2021250
  #2;
  mem_if.enable_in = 1;
  mem_if.wb_in = 1;
  mem_if.data_in = (1 << 16) & 1;  // header flit
  mem_if.addr_in = 'h0;

  #2;
  mem_if.enable_in = 1;
  mem_if.wb_in = 1;
  mem_if.data_in = 38400;  // 153600 bytes, size flit
  mem_if.addr_in = 'h0 + 'h4;

  #2;
  ddma_if.addr_in = 'h0;
  ddma_if.nbytes = 153600;
  ddma_if.cmd_in = 1;

  mem_if.wb_in = 0;  // lock memory write


  #2;
  #153600;  // wait 76800 cycles

  // source_node:  4
  // target_node:  5
  // source_xy:    {'X': 0, 'Y': 1}
  // target_xy:    {'X': 1, 'Y': 1}
  // data_size:    153600
  // release_time: 2117500
  #2;
  mem_if.enable_in = 1;
  mem_if.wb_in = 1;
  mem_if.data_in = (1 << 16) & 1;  // header flit
  mem_if.addr_in = 'h0;

  #2;
  mem_if.enable_in = 1;
  mem_if.wb_in = 1;
  mem_if.data_in = 38400;  // 153600 bytes, size flit
  mem_if.addr_in = 'h0 + 'h4;

  #2;
  ddma_if.addr_in = 'h0;
  ddma_if.nbytes = 153600;
  ddma_if.cmd_in = 1;

  mem_if.wb_in = 0;  // lock memory write


  #2;
  #153600;  // wait 76800 cycles

  // source_node:  4
  // target_node:  5
  // source_xy:    {'X': 0, 'Y': 1}
  // target_xy:    {'X': 1, 'Y': 1}
  // data_size:    153600
  // release_time: 2213750
  #2;
  mem_if.enable_in = 1;
  mem_if.wb_in = 1;
  mem_if.data_in = (1 << 16) & 1;  // header flit
  mem_if.addr_in = 'h0;

  #2;
  mem_if.enable_in = 1;
  mem_if.wb_in = 1;
  mem_if.data_in = 38400;  // 153600 bytes, size flit
  mem_if.addr_in = 'h0 + 'h4;

  #2;
  ddma_if.addr_in = 'h0;
  ddma_if.nbytes = 153600;
  ddma_if.cmd_in = 1;

  mem_if.wb_in = 0;  // lock memory write


  #2;
  #153600;  // wait 76800 cycles

  // source_node:  4
  // target_node:  5
  // source_xy:    {'X': 0, 'Y': 1}
  // target_xy:    {'X': 1, 'Y': 1}
  // data_size:    153600
  // release_time: 2310000
  #2;
  mem_if.enable_in = 1;
  mem_if.wb_in = 1;
  mem_if.data_in = (1 << 16) & 1;  // header flit
  mem_if.addr_in = 'h0;

  #2;
  mem_if.enable_in = 1;
  mem_if.wb_in = 1;
  mem_if.data_in = 38400;  // 153600 bytes, size flit
  mem_if.addr_in = 'h0 + 'h4;

  #2;
  ddma_if.addr_in = 'h0;
  ddma_if.nbytes = 153600;
  ddma_if.cmd_in = 1;

  mem_if.wb_in = 0;  // lock memory write


  #2;
end

endmodule

