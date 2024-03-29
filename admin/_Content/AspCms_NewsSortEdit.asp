<!--#include file="../../inc/AspCms_MainClass.asp" -->
<%
CheckAdmin()
Select  case action
	case "save" : SaveSort
End Select

dim ParentID,SortStyle,SortName,SortTemplate,SortURL,SortOrder,SortStatus,PageKey,PageDesc,SortLevel,ID,SortFolder,SortPic

getContent
Sub getContent
	ID = getForm("id","get")
	Dim rsObj 	: Set rsObj=Conn.Exec("select ParentID,SortStyle,SortName,SortTemplate,SortURL,SortOrder,SortStatus,PageKey,PageDesc,SortFolder,SortPic from Aspcms_NewsSort where SortID="&ID,"r1")
	if isnul(ID) then alertMsgAndGo "ID不能为空","-1"	
	ParentID=rsObj(0)
	SortStyle=rsObj(1)
	SortName=rsObj(2)
	SortTemplate=rsObj(3)
	SortURL=rsObj(4)
	SortOrder=rsObj(5)
	SortStatus=rsObj(6)
	PageKey=rsObj(7)
	PageDesc=rsObj(8)	
	SortFolder=rsObj(9)
	SortPic=rsObj(10)	
	rsObj.close	:	Set rsObj = nothing
End Sub

Sub SaveSort
	ID = getForm("id","post")
	ParentID=getForm("ParentID","post")
	SortStyle=getForm("SortStyle","post")
	SortName=getForm("SortName","post")
	SortTemplate=getForm("SortTemplate","post")
	SortURL=getForm("SortURL","post")
	SortOrder=getForm("SortOrder","post")
	SortStatus=getCheck(getForm("SortStatus","post"))
	PageKey=getForm("PageKey","post")
	PageDesc=getForm("PageDesc","post")
	SortFolder=getForm("SortFolder","post")
	SortPic=getForm("SortPic","post")
	
	if isnul(SortName) then alertMsgAndGo"请填写栏目名称","-1"
	if "5"=SortStyle and isnul(SortURL) then alertMsgAndGo"请填写链接地址","-1"
	if not isnum(SortOrder) then alertMsgAndGo"排序只能为数字","-1"
	
	if ParentID="0" then 
		SortLevel="1"
	else
		dim rs 	: set rs=Conn.Exec("select SortLevel from AspCms_NewsSort where SortID="&ParentID,"r1")
		SortLevel=rs(0)+1
		rs.close	:	set rs = nothing
	end if

	Conn.Exec "update AspCms_NewsSort Set ParentID="&ParentID&",SortStyle="&SortStyle&",SortName='"&SortName&"',SortTemplate='"&SortTemplate&"',SortURL='"&SortURL&"',SortOrder="&SortOrder&",SortStatus="&SortStatus&",PageKey='"&PageKey&"',PageDesc='"&PageDesc&"',SortLevel="&SortLevel&",SortFolder='"&SortFolder&"',SortPic='"&SortPic&"' Where SortID="&ID,"exe"	
	alertMsgAndGo "保存成功","AspCms_NewsSort.asp"
End Sub

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>网站栏目设置</title>
<link href="../css/div.css" rel="stylesheet" type="text/css" />
<link href="../css/txt.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/form.css" />
<script language="javascript" src="../js/common.js"></script>
<script language="javascript" src="../js/all.js"></script>
<script language="javascript" src="../js/myjs.js"></script>
</head>

<body>
  <div class="right_up"></div>
  <div class="right_title"><strong class="txt_C3">网站栏目管理</strong></div>
  <div class="main_center_article" id="web_main">
	  <form action="?action=save" method="post" name="form">
        <input type="hidden" name="ID" value="<%=ID%>"   />
        <div class="main_form" style=" background:#e8f1f6"	>
	  	  <div class="main_form_news_l"><strong>编辑栏目 </strong></div>
	  	  </div>
		<div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''"><div class="main_form_txt">顶级栏目：</div>
		<div class="main_form_input"> 
        	<%LoadSelect "ParentID","Aspcms_NewsSort","SortName","SortID",ParentID,0,"order by SortOrder","顶级栏目"%>

		</div>
		</div>
		<div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''"><div class="main_form_txt">类型：</div>
		<div class="main_form_input"> 
		<select name="SortStyle" id="SortStyle">
        <option value="0" <% if SortStyle=0 then echo "selected" end if%>>文章列表</option>
        <option value="1" <% if SortStyle=1 then echo "selected" end if%>>图片列表</option>
        <option value="2" <% if SortStyle=2 then echo "selected" end if%>>单篇文章</option>
        <option value="3" <% if SortStyle=3 then echo "selected" end if%>>产品列表</option>
        <option value="4" <% if SortStyle=4 then echo "selected" end if%>>下载列表</option>
        <option value="5" <% if SortStyle=5 then echo "selected" end if%>>链接</option>
         </select>
		</div>
		</div>
		<div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''"><div class="main_form_txt">栏目名称：</div>
		<div class="main_form_input"> <input type="text" name="SortName" class="input_1" value="<%=SortName%>" style="width:200px"  />
		</div>
		</div>
		<div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''"><div class="main_form_txt">模板文件名称：</div>
		<div class="main_form_input"> <input type="text" name="SortTemplate" class="input_1" value="<%=SortTemplate%>" style="width:200px"  /> 如：about.html
		</div>
		</div>
		<div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''"><div class="main_form_txt">指定生成目录：</div>
		<div class="main_form_input"> <input type="text" name="SortFolder" class="input_1" value="<%=SortFolder%>" style="width:200px"  /> 如：news
		</div>
		</div>
		<div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''"><div class="main_form_txt">链接：</div>
		<div class="main_form_input"> <input type="text" name="SortURL" style="width:200px" value="<%=SortURL%>" />
		</div>
		</div>
		<div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''"><div class="main_form_txt">排序：</div>
		<div class="main_form_input"><input type="text" name="SortOrder"  style="width:30px"  value="<%=SortOrder%>"/>         
		</div>
		</div>	   
		
		<div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''"><div class="main_form_txt">分类图片：</div>
		<div class="main_form_input"><input type="text" name="SortPic" maxlength="255" id="ImagePath" value="<%=SortPic%>"/> <iframe src="../fckeditor/upload.asp?action=news&Tobj=ImagePath" scrolling="no" topmargin="0" width="300" height="24" marginwidth="0" marginheight="0" frameborder="0" align="center"></iframe>
		</div> 尺寸：125px * 100px
		</div>
		     
        <div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''"><div class="main_form_txt">是否启用：</div>
		<div class="main_form_input"><input type="checkbox" name="SortStatus" value="1" <% if SortStatus then echo"checked=""checked"""%> />         
		</div>
		</div>
        
        <div class="main_form" style=" background:#e8f1f6"	>
	  	  <div class="main_form_news_l"><strong>SEO优化</strong></div>
	  	  </div>
		<div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''"><div class="main_form_txt">页面关键词：</div>
		<div class="main_form_input"> 
        	<input type="text" name="PageKey"  style="width:300px"  value="<%=PageKey%>"/> 
		</div>
		</div>
        
		<div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''"><div class="main_form_txt">页面描述：</div>
		<div class="main_form_input"> 
		  <textarea name="PageDesc" cols="40" rows="6" style="width:500px"><%=(PageDesc)%></textarea>
		</div>
		</div>  
        
		<div class="main_form"><div class="main_form_txt"></div>
		<div class="main_form_input">
		  <input type="submit"  value="保存" class="btn" onclick="form.action='?action=save';"/>
		</div>
		</div>
	</form>
</div>
</body>
</html>