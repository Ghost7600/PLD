--# ============================================================================
--# Name        : reg_tb.do
--# Version     : 0.1
--# Copyright   : Renan, Departamento de Eletrônica, Florianópolis, IFSC
--# Description : compilação modelsim registrador 
--# Adapted by  : Kenner Marqueti Couto
--# ============================================================================


#Cria biblioteca do projeto
vlib work

#compila projeto: todos os aquivo. Ordem é importante
vcom reg.vhd testbench.vhd

#Simula (work é o diretorio, testbench é o nome da entity)
vsim -voptargs="+acc" -t ns work.testbench

#Mosta forma de onda
view wave

#Adiciona ondas específicas
# -radix: binary, hex, dec
# -label: nome da forma de onda


# Com labels
add wave -label data_in_tb -radix binary  /data_in_tb
add wave -label reg_out_tb -radix binary  /reg_out_tb
add wave -label clk_ena_tb -radix binary /clk_ena_tb
add wave -label sclr_n_tb -radix binary /sclr_n_tb
add wave -label clk_tb -radix binary /clk_tb

#Simula até um 40ns
run 40ns

wave zoomfull
write wave wave.ps
