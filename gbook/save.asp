<!--#include file="../inc/AspCms_MainClass.asp" -->
<%
if action="add" then addFaq

Dim FaqID,FaqTitle,Contact,ContactWay,Content,Reply,AddTime,ReplyTime,FaqStatus,AuditStatus
Sub addFaq
	if getForm("code","post")<>Session("Code") then alertMsgAndGo "��֤�벻��ȷ","-1"
	'if session("faq") then alertMsgAndGo "�벻Ҫ�ظ��ύ","-1"
	FaqTitle=filterPara(getForm("FaqTitle","post"))
	Contact=filterPara(getForm("Contact","post"))
	ContactWay=filterPara(getForm("ContactWay","post"))
	Content=encode(filterPara(getForm("Content","post")))
	AddTime=now()
	FaqStatus=false
	AuditStatus=false
	
	if isnul(FaqTitle) then alertMsgAndGo "���ⲻ��Ϊ��","-1"
	if isnul(Contact) then alertMsgAndGo "���ݲ���Ϊ��","-1"
	if isnul(ContactWay) then alertMsgAndGo "��ϵ�˲���Ϊ��","-1"
	if isnul(Content) then alertMsgAndGo "��ϵ��ʽ����Ϊ��","-1"
	
	
	Conn.Exec"insert into Aspcms_Faq(FaqTitle,Contact,ContactWay,Content,AddTime,FaqStatus,AuditStatus) values('"&FaqTitle&"','"&Contact&"','"&ContactWay&"','"&Content&"','"&AddTime&"',"&FaqStatus&","&AuditStatus&")","exe"
	session("faq")=true
	
	if SwitchCommentsStatus=0 then
		alertMsgAndGo "���Գɹ���",getRefer	
	else	
		alertMsgAndGo "���Գɹ�����ȴ�����У�",getRefer	
	end if

	
End Sub

%>