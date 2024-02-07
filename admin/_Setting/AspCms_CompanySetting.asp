<!--#include file="../../inc/AspCms_MainClass.asp" -->
<!--#include file="AspCms_SettingFun.asp" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>网站信息设置</title>
<link href="../css/div.css" rel="stylesheet" type="text/css" />
<link href="../css/txt.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="../js/common.js"></script>
<script language="javascript" src="../js/all.js"></script>
<script language="javascript" src="../js/myjs.js"></script></head>

<body>
  <div class="right_up"></div>
  <div class="right_title"><strong class="txt_C3">网站信息设置</strong></div>
  <div class="main_center_article" id="web_main">
	  <form action="?action=editcompany" method="post" name="form">
	  	<div class="main_form"  style=" background:#e8f1f6">
	  	  <div class="main_form_news_l"><strong>基本设置</strong></div>
	  	  </div>
		<div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''">
		  <div class="main_form_txt">网站标题：</div>
		  <div class="main_form_input">
		    <input type="text" name="siteTitle" class="my_input" style="width:300px" value="<%=siteTitle%>"/>
	    </div></div>
		<div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''">
		  <div class="main_form_txt">网站Logo：</div>
		  <div class="main_form_input">
		    <input type="text" name="siteLogoUrl" id="siteLogoUrl" class="my_input" style="width:300px" value="<%=siteLogoUrl%>"/>
	    </div></div>
        <div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''">
		  <div class="main_form_txt">网站Logo上传：</div>
		  <div class="main_form_input">
		   <iframe src="../fckeditor/upload.asp?action=news&Tobj=siteLogoUrl" scrolling="no" topmargin="0" width="300" height="24" marginwidth="0" marginheight="0" frameborder="0" ></iframe>
	    </div></div>
		<div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''">
		  <div class="main_form_txt">网站地址：</div>
		  <div class="main_form_input">
	  	  <input type="text" name="siteUrl" class="my_input" style="width:300px" value="<%=siteUrl%>"/>  
          不含http://,如填写:www.hualingol.com 
	  	</div></div>
		<div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''">
		  <div class="main_form_txt">公司名称：</div>
		  <div class="main_form_input">
	  	  <input type="text" name="companyName" class="my_input" style="width:300px" value="<%=companyName%>"/>
	  	</div></div>
		<div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''">
		  <div class="main_form_txt">公司地址：</div>
		  <div class="main_form_input">
	  	  <input type="text" name="companyAddress" class="my_input" style="width:300px" value="<%=companyAddress%>"/>
		  </div>
		</div>
		<div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''">
		  <div class="main_form_txt">邮政编码：</div>
		  <div class="main_form_input">
		    <input name="companyPostCode" type="text" class="my_input" style="width:300px" value="<%=companyPostCode%>"/>
		  </div>
		</div>
		
		<div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''">
		<div class="main_form_txt">电话号码：</div>
		<div class="main_form_input">
		  <input type="text" name="companyPhone" class="my_input" style="width:300px" value="<%=companyPhone%>"/> 可填多个电话，用逗号隔开          
		</div>
		</div>
		<div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''">
		<div class="main_form_txt">商话1：</div>
		<div class="main_form_input">
		  <input type="text" name="companyMobile" class="my_input" style="width:300px" value="<%=companyMobile%>"/>          
		</div>
		</div>
        <div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''">
		<div class="main_form_txt">商话2：</div>
		<div class="main_form_input">
		  <input type="text" name="companyContact" class="my_input" style="width:300px" value="<%=companyContact%>"/>           
		</div>
		</div>
		<div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''">
		<div class="main_form_txt">公司传真：</div>
		<div class="main_form_input">
		  <input type="text" name="companyFax" class="my_input" style="width:300px" value="<%=companyFax%>"/>
		</div>
		</div>
		<div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''">
		<div class="main_form_txt">电子邮箱：</div>
		<div class="main_form_input">
		  <input type="text" name="companyEmail" class="my_input" style="width:300px" value="<%=companyEmail%>"/>
		</div>
		</div>
		<div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''">
		<div class="main_form_txt">统计代码：</div>
		<div class="main_form_input">
		  <textarea name="statisticalCode" cols="40" rows="6" style="width:500px"><%=decode(statisticalCode)%></textarea>
		</div>
		</div>
		<div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''">
		<div class="main_form_txt">备案号：</div>
		<div class="main_form_input">
		  <input type="text" name="companyICP" class="my_input" style="width:300px" value="<%=companyICP%>"/>
		</div>
		</div>

                	<div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''">
		  <div class="main_form_txt">评论功能开关：</div>
		  <div class="main_form_input">
            <input type="radio"  value="1" name="SwitchComments" <% if SwitchComments=1 then echo "checked" end if%>/>开启
            <input type="radio" value="0" name="SwitchComments" <% if SwitchComments=0 then echo "checked" end if%>/>关闭
		  </div></div>
          
          <div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''">
		  <div class="main_form_txt">评论审核开关：</div>
		  <div class="main_form_input">
            <input type="radio"  value="1" name="SwitchCommentsStatus" <% if SwitchCommentsStatus=1 then echo "checked" end if%>/>开启
            <input type="radio" value="0" name="SwitchCommentsStatus" <% if SwitchCommentsStatus=0 then echo "checked" end if%>/>关闭
		  </div></div>
          
          <div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''">
		  <div class="main_form_txt">留言审核开关：</div>
		  <div class="main_form_input">
            <input type="radio"  value="1" name="SwitchFaqStatus" <% if SwitchFaqStatus=1 then echo "checked" end if%>/>开启
            <input type="radio" value="0" name="SwitchFaqStatus" <% if SwitchFaqStatus=0 then echo "checked" end if%>/>关闭
		  </div></div>
        
		<div class="main_form"><div class="main_form_txt"></div>
		<div class="main_form_input">
		  <input type="submit"  value=" 保 存 " />
		</div>
		</div>
	</form>
</div>
</body>
</html>

