<!--#include file="../../inc/AspCms_MainClass.asp" -->
<!--#include file="AspCms_StyleFun.asp" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�ޱ����ĵ�</title>
<link href="../css/div.css" rel="stylesheet" type="text/css" />
<link href="../css/txt.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/form.css" />
<script language="javascript" src="../js/common.js"></script>
<script language="javascript" src="../js/all.js"></script>
<script language="javascript" src="../js/myjs.js"></script>
</head>

<body>
  <div class="right_up"></div>
  <div class="right_title"><strong class="txt_C3">���ģ�����-ģ�����</strong></div>
  <div class="main_center_article" id="web_main">
	  <form action="?action=delallcss" method="post" name="form">
	    <div class="maintable">
<div class="main_form"  style=" background:#e8f1f6">
  <div class="main_form_news_l"><strong>ģ�����</strong>  <%=defaultTemplate%>/css�ļ���</div>
</div>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#a9c5d0">
  <tr bgcolor="#DDEFF9" align="center">
    <td width="6%">���</td>
    <td width="30%">�ļ�����</td>
    <td width="13%">��С</td>
    <td width="12%">����</td>
    <td width="19%">�޸�����</td>
    <td width="14%">����</td>
    <td width="6%">ѡ��</td>
  </tr>
<%cssFileList
Sub cssFileList
	dim path,fileListArray,i,fileAttr,folderListArray,folderAttr,parentPath
	path = "/"&sitePath&"Templates/"&defaultTemplate&"/css"	
	if not isExistFolder(path) then createFolder path,"folderdir"
	if not isnul(getForm("dirpath","get")) then
		path=getForm("dirpath","get")
		parentPath=Mid(getForm("dirpath","get"),1,InstrRev(getForm("dirpath","get"),"/")-1)
	end if
	
	if not instr(path,"css")>0 then	
		echo "<tr bgcolor=""#FFFFFF"" align=""center""><td colspan=""7"" algin=""center"">�����޷���ЩĿ¼,<a href=""javascript:history.go(-1)"" class=""txt_C1"">����</a></td></tr>"
		response.end
	end if
	
	if not isExistFolder(path) then	
		echo "<tr bgcolor=""#FFFFFF"" align=""center""><td colspan=""7"" algin=""center"">û�����Ŀ¼,<a href=""javascript:history.go(-1)"" class=""txt_C1"">����</a></td></tr>"
		response.end
	end if

	fileListArray= getFileList(path)
	if instr(fileListArray(0),",")>0 then	
		for  i = 0 to ubound(fileListArray)
			fileAttr=split(fileListArray(i),",")
			echo"<tr bgcolor=""#FFFFFF"" align=""center"">"&vbcrlf& _
			"<td>"&i+1&"</td>"&vbcrlf& _
			"<td><a target=""_blank"" href="""&fileAttr(4)&""">"&fileAttr(0)&"</a></td>"&vbcrlf& _
			"<td>"&fileAttr(2)&"</td>"&vbcrlf& _
			"<td>"&fileAttr(1)&"</td>"&vbcrlf& _
			"<td>"&fileAttr(3)&"</td>"&vbcrlf& _
			"<td><a href=""AspCms_CssEdit.asp?cssname="&fileAttr(0)&""" class=""txt_C1"" >�༭</a> | <a href=""?action=delallcss&cssname="&fileAttr(0)&""" class=""txt_C1"" onClick=""return confirm('ȷ��Ҫɾ����')"">ɾ��</a></td>"&vbcrlf& _
			"<td><input type=""checkbox"" name=""cssname"" value="""&fileAttr(0)&""" class=""checkbox"" /></td>"&vbcrlf& _
			"</tr>"&vbcrlf
		next		
	end if
	
	if not instr(fileListArray(0),",")>0 then
		echo "<tr bgcolor=""#FFFFFF"" align=""center""><td colspan=""7"" algin=""center"">���ļ���,<a href=""javascript:history.go(-1)"" class=""txt_C1"">����</a></td></tr>"
	else
		echo"<tr bgcolor=""#FFFFFF"" align=""right"" height=""30"">"&vbcrlf& _
		"<td colspan=""7""><a href=""javascript:location.href='AspCms_CssAdd.asp'""  class=""txt_C1"">�½�ģ��<a/> <input type=""submit"" value=""����ɾ��"" onClick=""if(confirm('ȷ��Ҫɾ����')){return true;}else{return false}"" class=""btn""  />ȫѡ<input type=""checkbox"" name=""chkall"" id=""chkall"" class=""checkbox"" onClick=""checkAll(this.checked,'input','cssname')"" />��ѡ<input type=""checkbox"" name=""chkothers"" id=""chkothers"" class=""checkbox"" onClick=""checkOthers('input','cssname')"" />&nbsp;&nbsp;</td></tr>"
	end if
End Sub


%>
</table>

		</div>
        <div class="main_form" style=" background:#e8f1f6"	>
	  	  <div class="main_form_news_l"><strong> </strong></div>
  	    </div>
	  </form>
</div>
</body>
</html>
