--# ============================================================================
--# Name        : tb_divisor.do
--# Author      : Renan Augusto Starke
--# Version     : 0.1
--# Copyright   : Renan, Departamento de Eletrônica, Florianópolis, IFSC
--# Description : Exemplo de script de compilação ModelSim para divisor de clock
--# Adapted by  : Kenner Marqueti Couto
--# ============================================================================


#Cria biblioteca do projeto
vlib work

#compila projeto: todos os aquivo. Ordem é importante
vcom mux_sel.vhd mux_when.vhd testbench.vhd

#Simula (work é o diretorio, testbench é o nome da entity)
vsim -voptargs="+acc" -t ns work.testbench

#Mosta forma de onda
view wave

#Adiciona ondas específicas
# -radix: binary, hex, dec
# -label: nome da forma de onda


# Com labels
add wave -label a_tb -radix unsigned  /a_tb
add wave -label b_tb -radix unsigned  /b_tb
add wave -label sel -radix unsigned  /sel_tb
add wave -label result_sel -radix unsigned /result_tb_sel
add wave -label result_when -radix unsigned /result_tb_when


# Sem labels
#add wave -radix binary  /output_5
#add wave -radix binary  /output_10

#Como mostrar sinais internos do processo



#Simula até um 500ns
run 60ns

wave zoomfull
write wave wave.ps
