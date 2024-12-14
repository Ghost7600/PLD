# Compilação das bibliotecas e do código VHDL
vlib work

# Compilar o design principal e o testbench
vcom adder.vhd counter.vhd seven_segment_cntrl.vhd mult.vhd mux_when.vhd reg.vhd shifter.vhd mult_control.vhd mul_8x8.vhd testbench_mult8x8.vhd

# Simular
vsim -voptargs="+acc" -t ns work.testbench_mult8x8

view wave

#Adiciona ondas específicas
# -radix: binary, hex, dec, uns
# -label: nome da forma de onda
add wave -label clock -radix binary  /clk
add wave -label reset_a -radix binary  /reset_a
add wave -label start -radix binary  /start
add wave -label data_a -radix unsigned  /data_a
add wave -label data_b -radix unsigned  /data_b
add wave -label done_flag -radix binary  /done_flag
add wave -label s_sseg -radix binary  /s_sseg_unsigned
add wave -label product8x8_out -radix unsigned  /out_8x8


#Como mostrar sinais internos do processo
#add wave -label count -radix unsigned /dut_5/p0/count
add wave -label aout -radix unsigned /mul8x8_inst/s_aout
add wave -label s_state_out -radix unsigned  /mul8x8_inst/s_state_out
add wave -label bout -radix unsigned /mul8x8_inst/s_bout
add wave -label sel -radix unsigned /mul8x8_inst/s_sel
add wave -label product -radix unsigned /mul8x8_inst/s_product
add wave -label shift -radix unsigned /mul8x8_inst/s_shift
add wave -label shift_out -radix unsigned /mul8x8_inst/s_shift_out
add wave -label sum -radix unsigned /mul8x8_inst/s_sum
add wave -label count -radix unsigned /mul8x8_inst/s_count
add wave -label state -radix unsigned /mul8x8_inst/mult_control_inst/state
add wave -label clk_ena -radix unsigned /mul8x8_inst/mult_control_inst/clk_ena
add wave -label shift_sel -radix unsigned /mul8x8_inst/mult_control_inst/shift_sel

#Simula até um 500ns
run 100ns

wave zoomfull
write wave wave.ps