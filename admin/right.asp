<!--#include file="../inc/AspCms_MainClass.asp" -->
<%
CheckLogin()
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>ȫ���Ż�����</title>
<link href="css/div.css" rel="stylesheet" type="text/css" />
<link href="css/txt.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="js/common.js"></script>
<script language="javascript" src="js/all.js"></script>
<script language="javascript" src="js/myjs.js"></script></head>

<body>
  <div class="right_up"></div>

  <div class="main_center_article" id="web_main">
  
  
		
	  	<div class="main_form"  style=" background:#e8f1f6">
	  	  <div class="main_form_news_l"><strong>��ݲ���</strong></div>
	  	  </div>
		<div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''">
            <div class="main_form_line">
                <a href="_Setting/AspCms_CompanySetting.asp" class="txt_C1">��վ��Ϣ���� </a>
                <a href="_Content/AspCms_NewsSort.asp" class="txt_C1">������Ŀ����</a>
           
                <a href="_Comments/AspCms_Message.asp" class="txt_C1">���Թ��� </a>
            
                <a href="_Links/AspCms_Links.asp" class="txt_C1">������������</a>  
            </div>
		</div>
        
	  	<div class="main_form"  style=" background:#e8f1f6">
	  	  <div class="main_form_news_l"><strong>��վ��������ͳ��</strong></div>
	  	  </div>
          
         <div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''">
            <div class="main_form_line">
            <span>���£�<%=getDataCount("select Count(*) from Aspcms_News where SortID in (select SortID from Aspcms_NewsSort where SortStyle=0)")%></span>
        
            <span>���ԣ�<%=getDataCount("select Count(*) from Aspcms_Faq")%></span>
            </div>
		</div>      

	  	
          	
          
	  	
		
          
		<div class="main_form"  style=" background:#e8f1f6">
	  	  <div class="main_form_news_l"><strong>վ����Ϣ</strong></div>
	  	  </div>
		<div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''">
		  <div class="main_form_txt"> ���������ƣ�</div>
		  <div class="main_form_input">
        	���� <%=Request.ServerVariables("SERVER_NAME")%>(IP:<%=Request.ServerVariables("LOCAL_ADDR")%>) �˿�:<%=Request.ServerVariables("SERVER_PORT")%>
		  </div>
          </div>
		<div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''">
		  <div class="main_form_txt">վ������·����</div>
		  <div class="main_form_input">
		   <%=Request.ServerVariables("PATH_TRANSLATED")%>
	    </div></div>
		<div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''">
		  <div class="main_form_txt">FSO�ı���д��</div>
		  <div class="main_form_input">
          <%If Not isInstallObj(FSO_OBJ_NAME) Then%><font color="#FF0066"><b>��</b></font><%else%><b>��</b><%end if%>
		  </div>
		</div>
		<div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''">
		  <div class="main_form_txt">�ű��������棺</div>
		  <div class="main_form_input">
	  	  <%=ScriptEngine & "/"& ScriptEngineMajorVersion &"."&ScriptEngineMinorVersion&"."& ScriptEngineBuildVersion %>
		  </div>
		</div>
		<div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''">
		  <div class="main_form_txt">������IIS�汾��</div>
		  <div class="main_form_input">
	  	  <%=Request.ServerVariables("SERVER_SOFTWARE")%>
		  </div>
		</div>
 

        <div class="main_form"  style=" background:#e8f1f6">		
        
		</div>
		<div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''">
		  <div class="main_form_txt"></div>
		  <div class="main_form_input">
Copyright&copy;  2009-2013  .All Rights Reserved		  </div>
		</div>
  
</div>
</body>
</html>

