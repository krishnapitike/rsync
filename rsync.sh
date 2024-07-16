perl=kcpitike@perlmutter.nersc.gov
dec=piti526@deception.pnl.gov
remDir=/pscratch/sd/k/kcpitike/V-alloy/MLP/MLP-VH/
#remdir=/qfs/projects/fusiondft/krishna/V-alloy/MLP/MLP-VH/
locDir=.

if [ ${2} == 'perl' ] ; then remAcc=${perl} ; elif [ ${2}=='dec' ] ; then remAcc=${dec} ; fi

if [ ${1} == "d" ] ; then

rsync -a -P --min-size=1 \
--max-size=1000m \
--exclude='*.restart' \
--exclude='CHG*' \
--exclude='WAVECAR' \
--exclude='*.err' \
--exclude='*.out' \
--exclude='vaspout.h5' \
--exclude='log*' \
--exclude='vasprun.xml' \
${remAcc}:${remDir}/${3} ${locDir}/
echo "Downloaded ${remAcc}:${remDir}/${3} to ${locDir}/${3}"

elif [ ${1} == "u" ] ; then

rsync -a -P --min-size=1 \
--max-size=1000m \
--exclude='*.restart' \
--exclude='CHG*' \
--exclude='WAVECAR' \
--exclude='*.err' \
--exclude='*.out' \
--exclude='vaspout.h5' \
--exclude='log*' \
--exclude='vasprun.xml' \
${locDir}/${3} ${remAcc}:${remDir}/
echo "Uploaded ${locDir}/${3} ${remAcc}:${remDir}/${3}"

fi
