#/bin/bash

#ITEM 7
function salir_saludando(){
	NOMBRE=$1
	echo "Chau $NOMBRE"
	sleep 2
}

#ITEM 1
function fibonacci(){
	#Primer valor
	A=0
	#Segundo valor
	B=1

	echo -n "Ingrese un número: "
	read VAR1

	echo "La serie de Fibonacci es: "

	for (( i=0; i<VAR1; i++ ))
	do
		echo -n "$A "
		FIB=$((A + B))
		A=$B
		B=$FIB
	done

	echo
}

#ITEM 2

function mostrar_num_invertido(){
	echo -n "Ingrese un número: "
	read VAR1
	if echo "$VAR1"|egrep -q '^\-?[0-9]+$'; then
		echo "$VAR1"|rev
	else
		echo "No es un número"
	fi
}

#ITEM 3

function es_palindromo(){
	LEN=0
	I=1
	read -p "Ingrese la cadena que desea evaluar: " STR
	LEN=`echo $STR | wc -m`
	LEN=`expr $LEN - 1`
	if [ ! $LEN -eq 0 ]; then
    	MITAD=`expr $LEN / 2`
    	while [ $I -le $MITAD ]; do
        	C1=`echo $STR|cut -c$I`
        	C2=`echo $STR|cut -c$LEN`
        	if [ $C1 != $C2 ]; then
            	echo "La cadena no es palindromo"
        	fi
        	I=`expr $I + 1`
        	LEN=`expr $LEN - 1`
    	done
    	echo "La cadena es palindromo"
	else
    	echo "ERROR: La cadena ingresada es incorrecta"
	fi
}


#ITEM 5
function mostrar_num_ordenados(){
	echo "Ingrese 5 números"
	for (( i=0; i<=4; i++ ))
	do
		read -p "Ingrese valor $((i+1)): " VALOR
		arreglo[$i]=${VALOR}
	done

	ordenado=($(for i in "${arreglo[@]}"; do echo $i; done | sort))
	echo "${ordenado[@]}"
}

 

#---INICIO---
OPCION=0

mostrar_menu
while true; do
	read -p "Ingrese una opción: " OPCION
	case $OPCION in
		1) fibonacci;;
		2) mostrar_num_invertido;;
		3) es_palindromo;;
		5) mostrar_num_ordenados;;
		7) salir_saludando `whoami`
			break;;
		*) echo "Opción incorrecta";;
	esac
done
exit 0
