#
#!/bin/bash

# check arguments
if [[ $# -lt 2 ]]; then
	echo "Usage :"$0" <SRC_FILE> <DEST_FILE>"
	exit
fi

# test fichier dest existe
if [[ -f $2 ]]; then
	echo "$2 exists. Overwrite? Yes/No -->"
	read x;
	if [[ $x != "Yes" ]]; then
		exit;
	fi
	rm $2;
fi

#recupère fichier src
read tmp < $1;
pos=1;
len=8;

# récupère mot par mot le contenu de $1 que l'on met dans addr
for addr in $(cat $1); do
	for (( i = 0; i < 3; i++ )); do
		tmp=$(expr substr $addr $pos $len)
		pos=$(($pos + $len));
		echo -n "$((2#$tmp))." >> $2
	done
	# pour que le dernier ait pas le point/faire la saut de ligne
	echo "$((2#$tmp))" >> $2
	pos=1;
done

exit