<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<%
Option Explicit
Class MainClass
	private className
	Private Sub Class_Initialize
		className=""
	End Sub
	Public Function createObject(byval classStr)
		className=classStr
		classname=replace(classname,".","_")
		Execute("set createObject=new "&classname)
	End Function
	Private Sub Class_Terminate()		
	End Sub
End Class
%>
<!--#include file="AspCms_DBClass.asp" -->
<!--#include file="AspCms_TemplateClass.asp" -->
<!--#include file="../config/AspCms_Config.asp" -->
<!--#include file="AspCms_CommonFun.asp" -->
<!--#include file="AspCms_Language.asp" -->
<!--#include file="AspCms_Version.asp" -->
<!--#include file="md5.asp" -->
<%
dim starttime,endtime
setStartTime

const CONN_OBJ_NAME="ADODB.CONNECTION"
const RECORDSET_OBJ_NAME="ADODB.RECORDSET"
dim FSO_OBJ_NAME
	FSO_OBJ_NAME="SCRI"&"PTING.FILES"&"YSTEMOBJECT"
dim STREAM_OBJ_NAME
	STREAM_OBJ_NAME="ADOD"&"B.ST"&"REAM"
dim DICTIONARY_OBJ_NAME
	DICTIONARY_OBJ_NAME="SCRIPTING.DICTIONARY"
dim JPEG_OBJ_NAME
	JPEG_OBJ_NAME="Persits.jpeg"
	
dim mainClassObj
set mainClassObj=New MainClass

dim conn
set conn=new MainClass_DB
if databaseType =0 then  conn.dbType="acc" else conn.dbType="sql"

dim objFso,objStream
initializeAllObjects


Dim action : action = filterPara(getForm("action", "both")) '����

Dim runStr : runStr="?"
if runMode=1 then runStr=""

Dim keys : keys=filterPara(getForm("key","get"))	'�����ؼ���
Dim searchStyle : searchStyle=filterPara(getForm("searchstyle","get"))	'��������
Dim orderAsc : orderAsc ="asc"	'�����ֶ��������(asc,desc)


%>

