<!--#include file="inc/AspCms_MainClass.asp" -->
<%
if  runMode="0"  then
	dim templateobj,templatePath : set templateobj = mainClassobj.createObject("MainClass.template")	
	templatePath="/"&sitePath&"templates/"&defaultTemplate&"/"&htmlFilePath&"/index.html"	
	if not CheckTemplateFile("index.html") then echo "index.html"&"模板文件不存在！"
	with templateObj 
		.content=loadFile(templatePath) 
		.parseHtml()		
		.parseCommon
		echo .content 
	end with
	set templateobj =nothing : terminateAllObjects
else
	response.Redirect("/"&sitePath&"index"&FileExt)
end if
%>
