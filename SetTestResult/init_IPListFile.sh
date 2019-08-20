#!/bin/bash

#/IPList/TestResults.ini

IPListFileName='ip_list'
IPListFile='ip_list.ini'

ResultPath='/IPList'
curIPFilePath='IP_List'

srcPath=''
destPath=''

#rm -rf /IPList

mkdir $ResultPath -p

TestType=("OS" "Kernel" "KVM")

Platform=("7A" "7A_Integrated" "7A_2way" "780" "2K")

for item_type in ${TestType[@]}; do

  #echo $item_type
  echo ----------------------------------------------------

  for item_plat in ${Platform[@]}; do

    #echo 当前平台:$item_plat
    
    srcPath="${curIPFilePath}/${IPListFileName}_${item_type}_${item_plat}.ini"
    destPath="${ResultPath}/${item_type}/${item_plat}"
    mkdir $destPath -p
    destIPListFile="${ResultPath}/${item_type}/${item_plat}/${IPListFile}"
    echo destIPListFile:$destIPListFile
    
    #\cp $IPListFile  $destIPListFile
    \cp $srcPath $destIPListFile
   
  done

done

echo ----------------------------------------------------

