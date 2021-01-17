#
#!/bin/bash

# check arguments
if [[ $# -lt 2 ]]; then
	echo "Usage :"$0" <valeur> <deplacement>"
	exit
fi

# deplacement > 0
if [[ $2 -le 0 ]]; then
	echo "ecart > 0"
	exit;
fi

tmp=$(echo $1 | tr "," ".")

printf "%.$2lf\n" $tmp

exit