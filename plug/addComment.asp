<!--#include file="../inc/AspCms_MainClass.asp" -->
<%
if action="add" then addComment

Sub addComment	
	Dim CommentsID,NewsID,Commentator,CommentContent,AddTime,CommentIP,CommentStatus
	if getForm("code","post")<>Session("Code") then alertMsgAndGo "��֤�벻��ȷ","-1"
	NewsID=filterPara(getForm("NewsID","post"))
	Commentator=filterPara(getForm("Commentator","post"))
	CommentContent=encode(filterPara(getForm("CommentContent","post")))	
	CommentIP=getIP()
	CommentStatus=0
	
	if isnul(Commentator) then alertMsgAndGo "�����߲���Ϊ��","-1"
	if isnul(CommentContent) then alertMsgAndGo "�������ݲ���Ϊ��","-1"
	
	Conn.exec "insert into Aspcms_Comments(NewsID,Commentator,CommentContent,AddTime,CommentIP,CommentStatus) values("&NewsID&",'"&Commentator&"','"&CommentContent&"',now(),'"&CommentIP&"',"&CommentStatus&")","exe"	
	
	if SwitchFaqStatus=0 then
		alertMsgAndGo "���۳ɹ���",getRefer	
	else	
		alertMsgAndGo "���۳ɹ�����ȴ�����У�",getRefer	
	end if
End Sub

%>