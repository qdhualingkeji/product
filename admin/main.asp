<!--#include file="../inc/AspCms_MainClass.asp" -->
<%CheckLogin()%>
<%
Dim Permissions
Permissions=rCookie("Permissions")
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=siteTitle%>-��̨����ϵͳ- Powered by AspCms</title>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<META content="MSHTML 6.00.2900.2963" name=GENERATOR>
<link href="css/div.css" rel="stylesheet" type="text/css" />
<link href="css/txt.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="js/myjs.js"></script>
<script language="javascript" src="js/time.js"></script>
</head>

<body scroll="no">
<div class="height_box" id="web_height">
<div class="webbox" id="up_box">
  <div class="logo_bg"><img src="images/logo.jpg" width="260" height="70" /></div>
  <div class="logo_menu_box" id="web_top">
    <div class="logo_menu1">
      <div class="logo_home"><a href="../" target="_blank"><img src="images/logo_home.jpg" border="0" /></a></div>
	  <div class="logo_home_menu">&nbsp;&nbsp;<a href="main.asp" class="logo_menu_txt">��̨����ҳ��</a><img src="images/logo_home_line.jpg" width="2" height="18" /><a href="_Manager/AspCms_ManagerEditPass.asp?id=<%=rCookie("AdminId")%>" target="main" class="logo_menu_txt">�޸�����</a><img src="images/logo_home_line.jpg" width="2" height="18" /><a href="index.asp?action=logout" class="logo_menu_txt">�˳���¼</a></div>
    </div>
	<div class="logo_menu2"></div>
	<div class="logo_menu3">
	  <div class="logo_menu3_txt txt_C2"><strong class="txt_C3">��ӭ��Ϣ:</strong>��ӭ��<b style="color:#FF0000"><%=rCookie("adminName")%></b>!&nbsp;�����ڵ�¼���Ǻ�̨����ϵͳ!&nbsp;��ǰʱ��:<script language="javascript">showTime()</script></div>
	</div>
  </div>
</div>
<div class="webbox" id="bottom_box">
<div class="left" id="web_left" style="overflow:scroll;">
  <div class="left_line5"></div>
  <div class="left_title" onclick="setMenu('left_m1')"><strong class="txt_C1"><img src="images/left_title_dot.gif" width="7" height="7" />ϵͳ����</strong></div>
  <div class="left_title_list_box_other" id="left_m1">
  <%if instr(Permissions,"AspCms_CompanySetting.asp")>0  then%>
      <div class="left_title_list" onmouseover="setLeftBg(1)" onmouseout="setLeftBg(0)">
          <img src="images/left_list_dot.gif" width="7" height="7" />
          <a href="_Setting/AspCms_CompanySetting.asp" target="main" class="txt_C2">��վ��Ϣ����</a>
      </div>
   <%end if
   if instr(Permissions,"AspCms_NewsSort.asp")>0  then
   %>
      <div class="left_title_list" onmouseover="setLeftBg(1)" onmouseout="setLeftBg(0)">
          <img src="images/left_list_dot.gif" width="7" height="7" />
          <a href="_Content/AspCms_NewsSort.asp" class="txt_C2"  target="main">������Ŀ����</a>
      </div>
   <%end if
   if instr(Permissions,"AspCms_ProductSpec.asp")>0  then
   %>
      <div class="left_title_list" onmouseover="setLeftBg(1)" onmouseout="setLeftBg(0)" style="display:none">
          <img src="images/left_list_dot.gif" width="7" height="7" />
          <a href="_Content/AspCms_ProductSpec.asp" class="txt_C2"  target="main">��Ʒ��������</a>
      </div>
   <%end if
   if instr(Permissions,"AspCms_OnlineService.asp")>0  then
   %>
      <div class="left_title_list" onmouseover="setLeftBg(1)" onmouseout="setLeftBg(0)" style="display:none">
          <img src="images/left_list_dot.gif" width="7" height="7" />
          <a href="_Setting/AspCms_OnlineService.asp" class="txt_C2"  target="main">���߿ͷ�����</a>
      </div>
   <%end if
   if instr(Permissions,"AspCms_ADSetting.asp")>0  then
   %>
      <div class="left_title_list" onmouseover="setLeftBg(1)" onmouseout="setLeftBg(0)" style="display:none">
          <img src="images/left_list_dot.gif" width="7" height="7" />
          <a href="_Setting/AspCms_ADSetting.asp" class="txt_C2"  target="main">��վ�������</a>
      </div>
   <%end if
   if instr(Permissions,"AspCms_Links.asp")>0  then
   %>
      <div class="left_title_list" onmouseover="setLeftBg(1)" onmouseout="setLeftBg(0)">
          <img src="images/left_list_dot.gif" width="7" height="7" />
          <a href="_Links/AspCms_Links.asp" class="txt_C2"  target="main">������������</a>
      </div>
   <%end if
   if instr(Permissions,"AspCms_SeoSetting.asp")>0  then
   %>
      <div class="left_title_list" onmouseover="setLeftBg(1)" onmouseout="setLeftBg(0)">
          <img src="images/left_list_dot.gif" width="7" height="7" />
          <a href="_Setting/AspCms_SeoSetting.asp" class="txt_C2"  target="main">ȫ���Ż�����</a>
      </div>
   <%end if
   if instr(Permissions,"AspCms_CopyRight.asp")>0  then
   %>
      <div class="left_title_list" onmouseover="setLeftBg(1)" onmouseout="setLeftBg(0)">
          <img src="images/left_list_dot.gif" width="7" height="7" />
          <a href="_Setting/AspCms_CopyRight.asp" class="txt_C2"  target="main">��վ��Ȩ����</a>
      </div>
   <%end if
   if instr(Permissions,"AspCms_Manager.asp")>0  then
   %>
      <div class="left_title_list" onmouseover="setLeftBg(1)" onmouseout="setLeftBg(0)">
          <img src="images/left_list_dot.gif" width="7" height="7" />
          <a href="_Manager/AspCms_Manager.asp" class="txt_C2"  target="main">����ԱȨ������</a>
      </div>
   <%end if
   if instr(Permissions,"AspCms_Data.asp")>0  then
   %>
      <div class="left_title_list" onmouseover="setLeftBg(1)" onmouseout="setLeftBg(0)">
          <img src="images/left_list_dot.gif" width="7" height="7" />
          <a href="_Data/AspCms_Data.asp" class="txt_C2"  target="main">���ݿⱸ��/�ָ�</a>
      </div>
   <%end if%>
  </div>
  <div class="left_title" onclick="setMenu('left_m2')">
      <strong class="txt_C1"><img src="images/left_title_dot.gif" width="7" height="7" />��վ���ݹ���</strong>
  </div>
  <div class="left_title_list_box" id="left_m2">      
<%
SortList(0)
function SortList(ParentID)
	Dim rs :set rs =Conn.Exec ("select *,(select count(*) from AspCms_NewsSort where ParentID=t.SortID) as c from AspCms_NewsSort t where ParentID="&ParentID&" order by Sortorder,Sortorder ","r1")
	If rs.eof or rs.bof Then
		echo "��û�м�¼"
	Else
		Do While not rs.eof 	
			echo getUrl(rs("sortStyle"),rs("sortID"),rs("SortName"),rs("c"),rs("SortLevel"),rs("parentID"))		   
			'echo "</div>"
			If rs("c")>0 then
			SortList(rs("SortID"))
			end If 
			rs.MoveNext
		Loop
		rs.close	:	set rs = nothing
	End If 
End function

Function getUrl(sortStyle,sortID,sortName,ccount,SortLevel,parentID)
	dim str, str1,str2
	str1="<div class=""left_title_list"" onmouseover=""setLeftBg(1)"" onmouseout=""setLeftBg(0)"">"&getLevel(SortLevel)&"<img src=""images/left_list_dot.gif"" width=""7"" height=""7"" />"
	str2="</div>"
	if ccount>0 then 
		if parentID=0 then
			str="<strong class=""txt_C2"">"&sortName&"</strong>"
		else
			str=sortName
		end if
		getUrl=str1&str&str2
		exit Function
	end if
	Select  case sortStyle
	case "0" 
		if instr(Permissions,"AspCms_NewsList.asp")>0 then
		str="<a  href=""_Content/AspCms_NewsList.asp?sort="&sortID&""" target=""main"" class=""txt_C2"">"&sortName&"</a>&nbsp;|&nbsp;<a  href=""_Content/AspCms_NewsAdd.asp?sort="&sortID&""" target=""main"" class=""txt_C2"">���</a>"				
		getUrl=str1&str&str2	
		end if
	case "1" 		
		if instr(Permissions,"AspCms_NewsList.asp")>0 then	
		str="<a  href=""_Content/AspCms_NewsList.asp?pic=1&sort="&sortID&""" target=""main"" class=""txt_C2"">"&sortName&"</a>&nbsp;|&nbsp;<a  href=""_Content/AspCms_NewsAdd.asp?pic=1&sort="&sortID&""" target=""main"" class=""txt_C2"">���</a>"			
		getUrl=str1&str&str2	
		end if	
	case "2" 
		if instr(Permissions,"AspCms_BaseAdd.asp")>0 then
		str="<a  href=""_Content/AspCms_BaseAdd.asp?sort="&sortID&""" target=""main"" class=""txt_C2"">"&sortName&"</a>"		
		getUrl=str1&str&str2
		end if
	case "3" 
		if instr(Permissions,"AspCms_productList.asp")>0 then
		str="<a  href=""_Content/AspCms_productList.asp?sort="&sortID&""" target=""main"" class=""txt_C2"">"&sortName&"</a>&nbsp;|&nbsp;<a  href=""_Content/AspCms_productAdd.asp?sort="&sortID&""" target=""main"" class=""txt_C2"">���</a>"	
		getUrl=str1&str&str2
		end if
	case "4" 
		if instr(Permissions,"AspCms_DownList.asp")>0 then
		str="<a  href=""_Content/AspCms_DownList.asp?sort="&sortID&""" target=""main"" class=""txt_C2"">"&sortName&"</a>&nbsp;|&nbsp;<a  href=""_Content/AspCms_DownAdd.asp?sort="&sortID&""" target=""main"" class=""txt_C2"">���</a>"	
		getUrl=str1&str&str2
		end if
'	case "5" 
'		str=sortName	
'		getUrl=str1&str&str2
	End Select
End Function



function getLevel(num)
	if not isnum(num) then  exit Function
	dim i
	getLevel=""
	for i=2 to num
		getLevel=getLevel&"&nbsp;&nbsp;&nbsp;"		
	next
	if num<>"1" then getLevel=getLevel&"��"
	
end function
%>
  </div>


  <div class="left_title" onclick="setMenu('left_m8')" style="display:none">
  	<strong class="txt_C1"><img src="images/left_title_dot.gif" width="7" height="7" />��Ա����</strong>
  </div>
  <div class="left_title_list_box_other" id="left_m8">
  <%if instr(Permissions,"AspCms_GradeEdit.asp,AspCms_Grades.asp")>0  then   %>
      <div class="left_title_list" onmouseover="setLeftBg(1)" onmouseout="setLeftBg(0)">
      <img src="images/left_list_dot.gif" width="7" height="7" />
      <a href="_User/AspCms_Grades.asp" class="txt_C2"  target="main">��Ա�ȼ�����</a>
      </div>
  <%end if%>
  <%if instr(Permissions,"AspCms_UserEdit.asp,AspCms_UserList.asp")>0  then   %>
      <div class="left_title_list" onmouseover="setLeftBg(1)" onmouseout="setLeftBg(0)">
      <img src="images/left_list_dot.gif" width="7" height="7" />
      <a href="_User/AspCms_UserList.asp" class="txt_C2"  target="main">��Ա����</a>
      </div>
  <%end if%>
  </div>    
  
  
  <div class="left_title" onclick="setMenu('left_m4')">
  	<strong class="txt_C1"><img src="images/left_title_dot.gif" width="7" height="7" />��������</strong>
  </div>
  <div class="left_title_list_box_other" id="left_m4">
  <%if instr(Permissions,"AspCms_Message.asp")>0  then   %>
      <div class="left_title_list" onmouseover="setLeftBg(1)" onmouseout="setLeftBg(0)">
      <img src="images/left_list_dot.gif" width="7" height="7" />
      <a href="_Comments/AspCms_Message.asp" class="txt_C2"  target="main">���Թ���</a>
      </div>
  <%end if%>
  <%if instr(Permissions,"AspCms_Comment.asp")>0  then   %>
      <div class="left_title_list" onmouseover="setLeftBg(1)" onmouseout="setLeftBg(0)" style="display:none">
      <img src="images/left_list_dot.gif" width="7" height="7" />
      <a href="_Comments/AspCms_Comment.asp" class="txt_C2"  target="main">���۹���</a>
      </div>
  <%end if%>
  
  <%if instr(Permissions,"AspCms_OrderEdit.asp,AspCms_Orders.asp")>0  then   %>
      <div class="left_title_list" onmouseover="setLeftBg(1)" onmouseout="setLeftBg(0)" style="display:none">
      <img src="images/left_list_dot.gif" width="7" height="7" />
      <a href="_Order/AspCms_Orders.asp" class="txt_C2"  target="main">��������</a>
      </div>
  <%end if%>
  </div>  
  


  <div class="left_title" onclick="setMenu('left_m6')" >
  	<strong class="txt_C1"><img src="images/left_title_dot.gif" width="7" height="7" />����</strong>
  </div>
  <div class="left_title_list_box_other" id="left_m6" style="display:none">
      <div class="left_title_list" onmouseover="setLeftBg(1)" onmouseout="setLeftBg(0)">
      <img src="images/left_list_dot.gif" width="7" height="7" />
      <a href="_make/AspCms_MakeHtml.asp" class="txt_C2"  target="main">���ɾ�̬</a>
      </div>
  </div>
  
   
  
  <div class="left_title" onclick="setMenu('left_m5')">
  	<strong class="txt_C1"><img src="images/left_title_dot.gif" width="7" height="7" />��������</strong>
  </div>
  <div class="left_title_list_box_other" id="left_m5">
   <%
   if instr(Permissions,"AspCms_Slide.asp")>0  then
   %>
      <div class="left_title_list" onmouseover="setLeftBg(1)" onmouseout="setLeftBg(0)">
      <img src="images/left_list_dot.gif" width="7" height="7" />
      <a href="_Other/AspCms_Slide.asp" class="txt_C2"  target="main">�õ�Ƭ����</a>
      </div>
   <%end if
   if instr(Permissions,"AspCms_FileManger.asp")>0  then
   %>
      <div class="left_title_list" onmouseover="setLeftBg(1)" onmouseout="setLeftBg(0)">
      <img src="images/left_list_dot.gif" width="7" height="7" />
      <a href="_Other/AspCms_FileManger.asp" class="txt_C2" target="main">�ϴ��ļ�����</a>
      </div>
   <%end if
      if instr(Permissions,"AspCms_RedundancyFile.asp")>0  then
   %>
      <div class="left_title_list" onmouseover="setLeftBg(1)" onmouseout="setLeftBg(0)"  style="display:none">
      <img src="images/left_list_dot.gif" width="7" height="7" />
      <a href="_Other/AspCms_RedundancyFile.asp" class="txt_C2" target="main">�����ļ����</a>
      </div>
   <%end if
   if instr(Permissions,"AspCms_Statistics.asp")>0  then
   %>
      <div class="left_title_list" onmouseover="setLeftBg(1)" onmouseout="setLeftBg(0)"  style="display:none">
      <img src="images/left_list_dot.gif" width="7" height="7" />
      <a href="_Other/AspCms_Statistics.asp" class="txt_C2" target="main">��վ����ͳ��</a>
      </div>
   <%end if
   if instr(Permissions,"AspCms_SearchEngine.asp")>0  then
   %>
      <div class="left_title_list" onmouseover="setLeftBg(1)" onmouseout="setLeftBg(0)"  style="display:none">
      <img src="images/left_list_dot.gif" width="7" height="7" />
      <a href="_Other/AspCms_SearchEngine.asp" class="txt_C2" target="main">���������¼</a>
      </div>
   <%end if%>
  </div>  
  
  <div class="left_title" onclick="setMenu('left_m3')"  style="display:none">
  	<strong class="txt_C1"><img src="images/left_title_dot.gif" width="7" height="7" />���ģ�����</strong>
  </div>
  <div class="left_title_list_box_other" id="left_m3">
 <!--     <div class="left_title_list" onmouseover="setLeftBg(1)" onmouseout="setLeftBg(0)">
      <img src="images/left_list_dot.gif" width="7" height="7" />
      <a href="_Style/AspCms_StyleList.asp" class="txt_C2" target="main">ģ��ѡ��</a>
      </div> -->
   <%
   if instr(Permissions,"AspCms_StyleManage.asp")>0  then
   %>
      <div class="left_title_list" onmouseover="setLeftBg(1)" onmouseout="setLeftBg(0)"  style="display:none">
      <img src="images/left_list_dot.gif" width="7" height="7" />
      <a href="_Style/AspCms_StyleManage.asp" class="txt_C2" target="main">ѡ��ģ��</a>
      </div>
   <%end if
   if instr(Permissions,"AspCms_TemplateManger.asp")>0  then
   %>
      <div class="left_title_list" onmouseover="setLeftBg(1)" onmouseout="setLeftBg(0)">
      <img src="images/left_list_dot.gif" width="7" height="7" />
      <a href="_Style/AspCms_TemplateManger.asp" class="txt_C2" target="main">ģ�����</a>
      </div>
   <%end if
   if instr(Permissions,"AspCms_CssManger.asp")>0  then
   %>
      <div class="left_title_list" onmouseover="setLeftBg(1)" onmouseout="setLeftBg(0)">
      <img src="images/left_list_dot.gif" width="7" height="7" />
      <a href="_Style/AspCms_CssManger.asp" class="txt_C2" target="main">��ʽ�ļ�����</a>
      </div>
   <%end if
   %>
      <div class="left_title_list" onmouseover="setLeftBg(1)" onmouseout="setLeftBg(0)">
      </div>
  </div>
  
  <div class="left_copy text_en" id="l_copy"></div>
</div>


<div class="right" id="web_right">
  <div class="main_center_article" id="web_main">
	  <iframe src="right.asp" name="main" width="100%" height="100%" scrolling="yes" frameborder="0"  ></iframe>
	</div>
</div>
</div>
</div>
<script language="javascript">
window.onresize = window.onload = setDiv;
function setDiv(){
	var space = 1;
	var maxX = document.getElementById("web_height").clientWidth;
	var maxY = document.getElementById("web_height").clientHeight;
	var webH = maxY-space;
	document.getElementById("web_top").style.width = maxX-260-space + "px";
	document.getElementById("bottom_box").style.height = document.getElementById("web_left").style.height = webH-69+ "px";
	document.getElementById("web_right").style.width = maxX-200-space + "px";
	document.getElementById("web_main").style.height = webH - 69 + "px";
}
</script>

</body>
</html>