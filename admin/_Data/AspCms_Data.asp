<!--#include file="../../inc/AspCms_MainClass.asp" -->
<!--#include file="AspCms_DataFun.asp" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>ϵͳ�������-���ݿⱸ�ݻָ�</title>
<link href="../css/div.css" rel="stylesheet" type="text/css" />
<link href="../css/txt.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/form.css" />
<script language="javascript" src="../js/common.js"></script>
<script language="javascript" src="../js/all.js"></script>
<script language="javascript" src="../js/myjs.js"></script>
</head>

<body>
  <div class="right_up"></div>
  <div class="right_title"><strong class="txt_C3">ϵͳ�������-���ݿⱸ�ݻָ�</strong></div>
  <div class="main_center_article" id="web_main">
	  <form action="?action=delall" method="post" name="form">
	  	<div class="main_form"  style=" background:#e8f1f6">
	  	  <div class="main_form_news_l"><strong>�������ݿ�</strong>��<a href="?action=bakup" class="txt_C1">��ʼ����</a>��</div>
	  	  </div>
          <div class="maintable">
            <table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#a9c5d0">
              <tr bgcolor="#DDEFF9" align="center">
                <td width="10%">���</td>
                <td width="35%">�ļ�����</td>
                <td width="25%">����ʱ��</td>
                <td width="20%">����</td>
                <td width="10%">ѡ��</td>
              </tr>
              <%databackList%>
            </table>
		</div>
        <div class="main_form" style=" background:#e8f1f6"	>
	  	  <div class="main_form_news_l"><strong>ѹ���Ż����ݿ� </strong>��ѹ��ǰ�����[����]���ݿ⣬����ʹ���е����ݿⲻ�ܱ�ѹ����</div>
	  	  </div>
		<div class="main_form" onMouseOver="this.style.backgroundColor='#e8f1f6'" onMouseOut="this.style.backgroundColor=''"><div class="main_form_txt"></div>
		<div class="main_form_input"> 
        	<a href="?action=compress" class="txt_C1">ѹ���Ż����ݿ�</a>            
		</div>
		</div>
        
	</form>
</div>
</body>
</html>