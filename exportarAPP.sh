#!/bin/bash
arq=exportarAPP.sh
origem=/home/gbds/IMP_EXP
destino=BASES_EXPORTADAS
cfg=dev.F
param=51
w0=31
for w in {0..1}
do
if [ "$w" == "1" ]
then
if [ "$ccfg" == "$(($req / $ver )) $arq" ]
then
dir=$(ls -l | grep $destino | wc -l)
if [ "$dir" == "0" ]
then
mkdir $destino	
fi
echo ""
echo "########################################################"
echo "############# EXPORTAR BASE DE DADOS [APP] #############"
echo "########################################################"
echo "Ver 2.3                                        $cfg$w0$dev$var"
echo "--------------------------------------------------------"
echo "Insira o nome da base de dados:"
read insert
echo "--------------------------------------------------------"
echo ""
base=${insert^^}
letra=${#base}
while [ "$letra" -lt "5" ]; do			
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo "!!!!!!!!!O NOME DEVE CONTER NO MÍNIMO 5 LETRAS!!!!!!!!!!"
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo ""
echo "--------------------------------------------------------"
echo "Insira o nome da base de dados:"
read insert
echo "--------------------------------------------------------"
echo ""
base=${insert^^}
letra=${#base}
done
if [ "$letra" -gt "4" ]
then
qtd=$(ls $origem -l | grep $base | wc -l)
if [ "$qtd" == "$param" ]
then
cp -f $origem/*$base* $destino
echo "--------------------------------------------------------"
echo "Foram copiados  $qtd/$param de $origem"
echo "para $destino com SUCESSO!  ($base)"					
echo "--------------------------------------------------------"
else
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo "!!!!!!!!!!!  >ERR0< Esperado $param arquivos  !!!!!!!!!!!!!!"
echo "!!!!!!!!!!!   Encontrados "  $qtd " arquivos    !!!!!!!!!!!!!!" 
echo "!!!!!!!!!!!   A cópia NÃO foi realizada   !!!!!!!!!!!!!!"
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
fi
fi
sleep 7s		
else
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo "!!!!! O script foi modificado, operação cancelada. !!!!!"
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
sleep 4s
fi
fi
req=50715
var=x
dev=i
ver=23
ccfg=$(wc -c $arq)	
done