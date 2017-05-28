# written by eric bridgeford

rm -rf $1/outputs
mkdir $1/outputs

pkill -f memlog
pkill -f cpulog
pkill -f disklog

./memlog.sh > ${1}/mem.txt &
memkey=$!
python cpulog.py ${1}/cpu.txt &
cpukey=$!
./disklog.sh $1 > ${1}/disk.txt &
diskkey=$!

python CPAC_cli.py -s ../CPAC_sublists/single_sub.yml -c ../CPAC_pipes/best_pipeline.yml -n fsl

sleep 30

kill $memkey $cpukey $diskkey

