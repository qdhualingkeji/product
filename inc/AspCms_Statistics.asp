<!--#include file="AspCms_MainClass.asp" -->
<%	
if conn.Exec("select count(*) from Aspcms_Visits where year(AddTime)="&Year(date)&" and month(AddTime)="&month(date)&" and day(AddTime)="&day(date),"r1")(0)>0 then
	conn.Exec"update Aspcms_Visits set Visits=Visits+1 where year(AddTime)="&Year(date)&" and month(AddTime)="&month(date)&" and day(AddTime)="&day(date),"exe"
else		
		conn.Exec"insert into Aspcms_Visits(Visits,AddTime) values(1,'"&date&"')","exe"
end if 
%>
