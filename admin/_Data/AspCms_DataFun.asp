<%
CheckAdmin()
Select  case action
	case "del" : delBackUp
	case "bakup" : backUp
	case "delall" : delAll
	case "restore" : restore
	case "compress" : compress
End Select 



Sub databackList
'die "aa"
	dim path,fileListArray,i,arrayLen,fileAttr
	path = "/"&sitePath&"AspCms_data/backup"
	if not isExistFolder(path) then createFolder path,"folderdir"
	fileListArray= getFileList(path)
	arrayLen = ubound(fileListArray)

	if instr(fileListArray(0),",")>0 then	
		for  i = 0 to arrayLen
			fileAttr=split(fileListArray(i),",")
			echo"<tr bgcolor=""#FFFFFF"" align=""center"">"&vbcrlf& _
			"<td>"&i+1&"</td>"&vbcrlf& _
			"<td><a href="""&fileAttr(4)&""" class=""txt_C1"" >"&fileAttr(0)&"</a></td>"&vbcrlf& _
			"<td>"&fileAttr(3)&"</td>"&vbcrlf& _
			"<td><a href=""?action=restore&path="&fileAttr(4)&""" class=""txt_C1"" onClick=""return confirm('ȷ���ָ���')"">�ָ��˱���</a> | <a href=""?action=del&path="&fileAttr(4)&""" class=""txt_C1"" onClick=""return confirm('ȷ��Ҫɾ����')"">ɾ��</a></td>"&vbcrlf& _
			"<td><input type=""checkbox"" name=""id"" value="""&fileAttr(4)&""" class=""checkbox"" /></td>"&vbcrlf& _
			"</tr>"&vbcrlf
		next
		echo"<tr bgcolor=""#FFFFFF"" align=""right"" height=""30"">"&vbcrlf& _
		"<td colspan=""5""><input type=""submit"" value=""����ɾ��"" onClick=""if(confirm('ȷ��Ҫɾ����')){return true;}else{return false}"" class=""btn""  />ȫѡ<input type=""checkbox"" name=""chkall"" id=""chkall"" class=""checkbox"" onClick=""checkAll(this.checked,'input','id')"" />��ѡ<input type=""checkbox"" name=""chkothers"" id=""chkothers"" class=""checkbox"" onClick=""checkOthers('input','id')"" />&nbsp;&nbsp;</td></tr>"
	else
		echo "<tr bgcolor=""#FFFFFF"" align=""center""><td colspan=""5"" algin=""center"">��û�б����ļ��� <a href=""?action=bakup"" class=""txt_C1"">���ڱ���</a></td></tr>"
	end if
End Sub

Sub  delBackUp
	dim path
	path = getForm("path","get")
	delFile path
	alertMsgAndGo "","AspCms_Data.asp"
End Sub

Sub backUp
	dim fileName	: fileName = timeToStr(now())
	moveFile "/"&sitePath&accessFilePath,"../../AspCms_data/backup/"&fileName&"_bak.asp",""
	alertMsgAndGo "���ݳɹ�","AspCms_Data.asp"
End Sub


Sub restore
	dim path
	path = getForm("path","get")
	moveFile path,"/"&sitePath&accessFilePath,""
	alertMsgAndGo "�ָ��ɹ�","AspCms_Data.asp"
End Sub


Sub compress
	dim engineObj,tempDbPath
	tempDbPath = "/"&sitePath&"AspCms_data/tempdata.asp"
	conn.Class_Terminate
	set engineObj = server.CreateObject("JRO.JetEngine")
	engineObj.CompactDatabase "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & server.MapPath("/"&sitePath&accessFilePath),"Provider=Microsoft.Jet.OLEDB.4.0;Data Source="& server.MapPath(tempDbPath)
	moveFile tempDbPath,"/"&sitePath&accessFilePath,"del" 
	set engineObj = Nothing
	alertMsgAndGo "ѹ���ɹ�","AspCms_Data.asp"
End Sub

Sub delAll
	dim ids,idsArray,arrayLen,i
	ids=replace(getForm("id","post")," ","")
	idsArray = split(ids,",") : arrayLen=ubound(idsArray)
	for i=0 to arrayLen
		delFile idsArray(i)
	next
	alertMsgAndGo "ɾ���ɹ�","AspCms_Data.asp"
End Sub


%>