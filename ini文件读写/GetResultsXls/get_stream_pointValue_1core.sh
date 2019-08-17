#!/bin/bash

#----------------------------------------------------------------------------------------

if [ $# -ne 4 ];then
 echo "usage: $0 TestType Platform TestCase Node_num" 
 exit 1
fi

#----------------------------------------------------------------------------------------
TestType="$1"
Platform="$2"
TestCase="$3"
Node_num="$4"
#----------------------------------------------------------------------------------------
resultsPath='/data'
PointsPath='Points_Files'
testMode='1core'
#----------------------------------------------------------------------------------------
#测试结果文件(筛选内容后)地址
destResultPath="${resultsPath}/${TestType}/${Platform}/$TestCase/$PointsPath/Points_${TestCase}_${testMode}_${Node_num}.txt"

#测试结果配置文件地址
destIniPath="${resultsPath}/${TestType}/${Platform}/$TestCase/$PointsPath/${TestCase}_${testMode}_${Node_num}.ini"


if [ ! -s $destResultPath ];
then
  echo Error! [$destResultPath] not existed!Please check it!
  exit 1
fi

if [ ! -s $destIniPath ];
then
  echo Error! [$destIniPath] not existed!Please check it!
  exit 1
fi

#读取测试结果跑分情况，并记录在相应的配置文件中

function get_Copy()
{

  key_name='Copy'
  #key_val=`cat  $destResultPath |awk 'NR==2'|awk '{print $4}'`
  #key_val_str=`cat  $destResultPath | grep $key_name |awk '{print $4}'`
  #key_val=${key_val_str%%\**}
  key_val=`cat  $destResultPath | grep $key_name |awk '{print $2}'`
  python -c 'import mark_points_stream; mark_points_stream.setPoint("'$TestType'","'$Platform'","'$TestCase'","'$Node_num'","'$key_name'","'$key_val'","'$testMode'")'

}

function get_Scale()
{

  key_name='Scale'
  key_val=`cat  $destResultPath | grep $key_name |awk '{print $2}'`
  python -c 'import mark_points_stream; mark_points_stream.setPoint("'$TestType'","'$Platform'","'$TestCase'","'$Node_num'","'$key_name'","'$key_val'","'$testMode'")'

}

function get_Add()
{

  key_name='Add'
  key_val=`cat  $destResultPath | grep $key_name |awk '{print $2}'`
  python -c 'import mark_points_stream; mark_points_stream.setPoint("'$TestType'","'$Platform'","'$TestCase'","'$Node_num'","'$key_name'","'$key_val'","'$testMode'")'

}

function get_Triad()
{

  key_name='Triad'
  key_val=`cat  $destResultPath | grep $key_name |awk '{print $2}'`
  python -c 'import mark_points_stream; mark_points_stream.setPoint("'$TestType'","'$Platform'","'$TestCase'","'$Node_num'","'$key_name'","'$key_val'","'$testMode'")'

}


get_Copy

get_Scale

get_Add

get_Triad
