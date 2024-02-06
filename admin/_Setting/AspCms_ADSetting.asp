<!--#include file="../../inc/AspCms_MainClass.asp" -->
<!--#include file="AspCms_SettingFun.asp" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>系统相关设置-网站广告设置</title>
<link href="../css/div.css" rel="stylesheet" type="text/css" />
<link href="../css/txt.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/form.css" />
<script language="javascript" src="../js/common.js"></script>
<script language="javascript" src="../js/all.js"></script>
<script language="javascript" src="../js/myjs.js"></script>
</head>

<body>
  <div class="right_up"></div>
  <div class="right_title"><strong class="txt_C3">系统相关设置-网站广告设置</strong></div>
  <div class="main_center_article" id="web_main">
	  <form action="?action=editad " method="post" name="form">
	  	<div class="main_form"  style=" background:#e8f1f6">
	  	  <div class="main_form_news_l"><strong>浮动广告</strong></div>
	  	  </div>
          <div class="maintable">
        
		<div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''"><div class="main_form_txt">显示状态：</div>
		<div class="main_form_input">             
            <input type="radio"  value="1" name="adStatus" <% if adStatus=1 then echo "checked" end if%>/>显示
            <input type="radio" value="0" name="adStatus" <% if adStatus=0 then echo "checked" end if%>/>隐藏
		</div>
		</div>
        <div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''"><div class="main_form_txt">图片地址：</div>
		<div class="main_form_input"> 
        	<input type="text" name="adImagePath" id="adImagePath" style="width:300px" value="<%=adImagePath%>"/>
		</div>
		</div>
        
		<div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''"><div class="main_form_txt">上传图片：</div>
		<div class="main_form_input"> 
        	<iframe src="../fckeditor/upload.asp?action=news&amp;Tobj=adImagePath" scrolling="No" topmargin="0" width="300" height="24" marginwidth="0" marginheight="0" frameborder="0" align="left"></iframe>
		</div>
		</div>
        
		<div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''"><div class="main_form_txt">链接地址：</div>
		<div class="main_form_input"> 
        	<input name="adLink" type="text"  style="width:300px" value="<%=adLink%>" /> 空链接则填"#"
		</div>
		</div>
        
		<div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''"><div class="main_form_txt">图片大小：</div>
		<div class="main_form_input"> 
        	宽：<input name="adImgWidth" type="text" style="width:40px" value="<%=adImgWidth%>"/> 
            高：<input name="adImgHeight" type="text"  style="width:40px" value="<%=adImgHeight%>"/>
		</div>
		</div>

		<div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''"><div class="main_form_txt">调用标签：</div>
		<div class="main_form_input">{aspcms:floatad}
		</div>
		</div>
        
        
		<div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''"><div class="main_form_txt"></div>
		<div class="main_form_input"> 
        	<input type="submit" value=" 保存 " />
		</div>
		</div>
		</div>
        <div class="main_form" style=" background:#e8f1f6"	>
	  	  <div class="main_form_news_l"><strong>广告类型说明 </strong></div>
	  	  </div>
		<div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''"><div class="main_form_txt">浮动广告：</div>
		<div class="main_form_input"> 
        	指漂浮在页面上不断移动的广告，其大小一般为80*80
		</div>
		</div>
        <div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''"><div class="main_form_txt">对联广告：</div>
		<div class="main_form_input"> 
        	指固定显示在页面两侧的广告
		</div>
		</div>
        <div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''"><div class="main_form_txt">弹出式公告：</div>
		<div class="main_form_input"> 
        	指弹出指定大小页面的内容形式公告
		</div>
		</div>
	</form>
</div>
</body>
</html>