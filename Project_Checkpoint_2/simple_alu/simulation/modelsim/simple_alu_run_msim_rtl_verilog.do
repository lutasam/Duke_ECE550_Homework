transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Lutas/OneDrive/Desktop/Class/ECE-550D/Homework/Project_Checkpoint_2/simple_alu {C:/Users/Lutas/OneDrive/Desktop/Class/ECE-550D/Homework/Project_Checkpoint_2/simple_alu/alu.v}
vlog -vlog01compat -work work +incdir+C:/Users/Lutas/OneDrive/Desktop/Class/ECE-550D/Homework/Project_Checkpoint_2/simple_alu {C:/Users/Lutas/OneDrive/Desktop/Class/ECE-550D/Homework/Project_Checkpoint_2/simple_alu/rca.v}
vlog -vlog01compat -work work +incdir+C:/Users/Lutas/OneDrive/Desktop/Class/ECE-550D/Homework/Project_Checkpoint_2/simple_alu {C:/Users/Lutas/OneDrive/Desktop/Class/ECE-550D/Homework/Project_Checkpoint_2/simple_alu/fa.v}
vlog -vlog01compat -work work +incdir+C:/Users/Lutas/OneDrive/Desktop/Class/ECE-550D/Homework/Project_Checkpoint_2/simple_alu {C:/Users/Lutas/OneDrive/Desktop/Class/ECE-550D/Homework/Project_Checkpoint_2/simple_alu/csa32.v}
vlog -vlog01compat -work work +incdir+C:/Users/Lutas/OneDrive/Desktop/Class/ECE-550D/Homework/Project_Checkpoint_2/simple_alu {C:/Users/Lutas/OneDrive/Desktop/Class/ECE-550D/Homework/Project_Checkpoint_2/simple_alu/and32.v}
vlog -vlog01compat -work work +incdir+C:/Users/Lutas/OneDrive/Desktop/Class/ECE-550D/Homework/Project_Checkpoint_2/simple_alu {C:/Users/Lutas/OneDrive/Desktop/Class/ECE-550D/Homework/Project_Checkpoint_2/simple_alu/or32.v}
vlog -vlog01compat -work work +incdir+C:/Users/Lutas/OneDrive/Desktop/Class/ECE-550D/Homework/Project_Checkpoint_2/simple_alu {C:/Users/Lutas/OneDrive/Desktop/Class/ECE-550D/Homework/Project_Checkpoint_2/simple_alu/sll32.v}
vlog -vlog01compat -work work +incdir+C:/Users/Lutas/OneDrive/Desktop/Class/ECE-550D/Homework/Project_Checkpoint_2/simple_alu {C:/Users/Lutas/OneDrive/Desktop/Class/ECE-550D/Homework/Project_Checkpoint_2/simple_alu/sra32.v}

vlog -vlog01compat -work work +incdir+C:/Users/Lutas/OneDrive/Desktop/Class/ECE-550D/Homework/Project_Checkpoint_2/simple_alu {C:/Users/Lutas/OneDrive/Desktop/Class/ECE-550D/Homework/Project_Checkpoint_2/simple_alu/alu_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  alu_tb

add wave *
view structure
view signals
run -all
