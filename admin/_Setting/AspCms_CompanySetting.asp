<!--#include file="../../inc/AspCms_MainClass.asp" -->
<!--#include file="AspCms_SettingFun.asp" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>��վ��Ϣ����</title>
<link href="../css/div.css" rel="stylesheet" type="text/css" />
<link href="../css/txt.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="../js/common.js"></script>
<script language="javascript" src="../js/all.js"></script>
<script language="javascript" src="../js/myjs.js"></script></head>

<body>
  <div class="right_up"></div>
  <div class="right_title"><strong class="txt_C3">��վ��Ϣ����</strong></div>
  <div class="main_center_article" id="web_main">
	  <form action="?action=editcompany" method="post" name="form">
	  	<div class="main_form"  style=" background:#e8f1f6">
	  	  <div class="main_form_news_l"><strong>��������</strong></div>
	  	  </div>
		<div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''">
		  <div class="main_form_txt">��վ���⣺</div>
		  <div class="main_form_input">
		    <input type="text" name="siteTitle" class="my_input" style="width:300px" value="<%=siteTitle%>"/>
	    </div></div>
		<div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''">
		  <div class="main_form_txt">��վLogo��</div>
		  <div class="main_form_input">
		    <input type="text" name="siteLogoUrl" id="siteLogoUrl" class="my_input" style="width:300px" value="<%=siteLogoUrl%>"/>
	    </div></div>
        <div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''">
		  <div class="main_form_txt">��վLogo�ϴ���</div>
		  <div class="main_form_input">
		   <iframe src="../fckeditor/upload.asp?action=news&Tobj=siteLogoUrl" scrolling="no" topmargin="0" width="300" height="24" marginwidth="0" marginheight="0" frameborder="0" ></iframe>
	    </div></div>
		<div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''">
		  <div class="main_form_txt">��վ��ַ��</div>
		  <div class="main_form_input">
	  	  <input type="text" name="siteUrl" class="my_input" style="width:300px" value="<%=siteUrl%>"/>  
          ����http://,����д:www.hualingol.com 
	  	</div></div>
		<div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''">
		  <div class="main_form_txt">��˾���ƣ�</div>
		  <div class="main_form_input">
	  	  <input type="text" name="companyName" class="my_input" style="width:300px" value="<%=companyName%>"/>
	  	</div></div>
		<div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''">
		  <div class="main_form_txt">��˾��ַ��</div>
		  <div class="main_form_input">
	  	  <input type="text" name="companyAddress" class="my_input" style="width:300px" value="<%=companyAddress%>"/>
		  </div>
		</div>
		<div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''">
		  <div class="main_form_txt">�������룺</div>
		  <div class="main_form_input">
		    <input name="companyPostCode" type="text" class="my_input" style="width:300px" value="<%=companyPostCode%>"/>
		  </div>
		</div>
		
		<div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''">
		<div class="main_form_txt">�绰���룺</div>
		<div class="main_form_input">
		  <input type="text" name="companyPhone" class="my_input" style="width:300px" value="<%=companyPhone%>"/> �������绰���ö��Ÿ���          
		</div>
		</div>
		<div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''">
		<div class="main_form_txt">�̻�1��</div>
		<div class="main_form_input">
		  <input type="text" name="companyMobile" class="my_input" style="width:300px" value="<%=companyMobile%>"/>          
		</div>
		</div>
        <div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''">
		<div class="main_form_txt">�̻�2��</div>
		<div class="main_form_input">
		  <input type="text" name="companyContact" class="my_input" style="width:300px" value="<%=companyContact%>"/>           
		</div>
		</div>
		<div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''">
		<div class="main_form_txt">��˾���棺</div>
		<div class="main_form_input">
		  <input type="text" name="companyFax" class="my_input" style="width:300px" value="<%=companyFax%>"/>
		</div>
		</div>
		<div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''">
		<div class="main_form_txt">�������䣺</div>
		<div class="main_form_input">
		  <input type="text" name="companyEmail" class="my_input" style="width:300px" value="<%=companyEmail%>"/>
		</div>
		</div>
		<div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''">
		<div class="main_form_txt">ͳ�ƴ��룺</div>
		<div class="main_form_input">
		  <textarea name="statisticalCode" cols="40" rows="6" style="width:500px"><%=decode(statisticalCode)%></textarea>
		</div>
		</div>
		<div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''">
		<div class="main_form_txt">�����ţ�</div>
		<div class="main_form_input">
		  <input type="text" name="companyICP" class="my_input" style="width:300px" value="<%=companyICP%>"/>
		</div>
		</div>

                	<div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''">
		  <div class="main_form_txt">���۹��ܿ��أ�</div>
		  <div class="main_form_input">
            <input type="radio"  value="1" name="SwitchComments" <% if SwitchComments=1 then echo "checked" end if%>/>����
            <input type="radio" value="0" name="SwitchComments" <% if SwitchComments=0 then echo "checked" end if%>/>�ر�
		  </div></div>
          
          <div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''">
		  <div class="main_form_txt">������˿��أ�</div>
		  <div class="main_form_input">
            <input type="radio"  value="1" name="SwitchCommentsStatus" <% if SwitchCommentsStatus=1 then echo "checked" end if%>/>����
            <input type="radio" value="0" name="SwitchCommentsStatus" <% if SwitchCommentsStatus=0 then echo "checked" end if%>/>�ر�
		  </div></div>
          
          <div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''">
		  <div class="main_form_txt">������˿��أ�</div>
		  <div class="main_form_input">
            <input type="radio"  value="1" name="SwitchFaqStatus" <% if SwitchFaqStatus=1 then echo "checked" end if%>/>����
            <input type="radio" value="0" name="SwitchFaqStatus" <% if SwitchFaqStatus=0 then echo "checked" end if%>/>�ر�
		  </div></div>
        
		<div class="main_form"><div class="main_form_txt"></div>
		<div class="main_form_input">
		  <input type="submit"  value=" �� �� " />
		</div>
		</div>
	</form>
</div>
</body>
</html>
