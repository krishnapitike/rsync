perl=kcpitike@perlmutter.nersc.gov
dec=piti526@deception.pnl.gov
kest=kcpitike@kestrel.nrel.gov
remDir=/pscratch/sd/k/kcpitike/V-alloy/MLP/MLP-VH/
#remdir=/qfs/projects/fusiondft/krishna/V-alloy/MLP/MLP-VH/
locDir=.

if [ 'perl'~=${2} ] ; then 
  remAcc=${perl}
elif [ 'dec'~=${2} ] | [ 'con'~${2} ] ; then 
  remAcc=${dec}
elif [ 'kestrel'=~${2} ] ; then
  remAcc=${kest}
fi

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
