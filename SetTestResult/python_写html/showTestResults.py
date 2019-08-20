#!/usr/bin python
#coding:utf-8
 
import webbrowser
#命名生成的html
GEN_HTML = "Test_Results.html" 
#打开文件，准备写入
f = open(GEN_HTML,'w')
 
#准备相关变量
str1 = 'my name is :'
str2 = '--zongxp--'
TestPlatform = '7A独显测试'
 
message = """
<html>
<head></head>
<body>
<p>%s</p>
<p>%s</p>
<p>%s</p>

</p><table id="result_table"><tbody>
<tr id="header_row">
<td>Test Case/Test Group</td>
<td>Count</td>
<td>Pass</td>
<td>Fail</td>
<td>Error</td>
<td>View</td>
</tr>


</body>
</html>"""%(str1,str2,TestPlatform)
 
#写入文件
f.write(message) 
#关闭文件
f.close()
 
#运行完自动在网页中显示
webbrowser.open(GEN_HTML,new = 1) 
'''
webbrowser.open(url, new=0, autoraise=True) 
Display url using the default browser. If new is 0, the url is opened in the same browser window if possible. If new is 1, a new browser window is opened if possible. If new is 2, a new browser page (“tab”) is opened if possible. If autoraise is True, the window is raised if possible (note that under many window managers this will occur regardless of the setting of this variable).
'''
