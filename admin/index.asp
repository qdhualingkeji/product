<!--#include file="../inc/AspCms_MainClass.asp" -->
<%
if action = "login" then
	dim UserName,Password,sql,code,Rs
	UserName = filterPara(getForm("username","post"))
	Password = md5(getForm("Password","post"),16)
	code     = getForm("code","post")
	if code <> Session("Code") then
		alertMsgAndGo "您填写的验证码错误,系统即将返回登录页面!","-1"
	end if
	sql = "select count(*) from Aspcms_Admins where UserName = '"& UserName &"' and AdminPassWord='"&Password&"'"
	Dim rsObj : Set rsObj=Conn.Exec(sql,"r1")
	if rsObj(0)=1 then
		Set rsObj=Conn.Exec("select AdminId,Permissions from Aspcms_Admins where UserName='"&UserName&"' and AdminStatus","r1")	
		if not rsObj.Eof Then
			wCookie"adminName",UserName
			wCookie"AdminId",rsObj("AdminId")
			wCookie"Permissions",repnull(rsObj("Permissions"))
			Conn.Exec"update Aspcms_Admins set LastLogin=now(),LastIP='"&getIp()&"',LoginCount=LoginCount+1 where AdminId="&rsObj("AdminId"),"exe"			
			response.Redirect("main.asp")
		else
			alertMsgAndGo "对不起，您的账号已被禁用!","-1"
		end if
	else
		alertMsgAndGo "用户名或密码错误,系统即将返回登录页面!","-1"
	end if
	rsObj.Close() : set rsObj=Nothing	
elseif action = "logout" then
	wCookie"adminName",""
	wCookie"AdminId",""
	wCookie"Permissions",""
	alertMsgAndGo "您已经成功退出登录!","index.asp"
elseif action = "relog" then
	alertMsgAndGo "对不起,您的登录状态已经失效,请重新登录!","index.asp"
end if
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=siteTitle%>-后台管理系统登陆-</title>
<META content="MSHTML 6.00.2900.2963" name=GENERATOR>
<link rel="stylesheet" href="css/style.css" type="text/css" media="screen" />
</head>

<body>
<div id="main">
<form action="index.asp?action=login" method="post">
    	<div class="left">
		<p><input type="text" name="username"  class="inputbox" id="username" /></p>
		<p><input type="password" name="password" class="inputbox" id="password"/></p>
		<p><input type="text" name="code"  class="inputbox cfcode" id="verification" maxlength="4"/>        
        <a onClick="SeedImg.src='../inc/checkcode.asp'"><img src="../inc/checkcode.asp" id="SeedImg" align="absmiddle" style="cursor:pointer;" border="0" /></a></p>
        </div>
        <div class="right">
		<p><input type="image" src="images/login_13.gif" width="90px" height="40px" value="登陆"></p>
        </div>
<div class="copyright">Copyright&copy;  2009-2013  .All Rights Reserved	</div>
  </form>
</div>
</body>
</html>
