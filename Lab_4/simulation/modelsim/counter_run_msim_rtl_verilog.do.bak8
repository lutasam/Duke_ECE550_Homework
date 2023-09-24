transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Lutas/OneDrive/Desktop/Class/ECE-550D/Homework/Lab_4 {C:/Users/Lutas/OneDrive/Desktop/Class/ECE-550D/Homework/Lab_4/counter.v}

vlog -vlog01compat -work work +incdir+C:/Users/Lutas/OneDrive/Desktop/Class/ECE-550D/Homework/Lab_4 {C:/Users/Lutas/OneDrive/Desktop/Class/ECE-550D/Homework/Lab_4/counter_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  counter_tb

add wave *
view structure
view signals
run -all
