<!--#include file="../inc/AspCms_MainClass.asp" -->
<%
if action = "reg" then
	addUser()
elseif action = "editpass" then
	editUser()
else
	echoContent()
end if

Sub editPass
	dim userName,userPass,reuserPass
	userName=trim(rCookie("loginName"))	
	userPass=getForm("userPass","post")	
	reuserPass=getForm("reuserPass","post")		
	
	if userPass<>reuserPass then alertMsgAndGo "两次输入密码不相同","-1" 		
	'die  "update Aspcms_Users set [Password]='"&md5(userPass,16)&"' where UserName='"&userName&"'"
	conn.Exec "update Aspcms_Users set [Password]='"&md5(userPass,16)&"' where UserName='"&userName&"'","exe"	
	alertMsgAndGo "密码修改成功","editPass.asp"
End Sub

Sub editUser
	dim userName,userPass,reuserPass,Email,Mobile,Address,PostCode,Gender,QQ,TrueName,Phone
	userName=trim(rCookie("loginName"))	
	userPass=getForm("userPass","post")	
	reuserPass=getForm("reuserPass","post")		
	
	Email=filterPara(getForm("Email","post"))
	Mobile=filterPara(getForm("Mobile","post"))
	Address=filterPara(getForm("Address","post"))
	PostCode=filterPara(getForm("PostCode","post"))
	Gender=filterPara(getForm("Gender","post"))
	QQ=filterPara(getForm("QQ","post"))
	TrueName=filterPara(getForm("TrueName","post"))
	Phone=filterPara(getForm("Phone","post"))

	
	if userPass<>reuserPass then alertMsgAndGo "两次输入密码不相同","-1" 	
	
	dim passStr
	if not isnul(userPass) then passStr="[Password]='"&md5(userPass,16)&"',"	

	Conn.Exec"update Aspcms_Users set "&passStr&" Email='"&Email&"',QQ='"&QQ&"',Mobile='"&Mobile&"',Address='"&Address&"',PostCode='"&PostCode&"',Gender="&Gender&",Phone='"&Phone&"',TrueName='"&TrueName&"' where userName='"&userName&"'","exe"	
	alertMsgAndGo "修改成功","editPass.asp"
	
End Sub

Sub echoContent()
	dim page
	page=replaceStr(request.QueryString,FileExt,"")
	if isNul(page) then page=1
	if isNum(page) then page=clng(page) else echoMsgAndGo "页面不存在",3 end if
	dim templateobj,channelTemplatePath : set templateobj = mainClassobj.createObject("MainClass.template")
	dim typeIds,rsObj,rsObjtid,Tid,rsObjSmalltype,rsObjBigtype
	Dim templatePath,tempStr
	templatePath = "/"&sitePath&"templates/"&defaultTemplate&"/"&htmlFilePath&"/reg.html"

	with templateObj 
		.content=loadFile(templatePath)	
		.parseHtml()
		.parseCommon() 
		echo .content 
	end with
	set templateobj =nothing : terminateAllObjects
End Sub



Sub addUser
	Dim UserName,Password,verifyPass,Email,Mobile,Address,PostCode,Gender,QQ,UserStatus,RegisterTime,RegisterIP,LastLoginIP,LastLoginTime,Birthday,Exp1,Exp2,Exp3,GradeID,TrueName,Phone
	if getForm("code","post")<>Session("Code") then alertMsgAndGo "验证码不正确","-1"

	UserName=filterPara(getForm("UserName","post"))
	Password=filterPara(getForm("userPass","post"))
	verifyPass=filterPara(getForm("verifyPass","post"))
	Email=filterPara(getForm("Email","post"))
	Mobile=filterPara(getForm("Mobile","post"))
	Address=filterPara(getForm("Address","post"))
	PostCode=filterPara(getForm("PostCode","post"))
	Gender=1
	Gender=filterPara(getForm("Gender","post"))
	QQ=filterPara(getForm("QQ","post"))
	Phone=filterPara(getForm("Phone","post"))
	TrueName=filterPara(getForm("TrueName","post"))
	UserStatus=true
	RegisterTime=now()
	RegisterIP=getip()
	GradeID=2

	
	if isnul(UserName) then alertMsgAndGo "用户名不能为空","-1"
	if Conn.Exec("select count(*) from Aspcms_Users where UserName='"&UserName&"'","r1")(0) >0 then alertMsgAndGo "该用户名已被注册","-1"
	
	if isnul(Password) then alertMsgAndGo "密码不能为空","-1"
	if isnul(verifyPass) then alertMsgAndGo "确认密码不能为空","-1"
	if Password<>verifyPass then alertMsgAndGo "两次输入密码不相同","-1"
	
	Password=md5(Password,16)
	Conn.Exec"insert into Aspcms_Users(UserName,[Password],Email,Mobile,Address,PostCode,Gender,QQ,UserStatus,RegisterIP,RegisterTime,GradeID,TrueName,Phone) values('"&UserName&"','"&Password&"','"&Email&"','"&Mobile&"','"&Address&"','"&PostCode&"',"&Gender&",'"&QQ&"',"&UserStatus&",'"&RegisterIP&"','"&RegisterTime&"',"&GradeID&",'"&TrueName&"','"&Phone&"')","exe"
	
	alertMsgAndGo "注册成功！","/"&sitePath&"plug/login.asp"
End Sub
%>
