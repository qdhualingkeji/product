<%
'数据库库
Class MainClass_DB
	public dbConn,dbRs,isConnect,fetchCount
	private connStr,vqueryCount,vdbType
	private errid,errdes

	Private Sub Class_Initialize
		isConnect=false
		vqueryCount=0
		fetchCount=0
	End Sub
	
	Public Property Get queryCount
		queryCount=vqueryCount
	End Property

	Public Property Let dbType(byval pType)
		if pType="sql" then vdbType=pType  else vdbType="acc"
	End Property

	Private Sub getConnStr()
		if vdbType="sql" then
			connStr="Provider=Sqloledb;Data Source="&databaseServer&";Initial Catalog="&databaseName&";User ID="&databaseUser&";Password="&databasePwd&";"
		elseif vdbType="acc" then
			connStr="Provider=Microsoft.Jet.OLEdb.4.0;Data Source="&server.mappath("/"&sitePath&accessFilePath)
		end if
	End Sub

	Public Sub connect()
		getConnStr
		if isObject(dbConn)=false or isConnect=false then
			On Error Resume Next
			set dbConn=server.CreateObject(CONN_OBJ_NAME)
			dbConn.open connStr
			isConnect=true
			if Err then errid=Err.number:errdes=Err.description:Err.Clear:dbConn.close:set dbConn=nothing:isConnect=false:echoErr err_dbconect,errid,errdes
		end if
	End Sub

	Function Exec(byval sqlStr,byval sqlType)
'	die sqlStr
		if not isConnect=true then connect
		On Error Resume Next
				if err then die "请联系管理员"
		select case sqlType
			case "exe"
				err.clear
				set Exec=dbConn.execute(sqlStr)
			case "r1"
				set Exec=server.CreateObject(RECORDSET_OBJ_NAME)
				Exec.open sqlStr,dbConn,1,1
			case "r3"
				set Exec=server.CreateObject(RECORDSET_OBJ_NAME)
				Exec.open sqlStr,dbConn,3,3
			case "arr"
				set dbRs=server.CreateObject(RECORDSET_OBJ_NAME)
				dbRs.open sqlStr,dbConn,1,1				
				if not dbRs.eof then
					if fetchCount=0 then  Exec=dbRs.getRows() else Exec=dbRs.getRows(fetchCount)
				end if
				dbRs.close:set dbRs=nothing
		end select
		vqueryCount=vqueryCount+1		
				if err then die err&"数据库操作错误！<br/>"
		if Err then
			errid=Err.number:errdes=Err.description:Err.Clear:dbConn.close:set dbConn=nothing:isConnect=false
			echoErr err_rsopen,errid,errdes
		end if
	End Function

	Public Sub Class_Terminate()
		if isObject(dbRs) then set dbRs=nothing
		if isConnect then dbConn.close:set dbConn=nothing:isConnect=false
	End Sub
End Class

Class MainClass_DataList
	Public primaryField,tableStr
	Public orderStr,whereStr,dataSortType,fieldsStr,dataPageSize,dataCurrentPage
	Public recordsCount,pagesCount
	private tempTableCount,sqlstr,topCount,whereStr2,whereStr3
	private m,n
	
	Public Sub Class_Initialize
		 dataSortType="desc"
	End Sub

	Public Sub Class_Terminate

	End Sub

	Public Function getDataList()
		dim order
		if isNul(dataPageSize) then dataPageSize=100 else dataPageSize=clng(dataPageSize)
		if not isNul(whereStr) then whereStr= " where "&whereStr else whereStr=""
		if isNul(tableStr) then die err_table
		if isNul(fieldsStr) then fieldsStr=" * "  else  fieldsStr=" "&fieldsStr&" "
		if not isNul(orderStr) then order=" order by "&orderStr&" "&dataSortType  else order=" "
		sqlstr="select top "&dataPageSize&fieldsStr&" from "&tableStr&" "&whereStr&order
		getDataList=conn.db(sqlstr,"array")
	End Function

	Public Function getPageList()
		dim order
		if isNul(dataPageSize) then dataPageSize=30 else dataPageSize=clng(dataPageSize)
		if not isNul(whereStr) then whereStr2=" where "&whereStr : whereStr3=" and "&whereStr else whereStr2="":whereStr3=""
		'die "select count(*) from "&tableStr&whereStr2
		recordsCount=conn.db("select count(*) from "&tableStr&whereStr2,"array")(0,0)
		m=recordsCount mod dataPageSize
		n=int(recordsCount / dataPageSize)
		if m=0 then pagesCount=n else pagesCount=n + 1  
		if isNul(primaryField) then die err_primarykey
		if isNul(tableStr) then die err_table
		if isNul(orderStr) then orderStr=primaryField
		if isNul(fieldsStr) then fieldsStr=" * "  else  fieldsStr=" "&fieldsStr&" "
		if dataCurrentPage > pagesCount   then dataCurrentPage=pagesCount
		if isNul(dataCurrentPage)  then 
			dataCurrentPage=1 
		else 
			if dataCurrentPage <= 0 then dataCurrentPage=1 else dataCurrentPage=clng(dataCurrentPage)
		end if
		order=" "&orderStr&" "&dataSortType 
		if dataSortType="desc" then
			if dataCurrentPage=1 then 
				sqlstr="select top "&dataPageSize&fieldsStr&" from "&tableStr&" "&whereStr2&" order by "&order
			else
				sqlstr="select top "&dataPageSize&fieldsStr&" from "&tableStr&" where "&primaryField&"<(select min("&primaryField&") from (select top "&(dataCurrentPage - 1) * dataPageSize&" "&primaryField&" from "&tableStr &" "&whereStr2& " order by  "&order&") as temptable)  "& whereStr3& " order by "&order
			end if
		else dataSortType="asc" 
			if dataCurrentPage=1 then 
				sqlstr="select top "&dataPageSize&fieldsStr&" from "&tableStr&" "&whereStr2&" order by "&order
			else
				sqlstr="select top "&dataPageSize&fieldsStr&" from "&tableStr&" where "&primaryField&">(select max("&primaryField&") from (select top "&(dataCurrentPage - 1) * dataPageSize &" "&primaryField&" from "&tableStr &" "& whereStr& " order by  "&order&") as temptable)  "& whereStr3& " order by "&order
			end if
		end if
		getPageList=conn.db(sqlstr,"array")
	End Function
End Class


Class MainClass_Xml
	Public xmlDocument,xmlPath,xmlDomObj,xmlstr
	Private xmlDomVer,xmlFileSavePath

	Public Sub Class_Initialize()
		xmlDomVer=getXmlDomVer()
		createXmlDomObj
	End Sub

	Public Sub Class_Terminate()
		If IsObject(xmlDomObj) Then Set xmlDomObj=Nothing
	End Sub

	Public Function getXmlDomVer()
		dim i,xmldomVersions,xmlDomVersion
		getXmlDomVer=false
		xmldomVersions=Array("Microsoft.2MLDOM","MSXML2.DOMDocument","MSXML2.DOMDocument.3.0","MSXML2.DOMDocument.4.0","MSXML2.DOMDocument.5.0")
		for i=0 to ubound(xmldomVersions)
			xmlDomVersion=xmldomVersions(i)
			if isInstallObj(xmlDomVersion) then getXmlDomVer=xmlDomVersion : Exit Function
		next
	End Function

	Private Sub createXmlDomObj
		set xmlDomObj=server.CreateObject(xmlDomVer)
		xmlDomObj.validateonparse=true 
		xmlDomObj.async=false 
	End Sub

	Public Function load(Byval xml,Byval xmlType)
		dim xmlUrl,xmlfilePath
		select case xmlType 
			case "xmlfile"
				xmlfilePath=server.mappath(xml)   
		 		xmlDomObj.load(xmlfilePath)   
			case "xmldocument"
				xmlUrl=xml
				xmlstr=getRemoteContent(xmlUrl,"text")
				If left(xmlstr, 5) <> "<?xml" then die err_xml else xmlDomObj.loadXML(xmlstr)
			case "transfer"
				xmlUrl=xml
				xmlstr=bytesToStr(getRemoteContent(xmlUrl,"body"),"gbk")
				If left(xmlstr, 5) <> "<?xml" then die err_xml else xmlDomObj.loadXML(xmlstr)
		end select
	End Function

	Public Function isExistNode(nodename)
        dim node
        isExistNode=True
        set node=xmlDomObj.getElementsByTagName(nodename)
        If node.Length=0 Then isExistNode=False : set node=nothing
    End Function

	Public Function getNodeValue(nodename, itemId)
		if isNul(itemId) then  itemId=0
		getNodeValue=xmlDomObj.getElementsByTagName(nodename).Item(itemId).Text
	End Function

	Public Function getNodeLen(nodename)
		getNodeLen=xmlDomObj.getElementsByTagName(nodename).Length
	End Function
	
	Public Function getNodes(nodename)
		Set getNodes=xmlDomObj.getElementsByTagName(nodename)
	End Function
	
	Public Function getNode(nodename, itemId)
		Set getNode=xmlDomObj.getElementsByTagName(nodename).Item(itemId)
	End Function

	Public Function getAttributes(nodeName, attrName, itemId)
	dim xmlAttributes, i
		if isNul(itemId) then  itemId=0
		err.clear:on error resume next
		getAttributes=xmlDomObj.getElementsByTagName(nodeName).Item(itemId).getAttributeNode(attrName).nodevalue
		if err then getAttributes="":err.clear
	End Function

	Public Function getAttributesByNode(node, attrName)
		err.clear:on error resume next
		getAttributesByNode=node.getAttributeNode(attrName).nodevalue
		if err then getAttributesByNode="":err.clear
	End Function

	Public Function setXmlNodeValue(Byval nodename, Byval itemId, Byval str,Byval savePath)
	dim node
		xmlFileSavePath=savePath
		Set node=xmlDomObj.getElementsByTagName(nodename).Item(itemId)
		node.childNodes(0).text=str
		xmlDomObj.save Server.MapPath(xmlFileSavePath)
		set node=nothing
	End Function
End Class
%>