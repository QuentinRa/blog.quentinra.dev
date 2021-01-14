#
#!/bin/bash

# check arguments
if [[ $# -lt 3 ]]; then
	echo "Usage :"$0" <STRINGS_REPRESENTATIONS_FILE> <radix> <REPORTS_FILE>"
	exit
fi

# radix beetween 2 and 36
if [[ $2 -lt 2 || $2 -gt 36 ]]; then
	echo "The radix is a decimal between 2 and 36."
	exit;
fi

# STRINGS_REPRESENTATIONS_FILE exists/is regular
if [[ ! -f $1 ]]; then
	echo "$1 does not exist or is not regular."
	exit;
fi

DIGITS=0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ;
# prends depuis la première valeur de digits autant de nombre que la valeur de la base
DIGITS_AUTORISES=$(expr substr $DIGITS 1 $1);
pos=1;


while read check; do
	echo "$check : " > strings_representations.dat
	len=$(expr length $check)
	for (( i = 0; i < $len; i++ )); do
		# recuperation du digit
		val=$(expr substr $check $pos 1)
		verification=$(expr index $DIGITS_AUTORISES $val)
		# pas d'occurence
		if [[ $verification -eq 0 ]]; then
			echo -n "$val ";
		fi
		# passe au digit suivant
		pos=$(($pos+1));
	done
done < $1

exit