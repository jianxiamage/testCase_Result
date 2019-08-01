#!/usr/bin/env python
# -*- coding: utf-8 -*-

import commands
import sys  #引入模块
import os
import traceback
import ConfigParser

from get_GroupNum import *

#ResultIniPath='/data/OS/7A/TestResults.ini'
def getResult(TestCase,NodeNum):

    config = ConfigParser.ConfigParser()
    #print os.getcwd() #获取当前工作目录路径

    retCode,output = commands.getstatusoutput('cat testResultIni_path.txt')
    print  retCode
    print  output
    
    ResultIniPath = str(output)   

    config.readfp(open(ResultIniPath))
    #Group_num=getGroupNumByName(TestCase)
    sectionName = str(TestCase)
    keyName = 'node_'+ str(NodeNum)
    resultStr=config.get(sectionName,keyName)
    retCode=int(resultStr)
    #print retCode
    return retCode


if __name__=='__main__':

  try:
  
      test_case = sys.argv[1]
      node_num = sys.argv[2]
      
      #a = config.get(sectionName,valName)
      result_code=getResult(test_case,node_num)
      retCode=result_code
      print retCode
  
  except Exception as E:
      #print('str(Exception):', str(Exception))
      print('str(e):', str(E))
      #print('repr(e):', repr(E))
      #print('traceback.print_exc(): ', traceback.print_exc())
