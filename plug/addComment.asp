<!--#include file="../inc/AspCms_MainClass.asp" -->
<%
if action="add" then addComment

Sub addComment	
	Dim CommentsID,NewsID,Commentator,CommentContent,AddTime,CommentIP,CommentStatus
	if getForm("code","post")<>Session("Code") then alertMsgAndGo "验证码不正确","-1"
	NewsID=filterPara(getForm("NewsID","post"))
	Commentator=filterPara(getForm("Commentator","post"))
	CommentContent=encode(filterPara(getForm("CommentContent","post")))	
	CommentIP=getIP()
	CommentStatus=0
	
	if isnul(Commentator) then alertMsgAndGo "评论者不能为空","-1"
	if isnul(CommentContent) then alertMsgAndGo "评论内容不能为空","-1"
	
	Conn.exec "insert into Aspcms_Comments(NewsID,Commentator,CommentContent,AddTime,CommentIP,CommentStatus) values("&NewsID&",'"&Commentator&"','"&CommentContent&"',now(),'"&CommentIP&"',"&CommentStatus&")","exe"	
	
	if SwitchFaqStatus=0 then
		alertMsgAndGo "评论成功！",getRefer	
	else	
		alertMsgAndGo "评论成功，请等待审核中！",getRefer	
	end if
End Sub

%>