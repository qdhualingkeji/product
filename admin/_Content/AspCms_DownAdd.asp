<!--#include file="../../inc/AspCms_MainClass.asp" -->
<!--#include file="AspCms_ContentFun.asp" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>下载资源-添加下载</title>
<link href="../css/div.css" rel="stylesheet" type="text/css" />
<link href="../css/txt.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/form.css" />
<script language="javascript" src="../js/common.js"></script>
<script language="javascript" src="../js/all.js"></script>
<script language="javascript" src="../js/myjs.js"></script>

</head>

<body>
  <div class="right_up"></div>
  <div class="right_title"><strong class="txt_C3">下载资源-添加下载</strong></div>
  <div class="main_center_article" id="web_main">
	  <form action="?action=adddown" method="post" name="form">
	  	<div class="main_form"  style=" background:#e8f1f6">
	  	  <div class="main_form_news_l"><strong>添加下载 | <a href="AspCms_DownList.asp?sort=<%=SortID%>" class="txt_C1">查看下载列表</a></strong></div>
	  	  </div>        
		<div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''"><div class="main_form_txt">下载名称：</div>
		<div class="main_form_input"> 
        	<input type="text" name="Title" maxlength="200"  style="width:300px" />
        	<input type="hidden" name="SortID" value="<%=sortID%>" />
		</div>
		</div>
		<div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''"><div class="main_form_txt">下载文件1：</div>
		<div class="main_form_input"><input type="text" name="ImagePath" maxlength="255" id="ImagePath1"/> <iframe src="../fckeditor/upload.asp?action=news&Tobj=ImagePath1" scrolling="no" topmargin="0" width="300" height="24" marginwidth="0" marginheight="0" frameborder="0" align="center"></iframe>
		</div>
		</div>
        <div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''"><div class="main_form_txt">下载文件2：</div>
		<div class="main_form_input"><input type="text" name="ImagePath" maxlength="255" id="ImagePath2"/> <iframe src="../fckeditor/upload.asp?action=news&Tobj=ImagePath2" scrolling="no" topmargin="0" width="300" height="24" marginwidth="0" marginheight="0" frameborder="0" align="center"></iframe>
		</div>
		</div>
        <div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''"><div class="main_form_txt">下载文件3：</div>
		<div class="main_form_input"><input type="text" name="ImagePath" maxlength="255" id="ImagePath3"/> <iframe src="../fckeditor/upload.asp?action=news&Tobj=ImagePath3" scrolling="no" topmargin="0" width="300" height="24" marginwidth="0" marginheight="0" frameborder="0" align="center"></iframe>
		</div>
		</div>
		<div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''"><div class="main_form_txt">浏览权限：</div>
		<div class="main_form_input">
		<%=userGradeSelrct("GradeID",0)%>
        <input type="radio" name="Exclusive" value=">=" checked="checked" />
        隶属
        <input type="radio" name="Exclusive" value="=" /> 
        专属（隶属：权限值≥可查看，专属：权限值＝可查看）
		</div>
		</div>
		<div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''"><div class="main_form_txt">内容：</div>
		<div class="main_form_input">           
  <%Dim oFCKeditor:Set oFCKeditor = New FCKeditor:oFCKeditor.BasePath="../fckeditor/":oFCKeditor.ToolbarSet="aspcms":oFCKeditor.Width="615":oFCKeditor.Height="300":oFCKeditor.Value=decodeHtml(Content):oFCKeditor.Create "Content"%>  
		</div>
		</div>	
       
		<div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''"><div class="main_form_txt">关键词：</div>
		<div class="main_form_input"><input type="text" name="NewsTag" maxlength="255"   style="width:500px"/>         
		</div>
		</div>	
		<div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''"><div class="main_form_txt">描述：</div>
		<div class="main_form_input">  
		  <textarea name="PageDesc" cols="40" rows="6" style="width:500px"></textarea>      
		</div>
		</div>
        <div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''"><div class="main_form_txt">立刻发布：</div>
		<div class="main_form_input"><input type="checkBox" name="NewsStatus"  checked value="1"/>
		</div>
		</div>
		<div class="main_form"><div class="main_form_txt"></div>
		<div class="main_form_input">
		  <input type="submit"  value=" 保 存 " class="btn" />
		</div>
		</div>
	</form>
.</div>
</body>
</html>