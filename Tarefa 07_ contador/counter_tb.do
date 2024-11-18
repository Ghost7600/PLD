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
vcom counter.vhd testbench.vhd

#Simula (work é o diretorio, testbench é o nome da entity)
vsim -voptargs="+acc" -t ns work.testbench

#Mosta forma de onda
view wave

#Adiciona ondas específicas
# -radix: binary, hex, dec
# -label: nome da forma de onda


# Com labels
add wave -label clk_tb -radix binary  /clk_tb
add wave -label aclr_n_tb -radix binary  /aclr_n_tb
add wave -label count_out_tb -radix binary /count_out_tb



#Simula até um 40ns
run 40ns

wave zoomfull
write wave wave.ps
