#
#!/bin/bash

if [[ $# -lt 2 ]]; then
	echo "Usage :"$0" <number> <number>"
	exit
fi

# man test : -o <=> OR <=> ou logique

if [ $1 -lt 0 -o $2 -lt 0 ]; then
	echo $1" ou "$2" n'est pas un entier positif"
	exit
fi

if [[ $1 -gt $2 ]]; then
	min=$2;
	max=$1;
else
	min=$1;
	max=$2;
fi

for (( i = 0; i <= ($max-$min); i++ )); do
	for (( j = 0; j <= ($max-$min); j++ )); do
		calcul=$(( ($min+$i)*($min+$j) ));
		printf "%5d" $calcul;
	done
	echo
done

exit