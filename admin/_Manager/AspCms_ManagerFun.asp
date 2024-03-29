<%
CheckAdmin()
Dim AdminID,UserName,PassWord,rePassword,RealName,AdminStatus,AddTime,Permissions,AdminDesc,LastLogin,LastIP,LoginCount,ID
ID = getForm("id","both")

Select  case action
	case "del" : DelAdmin
	case "add" : AddAdmin
	case "edit" : EditAdmin
	case "editpass" : EditPass
End Select

Sub getContent
	Dim rsObj 	: Set rsObj=Conn.Exec("select AdminID,UserName,AdminPassWord,RealName,AdminStatus,AddTime,Permissions,AdminDesc,LastLogin,LastIP,LoginCount from Aspcms_Admins where AdminID="&ID,"r1")
	if isnul(ID) then alertMsgAndGo "ID不能为空","-1"	
		AdminID=rsObj(0)
		UserName=rsObj(1)
		PassWord=rsObj(2)
		RealName=rsObj(3)
		AdminStatus=rsObj(4)
		AddTime=rsObj(5)
		Permissions=rsObj(6)
		AdminDesc=rsObj(7)
		LastLogin=rsObj(8)
		LastIP=rsObj(9)
		LoginCount=rsObj(10)
	rsObj.close	:	Set rsObj = nothing
End Sub

Sub EditAdmin
	AdminID=getForm("AdminID","post")	
	PassWord=getForm("PassWord","post")	
	rePassword=getForm("rePassword","post")	
	RealName=getForm("RealName","post")	
	AdminStatus=getCheck(getForm("AdminStatus","post"))
	Permissions=getForm("Permissions","post")	
	AdminDesc=getForm("AdminDesc","post")	
	Dim passStr
	'if isnul(UserName) then alertMsgAndGo "登录名不能为空","-1"
	if rePassword<>Password then alertMsgAndGo "确认密码不正确","-1" 
	'if isnul(RealName) then alertMsgAndGo "管理员姓名不能为空","-1"	
	if not isnul(Password) then passStr="AdminPassWord='"&md5(PassWord,16)&"',"	
	if AdminID="1" then AdminStatus=true
	
	conn.Exec "update Aspcms_Admins set "&passStr&" RealName='"&RealName&"',AdminStatus="&AdminStatus&",Permissions='"&Permissions&"',AdminDesc='"&AdminDesc&"' where AdminID="&AdminID,"exe"	
	alertMsgAndGo "修改成功","AspCms_Manager.asp"
End Sub

Sub EditPass
	AdminID=getForm("AdminID","post")	
	PassWord=getForm("PassWord","post")	
	rePassword=getForm("rePassword","post")		
	Dim passStr
	'if isnul(UserName) then alertMsgAndGo "登录名不能为空","-1"
	if rePassword<>Password then alertMsgAndGo "确诊密码不正确","-1" 
	'if isnul(RealName) then alertMsgAndGo "管理员姓名不能为空","-1"	
	if not isnul(Password) then passStr="AdminPassWord='"&md5(PassWord,16)&"'"	
	if AdminID="1" then AdminStatus=true
	
	if isnul(passStr) then response.Redirect("AspCms_ManagerEditPass.asp?id="&rCookie("AdminId"))
	conn.Exec "update Aspcms_Admins set "&passStr&"  where AdminID="&AdminID,"exe"	
	alertMsgAndGo "修改成功","AspCms_ManagerEditPass.asp?id="&rCookie("AdminId")
End Sub

Sub AddAdmin

	UserName=getForm("UserName","post")	
	PassWord=getForm("PassWord","post")	
	rePassword=getForm("rePassword","post")	
	RealName=getForm("RealName","post")	
	AdminStatus=getCheck(getForm("AdminStatus","post"))
	AddTime=now()
	Permissions=getForm("Permissions","post")	
	AdminDesc=getForm("AdminDesc","post")	
'die UserName
	if isnul(UserName) then alertMsgAndGo "登录名不能为空","-1"
	if (Conn.Exec("select count(*) from Aspcms_Admins where UserName='"&UserName&"'","r1"))(0)<>0 then alertMsgAndGo "已存在登录名为"""&UserName&"""的管理员","-1"
	if isnul(Password) then alertMsgAndGo "密码不能为空","-1"
	if rePassword<>Password then alertMsgAndGo "确诊密码不正确","-1" 
	'if isnul(RealName) then alertMsgAndGo "管理员姓名不能为空","-1"
	
	conn.Exec "insert into Aspcms_Admins(UserName,AdminPassWord,RealName,AdminStatus,AddTime,Permissions,AdminDesc,LoginCount) values('"&UserName&"','"&md5(PassWord,16)&"','"&RealName&"',"&AdminStatus&",'"&AddTime&"','"&Permissions&"','"&AdminDesc&"',0)","exe"		
	alertMsgAndGo "添加成功","AspCms_Manager.asp"
End Sub	

Sub AdminList
	Dim rsObj	:	Set rsObj=conn.Exec("select AdminID,AdminStatus,UserName,RealName,LastLogin,LastIP from Aspcms_Admins Order by AdminID","r1")
	If rsObj.Eof Then 
		echo"<tr bgcolor=""#FFFFFF"" align=""center"">"&vbcrlf& _
			"<td colspan=""7"">没有数据</td>"&vbcrlf& _
		  "</tr>"&vbcrlf
	Else
		Do while not rsObj.Eof 

		 echo"<tr bgcolor=""#FFFFFF"" align=""center"">"&vbcrlf& _
			"<td>"&rsObj(0)&"</td>"&vbcrlf& _
			"<td>"&getStr(rsObj(1),"启用","禁用")&"</td>"&vbcrlf& _
			"<td>"&rsObj(2)&"</td>"&vbcrlf& _
			"<td>"&rsObj(3)&"</td>"&vbcrlf& _
			"<td>"&rsObj(4)&"</td>"&vbcrlf& _
			"<td>"&rsObj(5)&"</td>"&vbcrlf& _
			"<td><a href=""AspCms_ManagerEdit.asp?id="&rsObj(0)&""" class=""txt_C1"">修改</a> | <a href=""?action=del&id="&rsObj(0)&""" class=""txt_C1"" onClick=""return confirm('确定要删除吗')"">删除</a></td>"&vbcrlf& _
		  "</tr>"&vbcrlf
		  
		  
		  rsObj.MoveNext
		Loop
	End If
	rsObj.close	:	Set rsObj = nothing
End Sub

Sub DelAdmin 
	if ID="1" then alertMsgAndGo "对不起，你不能删除这个账号","AspCms_Manager.asp"
	conn.Exec "Delete * from Aspcms_Admins where AdminID="&ID ,"exe"
'	alertMsgAndGo "删除成功","Aspcms_Admins.asp"	
	response.Redirect("AspCms_Manager.asp")
End Sub 
%>