<!--#include file="../../inc/AspCms_MainClass.asp" -->
<!--#include file="AspCms_OrderFun.asp" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>订单管理</title>
<link href="../css/div.css" rel="stylesheet" type="text/css" />
<link href="../css/txt.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/form.css" />
<script language="javascript" src="../js/common.js"></script>
<script language="javascript" src="../js/all.js"></script>
<script language="javascript" src="../js/myjs.js"></script>
</head>

<body>
  <div class="right_up"></div>
  <div class="right_title"><strong class="txt_C3">订单管理</strong></div>
  <div class="main_center_article" id="web_main">
	  	<div class="main_form"  style=" background:#e8f1f6">
	  	  <div class="main_form_news_l"><strong>订单管理</strong></div>
	  	  </div>
	  <form action="?page=<%=page%>&order=<%=order%>&sort=<%=sortID%>&keyword=<%=keyword%>" method="post" name="form">
          <div class="maintable">
        <table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#a9c5d0" style=" margin:5px 0px;">
            <tr bgcolor="#FFFFFF" align="center">
                <td style=" height:30px;">联系人或联系电话：<input type="text" name="keyword" value="<%=keyword%>" style="width:200px;" />&nbsp;&nbsp;<input type="submit" name="selectBtn" value="搜索" class="btn" />        <input type="button" name="selectBtn" value="全部" class="btn"  onclick="location.href='?'" /></td>
            </tr>
        </table>         
            <table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#a9c5d0">
              <tr bgcolor="#DDEFF9" align="center">
                <td width="4%">ID</td>
                <td width="30%">订单名称</td>  
                <td width="10%">订购人</td>
                <td width="18%">联系电话</td>
                <td width="4%">数量</td>
                <td width="14%">订购时间</td>
                <td width="6">状态</td>
                <td width="10%">操作</td>
                <td width="4%">选择</td>
              </tr>  
              <%OrderList%>
            </table>
           
        </div>
	</form>
</div>
</body>
</html>