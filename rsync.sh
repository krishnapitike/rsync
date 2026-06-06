perl=kcpitike@perlmutter.nersc.gov
dec=piti526@deception.pnl.gov
kest=kcpitike@kestrel.nrel.gov
pl2=piti526@pleiades2.pnl.gov
remDirDec=/rcfs/projects/fusiondft/krishna/MPEA/mpea_dislocation_master/
remDirPL2=/files4/krishna/mpea_dislocation_master/
remPerl=/global/cfs/cdirs/m4242/pscratch/MPEA/mpea_dislocation_master/
locDir=.

if [ ${2} == 'perl' ] ; then
  remAcc=${perl}
  remDir=${remDirPerl}
elif [ ${2} == 'dec' ] ; then
  remAcc=${dec}
  remDir=${remDirDec}
elif [ ${2} == 'pl2' ] ; then
  remAcc=${pl2}
  remDir=${remDirPL2}
  export RSYNC_RSH="ssh -o HostKeyAlgorithms=+ssh-rsa -o PubkeyAcceptedAlgorithms=+ssh-rsa"
fi

if [ ${1} == "d" ] ; then

rsync -a -P --min-size=1 \
--max-size=1000m \
--exclude='*.restart' \
--exclude='CHG*' \
--exclude='WAVECAR' \
--exclude='vaspout.h5' \
--exclude='vasprun.xml' \
${remAcc}:${remDir}/${3} ${locDir}/
echo "Downloaded ${remAcc}:${remDir}/${3} to ${locDir}/${3}"

elif [ ${1} == "u" ] ; then

rsync -a -P --min-size=1 \
--max-size=1000m \
--exclude='*.restart' \
--exclude='CHG*' \
--exclude='WAVECAR' \
--exclude='vaspout.h5' \
--exclude='vasprun.xml' \
${locDir}/${3} ${remAcc}:${remDir}/
echo "Uploaded ${locDir}/${3} ${remAcc}:${remDir}/${3}"

fi
