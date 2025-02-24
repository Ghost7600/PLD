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
vcom semaforo.vhd testbench.vhd

#Simula (work é o diretorio, testbench é o nome da entity)
vsim -voptargs="+acc" -t ns work.testbench

#Mosta forma de onda
view wave

#Adiciona ondas específicas
# -radix: binary, hex, dec
# -label: nome da forma de onda


# Com labels
add wave -label ns_tb  /ns_tb
add wave -label ew_tb  /ew_tb
add wave -label clk_tb -radix binary /clk_tb
add wave -label reset_a_tb -radix binary  /reset_a_tb
add wave -label start_tb -radix binary  /start_tb
add wave -label state  /semaforo_inst/state

# Sem labels
#add wave -radix binary  /output_5
#add wave -radix binary  /output_10

#Como mostrar sinais internos do processo



#Simula até um 500ns
run 200ns

wave zoomfull
write wave wave.ps