<%
CheckAdmin()

Select  case action
	case "delallfile" : delAllFile
End Select 

Dim dirpath

dirpath=getForm("dirpath","get")

Sub uplpadFileList
dim path,fileListArray,i,fileAttr,folderListArray,folderAttr,parentPath
	path = "/"&sitePath&"upLoad"	
	if not isExistFolder(path) then createFolder path,"folderdir"
	if not isnul(getForm("dirpath","get")) then
		path=getForm("dirpath","get")
		parentPath=Mid(getForm("dirpath","get"),1,InstrRev(getForm("dirpath","get"),"/")-1)
	end if
	
	if not instr(path,"upLoad")>0 then	
		echo "<tr bgcolor=""#FFFFFF"" align=""center""><td colspan=""7"" algin=""center"">�����޷���ЩĿ¼,<a href=""javascript:history.go(-1)"" class=""txt_C1"">����</a></td></tr>"
		response.end
	end if
	
	if not isExistFolder(path) then	
		echo "<tr bgcolor=""#FFFFFF"" align=""center""><td colspan=""7"" algin=""center"">û�����Ŀ¼,<a href=""javascript:history.go(-1)"" class=""txt_C1"">����</a></td></tr>"
		response.end
	end if
	folderListArray=getFolderList(path)
	if instr(folderListArray(0),",")>0 then
		for i=0 to ubound(folderListArray)
			folderAttr=split(folderListArray(i),",")
			echo "<tr bgcolor=""#FFFFFF"" align=""center"">"&vbcrlf& _
			"<td>"&i+1&"</td>"&vbcrlf& _
			"<td><a class=""txt_C1"" href=""?dirpath="&folderAttr(4)&""">"&folderAttr(0)&"</a></td>"&vbcrlf& _
			"<td>"&folderAttr(2)&"</td>"&vbcrlf& _
			"<td>"&folderAttr(1)&"</td>"&vbcrlf& _
			"<td>"&folderAttr(3)&"</td>"&vbcrlf& _
			"<td><a href=""?action=delallfile&path="&folderAttr(4)&""" class=""txt_C1"" onClick=""return confirm('ȷ��Ҫɾ����')"">ɾ��</a></td>"&vbcrlf& _
			"<td><input type=""checkbox"" name=""path"" value="""&folderAttr(4)&""" class=""checkbox"" /></td>"&vbcrlf& _
			"</tr>"&vbcrlf
		next
	end if	
	
	fileListArray= getFileList(path)
	if instr(fileListArray(0),",")>0 then	
		for  i = 0 to ubound(fileListArray)
			fileAttr=split(fileListArray(i),",")
			echo"<tr bgcolor=""#FFFFFF"" align=""center"">"&vbcrlf& _
			"<td>"&i+1&"</td>"&vbcrlf& _
			"<td><a target=""_blank"" href="""&fileAttr(4)&""">"&fileAttr(0)&"</a></td>"&vbcrlf& _
			"<td>"&fileAttr(2)&"</td>"&vbcrlf& _
			"<td>"&fileAttr(1)&"</td>"&vbcrlf& _
			"<td>"&fileAttr(3)&"</td>"&vbcrlf& _
			"<td><a href=""?action=delallfile&path="&fileAttr(4)&"&dirpath="&dirpath&""" class=""txt_C1"" onClick=""return confirm('ȷ��Ҫɾ����')"">ɾ��</a></td>"&vbcrlf& _
			"<td><input type=""checkbox"" name=""path"" value="""&fileAttr(4)&""" class=""checkbox"" /></td>"&vbcrlf& _
			"</tr>"&vbcrlf
		next		
	end if
	
	if not instr(folderListArray(0),",")>0  and not instr(fileListArray(0),",")>0 then
		echo "<tr bgcolor=""#FFFFFF"" align=""center""><td colspan=""7"" algin=""center"">���ļ���,<a href=""javascript:history.go(-1)"" class=""txt_C1"">����</a></td></tr>"
	else
		echo"<tr bgcolor=""#FFFFFF"" align=""right"" height=""30"">"&vbcrlf& _
		"<td colspan=""7""><a href=""javascript:location.href='AspCms_FileManger.asp'""  class=""txt_C1"">���ض���Ŀ¼<a/>   <a href=""javascript:location.href='?dirpath="&parentPath&"'""  class=""txt_C1"">�����ϼ�Ŀ¼<a/> <input type=""submit"" value=""����ɾ��"" onClick=""if(confirm('ȷ��Ҫɾ����')){return true;}else{return false}"" class=""btn""  />ȫѡ<input type=""checkbox"" name=""chkall"" id=""chkall"" class=""checkbox"" onClick=""checkAll(this.checked,'input','path')"" />��ѡ<input type=""checkbox"" name=""chkothers"" id=""chkothers"" class=""checkbox"" onClick=""checkOthers('input','path')"" />&nbsp;&nbsp;</td></tr>"
	end if
End Sub

Sub delAllFile
	dim ids,idsArray,arrayLen,i
	ids=replace(getForm("path","both")," ","")
	idsArray = split(ids,",") : arrayLen=ubound(idsArray)
	for i=0 to arrayLen
		if isExistFolder(idsArray(i))then delFolder idsArray(i)
		if isExistFile(idsArray(i))then delFile idsArray(i)	
	next
	dirpath =getForm("dirpath","both")
	alertMsgAndGo "ɾ���ɹ�",getPageName()&"?dirpath="&dirpath
End Sub


Function getAllFileList(path,countnum)
	dim fileListArray,i,fileAttr,folderListArray,folderAttr,parentPath
	if not isExistFolder(path) then createFolder path,"folderdir"	
	
	if not instr(path,"upLoad")>0 then	
		echo "<tr bgcolor=""#FFFFFF"" align=""center""><td colspan=""7"" algin=""center"">�����޷���ЩĿ¼,<a href=""javascript:history.go(-1)"" class=""txt_C1"">����</a></td></tr>"
		response.end
	end if
	
	if not isExistFolder(path) then	
		echo "<tr bgcolor=""#FFFFFF"" align=""center""><td colspan=""7"" algin=""center"">û�����Ŀ¼,<a href=""javascript:history.go(-1)"" class=""txt_C1"">����</a></td></tr>"
		response.end
	end if
	folderListArray=getFolderList(path)
	if instr(folderListArray(0),",")>0 then
		for i=0 to ubound(folderListArray)
			folderAttr=split(folderListArray(i),",")	
			if isExistFolder(folderAttr(4)) then
				getAllFileList folderAttr(4),countnum
			end if
		next
	end if	
	
	dim rsObj,rsObj1 
	fileListArray= getFileList(path)
	if instr(fileListArray(0),",")>0 then	
		for  i = 0 to ubound(fileListArray)
			fileAttr=split(fileListArray(i),",")
			Set rsObj=Conn.Exec("select count(*) from Aspcms_News where ImagePath like '%"&fileAttr(4)&"%' or DownURL like '%"&fileAttr(4)&"%' or Content like '%"&fileAttr(4)&"%' ","r1")
			
			Set rsObj1=Conn.Exec("select count(*) from Aspcms_Links where ImageURL like '%"&fileAttr(4)&"%' ","r1")

			if not rsObj(0)>0 and not rsObj1(0)>0 and not instr(lcase(adImagePath),lcase(fileAttr(4)))>0 and not instr(lcase(slideImgs),lcase(fileAttr(4)))>0 and not instr(lcase(siteLogoUrl),lcase(fileAttr(4)))>0 then			
				echo"<tr bgcolor=""#FFFFFF"" align=""center"">"&vbcrlf& _
				"<td>"&countnum&"</td>"&vbcrlf& _
				"<td><a target=""_blank"" href="""&fileAttr(4)&""">"&fileAttr(0)&"</a></td>"&vbcrlf& _
				"<td>"&fileAttr(2)&"</td>"&vbcrlf& _
				"<td>"&fileAttr(1)&"</td>"&vbcrlf& _
				"<td>"&fileAttr(3)&"</td>"&vbcrlf& _
				"<td><a href=""?action=delallfile&path="&fileAttr(4)&""" class=""txt_C1"" onClick=""return confirm('ȷ��Ҫɾ����')"">ɾ��</a></td>"&vbcrlf& _
				"<td><input type=""checkbox"" name=""path"" value="""&fileAttr(4)&""" class=""checkbox"" /></td>"&vbcrlf& _
				"</tr>"&vbcrlf
				countnum=countnum+1
				'if countnum>99 then exit Function
			end if
		next		
	end if
End Function
%>