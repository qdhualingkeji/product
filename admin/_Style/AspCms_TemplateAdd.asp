<!--#include file="../../inc/AspCms_MainClass.asp" -->
<!--#include file="AspCms_StyleFun.asp" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>风格模板管理-编辑模板</title>
<link href="../css/div.css" rel="stylesheet" type="text/css" />
<link href="../css/txt.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/form.css" />
<script language="javascript" src="../js/common.js"></script>
<script language="javascript" src="../js/all.js"></script>
<script language="javascript" src="../js/myjs.js"></script>
</head>

<body>
  <div class="right_up"></div>
  <div class="right_title"><strong class="txt_C3">风格模板管理-添加模板</strong></div>
  <div class="main_center_article" id="web_main">
	  <form action="?action=addfile" method="post" name="form">
	  	<div class="main_form"  style=" background:#e8f1f6">
	  	  <div class="main_form_news_l"><strong>添加模板</strong></div>
	  	  </div>        
		<div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''"><div class="main_form_txt">文件名称：</div>
		<div class="main_form_input">
		<input type="text" name="filename"/> 
		</div>
		</div>
		<div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''"><div class="main_form_txt">文件内容：</div>
		<div class="main_form_input"> 
            <textarea cols="80" rows="3" name="filetext" style=" height:320px;" ></textarea>
		</div>
		</div>		
		<div class="main_form"><div class="main_form_txt"></div>
		<div class="main_form_input">
		  <input type="submit"  value=" 添 加 " class="btn"/>
		</div>
		</div>
	</form>
	</div>
</body>
</html>

