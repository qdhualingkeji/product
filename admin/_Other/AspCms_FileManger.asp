<!--#include file="../../inc/AspCms_MainClass.asp" -->
<!--#include file="AspCms_FileMangerFun.asp" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�ޱ����ĵ�</title>
<link href="../css/div.css" rel="stylesheet" type="text/css" />
<link href="../css/txt.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/form.css" />
<script language="javascript" src="../js/common.js"></script>
<script language="javascript" src="../js/all.js"></script>
<script language="javascript" src="../js/myjs.js"></script>
</head>

<body>
  <div class="right_up"></div>
  <div class="right_title"><strong class="txt_C3">��������-�ϴ��ļ�����</strong></div>
  <div class="main_center_article" id="web_main">
	  <form action="?action=delallfile&dirpath=<%=dirpath%>" method="post" name="form">
	    <div class="maintable">
<div class="main_form"  style=" background:#e8f1f6">
  <div class="main_form_news_l"><strong>�ϴ��ļ�����</strong></div>
</div>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#a9c5d0">
  <tr bgcolor="#DDEFF9" align="center">
    <td width="6%">���</td>
    <td width="35%">�ļ�����</td>
    <td width="13%">��С</td>
    <td width="12%">����</td>
    <td width="19%">�޸�����</td>
    <td width="9%">����</td>
    <td width="6%">ѡ��</td>
  </tr>
<%uplpadFileList%>
</table>

		</div>
        <div class="main_form" style=" background:#e8f1f6"	>
	  	  <div class="main_form_news_l"><strong> </strong></div>
  	    </div>
	  </form>
</div>
</body>
</html>
