<!--#include file="../../inc/AspCms_MainClass.asp" -->
<%
CheckAdmin()
Select  case action
	case "del" : DelSort
	case "add" : AddSort
	case "move" : MoveSort
	case "save" :SaveALL
	case "enable" :Enable
	case "notEnabled" :NotEnabled

End Select
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
	  <form action="?action=del" method="post" name="form">
	  	<div class="main_form"  style=" background:#e8f1f6">
	  	  <div class="main_form_news_l"><strong>网站栏目列表</strong></div>
	  	  </div>
          <div class="maintable">
            <table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#a9c5d0">
              <tr bgcolor="#DDEFF9" align="center">
                <td width="4%">ID</td>
                <td width="8%">状态</td>
                <td width="30%">栏目名称</td>
                <td width="24%">链接</td>
                <td width="12%">类型</td>
                <td width="8%">排序</td>
                <td width="10%">基本操作</td>
                <td width="4%">选择</td>
              </tr>
              <%SortList(0)%>
            <tr bgcolor="#ffffff">
                <td colspan="8" style="line-height:30px; height:30px; padding:0px 5px;" align="right">
                全选<input type="checkbox" name="chkall" id="chkall" class="checkbox" onClick="checkAll(this.checked,'input','id')" />反选<input type="checkbox" name="chkothers" id="chkothers" class="checkbox" onClick="checkOthers('input','id')" />
               
                <input type="submit"  value=" 删除 " class="btn"  onclick="return confirm('确定要删除吗')" />
                <input type="submit"  value=" 保存 " class="btn" onclick="form.action='?action=save';" />    
                </td>
            </tr>
            </table>
		</div>
        <div class="main_form" style=" background:#e8f1f6"	>
	  	  <div class="main_form_news_l"><strong>添加栏目 </strong></div>
	  	  </div>
		<div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''"><div class="main_form_txt">顶级栏目：</div>
		<div class="main_form_input"> 
        	<%LoadSelect "ParentID","Aspcms_NewsSort","SortName","SortID","", 0,"order by SortOrder","顶级栏目"%>

		</div>
		</div>
		<div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''"><div class="main_form_txt">类型：</div>
		<div class="main_form_input"> 
		<select name="SortStyle" id="SortStyle">
        <option value="0" >文章列表</option>
        <option value="1" >图片列表</option>
        <option value="2" >单篇文章</option>
        <option value="3" >产品列表</option>
        <option value="4" >下载列表</option>
        <option value="5" >链接</option>
         </select>
		</div>
		</div>
		<div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''"><div class="main_form_txt">栏目名称：</div>
		<div class="main_form_input"> <input type="text" name="SortName" class="input_1" style="width:200px"  />
		</div>
		</div>
		<div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''"><div class="main_form_txt">链接：</div>
		<div class="main_form_input"> <input type="text" name="SortURL" style="width:200px" />
		</div>
		</div>
		<div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''"><div class="main_form_txt">排序：</div>
		<div class="main_form_input"><input type="text" name="SortOrder"  style="width:30px" value="0"/>         
		</div>
		</div>	        
        <div class="main_form" onmouseover="this.style.backgroundColor='#e8f1f6'" onmouseout="this.style.backgroundColor=''"><div class="main_form_txt">是否启用：</div>
		<div class="main_form_input"><input type="checkbox" name="SortStatus" value="1" checked="checked" />         
		</div>
		</div>
		<div class="main_form"><div class="main_form_txt"></div>
		<div class="main_form_input">
		  <input type="submit"  value=" 添 加 " class="btn" onclick="form.action='?action=add';"/>
		</div>
		</div>
	</form>
</div>
</body>
</html>
<%
Sub NotEnabled	
	Dim id				:	id=getForm("ID","get")
	Conn.Exec"update AspCms_NewsSort set SortStatus=0 Where SortID="&id,"exe"
	response.Redirect("AspCms_NewsSort.asp")	
End Sub

Sub Enable
	Dim id				:	id=getForm("ID","get")
	Conn.Exec"update AspCms_NewsSort set SortStatus=1 Where SortID="&id,"exe"
	response.Redirect("AspCms_NewsSort.asp")
End Sub

Sub SaveALL
	Dim ids				:	ids=split(getForm("SortIDs","post"),",")
	Dim SortNames		:	SortNames=split(getForm("SortNames","post"),",")
	Dim SortURLs		:	SortURLs=split(getForm("SortURLs","post"),",")
	Dim SortStyles		:	SortStyles=split(getForm("SortStyles","post"),",")
	Dim SortOrders		:	SortOrders=split(getForm("SortOrders","post"),",")
	If Ubound(ids)=-1 Then 	'防止有值为空时下标越界
		ReDim ids(0)
		ids(0)=""
	End If	
	If Ubound(SortNames)=-1 Then
		ReDim SortNames(0)
		SortNames(0)=""
	End If
	If Ubound(SortURLs)=-1 Then
		ReDim SortURLs(0)
		SortURLs(0)=""
	End If
	If Ubound(SortStyles)=-1 Then
		ReDim SortStyles(0)
		SortStyles(0)=""
	End If
	If Ubound(SortOrders)=-1 Then
		ReDim SortOrders(0)
		SortOrders(0)=0
	End If
	Dim i
	For i=0 To Ubound(ids)		
		Conn.Exec "update AspCms_NewsSort Set SortName='"&trim(SortNames(i))&"',SortURL='"&trim(SortURLs(i))&"',SortOrder='"&trim(SortOrders(i))&"',SortStyle='"&trim(SortStyles(i))&"' Where SortID="&trim(ids(i)),"exe"		
	Next
	alertMsgAndGo "保存成功","AspCms_NewsSort.asp"
End Sub	

Sub AddSort
	'Dim SortID		:	SortID=getForm("SortID","post")
	Dim ParentID	:	ParentID=getForm("ParentID","post")
	Dim SortName	:	SortName=getForm("SortName","post")
	Dim SortURL		:	SortURL=getForm("SortURL","post")
	Dim SortOrder	:	SortOrder=getForm("SortOrder","post")
	Dim SortLevel	:	SortLevel=getForm("SortLevel","post")
	
	Dim SortStyle	:	SortStyle=getForm("SortStyle","post")
	Dim PageTitle	:	PageTitle=getForm("PageTitle","post")
	Dim PageKey		:	PageKey=getForm("PageKey","post")
	Dim PageDesc	:	PageDesc=getForm("PageDesc","post")
	Dim SortStatus  :	SortStatus=getCheck(getForm("SortStatus","post"))
	
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
	Conn.Exec "insert into Aspcms_NewsSort(ParentID,SortName,SortURL,SortOrder,SortLevel,SortStyle,PageTitle,PageKey,PageDesc,AddTime,SortStatus) values('"&ParentID&"','"&SortName&"','"&SortURL&"',"&SortOrder&",'"&SortLevel&"',"&SortStyle&",'"&PageTitle&"','"&PageKey&"','"&PageDesc&"',now(),"&SortStatus&")","exe"
	editSort 0	
	alertMsgAndGo "添加栏目成功","AspCms_NewsSort.asp"
End Sub

Sub DelSort
	if isnul(getForm("id","both")) then ids=getForm("id","get")
	if isnul(getForm("id","both")) then alertMsgAndGo"请选择要删除的数据","-1"	
	Dim ids	:	ids=split(getForm("id","both"),",")
	dim id
	for each id in ids
		Dim rsObj : set rsObj=conn.Exec("select SortID,SortStyle from Aspcms_NewsSort where SortID in("&id&")","r1")	
		Dim filePath
		do while not rsObj.eof
			filePath="/"&sitePath&Dir(rsObj(1))&"/"&rsObj(0)&FileExt
			if isExistFile(filePath)then delFile filePath
			rsObj.movenext
		loop
		rsObj.close : set rsObj=nothing	
		dim sorids 
		sorids=GetSmallestChild("Aspcms_NewsSort",id)	
		'die sorids
		Conn.Exec "delete * from AspCms_News where SortID in("&sorids&")","exe"		
		Conn.Exec "delete * from AspCms_NewsSort where SortID in("&sorids&")","exe"
		Conn.Exec "delete * from AspCms_NewsSort where SortID in("&id&")","exe"
	next
	'echoMsgAndGo"删除栏目成功","3"	
	alertMsgAndGo "删除栏目成功","AspCms_NewsSort.asp"
End Sub

function SortList(ParentID)
	Dim rs :set rs =Conn.Exec ("select *,(select count(*) from AspCms_NewsSort where ParentID=t.SortID) as c from AspCms_NewsSort t where ParentID="&ParentID&" order by Sortorder,Sortorder ","r1")
	IF rs.eof or rs.bof Then
		echo "<tr bgcolor=""#ffffff"" align=""center""><td colspan=""8"">还没有记录</td></tr>"
	Else
		Do While not rs.eof 
			echo "<tr bgcolor=""#ffffff"" align=""center"">"
			echo "<td>"&rs("SortID")&"</td>"
			
			echo "<td>"&getStr(rs("SortStatus"),"<a href=""?action=notEnabled&id="&rs("SortID")&""" class=""txt_C1"">启用</a>","<a href=""?action=enable&id="&rs("SortID")&""" class=""txt_C4"">未启用</a>")&"</td>"
			echo "<td align=""left"">"&getLevel(rs("SortLevel"))&"<input name=""SortNames"" type=""text"" class=""input_1"" id=""SortNames"" value="""&rs("SortName")&""" size=""12"" maxlength=""255""  style=""width:60%""/></td>"
			echo "<td><input name=""SortUrls"" type=""text""  id=""SortUrls"" value="""&rs("SortUrl")&""" size=""18"" maxlength=""255"" style=""width:90%""/></td>"
			echo "<td>"			
			echo "<select name=""SortStyles"" id=""SortStyles"">"
			if rs("SortStyle")="0" then  
        		echo "<option value=""0"" selected >文章列表</option>"
			else				
        		echo "<option value=""0"">文章列表</option>"
			end if
			if rs("SortStyle")="1" then  
        		echo "<option value=""1"" selected >图片列表</option>"
			else				
        		echo "<option value=""1"">图片列表</option>"
			end if
			if rs("SortStyle")="2" then  
        		echo "<option value=""2"" selected >单篇文章</option>"
			else				
        		echo "<option value=""2"">单篇文章</option>"
			end if
			if rs("SortStyle")="3" then  
        		echo "<option value=""3"" selected >产品列表</option>"
			else				
        		echo "<option value=""3"">产品列表</option>"
			end if
			if rs("SortStyle")="4" then  
        		echo "<option value=""4"" selected >下载列表</option>"
			else				
        		echo "<option value=""4"">下载列表</option>"
			end if
			if rs("SortStyle")="5" then  
        		echo "<option value=""5"" selected >链接</option>"
			else				
        		echo "<option value=""5"">链接</option>"
			end if
         	echo "</select>"
			echo "</td>"
			echo "<td>"
			echo "<input name=""SortOrders"" type=""text"" class=""input_1"" id=""SortOrders"" value="""&rs("SortOrder")&""" size=""5"" maxlength=""4"" style="" text-align:center;""  style=""width:90%""/>"
			echo "</td>"
			echo "<td class=""txt_C1""><a href=""AspCms_NewsSortEdit.asp?action=edit&id="&rs("Sortid")&""" class=""txt_C1"" >编辑</a> | <a href=""?action=del&id="&rs("Sortid")&""" class=""txt_C1"" onClick=""return confirm('确定要删除吗')"">删除</a></td>"
			
			echo "<td><input type=""checkbox"" name=""id"" value="""&rs("SortID")&""" class=""checkbox"" /><input type=""hidden"" name=""SortIDs"" value="""&rs("SortID")&""" /></td>"
			echo "</tr>"				
			if rs("c")>0 then SortList(rs("SortID"))			
			rs.MoveNext
		Loop
		rs.close	:	set rs = nothing
	End If
End Function

Function editSort(sortID)	
	dim rs,prs,SortPath
	set rs=conn.exec("select * from Aspcms_NewsSort where parentID="&sortID,"r1")	
	if not rs.eof then		
		set prs=conn.exec("select * from Aspcms_NewsSort where SortID="&rs("parentID"),"r1")	
		do while not rs.eof			
			if rs("SortLevel")=1 then 
				SortPath = rs("SortID")&","
				conn.exec "update Aspcms_NewsSort set TopSortID="&rs("SortID")&",SortPath='"&SortPath&"' where SortID="&rs("SortID"),"exe"
			else
				SortPath =trim(prs("SortPath"))&rs("SortID")&","
				'echo "update Aspcms_NewsSort set TopSortID="&prs("TopSortID")&",SortPath='"&SortPath&"' where SortID="&rs("SortID")&"<br>"
				conn.exec "update Aspcms_NewsSort set TopSortID="&prs("TopSortID")&",SortPath='"&SortPath&"' where SortID="&rs("SortID"),"exe"
			end if			
			editSort rs("SortID")			
			rs.movenext
		loop		
		prs.close : set prs=nothing
	end if
	rs.close : set rs=nothing
End Function 
%>