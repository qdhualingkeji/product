<!--#include file="../inc/AspCms_MainClass.asp" -->
<%
'commentList
'Sub commentList
'	Dim rsObj,NewsId 
'	NewsID=filterPara(getForm("id","get"))
'	set rsObj=conn.Exec("select * from Aspcms_Comments where newsID="&NewsID,"r1")	
'	do while not rsObj.eof		 
'		echo"document.write('<div class=""clistbox"">');" &vbcrlf& _
'		"document.write('<div class=""line1""><span>发表于："&rsObj("AddTime")&"</span> 评论者："&rsObj("Commentator")&" IP："&rsObj("CommentIP")&" </div>');" &vbcrlf& _
'		"document.write('<div class=""line2"">"&rsObj("CommentContent")&"</div>');" &vbcrlf& _
'		"document.write('</div>');" &vbcrlf		 
'		rsObj.moveNext
'	loop
'	rsObj.close()
'	set rsObj=nothing
'End Sub

%>
function $(obj){return document.getElementById(obj);}
var xmlHttp;
function cxhr()
{
	if (window.ActiveXObject)
	{
		xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");		
	}
	else if (window.XMLHttpRequest)
	{
		xmlHttp=new XMLHttpRequest();		
	}	
    
}
function pager(id,page)
{
	$("commentlist").innerHTML="Loading..."
	cxhr();
	var url="/<%=sitePath%>plug/commentList.asp?id="+id+"&page="+page
	xmlHttp.open("POST",url,true);
	xmlHttp.onreadystatechange=hsc;
	xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;");
	xmlHttp.send(null);
}

function hsc()
{

	if(xmlHttp.readyState==4)
	{	
		if (xmlHttp.status==200)
		{
        
			$("commentlist").innerHTML=xmlHttp.responseText;
		}
	}
}

pager(<%=filterPara(getForm("id","get"))%>,1)