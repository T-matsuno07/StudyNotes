# !/bin/bash

UserName="root"
IpAddr="10.8.8.129"
DirPath="/tmp"
ExeCommand="sh ./sample.sh"

if [ ! -e ./oneline_ssh.zip ]; then
  zip  -r ./oneline_ssh.zip ./oneline_ssh
fi

for IpAddr in `sh ./print_ip_address.sh`
do
  scp ./oneline_ssh.zip ${UserName}@${IpAddr}:${DirPath}
  if [ $? -eq 0 ]; then
     ssh ${UserName}@${IpAddr} "cd ${DirPath} && unzip oneline_ssh.zip && cd ./oneline_ssh && ${ExeCommand}"
  fi
done