<%
CheckAdmin()

Select Case action
	Case "editcompany" 	 : Call EditCompany()
	Case "editcopyright" : Call EditCopyRight()
	Case "editseo"		 : Call EditSeo()
	Case "editad"		 : Call EditAD()
	Case "editservice"	 : Call EditService()
	Case "baidu" 		 : Call makeBaidu
	Case "google" 		 : Call makeGoogle
	Case "rss" 		 	 : Call makeRss
	Case "sitemap" 		 : Call makeSiteMap
End Select 

Dim  flag : flag=0

Sub EditCompany
'die "AA"&getForm("statisticalCode","post")
	Dim Str
	Str="'企业信息"&vbcrlf& _
	"Const siteTitle="""&getForm("siteTitle","post")&"""	'首页标题"&vbcrlf& _
	"Const siteLogoUrl="""&getForm("siteLogoUrl","post")&"""	'LOGO图片URL"&vbcrlf& _
	"Const siteUrl="""&getForm("siteUrl","post")&"""  '站点网址"&vbcrlf& _
	"Const companyName="""&getForm("companyName","post")&"""  '企业名称"&vbcrlf& _
	"Const companyAddress="""&getForm("companyAddress","post")&"""  '企业地址"&vbcrlf& _
	"Const companyPostCode="""&getForm("companyPostCode","post")&"""  '邮政编码"&vbcrlf& _
	"Const companyContact="""&getForm("companyContact","post")&"""  '联系人"&vbcrlf& _
	"Const companyPhone="""&getForm("companyPhone","post")&"""  '电话号码"&vbcrlf& _
	"Const companyMobile="""&getForm("companyMobile","post")&"""  '手机号码"&vbcrlf& _
	"Const companyFax="""&getForm("companyFax","post")&"""  '公司传真"&vbcrlf& _
	"Const companyEmail="""&getForm("companyEmail","post")&"""  '电子邮箱"&vbcrlf& _
	"Const statisticalCode ="""&replaceStr(encode(getForm("statisticalCode","post")),"""","""""")&"""	'统计代码"&vbcrlf& _
	"Const companyICP="""&getForm("companyICP","post")&"""	'备案号"&vbcrlf
'die Str
	createTextFile "<"&"%"&vbcrlf&Str&vbcrlf&"%"&">","../../config/AspCms_CompanyConfig.asp",""
	editCommentConfig
	alertMsgAndGo "网站信息设置成功","AspCms_CompanySetting.asp" 
End Sub

Sub editCommentConfig
	dim templateobj,configPath,configStr
	configPath="../../config/AspCms_Config.asp"
	set templateobj = mainClassObj.createObject("MainClass.template")
	configStr=loadFile(configPath)
	configStr=templateobj.regExpReplace(configStr,"Const SwitchComments=(\d{1})","Const SwitchComments="&getForm("SwitchComments","post"))
	configStr=templateobj.regExpReplace(configStr,"Const SwitchCommentsStatus=(\d{1})","Const SwitchCommentsStatus="&getForm("SwitchCommentsStatus","post"))
	configStr=templateobj.regExpReplace(configStr,"Const SwitchFaqStatus=(\d{1})","Const SwitchFaqStatus="&getForm("SwitchFaqStatus","post"))
	set templateobj=nothing
	
	createTextFile configStr,configPath,""
End Sub

Sub EditCopyRight
	Dim Str
	Str="'版权设置"&vbcrlf& _
	"Const copyRight="""&replaceStr(encode(getForm("copyRight","post")),"""","""""")&"""	'版权"
	createTextFile "<"&"%"&vbcrlf&Str&vbcrlf&"%"&">","../../config/AspCms_CopyRightConfig.asp",""
	response.Redirect("AspCms_CopyRight.asp")
End Sub

Sub EditSeo
	if runMode=1 and getForm("runMode","post")<>1 then DelAllHtml
	Dim Str
	Str="'全局优化设置"&vbcrlf& _
	"Const runMode="&getForm("runMode","post")&"	'网站运行模式（0为动态，1为静态）"&vbcrlf& _
	"Const additionTitle="""&getForm("additionTitle","post")&"""	'网页附加标题"&vbcrlf& _
	"Const siteKeyWords="""&getForm("siteKeyWords","post")&"""	'站点关键词"&vbcrlf& _
	"Const siteDesc="""&replaceStr(encode(getForm("siteDesc","post")),"""","""""")&"""	'站点描述"&vbcrlf	

	createTextFile "<"&"%"&vbcrlf&Str&vbcrlf&"%"&">","../../config/AspCms_SeoConfig.asp",""
	alertMsgAndGo "全局优化设置成功","AspCms_SeoSetting.asp" 
End Sub

Sub EditAD
	Dim Str
	Str="'浮动广告"&vbcrlf& _
	"Const adStatus="""&getForm("adStatus","post")&"""	'广告显示状态"&vbcrlf& _
	"Const adImagePath="""&getForm("adImagePath","post")&"""	'图片地址"&vbcrlf& _
	"Const adLink="""&getForm("adLink","post")&"""	'链接地址"&vbcrlf& _
	"Const adImgWidth="""&getForm("adImgWidth","post")&"""	'图片宽度"&vbcrlf& _
	"Const adImgHeight="""&getForm("adImgHeight","post")&"""	'图片高度"&vbcrlf
	createTextFile "<"&"%"&vbcrlf&Str&vbcrlf&"%"&">","../../config/AspCms_ADConfig.asp",""
	alertMsgAndGo "浮动广告设置成功","AspCms_ADSetting.asp" 
End Sub

Sub EditService
	Dim Str
	Str="'在线客服"&vbcrlf& _
	"Const serviceStatus="&getForm("serviceStatus","post")&"	'在线客服显示状态"&vbcrlf& _
	"Const serviceStyle="&getForm("serviceStyle","post")&"	'样式"&vbcrlf& _
	"Const serviceLocation="""&getForm("serviceLocation","post")&"""	'显示位置"&vbcrlf& _
	"Const serviceQQ="""&getForm("serviceQQ","post")&"""'QQ"&vbcrlf& _
	"Const serviceEmail="""&getForm("serviceEmail","post")&"""	'邮箱"&vbcrlf& _
	"Const serviceWangWang="""&getForm("serviceWangWang","post")&"""	'旺旺"&vbcrlf& _
	"Const servicePhone="""&getForm("servicePhone","post")&"""	'电话"&vbcrlf& _
	"Const serviceContact="""&getForm("serviceContact","post")&"""	'联系方式链接"&vbcrlf& _
	"Const servicekfStatus="&getForm("servicekfStatus","post")&"	'53KF显示状态"&vbcrlf& _
	"Const servicekf="""&replaceStr(encode(getForm("servicekf","post")),"""","""""")&"""	'53KF"&vbcrlf
	createTextFile "<"&"%"&vbcrlf&Str&vbcrlf&"%"&">","../../config/AspCms_OnlineServiceConfig.asp",""
	alertMsgAndGo "在线客服设置成功","AspCms_OnlineService.asp" 
End Sub


Sub makeBaidu
	Dim makenum
	if isNul(makenum) then makenum=100 else makenum=clng(makenum)
	allmakenum=getForm("allmakenum","get") : if isNul(allmakenum) then allmakenum=500 else allmakenum=clng(allmakenum)
	dim vDes,vName,i,j,rsObj,baiduStr,allmakenum,pagenum,xmlUrl,dt : set rsObj=conn.Exec("select top "&allmakenum&" NewsID,Title,ImagePath,Author,NewsTag,Aspcms_News.AddTime,Aspcms_News.SortID,SortStyle from Aspcms_News,Aspcms_NewsSort where NewsStatus and Aspcms_News.SortID=Aspcms_NewsSort.SortID order by Aspcms_News.addtime desc","r1")
	rsObj.pagesize=makenum
	pagenum=rsObj.pagecount
	for i=1 to pagenum
		rsObj.absolutepage=i
		baiduStr =  "<?xml version=""1.0"" encoding=""utf-8"" ?>"&vbcrlf&_
						"<document>"&vbcrlf&_
						"<webSite>http://"&siteUrl&"</webSite>"&vbcrlf&_
						"<webMaster>"&siteTitle&"</webMaster>"&vbcrlf&_
						"<updatePeri>1800</updatePeri>"&vbcrlf
		for j=1 to rsObj.pagesize
			vDes=rsObj("NewsTag") : if isNul(vDes) then vDes=""
			vName=rsObj("Title") : if isNul(vName) then vName=""
			Dim link
			if rsObj("SortStyle")=2 then
				link="http://"&siteUrl&"/"&sitePath&Dir(rsObj("SortStyle"))&"/"&runstr&rsObj("SortID")&FileExt
			else
				link="http://"&siteUrl&"/"&sitePath&Dir(rsObj("SortStyle"))&"/"&runstr&rsObj("SortID")&"_"&rsObj("NewsID")&FileExt			
			end if			
			baiduStr = baiduStr & "<item>"&vbcrlf&_
								  "<title>"&server.htmlencode(vName)&"</title>"&vbcrlf&_
								  "<link>"&link&"</link>"&vbcrlf&_  
								  "<text>"&server.htmlencode(filterStr(left(vDes, 300),"html"))&"</text>"&vbcrlf
			If left(rsObj("ImagePath"), 7) = "http://"  Then
				baiduStr = baiduStr & "<image>"&rsObj("ImagePath")&"</image>"&vbcrlf
			Else
				baiduStr = baiduStr & "<image>http://"&siteUrl&"/"&sitePath&rsObj("ImagePath")&"</image>"&vbcrlf
			End If
			dt=rsObj("AddTime")
			baiduStr = baiduStr & "<keywords>"&rsObj("Title")&","&rsObj("Author")&"</keywords>"&vbcrlf&_
								  "<author>"&siteTitle&"</author>"&vbcrlf&_
								  "<source>"&siteTitle&"</source>"&vbcrlf&_
								  "<pubDate>"&formatDate(dt,1)&"</pubDate>"&vbcrlf&_
								  "</item>"&vbcrlf
			rsObj.movenext
			if rsObj.eof then exit for
		next
		baiduStr = baiduStr + "</document>"&vbcrlf
		if i=1 then xmlUrl="" else xmlUrl="_"&i
		createTextFile baiduStr,"/"&sitePath&"baidu"&xmlUrl&".xml","utf-8"
		echo "http://"&siteUrl&"/"&sitePath&"baidu"&xmlUrl&".xml"&" 生成完毕 <a target='_blank' href='/"&sitePath&"baidu"&xmlUrl&".xml'><font color=red>浏览</font></a><br>"
	next
	rsObj.close : set rsObj=nothing : echo "生成完毕"
	echo  "请通过<a href='http://news.baidu.com/newsop.html' target='_blank'>http://news.baidu.com/newsop.html</a>提交!"		
	die"<br><a href=""javascript:history.go(-1)"">返回</a>！"
End Sub

Sub makeGoogle
		Dim makenum
		if isNul(makenum) then makenum=100 else makenum=clng(makenum)
		allmakenum=getForm("allmakenum","get") : if isNul(allmakenum) then allmakenum=500 else allmakenum=clng(allmakenum)
		dim i,j,rsObj,googleStr,allmakenum,pagenum,xmlUrl,googleDateArray,googleDate :  set rsObj=conn.Exec("select top "&allmakenum&" NewsID,Title,ImagePath,Author,NewsTag,Aspcms_News.AddTime,Aspcms_News.SortID,SortStyle from Aspcms_News,Aspcms_NewsSort where NewsStatus and Aspcms_News.SortID=Aspcms_NewsSort.SortID order by Aspcms_News.addtime desc","r1")
		rsObj.pagesize=makenum
		pagenum=rsObj.pagecount
		for i=1 to pagenum
			rsObj.absolutepage=i
			Dim link	
			googleStr =  "<?xml version=""1.0"" encoding=""UTF-8""?>"&vbcrlf&_
							"<urlset xmlns=""http://www.google.com/schemas/sitemap/0.84"">"&vbcrlf&_
							"<url>"&vbcrlf&_
							"<loc>http://"&siteUrl&"</loc>"&vbcrlf&_
							"</url>"&vbcrlf
			for j=1 to rsObj.pagesize
					googleDateArray=rsObj("AddTime")
					googleDate=formatDate(googleDateArray,1)
					
			if rsObj("SortStyle")=2 then
				link="http://"&siteUrl&"/"&sitePath&Dir(rsObj("SortStyle"))&"/"&runstr&rsObj("SortID")&FileExt
			else
				link="http://"&siteUrl&"/"&sitePath&Dir(rsObj("SortStyle"))&"/"&runstr&rsObj("SortID")&"_"&rsObj("NewsID")&FileExt			
			end if		
					googleStr = googleStr & "<url>"&vbcrlf&_
										  "<loc>"&link&"</loc>"&vbcrlf&_
										  "<lastmod>"&googleDate&"</lastmod>"&vbcrlf&_
										  "</url>"&vbcrlf
					rsObj.movenext
					if rsObj.eof then exit for
			next
			googleStr = googleStr + "</urlset>"&vbcrlf
			if i=1 then xmlUrl="" else xmlUrl="_"&i
			createTextFile googleStr,"/"&sitePath&"google"&xmlUrl&".xml","utf-8"			
			echo "http://"&siteUrl&"/"&sitePath&"google"&xmlUrl&".xml"&" 生成完毕 <a target='_blank' href='/"&sitePath&"google"&xmlUrl&".xml'><font color=red>浏览</font></a><br>"
		next
		rsObj.close : set rsObj=nothing : echo "生成完毕"
		echo  "请通过<a href='http://www.google.com/webmasters/tools/' target='_blank'>http://www.google.com/webmasters/tools/</a>提交!"
		die"<br><a href=""javascript:history.go(-1)"">返回</a>！"
End Sub


Sub makeSiteMap	
	dim templateobj,templatePath : set templateobj = mainClassobj.createObject("MainClass.template")	
	templatePath="/"&sitePath&"templates/"&defaultTemplate&"/"&htmlFilePath&"/sitemap.html"	
	if not CheckTemplateFile("sitemap.html") then echo "sitemap.html"&"模板文件不存在！"
	with templateObj 
		.content=loadFile(templatePath) 
		.parseHtml()		
		.parseCommon		
		createTextFile .content ,"/"&sitePath&"sitemap.html",""
	end with
	set templateobj =nothing : terminateAllObjects
	alertMsgAndGo "SiteMap生成成功!","-1" 
End Sub

Sub makeRssMap	
	dim templateobj,templatePath : set templateobj = mainClassobj.createObject("MainClass.template")	
	templatePath="/"&sitePath&"templates/"&defaultTemplate&"/"&htmlFilePath&"/rssmap.html"	
	if not CheckTemplateFile("rssmap.html") then echo "rssmap.html"&"模板文件不存在！"
	with templateObj 
		.content=loadFile(templatePath) 
		.parseHtml()	
		.parseRssList("")	
		.parseCommon		
		createTextFile .content ,"/"&sitePath&"rssmap.html",""
	end with
	set templateobj =nothing : terminateAllObjects
End Sub



Sub makeRss
	Dim rssStr,rssStr1,rssStr2,rssStr3,sortid
	Dim rs	
	dim templateobj,templatePath : set templateobj = mainClassobj.createObject("MainClass.template")	
	set rs=conn.exec("select SortID,SortName,SortURL,SortStyle,SortFolder,PageKey,PageDesc from Aspcms_NewsSort","r1")
	do while not rs.eof
		rssStr1="<?xml version=""1.0"" encoding=""gb2312"" ?>"&vbcrlf&_
		"<rss version=""2.0"">"&vbcrlf&_
		"<channel>"&vbcrlf&_
		"<title><![CDATA["&rs("SortName")&"_"&siteTitle&"]]></title>"&vbcrlf&_
		"<link>http://"&siteUrl&"</link>"&vbcrlf&_
		"<description><![CDATA["&siteDesc&"]]></description>"&vbcrlf&_
		"<language>zh-cn</language>"&vbcrlf&_
		"<generator><![CDATA[Rss Powered By "&siteUrl&"]]></generator>"&vbcrlf&_
		"<webmaster>"&companyEmail&"</webmaster>"&vbcrlf
		rssStr3="</channel>"&vbcrlf&_
		"</rss>"&vbcrlf

		Dim rsObj,sql
		rssStr2=""
		if rs("SortStyle")=2 then 
			sql="select Top 100 NewsID,Title,TitleColor,ImagePath,Content,IsOutLink,Visits,AddTime,SortID,OutLink,IsTop,isrecommend,(SELECT SortFolder FROM Aspcms_NewsSort WHERE SortID=Aspcms_News.SortID),Author,GradeID from Aspcms_News where SortID in ("&GetSmallestChild("Aspcms_NewsSort",rs("SortID"))&") order by AddTime desc"	
		else
			sql="select Top 100 NewsID,Title,TitleColor,ImagePath,Content,IsOutLink,Visits,AddTime,SortID,OutLink,IsTop,isrecommend,(SELECT SortFolder FROM Aspcms_NewsSort WHERE SortID=Aspcms_News.SortID),Author,GradeID from Aspcms_News where NewsStatus and SortID in ("&GetSmallestChild("Aspcms_NewsSort",rs("SortID"))&") order by AddTime desc"
		end if

		set rsObj=conn.Exec(sql,"r1")
		do while not rsObj.eof
			rssStr2=rssStr2&"<item>"&vbcrlf&_
				"<title><![CDATA["&rsObj(1)&"]]></title>"&vbcrlf&_
				"<link>http://"&siteUrl&templateobj.getShowLink(rs("SortID"),rsObj("NewsID"),dir(rs("SortStyle")),rs("SortFolder"),rsObj("GradeID"))&"</link>"&vbcrlf&_
				"<description><![CDATA["&left(dropHtml(decodeHtml(rsObj("Content"))),100)&"]]></description>"&vbcrlf&_
				"<pubDate>"&formatDate(rsObj("AddTime"),1)&"</pubDate>"&vbcrlf&_
				"<category>"&rs("SortName")&"</category>"&vbcrlf&_
				"<author>"&rsObj("Author")&"</author>"&vbcrlf&_
				"<comments>"&siteTitle&"</comments>"&vbcrlf&_
			"</item>"&vbcrlf
			rsObj.movenext
		loop
		rssStr=rssStr1&rssStr2&rssStr3
		createTextFile rssStr,"/"&sitePath&"rss/"&rs("SortID")&".xml",""	
		rs.movenext
	loop
	rsObj.close : set rsObj=nothing
	rs.close : set rs=nothing
	
	set templateobj =nothing 
	makeRssMap()
	alertMsgAndGo "RSS生成成功!","-1" 
End Sub

Sub DelAllHtml
	dim styles,style
	styles=split("news,down,pic,product,about,",",")	
	if isExistFile("/"&sitePath&"index.html") then delFile "/"&sitePath&"index.html"	'删除首页	
	for each style in styles
		if style="news" or style="down" or style="pic" or style="product" then Delhtml(style&"list")	'删除列表页
		Delhtml(style)			'删除详细页				
	next	
	'删除指定的生成目录
	styles=""
	styles=conn.exec("select SortFolder from Aspcms_NewsSort where not isnull(SortFolder)","arr")
	for each style in styles
		'if not isnul(style) then echo "/"&sitePath&style&"<br>"
		'Delhtml(style)			'删除详细页			
		'echo "/"&sitePath&style&"<BR>"
		if not isnul(style) and isExistFolder("/"&sitePath&style) then Delhtml(style)		
	next
End Sub

'根据目录删除html文件
Sub Delhtml(str)
	dim fileListArray,fileAttr,i	
	'echo "/"&sitePath&str&"<BR>"
	fileListArray= getFileList("/"&sitePath&str)
	if instr(fileListArray(0),",")>0 then		
		for  i = 0 to ubound(fileListArray)
			fileAttr=split(fileListArray(i),",")	
			if GetExtend(fileAttr(0))=replace(FileExt,".","") then delFile fileAttr(4)	
		next		
	end if
End Sub
%>
