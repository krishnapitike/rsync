perl=kcpitike@perlmutter.nersc.gov
dec=piti526@deception.pnnl.gov
remAcc=${perl}
remDir=/pscratch/sd/k/kcpitike/V-alloy/configurations/
locDir=.

rsync -a -P --min-size=1 \
--max-size=1000m
--exclude='*.restart' \
--exclude='CHG*' \
--exclude='WAVECAR' \
--exclude='*.err' \
--exclude='*.out' \
--exclude='vaspout.h5' \
--exclude='log*' \
--exclude='vasprun.xml' \
if [ ${1} == "d" ] ; then 
  ${remAcc}:${remDir}/${2} ${locDir}/
  echo "Downloaded ${remAcc}:${remDir}/${2} to ${locDir}/${2}"
elif [ ${1} == "u" ] ; then
  ${locDir}/${2} ${remAcc}:${remDir}/
  echo "Uploaded ${remAcc}:${remDir}/${2} to ${locDir}/${2}"
