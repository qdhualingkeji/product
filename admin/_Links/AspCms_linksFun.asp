<%
CheckAdmin()

Dim LinkType,LinkText,LinkDesc,ImageURL,LinkOrder,LinkStatus,LinkURL,ID
ID = getForm("id","both")

Select  case action
	case "del" : DelLinks
	case "add" : AddLinks
	case "edit" : EditLinks
	
	case "enable" :Enable
	case "notEnabled" :NotEnabled
End Select

Sub getContent
	Dim rsObj 	: Set rsObj=Conn.Exec("select LinkType,LinkText,LinkDesc,ImageURL,LinkOrder,LinkStatus,LinkURL from Aspcms_Links where LinkID="&ID,"r1")
	if isnul(ID) then alertMsgAndGo "ID不能为空","-1"	
	LinkType=rsObj(0)
	LinkText=rsObj(1)
	LinkDesc=rsObj(2)
	ImageURL=rsObj(3)
	LinkOrder=rsObj(4)
	LinkStatus=rsObj(5)
	LinkURL=rsObj(6)
	rsObj.close	:	Set rsObj = nothing
End Sub

Sub EditLinks
	LinkType=getForm("LinkType","post")	
	LinkText=getForm("LinkText","post")	
	LinkDesc=getForm("LinkDesc","post")	
	ImageURL =getForm("ImageURL","post")	
	LinkOrder=getForm("LinkOrder","post")
	LinkStatus=getCheck(getForm("LinkStatus","post"))
	LinkURL=getForm("LinkURL","post")	

	if isnul(LinkText) then alertMsgAndGo "网站名称不能为空","-1"
	if isnul(LinkURL) then alertMsgAndGo "链接地址不能为空","-1"		
	if not isurl(LinkURL) then alertMsgAndGo "链接地址不正确","-1"	
	if isnul(LinkStatus) then LinkStatus=0
	conn.Exec "update Aspcms_Links set LinkType="&LinkType&",LinkText='"&LinkText&"',LinkDesc='"&LinkDesc&"',ImageURL='"&ImageURL&"',LinkOrder="&LinkOrder&",LinkStatus="&LinkStatus&",LinkURL='"&LinkURL&"' where LinkID="&ID,"exe"
	
	alertMsgAndGo "修改成功","AspCms_Links.asp"
End Sub

Sub AddLinks 	
	LinkType=getForm("LinkType","post")	
	LinkText=getForm("LinkText","post")	
	LinkDesc=getForm("LinkDesc","post")	
	ImageURL =getForm("ImageURL","post")	
	LinkOrder=getForm("LinkOrder","post")
	LinkStatus=getCheck(getForm("LinkStatus","post"))
	LinkURL=getForm("LinkURL","post")	

	if isnul(LinkText) then alertMsgAndGo "网站名称不能为空","-1"
	if isnul(LinkURL) then alertMsgAndGo "链接地址不能为空","-1"		
	if not isurl(LinkURL) then alertMsgAndGo "链接地址不正确","-1"
	'if LinkType and isnul(ImageURL) then alertMsgAndGo "图片地址不能为空","-1"
	conn.Exec "insert into Aspcms_Links(LinkType,LinkText,LinkDesc,ImageURL,LinkOrder,LinkStatus,LinkURL) values('"&LinkType&"','"&LinkText&"','"&LinkDesc&"','"&ImageURL&"','"&LinkOrder&"','"&LinkStatus&"','"&LinkURL&"')","exe"		
	alertMsgAndGo "添加成功","AspCms_Links.asp"
End Sub	

Sub LinksList
	Dim rsObj	:	Set rsObj=conn.Exec("select LinkID,LinkText,LinkURL,ImageURL,LinkOrder,LinkStatus,LinkType from Aspcms_Links Order by LinkOrder Asc,LinkID","r1")
	If rsObj.Eof Then 
		echo"<tr bgcolor=""#FFFFFF"" align=""center"">"&vbcrlf& _
			"<td colspan=""7"">没有数据</td>"&vbcrlf& _
		  "</tr>"&vbcrlf
	Else
		Do while not rsObj.Eof 
		Dim linkDisplay,linktype
		if rsObj(6) ="0" then linkDisplay=rsObj(1) : linktype ="文字链接"
		if rsObj(6) ="1" then linkDisplay="<img height=""30"" title="""&rsObj(1)&""" src="""&rsObj(3)&""" />" : linktype ="图片链接"
		 echo"<tr bgcolor=""#FFFFFF"" align=""center"">"&vbcrlf& _
			"<td>"&rsObj(0)&"</td>"&vbcrlf& _
			"<td>"&linkDisplay&"</td>"&vbcrlf& _
			"<td>"&rsObj(2)&"</td>"&vbcrlf& _
			"<td>"&rsObj(4)&"</td>"&vbcrlf& _
			"<td>"&linktype&"</td>"&vbcrlf& _
			"<td>"&getStr(rsObj(5),"<a href=""?action=notEnabled&id="&rsObj(0)&""" class=""txt_C1"">发布</a>","<a href=""?action=enable&id="&rsObj(0)&""" class=""txt_C4"">未发布</a>")&"</td>"&vbcrlf& _
			"<td><a href=""AspCms_LinksEdit.asp?id="&rsObj(0)&""" class=""txt_C1"">修改</a> | <a href=""?action=del&id="&rsObj(0)&""" class=""txt_C1"" onClick=""return confirm('确定要删除吗')"">删除</a></td>"&vbcrlf& _
		  "</tr>"&vbcrlf
		  rsObj.MoveNext
		Loop
	End If
	rsObj.close	:	Set rsObj = nothing
End Sub

Sub DelLinks 
	conn.Exec "Delete * from Aspcms_Links where LinkID="&ID ,"exe"
'	alertMsgAndGo "删除成功","AspCms_Links.asp"	
	response.Redirect("AspCms_Links.asp")
End Sub 

Sub NotEnabled	
	Dim id				:	id=getForm("ID","get")
	Conn.Exec"update Aspcms_Links set LinkStatus=0 Where LinkID="&id,"exe"
	response.Redirect getPageName()	
End Sub

Sub Enable
	Dim id				:	id=getForm("ID","get")
	Conn.Exec"update Aspcms_Links set LinkStatus=1 Where LinkID="&id,"exe"
	response.Redirect getPageName()
End Sub
%>