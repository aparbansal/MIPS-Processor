iverilog -Wall ../testbench/processor_tb.v  ../rtl/processor.v -o sim.out

echo ${x//$'\n'/ }
read -p "See sim results above." -n1 -s
echo ${x//$'\n\n'/ }

./sim.out

