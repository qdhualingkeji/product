<%
CheckAdmin()

Dim filename,path,filetext

select case action
	case "addfile" : addFile
	case "editfile" : editFile
	case "delallfile" : delAllFile
	
	case "addcss" : addCss
	case "editcss" : editCss
	case "delallcss" : delAllCss
	
	case "edit" : saveEdit
	
	case "edithtmlfilepath" : editHtmlFilePath
end select


Sub delAllCss
	dim ids,idsArray,arrayLen,i 	
	ids=replace(getForm("cssname","both")," ","")	
	idsArray = split(ids,",") : arrayLen=ubound(idsArray)	
	for i=0 to arrayLen
		if isExistFile("/"&sitePath&"Templates/"&defaultTemplate&"/css/"&idsArray(i)) then delFile "/"&sitePath&"Templates/"&defaultTemplate&"/css/"&idsArray(i)	
	next
	alertMsgAndGo "ɾ���ɹ�","AspCms_CssManger.asp"
End Sub

Sub delAllFile
	dim ids,idsArray,arrayLen,i 	
	ids=replace(getForm("filename","both")," ","")	
	idsArray = split(ids,",") : arrayLen=ubound(idsArray)	
	for i=0 to arrayLen
		if isExistFile("/"&sitePath&"Templates/"&defaultTemplate&"/"&htmlFilePath&"/"&idsArray(i)) then delFile "/"&sitePath&"Templates/"&defaultTemplate&"/"&htmlFilePath&"/"&idsArray(i)	
	next
	alertMsgAndGo "ɾ���ɹ�","AspCms_TemplateManger.asp"
End Sub

Sub saveEdit
	Dim Str
	Str="'Ĭ��ģ������"&vbcrlf& _
	"Const defaultTemplate="""&getForm("style","get")&"""	'Ĭ��ģ���ļ���	"&vbcrlf
	createTextFile "<"&"%"&vbcrlf&Str&vbcrlf&"%"&">","../../config/AspCms_TemplateConfig.asp",""
	response.Redirect("AspCms_StyleManage.asp")
End Sub

Sub getFile()
	filename=getForm("filename","get")	
	path = "/"&sitePath&"Templates/"&defaultTemplate&"/"&htmlFilePath&"/"&filename
	filetext=loadFile(path)
End Sub

Sub editFile()
	filename=getForm("filename","post")
	filetext=decodeHtml(getForm("filetext","post"))
	path= "/"&sitePath&"Templates/"&defaultTemplate&"/"&htmlFilePath&"/"&filename
	createTextFile filetext,path,""	
	alertMsgAndGo "����ɹ�","AspCms_TemplateManger.asp"
End Sub

Sub addFile()
	filename=getForm("filename","post")
	filetext=decodeHtml(getForm("filetext","post"))
	path= "/"&sitePath&"Templates/"&defaultTemplate&"/"&htmlFilePath&"/"&filename
	if isExistFile(path) then alertMsgAndGo "���ļ��Ѵ��ڣ�","-1"
	createTextFile filetext,path,""	
	alertMsgAndGo "���ӳɹ�","AspCms_TemplateManger.asp"
End Sub

Sub getCss()
	filename=getForm("cssname","get")	
	path = "/"&sitePath&"Templates/"&defaultTemplate&"/css/"&filename
	filetext=loadFile(path)
End Sub

Sub editCss()
	filename=getForm("filename","post")
	filetext=decodeHtml(getForm("filetext","post"))
	path= "/"&sitePath&"Templates/"&defaultTemplate&"/css/"&filename
	createTextFile filetext,path,""	
	alertMsgAndGo "����ɹ�","AspCms_CssManger.asp"
End Sub

Sub addCss()
	filename=getForm("filename","post")
	filetext=decodeHtml(getForm("filetext","post"))
	path= "/"&sitePath&"Templates/"&defaultTemplate&"/css/"&filename
	if isExistFile(path) then alertMsgAndGo "���ļ��Ѵ��ڣ�","-1"
	createTextFile filetext,path,""	
	alertMsgAndGo "���ӳɹ�","AspCms_CssManger.asp"
End Sub

Sub editHtmlFilePath
	dim templateobj,configPath,configStr,tempHtmlFilePath
	configPath="../../config/AspCms_Config.asp"
	tempHtmlFilePath = getForm("htmlFilePath","post")
	set templateobj = mainClassObj.createObject("MainClass.template")
	configStr=loadFile(configPath)
	configStr=templateobj.regExpReplace(configStr,"Const htmlFilePath=""(\S*?)""","Const htmlFilePath="""&tempHtmlFilePath&"""")
	set templateobj=nothing

	tempHtmlFilePath=getForm("htmlFilePath","post")
	if isNul(tempHtmlFilePath) then alertMsgAndGo "ģ���ļ������ļ��в���Ϊ��","-1"
	if tempHtmlFilePath<>htmlFilePath then moveFolder "../../templates/"&defaultTemplate&"/"&htmlFilePath&"/","../../templates/"&defaultTemplate&"/"&tempHtmlFilePath&"/"		
	createTextFile configStr,configPath,""
	alertMsgAndGo "�޸ĳɹ�","AspCms_StyleManage.asp"
End Sub


%>