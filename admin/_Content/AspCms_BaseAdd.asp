<!--#include file="../../inc/AspCms_MainClass.asp" -->
<!--#include file="AspCms_ContentFun.asp" -->
<%
Call getBase
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>添加内容</title>
<link href="../css/div.css" rel="stylesheet" type="text/css" />
<link href="../css/txt.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/form.css" />
<script language="javascript" src="../js/common.js"></script>
<script language="javascript" src="../js/all.js"></script>
<script language="javascript" src="../js/myjs.js"></script>


<script charset="utf-8" src="../kindeditor/kindeditor.js"></script>
	<script charset="utf-8" src="../kindeditor/lang/zh_CN.js"></script>
	<script charset="utf-8" src="../kindeditor/plugins/code/prettify.js"></script>
	<script>
		KindEditor.ready(function(K) {
			var editor1 = K.create('textarea[name="Content"]', {
				cssPath : '../kindeditor/plugins/code/prettify.css',
				uploadJson : '../kindeditor/asp/upload_json.asp',
				fileManagerJson : '../kindeditor/asp/file_manager_json.asp',
				allowFileManager : true,
				afterCreate : function() {
					var self = this;
					K.ctrl(document, 13, function() {
						self.sync();
						K('form[name=example]')[0].submit();
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
						K('form[name=example]')[0].submit();
					});
				}
			});
			prettyPrint();
		});
	</script>

</head>

<body>
  <div class="right_up"></div>
  <div class="right_title"><strong class="txt_C3">添加单篇文章</strong></div>
  <div class="main_center_article" id="web_main">
	  <form action="?action=<%=action%>" method="post" name="form">          
        <div class="main_form" style=" background:#e8f1f6"	>
	  	  <div class="main_form_news_l"><strong>添加内容 </strong></div>
	  	  </div>
		<div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''"><div class="main_form_txt">标题：</div>
		<div class="main_form_input"> 
        	<input type="hidden" name="Title"  style="width:200px;" value="<%=Title%>"  />
            <%=Title%>
        	<input type="hidden" name="sortID"  value="<%=sortID%>" />
		</div>
		</div>		
		<div style=" display:none;" class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''"><div class="main_form_txt">副标题：</div>
		<div class="main_form_input">         
		 <textarea name="Title2" cols="40" rows="6" style="width:500px"><%=Title2%></textarea>
		</div>
		</div>	
		<div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''"><div class="main_form_txt">内容：</div>
		<div class="main_form_input">   
        
             <textarea name="Content" cols="40" rows="6" style="width:800px; height:500px;"><%=Content%></textarea> 
  <%'Dim oFCKeditor:Set oFCKeditor = New FCKeditor:oFCKeditor.BasePath="../fckeditor/":oFCKeditor.ToolbarSet="aspcms":oFCKeditor.Width="615":oFCKeditor.Height="300":oFCKeditor.Value=decodeHtml(Content):oFCKeditor.Create "Content"%>  
		</div>
		</div>	
               
		<div class="main_form"><div class="main_form_txt"></div>
		<div class="main_form_input">
		  <input type="submit"  value="保存" class="btn"/>
		</div>
		</div>
	</form>
</div>
</body>
</html>