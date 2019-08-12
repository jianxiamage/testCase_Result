#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys  #引入模块
import os
import traceback
import ConfigParser
import glob

import xlwt

workbook = xlwt.Workbook(encoding='utf-8')
booksheet = workbook.add_sheet('Sheet 1', cell_overwrite_ok=True)

IPListIniFile='iozone_1.ini'

def getResult():

    ip_list_path =  IPListIniFile
    config = ConfigParser.ConfigParser()
    #print os.getcwd() #获取当前工作目录路径

    config.readfp(open(ip_list_path))
#    sectionName = 'EXT3 File System'
#    keyName='ip_'+ str(NodeNum)
#    resultStr = config.get(sectionName,keyName)
#    retCode = resultStr
#    return retCode


#-------------------------------------------------------------------------------
#首先插入表头,包括每一行的测试字段以及三个测试节点
    listglob = []
    curDir = os.getcwd() #获取当前工作目录路径
    findFile =  'iozone*.ini'
    listglob = glob.glob(os.path.join(curDir,findFile))
    listglob.sort()
    #path = unicode(listglob[1],'utf-8')
    print listglob
    print('---------------------------------')

    i = 0
    j = 0

    dictionary = {}
    for section in config.sections():
        dictionary[section] = {}
        print('---------------------------------')
        print section
        print('---------------------------------')

        for option in config.options(section):
            dictionary[section][option] = config.get(section, option)
            #print dictionary[section][option]
            print 'option:%s,value:%s' %(option,dictionary[section][option])
            booksheet.write(j,0,j)
            j = j + 1

        i = i + 1

    workbook.save('example.xls')

#-------------------------------------------------------------------------------

    i = 0
    j = 0

    dictionary = {}
    for section in config.sections():
        dictionary[section] = {}
        print('---------------------------------') 
        print section
        print('---------------------------------') 

        for option in config.options(section):
            dictionary[section][option] = config.get(section, option)
            #print dictionary[section][option]
            print 'option:%s,value:%s' %(option,dictionary[section][option])
            booksheet.write(j,0,j)
            j = j + 1
         
        i = i + 1

    workbook.save('example.xls')

    retCode = 0
    return retCode

if __name__=='__main__':

  try:
  
#      test_case_type = sys.argv[1]
#      test_case_platform = sys.argv[2]
#      test_case = sys.argv[3]
#      node_num = sys.argv[4]
      
      #result_code=getResult(test_case_type,test_case_platform,test_case,node_num)
      result_code=getResult()
      retCode=result_code
      print retCode
  
  except Exception as E:
      #print('str(Exception):', str(Exception))
      print('str(e):', str(E))
      #print('repr(e):', repr(E))
      #print('traceback.print_exc(): ', traceback.print_exc())
