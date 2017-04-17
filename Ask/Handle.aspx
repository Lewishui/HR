<%@ Page Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Ask_Handle" Codebehind="Handle.aspx.cs" %>
<%@ Import Namespace="Kesion.BLL" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<style type="text/css" media="all">
			body,td,input,select,textarea,a,div{font:12px Verdana, Arial, 宋体, sans-serif;color:#000;text-decoration:none;line-height:16px;}
			body{background:#fff;margin:0 auto;}
			li{list-style:none;padding:0;line-height:20px;}
			form{margin:0;padding:0;}
			h1,h2,h3,h4,h5,h6 {font-family:Verdana;font-size:12px;font-weight:400;}
			.mainBody {background:#fff;border-top:1px solid #b5cfe8;line-height:18px;margin-bottom:8px;}
			.mainBody h2 {clear:both;margin:0;letter-spacing:2px;height:22px;line-height:22px;background:#e7f5ff;color:#004299;text-align:center;font-weight:bold;}
			</style>

	</head>
<body>
<div class="mainBody">
                
    <form id="form1" runat="server">
  	
  	  <asp:Panel ID="PanAddReward" runat="server">
		 <table width="100%" cellpadding="5" cellspacing="3" border="0">
		  <tr>
		  <td> 问题： 
		  <font color="blue">  <%=dr["title"].ToString() %></font>
		  </td>
		  </tr>
		  <tr>
		  <td>  增加悬赏分，可以提高问题的关注度。</td>
		  </tr>
		 <tr>
		 <td>
		  增加悬赏分： 
		  <asp:DropDownList ID="DrpPoints" runat="server">
		   <asp:ListItem Value="5" Selected="True">5分</asp:ListItem>
		   <asp:ListItem Value="10">10分</asp:ListItem>
		   <asp:ListItem Value="15">15分</asp:ListItem>
		   <asp:ListItem Value="20">20分</asp:ListItem>
		   <asp:ListItem Value="25">25分</asp:ListItem>
		   <asp:ListItem Value="30">30分</asp:ListItem>
		   <asp:ListItem Value="35">35分</asp:ListItem>
		   <asp:ListItem Value="40">40分</asp:ListItem>
		   <asp:ListItem Value="45">45分</asp:ListItem>
		   <asp:ListItem Value="50">50分</asp:ListItem>
		  </asp:DropDownList>
		 
		  您当前的积分是 
		  <font color="red"><%=UserManage.GetUserInfo().AvailableScore.ToString() %>分</font> 
		  ，请设置您要增加的悬赏分 
		  </td>
		  </tr>
		 <tr>
		 <td>
		 <asp:Button ID="BtnAddScore" runat="server" Text="增加悬赏分" CssClass="btn" 
                 onclick="BtnAddScore_Click" />
		 <input type="button" name="Submit5" onclick="top.box.close();" value=" 取消 " class="btn"/> 
 </td>
		  </tr>
		  </table>
	</asp:Panel>	  	  
		  
	<asp:Panel ID="PanClose" runat="server" Visible="false">
	<table align="center" width="100%" cellpadding="5" cellspacing="3" border="0">
		 <tr>
		 <td height="45" align="center">
		 <br /><font color="#808080" size="3">
		  <b>如果没有满意的回答，请点击下面的“关闭问题”按钮直接结束提问！</b> 
		  </font>
		  <br /> 
		  <br /> 
		  出于保护回答者利益的考虑，问题的悬赏分将不再返还。 
		  <br /> 
		  如果因此造成您的积分损失，我们希望能得到您的理解。 
		  </td>
		  </tr>
		 <tr>
		 <td height="30" align="center">
		  <asp:Button ID="Button1" runat="server" Text="确定关闭" CssClass="btn" 
                 onclick="Button1_Click" />
		  <input type="button" name="Submit5" onclick="top.box.close();" value="还是再等等吧" class="btn"/> 
		  </td>
		  </tr>
		  </table>
	</asp:Panel>	  
		  
		  
		  </form>

		
   </div>
</body>
</html>
			