file delete -force -- ./build


vlib build


vlog -64 -incr -sv -work build \
	+incdir+./ \
    +incdir+$env(WORKSPACE_PATH)/accel_infst_common/hardware/verilog \
    ./verilog/SRL_bit.v \
    ./verilog/SRL_bus.v \
    ./verilog/vector_multiply.v \
    ./verilog/xilinx_fifo.v \
    ./verilog/xilinx_simple_dual_port_no_change_2_clock_ram.v \
    ./verilog/xilinx_simple_dual_port_no_change_asym_width_2_clock_ram.v \
    ./verilog/xilinx_simple_dual_port_no_change_asym_width_count_2_clock_ram.v \
    ./verilog/xilinx_simple_dual_port_no_change_ram.v \
    ./verilog/xilinx_true_dual_port_no_change_ram.v \
    ./verilog/adder_tree.v \
    ./verilog/address_incrementer.v \
    ./verilog/arbitration_nway_single_cycle.v \
    ./verilog/clock_gen.v \
    ./verilog/fifo_fwft.v \
    ./verilog/fifo_fwft_prog_full_count.v
