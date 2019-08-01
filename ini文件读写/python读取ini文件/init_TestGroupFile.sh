#!/bin/bash


srcGroupFile=''

ResultPath='/data'
GroupIniFile=$srcGroupFile
echo copy the [GroupIniFile] to dest Dir

destPath=''

#rm -rf /data

mkdir $ResultPath -p

TestType=("OS" "Kernel" "KVM")

for item_type in ${TestType[@]}; do

    echo ----------------------------------------------------

    #echo 当前平台:$item_plat
    
    destPath="${ResultPath}/${item_type}"
    mkdir $destPath -p
    destGroupFile="${ResultPath}/${item_type}/"
    echo destGroupFile:$destGroupFile
 
    srcGroupFile="TestcaseGroup_${item_type}.ini"
    echo the srcGroupFile is:$srcGroupFile
    \cp $srcGroupFile $destGroupFile -f


done

echo ----------------------------------------------------

