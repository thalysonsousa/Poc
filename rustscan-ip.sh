#!/bin/bash

cat $1 + > merged.txt

while read line; do
  # Extract the IP address and ports from each line
  ip=$(echo $line | awk '{print $1}')
  ports=$(echo $line | awk '{print $3}' | tr -d '[]')


  # Split the ports into an array
  IFS=',' read -ra port_arr <<< "$ports"


  # Print the IP address and each port in the "ip:port" format
  for port in "${port_arr[@]}"; do
    echo "${ip}:${port}" >> saida-bash.txt
  done
done < merged.txt
