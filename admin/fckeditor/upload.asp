<!--#include file="../../inc/AspCms_MainClass.asp" -->
<%
CheckLogin()
action = getForm("action", "get")
Dim Tobj : Tobj =getForm("Tobj", "get")
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>文件上传</title>
<link href="../css/div.css" rel="stylesheet" type="text/css" />
<link href="../css/txt.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/form.css" />

<script language="javascript" src="../js/common.js"></script>
<script language="javascript" src="../js/all.js"></script>
<script language="javascript" src="../js/myjs.js"></script>

</head>

<body>
<form name="form" enctype="multipart/form-data" action="upFile.asp?action=<%=action%>&Tobj=<%=Tobj%>"  method="post">


<input type="file" name="filedata"/>
 <input type="submit" name="submit" value="上传" >
</form>

</body>
</html>
