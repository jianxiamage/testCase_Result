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
#----------------------------------------------------------------------------------------
#测试结果文件(筛选内容后)地址
destResultPath="${resultsPath}/${TestType}/${Platform}/$PointsPath/$TestCase/Points_${TestCase}_${Node_num}.txt"

#测试结果配置文件地址
destIniPath="${resultsPath}/${TestType}/${Platform}/$PointsPath/$TestCase/${TestCase}_${Node_num}.ini"


if [ ! -s $destResultPath ];
then
  echo Error! [$destResultPath] not exited!Please check it!
  exit 1
fi

if [ ! -s $destIniPath ];
then
  echo Error! [$destIniPath] not exited!Please check it!
  exit 1
fi


function get_val_read()
{
  

}

function get_Re_reader()
{


}

function get_Random_Read()
{


}

function get_write()
{


}

function get_Re_writer()
{


}

function get_Random_Write()
{


}

get_val_read

get_Re_reader

get_Random_Read

get_write

get_Re_writer

get_Random_Write
