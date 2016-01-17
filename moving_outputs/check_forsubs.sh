exec 4<$1
exec 5<$2
COUNTER=0
while read -r line1<&4 && read -r line2<&5; do
	sub=${line1%_*}
	if [[ -f ${sub}_1.npz && -f ${sub}_2.npz ]]; then
		python npz2graphml.py $line1 $line2
		let COUNTER=$COUNTER+1
		echo $COUNTER
	fi  	

done 4<$1 5<$2
	
