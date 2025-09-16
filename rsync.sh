perl=kcpitike@perlmutter.nersc.gov
dec=piti526@dec-admin9.pnl.gov
kest=kcpitike@kestrel.nrel.gov
pl2=piti526@pleiades2.pnl.gov
remDirDec=/rcfs/projects/fusiondft/krishna/MPEA/dislocations/nep/barrier/master/sites_212/
remDirPL2=/files4/krishna/mpea_dislocation/barrier/master/sites_212
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
