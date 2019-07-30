#!/bin/bash

#--------------------------------------------
ServerIP='auto_test.loongson.cn'
ServerUser='loongson-test'
ServerPass='loongson'
#--------------------------------------------

ServerTestDir=autotest_result
#TestName="stressapp"
#TestGroupNum=2
okfile='ok_file.txt'
errfile='err_file.txt'
#--------------------------------------------
#items_count=3
#--------------------------------------------

if [ $# -ne 2 ];then
   echo "usage: $0 TestCase Platform"
   exit 0
fi

TestCase="$1"
Platform="$2"

#--------------------------------------------
ipList_stressappFile='ipList_stressapp.txt'
tmpipList_stressappFile="${ipList_stressappFile}.tmp"
#--------------------------------------------

#testcaseDir="7A"
testcaseDir=$Platform

mkdir -p $testcaseDir
testcase_ip_path="$testcaseDir/$ipList_stressappFile"
testcase_ip_path_tmp="$testcaseDir/$tmpipList_stressappFile"

function writeIPFile()
{
   if [ $# -ne 1 ];then
     echo "usage: writeIPFile opt_name"
     return
   fi

   retCode=0
   opt_name="$1"
   #opt_num="$2"

   #count_items=`python get_node_count.py $opt_name`

   #count_items=`python -c "import get_node_count;get_node_count.getSectionCount($opt_name)"`
   count_items=$(python -c 'import get_node_count; print get_node_count.getSectionCount("'$opt_name'")')
   echo count_items is:$count_items 
  
   for((i=1;i<=count_items;i++));
   do
     #IP_testcase=`python get_node_ip.py $opt_name $i`
     IP_testcase=$(python -c 'import get_node_ip; print get_node_ip.getResult("'$opt_name'","'$i'")')
     echo 第[$i]个ip:$IP_testcase
     echo $IP_testcase  >>  $testcase_ip_path
   done

}


#--------------------------------------------
check_result()
{

    if [ $# -ne 1 ];then
      echo "usage: check_result TestName"
      return
    fi

    TestName="$1"
    echo "--------------------------------------------------------"
    echo Begin to get the state of Test Case:[$TestName]
    echo "--------------------------------------------------------"
    i=0
    exec 3< $testcase_ip_path_tmp
    while read host <&3
    do
        echo "--------------------------------------------------------"
        let i++
        sshpass -p $ServerPass scp -o StrictHostKeychecking=no -r $ServerUser@$ServerIP:~/$ServerTestDir/$TestName/$host-* ${testcaseDir} || { echo 'Error!'; continue; }
        echo [$host] update state OK.
        opt_value=0
        #setResult
        python -c 'import set_test_result; set_test_result.setResult("'$TestName'","'$i'","'$opt_value'")'

    done < $testcase_ip_path_tmp

    return 0
}


rm -rf $testcase_ip_path

#writeIPFile stressapp 
writeIPFile $TestCase


#Delete the space lines and comment lines
sed '/^#.*\|^[[:space:]]*$/d' $testcase_ip_path> $testcase_ip_path_tmp


#check_result stressapp 
check_result $TestCase

rm -rf $testcase_ip_path_tmp

echo "--------------------------------------------------------"
