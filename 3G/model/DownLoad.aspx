<%@ Page Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.Mobile.Model_DownLoad" Codebehind="DownLoad.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no" /> 
<title>手机版</title>
<meta name="keywords" content="厦门科汛软件公司">
<meta name="description" content="KesionCMS">
<link href="../style/style.css" rel="stylesheet" type="text/css" />
	<script src="../../ks_inc/jquery.js" type="text/javascript"></script>
	<script src="../../ks_inc/kesion.common.js" type="text/javascript"></script>
	<style type="text/css">
	    body {font-size: 12px;font-family: 宋体;}
	    td {font-size: 12px; font-family: 宋体; line-height: 18px;table-layout:fixed;word-break:break-all}a {color: #555555; text-decoration: none}
	    a:hover {color: #FF8C40; text-decoration: underline}
	    th{ background-color: #0A95D2;color: white;font-size: 12px;font-weight:bold;height: 25px;}
	    .TableRow1 {background-color:#F7F7F7;}.TableRow2 {background-color:#F0F0F0;}
	    .TableBorder {border: 1px #3795D2 solid ; background-color: #FFFFFF;font: 12px;}
</style>
 </head>
	 <body><br /><br />
	 <table width="98%" border=0 align=center cellpadding=0 cellspacing=0 class=TableBorder>
	 <tr>  <th>系 统 提 示</th></tr><tr height=110>
	 <td class=TableRow1 align=center>
	  <%=MsgStr %>
	  </td>
	 </tr>
	 <tr height=22>
	 <td align=center class=TableRow2><a href=javascript:window.close()>关闭本窗口...</a></td></tr>
	 </table><br /><br />
	 </body>

</html>