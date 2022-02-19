# !/bin/bash

TargetFile="./aaa.txt"
SwtchText="include\s+aquire\s+role"


grep -q -E "^\s*#\s*${SwtchText}" ${TargetFile}
if [ $? = 0 ]; then
  if [ ! -e ${TargetFile}.org ]; then
    cp -p ${TargetFile} ${TargetFile}.org
  fi
  sed -i".bk" -E "s/(.*)# ?(.*)(${SwtchText})/\1\2\3/g" ${TargetFile}
fi

