<!--#include file="AspCms_MainClass.asp" -->
<%
Dim newsID
newsID=filterPara(getForm("id","get"))
conn.Exec  "update Aspcms_News set Visits=Visits+1 where newsID="&newsID&"", "exe"
%>