<!--#include file="../inc/AspCms_MainClass.asp" -->
<%
echoContent()
Sub echoContent()
	dim page
	page=replaceStr(request.QueryString,FileExt,"")
	if isNul(page) then page=1
	if isNum(page) then page=clng(page) else echoMsgAndGo "ҳ�治����",3 end if
	dim templateobj,channelTemplatePath : set templateobj = mainClassobj.createObject("MainClass.template")
	dim typeIds,rsObj,rsObjtid,Tid,rsObjSmalltype,rsObjBigtype
	Dim templatePath,tempStr
	templatePath = "/"&sitePath&"templates/"&defaultTemplate&"/"&htmlFilePath&"/editpass.html"

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
	
	with templateObj 
		.content=loadFile(templatePath)	
		.parseHtml()
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

%>