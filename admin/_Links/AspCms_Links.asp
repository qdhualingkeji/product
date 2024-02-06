<!--#include file="../../inc/AspCms_MainClass.asp" -->
<!--#include file="AspCms_linksFun.asp" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>系统相关设置-友情链接设置</title>
<link href="../css/div.css" rel="stylesheet" type="text/css" />
<link href="../css/txt.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/form.css" />
<script language="javascript" src="../js/common.js"></script>
<script language="javascript" src="../js/all.js"></script>
<script language="javascript" src="../js/myjs.js"></script>
</head>

<body>
  <div class="right_up"></div>
  <div class="right_title"><strong class="txt_C3">系统相关设置-友情链接设置</strong></div>
  <div class="main_center_article" id="web_main">
	  <form action="?action=edit" method="post" name="form">
	  	<div class="main_form"  style=" background:#e8f1f6">
	  	  <div class="main_form_news_l"><strong>友情链接列表</strong></div>
	  	  </div>
          <div class="maintable">
            <table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#a9c5d0">
              <tr bgcolor="#DDEFF9" align="center">
                <td width="7%">ID</td>
                <td width="24%">前台显示</td>
                <td width="16%">链接地址</td>
                <td width="10%">排序</td>
                <td width="20%">类型</td>
                <td width="9%">状态</td>
                <td width="14%">操作</td>
              </tr>
              <%LinksList%>
            </table>
            
		</div>
        <div class="main_form" style=" background:#e8f1f6"	>
	  	  <div class="main_form_news_l"><strong>添加友情链接 </strong></div>
	  	  </div>
		<div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''">
		<div class="main_form_txt">网站名称：</div>
		<div class="main_form_input"> 
        	<input type="text"  style="width:200px" name="LinkText"/>
		</div>
		</div>
        <div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''"><div class="main_form_txt">链接地址：</div>
		<div class="main_form_input"> <input type="text" name="LinkUrl" style="width:200px" />
		</div>
		</div>
		<div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''"><div class="main_form_txt">立刻发布：</div>
		<div class="main_form_input"> 
			<input type="checkbox"  checked="checked" value="1" name="LinkStatus"/>
		</div>
		</div>
		<div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''"><div class="main_form_txt">排序：</div>
		<div class="main_form_input"> 
			<input type="input" name="LinkOrder" value="99" style="width:100px"/>
		</div>
		</div>
        <div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''"><div class="main_form_txt">链接类型：</div>
		<div class="main_form_input"> 
		    <select name="LinkType" id="LinkType" onChange="selectLinkType(this.options[this.selectedIndex].value)">
		        <option value="0" <% if databaseType="0" then echo "selected"%>>文字链接</option>
		      <option value="1" <% if databaseType="1" then echo "selected"%>>图片链接</option>
            </select>
		</div>
		</div>
        
        <div id="imglink" style=" display:none" class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''"><div class="main_form_txt">图片上传：</div>
		<div class="main_form_input"> 
        <input type="text" name="ImageURL" id="ImageURL"/>
        <iframe src="../fckeditor/upload.asp?action=news&Tobj=ImageURL" scrolling="no" topmargin="0" width="300" height="24" marginwidth="0" marginheight="0" frameborder="0" align="center"></iframe>图片上传尺寸请控制在88*31
		</div>
        </div>      

		<div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''"><div class="main_form_txt">备注说明：</div>
		<div class="main_form_input"><textarea type="text" cols="40" rows="6" style="width:500px" name="LinkDesc"></textarea>         
		</div>
		</div>	
        
        
		<div class="main_form"><div class="main_form_txt"></div>
		<div class="main_form_input">
		  <input type="submit"  value=" 添 加 " class="btn" onclick="form.action='?action=add';"/>
		</div>
		</div>
        <div class="main_form"><div class="main_form_txt">友情链接说明：</div>
		</div>
	</form>
</div>
</body>
</html>