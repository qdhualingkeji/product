<!--#include file="../../inc/AspCms_MainClass.asp" -->
<!--#include file="AspCms_SettingFun.asp" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>系统相关设置-在线客服设置</title>
<link href="../css/div.css" rel="stylesheet" type="text/css" />
<link href="../css/txt.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/form.css" />
<script language="javascript" src="../js/common.js"></script>
<script language="javascript" src="../js/all.js"></script>
<script language="javascript" src="../js/myjs.js"></script>
</head>

<body>
  <div class="right_up"></div>
  <div class="right_title"><strong class="txt_C3">系统相关设置-在线客服设置</strong></div>
  <div class="main_center_article" id="web_main">
	  <form action="?action=editservice" method="post" name="form">
	  	<div class="main_form"  style=" background:#e8f1f6">
	  	  <div class="main_form_news_l"><strong>在线客服列表</strong></div>
	  	  </div>
          <div class="maintable">
        <div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''"><div class="main_form_txt">显示状态:</div>
		<div class="main_form_input"> 
            <input type="radio"  value="1" name="serviceStatus" <% if serviceStatus=1 then echo "checked" end if%>/>显示
            <input type="radio" value="0" name="serviceStatus" <% if serviceStatus=0 then echo "checked" end if%>/>隐藏
		</div>
		</div>
        <div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''"><div class="main_form_txt">样式:</div>
		<div class="main_form_input"> 
            <input type="radio"  value="1" name="serviceStyle" <% if serviceStyle=1 then echo "checked" end if%>/>样式一
            <input type="radio" value="2" name="serviceStyle" <% if serviceStyle=2 then echo "checked" end if%>/>样式二		</div>
		</div>
        <div class="main_form" style=" display:none" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''"><div class="main_form_txt">显示位置:</div>
		<div class="main_form_input"> 
            <input type="radio" value="left" name="serviceLocation" <% if serviceLocation="left" then echo "checked" end if%>/>左边
            <input type="radio" value="right" name="serviceLocation" <% if serviceLocation="right" then echo "checked" end if%>/>右边
		</div>
		</div>
        
        <div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''"><div class="main_form_txt">QQ：</div>
		<div class="main_form_input"> 
        	<input type="text" name="serviceQQ"  style="width:400px" value="<%=serviceQQ%>"/> 多个请用空格隔开
		</div>
		</div>
        <div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''"><div class="main_form_txt">旺旺：</div>
		<div class="main_form_input"> 
        	<input type="text" name="serviceWangWang" style="width:400px" value="<%=serviceWangWang%>"/>
       	  多个请用空格隔开		</div>
		</div>
        <div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''"><div class="main_form_txt">邮箱：</div>
		<div class="main_form_input"> 
        	<input type="text" name="serviceEmail"  style="width:400px" value="<%=serviceEmail%>"/>
       	  多个请用空格隔开		</div>
		</div>
        <div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''"><div class="main_form_txt">电话：</div>
		<div class="main_form_input"> 
        	<input type="text" name="servicePhone" style="width:400px" value="<%=servicePhone%>"/>
       	  多个请用空格隔开		</div>
		</div>
		</div>
        <div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''"><div class="main_form_txt">联系方式链接：</div>
		<div class="main_form_input"> 
        	<input type="text" name="serviceContact"  style="width:400px" value="<%=serviceContact%>"/>
       	 </div>
		</div>
        <div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''"><div class="main_form_txt">调用标签：</div>
		<div class="main_form_input">{aspcms:onlineservice}
		</div>
		</div>
        
        <div class="main_form" style=" background:#e8f1f6"	>
	  	  <div class="main_form_news_l"><strong>第三方客服系统 </strong></div>
	  	  </div>
             <div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''"><div class="main_form_txt">显示状态:</div>
		<div class="main_form_input"> 
            <input type="radio" value="1" name="servicekfStatus" <% if servicekfStatus=1 then echo "checked" end if%>/>显示
            <input type="radio" value="0" name="servicekfStatus" <% if servicekfStatus=0 then echo "checked" end if%>/>隐藏
		</div>
		</div>
		<div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''"><div class="main_form_txt">53客服系统：</div>
		<div class="main_form_input"> 
			<textarea name="servicekf" cols="40" rows="6" style="width:500px"><%=decode(servicekf)%></textarea>
		</div>
		</div>
        
        <div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''"><div class="main_form_txt">调用标签：</div>
		<div class="main_form_input">{aspcms:53kf}
		</div>
		</div>
        <div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''"><div class="main_form_txt">备注：</div>
		<div class="main_form_input"> 
        	 此处可放置第三方客服系统!
		</div>
		</div>

        
		<div class="main_form"><div class="main_form_txt"></div>
		<div class="main_form_input">
		  <input type="submit"  value=" 保 存 " class="btn" />
		</div>
		</div>
	</form>
</div>
</body>
</html>