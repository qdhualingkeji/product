<!--#include file="../inc/AspCms_MainClass.asp" -->
<%
commentList
Sub commentList

	Response.Buffer=True
	Response.ContentType="text/html;charset=gb2312"
	Dim rsObj,NewsId,page,pCount,pSize,i,pagerStr,pPage,nPage,numPage
	pSize=5		'������ʾ��
	numPage=5	'��ʾҳ����
	NewsID=filterPara(getForm("id","get"))
	page=filterPara(getForm("page","get"))
	
	dim sql
	if SwitchCommentsStatus=0 then
		sql="select * from Aspcms_Comments where newsID="&NewsID
	else
		sql="select * from Aspcms_Comments where CommentStatus and newsID="&NewsID	
	end if
	set rsObj=conn.Exec(sql,"r1")	
	if not rsObj.eof then
		rsObj.pageSize=pSize
		pCount=rsObj.pageCount
		if isNul(page) or not isnum(page) or page<1 then page=1 else page=clng(page)
		if page>pCount then page=pCount
		rsObj.absolutepage = page
		for i = 1 to pSize		 
			echo"<div class=""clistbox"">" &vbcrlf& _
			"<div class=""line1""><span>�����ڣ�"&rsObj("AddTime")&"</span> �����ߣ�"&rsObj("Commentator")&" IP��"&ipHide(rsObj("CommentIP"))&" </div>" &vbcrlf& _
			"<div class=""line2"">"&rsObj("CommentContent")&"</div>" &vbcrlf& _
			"</div>" &vbcrlf		 
			rsObj.moveNext
			if rsObj.eof then exit for
		next
		
		pagerStr=makePageNumber(page, numPage, pCount, "commentlist",NewsID)		
		if page>1 then pPage=page-1 else pPage=1
		if page=pCount then nPage=page else nPage=page+1
		
		echo "<div id=""commentPage"">"&"<a class=""ppage"" href=""javascript:pager("&NewsID&",1)"">��ҳ</a><a class=""ppage"" href=""javascript:pager("&NewsID&","&pPage&")"">��һҳ</a>"
		echo pagerStr
		echo "<a class=""npage"" href=""javascript:pager("&NewsID&","&nPage&")"">��һҳ</a>"&"<a class=""npage"" href=""javascript:pager("&NewsID&","&pCount&")"">ĩҳ</a>"&"</div>"
	else
		echo "��û�����ۣ�"
	end if
	rsObj.close()
	set rsObj=nothing
End Sub



%>