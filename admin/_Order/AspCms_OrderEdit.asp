<!--#include file="../../inc/AspCms_MainClass.asp" -->
<!--#include file="AspCms_OrderFun.asp" -->
<%
Conn.Exec"update Aspcms_Order set OrderStatus=1 Where OrderID="&getForm("ID","get"),"exe"
getContent
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>��������</title>
<link href="../css/div.css" rel="stylesheet" type="text/css" />
<link href="../css/txt.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/form.css" />
<script language="javascript" src="../js/common.js"></script>
<script language="javascript" src="../js/all.js"></script>
<script language="javascript" src="../js/myjs.js"></script>
</head>

<body>
    <div class="right_up"></div>
    <div class="right_title"><strong class="txt_C3">�鿴������Ϣ</strong></div>
    <div class="main_center_article" id="web_main">
    <div class="main_form"  style=" background:#e8f1f6">
    	<div class="main_form_news_l"><strong>������Ϣ</strong></div>
    </div>
    <form action="?action=edit&page=<%=page%>&order=<%=order%>&sort=<%=sortID%>&keyword=<%=keyword%>" method="post" name="form">
        <div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''">
        <div class="main_form_txt">�������ƣ�</div>
        <div class="main_form_input"> 
            <input type="text"  name="OrderName" disabled="disabled"  value="<%=OrderName%>"/>
            <input type="hidden"  name="OrderID" value="<%=OrderID%>"/>
        </div>
        </div>
        <div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''"><div class="main_form_txt">����������</div>
        <div class="main_form_input">
        <input name="num" type="text" style="width:60px;" value="<%=num%>" />
             
        </div>
        </div>
        <div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''"><div class="main_form_txt">��ϵ�ˣ�</div>
        <div class="main_form_input">
        <input name="Linkman" type="text" value="<%=Linkman%>" />
             
        </div>
        </div>
        <div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''"><div class="main_form_txt">�Ա�</div>
        <div class="main_form_input">             
            <input type="radio"  value="1" name="Gender" <% if Gender=1 then echo "checked" end if%>/>��
            <input type="radio" value="0" name="Gender" <% if Gender=0 then echo "checked" end if%>/>Ů
        </div>
        </div>
        <div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''"><div class="main_form_txt">�ֻ���</div>
        <div class="main_form_input"> 
            <input name="Mobile" type="text" value="<%=Mobile%>" />
        </div>
        </div>
        <div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''"><div class="main_form_txt">��ϵ�绰��</div>
        <div class="main_form_input"> 
            <input name="Phone" type="text" value="<%=Phone%>" />
        </div>
        </div>
        
        <div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''"><div class="main_form_txt">���䣺</div>
        <div class="main_form_input"> 
            <input name="Email" type="text" value="<%=Email%>" />
        </div>
        </div>
        <div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''"><div class="main_form_txt">QQ��</div>
        <div class="main_form_input"> 
            <input name="QQ" type="text" value="<%=QQ%>" />
        </div>
        </div>
        <div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''"><div class="main_form_txt">��ַ��</div>
        <div class="main_form_input"> 
            <input name="Address" type="text" style="width:300px" value="<%=Address%>" />
        </div>
        </div>
        <div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''"><div class="main_form_txt">�������룺</div>
        <div class="main_form_input"> 
            <input name="PostCode" type="text" value="<%=PostCode%>" />
        </div>
        </div>
          <div id="imglink" class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''"><div class="main_form_txt">��ע��</div>
		<div class="main_form_input">        
        <textarea name="Remark" cols="40" rows="6" style="width:500px"><%=Remark%></textarea>
		</div>
        </div>  
        
        <div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''"><div class="main_form_txt">�鿴״̬��</div>
        <div class="main_form_input"> 
            <input type="checkbox"  value="1" name="OrderStatus" <% if OrderStatus then echo"checked=""checked"""%>/>
        </div>
        </div>
 
        <div class="main_form"><div class="main_form_txt"></div>
		<div class="main_form_input">
		  <input type="button"  value=" ���� " class="btn" onclick="location.href='AspCms_Orders.asp'"/>
		</div>
		</div>
    </form>
    </div>
</body>
</html>