#! /usr/bin/zsh

dmesg --clear
i=0
LOOP=100
#LOOP=10
#LOOP=5
while ((i < LOOP))
do
    echo ${i}/${LOOP}-loop
    modprobe ipi_benchmark
    ((i = i + 1))
done

dmesg
dmesg | ./average.awk
