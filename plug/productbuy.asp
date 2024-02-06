<!--#include file="../inc/AspCms_MainClass.asp" -->
<%
if action = "buy" then
	addOrder()
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

Sub echoContent()
	dim id
	id=getForm("id","get")
	
	if isnul(id) or not isnum(id) then alertMsgAndGo "请选择产品！","-1" 
	
	dim templateobj,channelTemplatePath : set templateobj = mainClassobj.createObject("MainClass.template")
	dim typeIds,rsObj,rsObjtid,Tid,rsObjSmalltype,rsObjBigtype,selectproduct
	Dim templatePath,tempStr
	templatePath = "/"&sitePath&"templates/"&defaultTemplate&"/"&htmlFilePath&"/productbuy.html"

	set rsObj=conn.Exec("select title from aspcms_news where newsID="&id,"r1")
	selectproduct=rsObj(0)
	
	Dim linkman,gender,phone,mobile,email,qq,address,postcode
	if isnul(rCookie("loginstatus")) then  wCookie"loginstatus",0
	if rCookie("loginstatus")=1 then  
		set rsObj=conn.Exec("select *  from aspcms_Users where UserID="&trim(rCookie("userID")),"r1")
		linkman=rsObj("truename")
		gender=rsObj("gender")
		phone=rsObj("phone")
		mobile=rsObj("mobile")
		email=rsObj("email")
		qq=rsObj("qq")
		address=rsObj("address")
		postcode=rsObj("postcode")
	else 
		gender=1
	end if
	rsObj.close()
		
	with templateObj 
		.content=loadFile(templatePath)	
		.parseHtml()
		.content=replaceStr(.content,"{aspcms:selectproduct}",selectproduct)
		.content=replaceStr(.content,"[aspcms:linkman]",linkman)		
		.content=replaceStr(.content,"[aspcms:gender]",gender)		
		.content=replaceStr(.content,"[aspcms:phone]",phone)		
		.content=replaceStr(.content,"[aspcms:mobile]",mobile)		
		.content=replaceStr(.content,"[aspcms:email]",email)			
		.content=replaceStr(.content,"[aspcms:qq]",qq)			
		.content=replaceStr(.content,"[aspcms:address]",address)			
		.content=replaceStr(.content,"[aspcms:postcode]",postcode)	
		.parseCommon() 		
		echo .content 
	end with
	set templateobj =nothing : terminateAllObjects
End Sub



Sub addOrder
	Dim OrderID,UserID,OrderName,Linkman,Gender,Address,PostCode,Phone,Mobile,Email,QQ,AddTime,Remark,OrderStatus,num
	if getForm("code","post")<>Session("Code") then alertMsgAndGo "验证码不正确","-1"


	OrderID=getForm("OrderID","post")	

	OrderName=filterPara(getForm("OrderName","post"))
	Linkman=filterPara(getForm("Linkman","post"))
	Gender=filterPara(getForm("Gender","post"))
	Address=filterPara(getForm("Address","post"))
	PostCode=filterPara(getForm("PostCode","post"))
	Phone=filterPara(getForm("Phone","post"))
	Mobile=filterPara(getForm("Mobile","post"))	
	Email=filterPara(getForm("Email","post"))
	QQ=filterPara(getForm("QQ","post"))	
	Remark=filterPara(getForm("Remark","post"))	
	num=filterPara(getForm("num","post"))	
	AddTime=now()
	OrderStatus=false

	

	
	if isnul(OrderName) then alertMsgAndGo "订单名称不能为空","-1"
	if isnul(Linkman) then alertMsgAndGo "联系人不能为空","-1"
	if isnul(Phone) then alertMsgAndGo "联系电话不能为空","-1"
	if isnul(Mobile) then alertMsgAndGo "手机不能为空","-1"
	if not isnum(num) then alertMsgAndGo "订购数量不正确","-1"

	Conn.Exec"insert into Aspcms_Order(OrderName,Linkman,Gender,Address,PostCode,Phone,Mobile,Email,QQ,AddTime,Remark,OrderStatus,num) values('"&OrderName&"','"&Linkman&"',"&Gender&",'"&Address&"','"&PostCode&"','"&Phone&"','"&Mobile&"','"&Email&"','"&QQ&"','"&AddTime&"','"&Remark&"',"&OrderStatus&","&num&")","exe"
	
	alertMsgAndGo "产品订购成功！","/"
End Sub
%>
