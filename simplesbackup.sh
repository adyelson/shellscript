#!/bin/bash
local=$(pwd)
origem=/home/gbds/IMP_EXP
destino=/TODAS_BASES
nomearq=00_TODAS_BASES
pastas=$(ls $origem |awk -F'_'  '$1 {print  $1}'|sort|uniq|sort -nr)
qtd=$(ls $origem |awk -F'_'  '$1 {print  $1}'|sort|uniq|sort -n | wc -l)
array=($pastas)
#echo $local
mkdir $destino

#echo linhas: $qtd 
#echo array: ${array[4]} ---

w=$(($qtd-1)) 
#echo $w
x=0

while [ $x -le $w ]
do
   mkdir $destino/${array[$x]}
   cp $origem/${array[$x]}* $destino/${array[$x]}
  x=$(($x+1))
done

zip -r $nomearq.zip $destino/*
rm -fr $destino
echo -----------------------------------------------------
echo " Foi criado o arquivo $nomearq.zip em $local,"
echo " contendo todas as bases de $origem"
echo -----------------------------------------------------
sleep 3s