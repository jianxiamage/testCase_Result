#!/bin/bash
set -e

#if [ $# -ne 3 ];then
# echo "usage: $0 TestType Platform TestCase" 
# exit 1
#fi

#----------------------------------------------------------------------------------------
#测试类型:"KVM" -->KVM

#测试平台:[7A,7A_Integrated,7A_2way,780,2K]
#目前支持5个平台
#----------------------------------------------------------------------------------------

sh Create_Result_Excel_KVM_2K.sh

sh Create_Result_Excel_KVM_780.sh

sh Create_Result_Excel_KVM_7A_2way.sh

sh Create_Result_Excel_KVM_7A_Integrated.sh

sh Create_Result_Excel_KVM_7A.sh

