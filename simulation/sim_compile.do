if {[file exist build]} {
    rm -r build
}

vlib build


vlog -lint -sv +define+SIMULATION -work build  +incdir+../hardware/verilog/ ../hardware/verilog/clock_gen.v
vlog -lint -sv +define+SIMULATION -work build  +incdir+../hardware/verilog/ ../hardware/verilog/fifo_fwft.v
vlog -lint -sv +define+SIMULATION -work build  +incdir+../hardware/verilog/ ../hardware/verilog/fifo_fwft_prog_full_count.v
vlog -lint -sv +define+SIMULATION -work build  +incdir+../hardware/verilog/ ../hardware/verilog/SRL_bit.v
vlog -lint -sv +define+SIMULATION -work build  +incdir+../hardware/verilog/ ../hardware/verilog/SRL_bus.v
vlog -lint -sv +define+SIMULATION -work build  +incdir+../hardware/verilog/ ../hardware/verilog/xilinx_simple_dual_port_no_change_2_clock_ram.v
vlog -lint -sv +define+SIMULATION -work build  +incdir+../hardware/verilog/ ../hardware/verilog/xilinx_simple_dual_port_no_change_asym_width_count_2_clock_ram.v
vlog -lint -sv +define+SIMULATION -work build  +incdir+../hardware/verilog/ ../hardware/verilog/xilinx_simple_dual_port_no_change_ram.v
vlog -lint -sv +define+SIMULATION -work build  +incdir+../hardware/verilog/ ../hardware/verilog/xilinx_true_dual_port_no_change_ram.v
vlog -lint -sv +define+SIMULATION -work build  +incdir+../hardware/verilog/ ../hardware/verilog/arbitration_nway_single_cycle.v
vlog -lint -sv +define+SIMULATION -work build  +incdir+../hardware/verilog/ ../hardware/verilog/adder_tree.v
vlog -lint -sv +define+SIMULATION -work build  +incdir+../hardware/verilog/ ../hardware/verilog/vector_multiply.v

