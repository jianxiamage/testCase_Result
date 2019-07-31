#!/bin/bash

#/data/TestResults.ini

srcGroupFile='TestcaseGroup.ini'

ResultPath='/data'
GroupIniFile=$srcGroupFile
echo copy the file:$GroupIniFile to dest Dir

destPath=''

#rm -rf /data

mkdir $ResultPath -p

TestType=("OS" "Kernel" "KVM")

for item_type in ${TestType[@]}; do

  #echo $item_type
  echo ----------------------------------------------------

    #echo 当前平台:$item_plat
    
    destPath="${ResultPath}/${item_type}"
    mkdir $destPath -p
    destGroupFile="${ResultPath}/${item_type}/${srcGroupFile}"
    echo destGroupFile:$destGroupFile
 
    #\cp $srcGroupFile $destGroupFile -f


done

echo ----------------------------------------------------

