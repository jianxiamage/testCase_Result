#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys  #引入模块
import os
import traceback
import ConfigParser

from get_GroupNum import *

#getGroupNumByName
ip_list_path='/data/ip_list.ini'
def getResult(TestCase,NodeNum):

    config = ConfigParser.ConfigParser()
    #print os.getcwd() #获取当前工作目录路径

    config.readfp(open(ip_list_path))
    Group_num=getGroupNumByName(TestCase)
    tmp='获取的小组编号:' + Group_num
    #print tmp
    sectionName='Group'+ str(Group_num)
    keyName='ip_'+ str(NodeNum)
    resultStr=config.get(sectionName,keyName)
    retCode=resultStr
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
