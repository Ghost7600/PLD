--# ============================================================================
--# Name        : tb.do
--# Version     : 0.1
--# Adapted by  : Kenner Marqueti Couto
--# ============================================================================


#Cria biblioteca do projeto
vlib work

#compila projeto: todos os aquivo. Ordem é importante
vcom seven_segment_cntrl.vhd testbench.vhd

#Simula (work é o diretorio, testbench é o nome da entity)
vsim -voptargs="+acc" -t ns work.testbench

#Mosta forma de onda
view wave

#Adiciona ondas específicas
# -radix: binary, hex, dec
# -label: nome da forma de onda


# Com labels
add wave -label input_tb -radix unsigned  /input_tb
add wave -label output_tb -radix unsigned  /output_tb

# Sem labels
#add wave -radix binary  /output_5
#add wave -radix binary  /output_10

#Como mostrar sinais internos do processo



#Simula até um 500ns
run 60ns

wave zoomfull
write wave wave.ps