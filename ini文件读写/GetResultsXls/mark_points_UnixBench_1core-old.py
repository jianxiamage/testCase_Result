#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys  #引入模块
import os
import traceback
import ConfigParser

#-------------------------------------------------
#存在一个测试项含有多个测试结果文件的情况
#stream测试，无论单核测试还是多核测试均含有浮点和整型两种文件
#因此，相比只生成一个结果文件的测试项(例如iozone)要多加一个类型参数
#-------------------------------------------------
ResultPath='/data/'
PointsPath='Points_Files'
#global sectionName
#sectionName='-1core'

def setPoint(TestType,Platform,TestCase,NodeNum,keyName,keyValue,mode,section):
    
    ResultIniPath = ResultPath + str(TestType) + '/' + str(Platform) + '/' + str(TestCase) + '/' + str(PointsPath) + '/' + str(TestCase) + '_' +  str(mode) + '_' + str(NodeNum) + '.ini'

    print('-----------------------------------')
    print(ResultIniPath)
    print('-----------------------------------')
    config = ConfigParser.ConfigParser()
    #print os.getcwd() #获取当前工作目录路径

    config.readfp(open(ResultIniPath))
    
    #根据测试用例名称找出其对应小组编号
    #Group_num=getGroupNumByName(TestType,TestCase)

    sectionName='Dhrystone 2 using register variables'
    keyName = str(keyName)
    #resultStr = config.get(sectionName,keyName)
    #tmp='The old value is:'+resultStr
    #print tmp
    #更新指定section的option值
    config.set(sectionName,keyName,keyValue)

    sectionName='Double-Precision Whetstone'
    keyName = str(keyName)
    config.set(sectionName,keyName,keyValue)

    sectionName='Execl Throughput'
    keyName = str(keyName)
    config.set(sectionName,keyName,keyValue)


    sectionName='File Copy 1024 bufsize 2000 maxblocks'
    keyName = str(keyName)
    config.set(sectionName,keyName,keyValue)


    sectionName='File Copy 256 bufsize 500 maxblocks'
    keyName = str(keyName)
    config.set(sectionName,keyName,keyValue)

    sectionName='File Copy 4096 bufsize 8000 maxblocks'
    keyName = str(keyName)
    config.set(sectionName,keyName,keyValue)

    sectionName='Pipe Throughput'
    keyName = str(keyName)
    config.set(sectionName,keyName,keyValue)

    sectionName='Pipe-based Context Switching'
    keyName = str(keyName)
    config.set(sectionName,keyName,keyValue)

    sectionName='Process Creation'
    keyName = str(keyName)
    config.set(sectionName,keyName,keyValue)

    sectionName='Shell Scripts (1 concurrent)'
    keyName = str(keyName)
    config.set(sectionName,keyName,keyValue)

    sectionName='Shell Scripts (8 concurrent)'
    keyName = str(keyName)
    config.set(sectionName,keyName,keyValue)

    sectionName='System Call Overhead'
    keyName = str(keyName)
    config.set(sectionName,keyName,keyValue)

    sectionName='System Benchmarks Index Score'
    keyName = str(keyName)
    config.set(sectionName,keyName,keyValue)


    #保存到配置文件
    config.write(open(ResultIniPath,'w'))

    #retCode=int(resultStr)
    #return retCode


if __name__=='__main__':

  try:
  
      test_case_type = sys.argv[1]
      test_case_platform = sys.argv[2]
      test_case = sys.argv[3]
      node_num = sys.argv[4]
      test_key = sys.argv[5]
      test_value = sys.argv[6]
      test_mode = sys.argv[7]
      
      #a = config.get(sectionName,valName)
      setPoint(test_case_type,test_case_platform,test_case,node_num,test_key,test_value,test_mode)
  
  except Exception as E:
      #print('str(Exception):', str(Exception))
      print('str(e):', str(E))
      #print('repr(e):', repr(E))
      #print('traceback.print_exc(): ', traceback.print_exc())

