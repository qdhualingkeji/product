<%
CheckAdmin()
'�������ID�������ؼ��ʣ�ҳ��������
Dim SortID,keyword,page,order,pic,ID

SortID =getForm("sort","get")	
keyword=getForm("keyword","post")
if isnul(keyword) then keyword=getForm("keyword","get")
page=getForm("page","get")
order=getForm("order","get")
pic=getForm("pic","get")
ID=getForm("id","get")


select case action 
	case "edit" : editFaq	
	case "del" : delFaq	
	
	case "enable" :Enable
	case "notenabled" :NotEnabled	
end select
Dim FaqID,FaqTitle,Contact,ContactWay,Content,Reply,AddTime,ReplyTime,FaqStatus,AuditStatus


Sub delFaq	
	Dim id	:	id=getForm("id","both")
	if isnul(id) then alertMsgAndGo "��ѡ��Ҫɾ��������","-1"
	SortID =getForm("sort","get")
	keyword=getForm("keyword","get")
	page=getForm("page","get")
	order=getForm("order","get")
	pic=getForm("pic","get")
	Conn.Exec "delete * from Aspcms_Faq where FaqID in("&id&")","exe"
	alertMsgAndGo "ɾ���ɹ�","?page="&page&"&order="&order&"&sort="&sortID&"&keyword="&keyword
End Sub

Sub getContent
	if not isnul(ID) then		
		Dim rs : Set rs = Conn.Exec("select * from Aspcms_Faq where FaqID="&ID,"r1")
		if not rs.eof then			
			FaqID=rs("FaqID")		
			FaqTitle=rs("FaqTitle")		
			Contact=rs("Contact")		
			ContactWay=rs("ContactWay")		
			Content=rs("Content")		
			Reply=rs("Reply")		
			AddTime=rs("AddTime")		
			FaqStatus=rs("FaqStatus")		
			AuditStatus=rs("AuditStatus")			
		end if
	else		
		alertMsgAndGo "û��������¼","-1"
	end if
End Sub

Sub editFaq
	FaqID=getForm("FaqID","post")
	FaqTitle=getForm("FaqTitle","post")
	Contact=getForm("Contact","post")
	ContactWay=getForm("ContactWay","post")
	Content=encodeHtml(getForm("Content","post"))
	Reply=getForm("Reply","post")
	AddTime=now()
	ReplyTime=now()
	FaqStatus=getCheck(getForm("FaqStatus","post"))
	AuditStatus=getCheck(getForm("AuditStatus","post"))
	if not isnul(Reply) then AuditStatus=1 else AuditStatus=0 end if 
		
	Conn.Exec"update Aspcms_Faq set FaqTitle='"&FaqTitle&"',Content='"&Content&"',Reply='"&Reply&"',ReplyTime='"&ReplyTime&"',FaqStatus="&FaqStatus&",AuditStatus="&AuditStatus&" where FaqID="&FaqID,"exe"	
	alertMsgAndGo "�޸ĳɹ�","AspCms_Message.asp?page="&page&"&order="&order&"&sort="&sortID&"&keyword="&keyword
End Sub

Sub FaqList	
	dim datalistObj,rsArray
	dim m,i,orderStr,whereStr,sqlStr,rsObj,allPage,allRecordset,numPerPage,searchStr
	numPerPage=10
	orderStr= " order by FaqID desc"
	if isNul(page) then page=1 else page=clng(page)
	if page=0 then page=1
	whereStr=" where 1=1 "
	if not isNul(SortID) then  whereStr=whereStr
	if not isNul(keyword) then 
		whereStr = whereStr&" and (FaqTitle like '%"&keyword&"%' or Content like '%"&keyword&"%')"
	end if
	sqlStr = "select FaqID,Contact,FaqTitle,AddTime,FaqStatus,AuditStatus,ContactWay,Content,Reply,ReplyTime from Aspcms_Faq "&whereStr&orderStr
	
	set rsObj = conn.Exec(sqlStr,"r1")
	rsObj.pagesize = numPerPage
	allRecordset = rsObj.recordcount : allPage= rsObj.pagecount
	if page>allPage then page=allPage
	if allRecordset=0 then
		if not isNul(keyword) then
		    echo "<tr bgcolor=""#FFFFFF"" align=""center""><td colspan='8'>�ؼ��� <font color=red>"""&keyword&"""</font> û�м�¼</td></tr>" 
		else
		    echo "<tr bgcolor=""#FFFFFF"" align=""center""><td colspan='8'>��û�м�¼!</td></tr>"
		end if
	else  
		rsObj.absolutepage = page
		for i = 1 to numPerPage	
			 echo"<tr bgcolor=""#FFFFFF"" align=""center"">"&vbcrlf& _
				"<td>"&rsObj(0)&"</td>"&vbcrlf& _
				"<td>"&rsObj(1)&"</td>"&vbcrlf& _
				"<td>"&rsObj(2)&"</td>"&vbcrlf& _
				"<td>"&rsObj(3)&"</td>"&vbcrlf& _
				"<td>"&getStr(rsObj(4),"<a href=""?action=notenabled&id="&rsObj(0)&"&page="&page&"&order="&order&"&sort="&sortID&"&keyword="&keyword&""" class=""txt_C1"">����</a>","<a href=""?action=enable&id="&rsObj(0)&"&page="&page&"&order="&order&"&sort="&sortID&"&keyword="&keyword&""" class=""txt_C4"">������</a>")&"</td>"&vbcrlf& _
				"<td>"&getStr(rsObj(5),"�ѻظ�","δ�ظ�")&"</td>"&vbcrlf& _
				"<td><a href=""AspCms_MessageEdit.asp?id="&rsObj(0)&"&page="&page&"&order="&order&"&sort="&sortID&"&keyword="&keyword&""" class=""txt_C1"">�ظ�</a> | <a href=""?action=del&id="&rsObj(0)&"&page="&page&"&order="&order&"&sort="&sortID&"&keyword="&keyword&""" class=""txt_C1"" onClick=""return confirm('ȷ��Ҫɾ����')"">ɾ��</a></td>"&vbcrlf& _
				"<td><input type=""checkbox"" name=""id"" value="""&rsObj(0)&""" class=""checkbox"" /></td>"&vbcrlf& _
			  "</tr>"&vbcrlf
			rsObj.movenext
			if rsObj.eof then exit for
		next
		echo"<tr bgcolor=""#FFFFFF"">"&vbcrlf& _
			"<td colspan=""4"">"&vbcrlf& _
			"<div class=""pager"" style=""padding-left:20px;"">"&vbcrlf& _
			"ҳ����"&page&"/"&allPage&"  ÿҳ"&numPerPage &" �ܼ�¼��"&allRecordset&"�� <a href=""?page=1&order="&order&"&sort="&sortID&"&keyword="&keyword&""">��ҳ</a> <a href=""?page="&(page-1)&"&order="&order&"&sort="&sortID&"&keyword="&keyword&""">��һҳ</a> "&vbcrlf
		dim pageNumber
		pageNumber=makePageNumber_(page, 10, allPage, "newslist","")
		echo pageNumber
		echo"<a href=""?page="&(page+1)&"&order="&order&"&sort="&sortID&"&keyword="&keyword&""">��һҳ</a> <a href=""?page="&allPage&"&order="&order&"&sort="&sortID&"&keyword="&keyword&""">βҳ</a>"&vbcrlf& _
			"</div>"&vbcrlf& _
			"</td>"&vbcrlf& _
			"<td colspan=""4"" style=""padding-left:20px;"" >"&vbcrlf& _
		"ȫѡ<input type=""checkbox"" name=""chkall"" id=""chkall"" class=""checkbox"" onClick=""checkAll(this.checked,'input','id')"" />��ѡ<input type=""checkbox"" name=""chkothers"" id=""chkothers"" class=""checkbox"" onClick=""checkOthers('input','id')"" />"&vbcrlf& _
		"<input type=""submit"" value=""����ɾ��"" onclick=""if(confirm('ȷ��Ҫɾ����')){form.action='?action=del&pic="&pic&"&page="&page&"&order="&order&"&sort="&sortID&"&keyword="&keyword&"';}else{return false}"" class=""btn"" /> "&vbcrlf& _
		"</td>"&vbcrlf& _
		"</tr>"&vbcrlf
	end if
	rsObj.close : set rsObj = nothing	
End Sub

Sub NotEnabled	
	SortID =getForm("sort","get")
	keyword=getForm("keyword","get")
	page=getForm("page","get")
	order=getForm("order","get")
	Dim id				:	id=getForm("ID","get")
	Conn.Exec"update Aspcms_Faq set FaqStatus=0 Where FaqID="&id,"exe"
	response.Redirect getPageName()&"?page="&page&"&order="&order&"&sort="&sortID&"&keyword="&keyword	
End Sub

Sub Enable
	SortID =getForm("sort","get")
	keyword=getForm("keyword","get")
	page=getForm("page","get")
	order=getForm("order","get")

	Dim id				:	id=getForm("ID","get")
	Conn.Exec"update Aspcms_Faq set FaqStatus=1 Where FaqID="&id,"exe"
	response.Redirect getPageName()&"?page="&page&"&order="&order&"&sort="&sortID&"&keyword="&keyword
End Sub

%>