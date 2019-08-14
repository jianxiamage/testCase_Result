#!/bin/bash

#----------------------------------------------------------------------------------------

if [ $# -ne 3 ];then
 echo "usage: $0 TestType Platform TestCase" 
 exit 1
fi

#----------------------------------------------------------------------------------------
TestType="$1"
Platform="$2"
TestCase="$3"
TestMode="CINT"
#----------------------------------------------------------------------------------------
resultsPath='/data'
PointsPath='Points_Files'
Node_count=0
#----------------------------------------------------------------------------------------
#测试结果文件(筛选内容后)地址
destResultPath="${resultsPath}/${TestType}/${Platform}/$TestCase/$PointsPath"

#测试结果配置文件地址
#destIniPath="${resultsPath}/${TestType}/${Platform}/$TestCase/$PointsPath/${TestCase}_${Node_count}.ini"


if [ ! -s $destResultPath ];
then
  echo Error! [$destResultPath] not exited!Please check it!
  exit 1
fi

#if [ ! -s $destIniPath ];
#then
#  echo Error! [$destIniPath] not exited!Please check it!
#  exit 1
#fi

#spec2000单核浮点型
echo -------------------------------------------------------------
ls -l $destResultPath/${TestCase}_${TestMode}_*.ini

Node_count=`ls $destResultPath/${TestCase}_${TestMode}_*.ini | wc -l`
echo Node_count is:$Node_count
echo -------------------------------------------------------------

#读取iozone测试结果情况，并将本组测试结果跑分情况写入Excel文件

python -c 'import write_Excel_spec2000_ncore_CINT; write_Excel_spec2000_ncore_CINT.writeResult("'$TestType'","'$Platform'","'$TestCase'","'$TestMode'","'$Node_count'")'
