<%@ Page Language="C#" AutoEventWireup="True" Inherits="Kesion.NET.WebSite.User_SignIn" Codebehind="SignIn.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.Cache" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title>用户签到</title>
    <script src="/ks_inc/jquery.js"></script>
    <script src="/ks_inc/Kesion.Common.js"></script>
	<style type="text/css">
	#PopLogin{background:#faf3e1}
    #PopLogin td{font-size:13px;line-height:20px; padding:6px 0px; text-align:center}
    #PopLogin td a{color:#336699;text-decoration:underline;}
    #PopLogin td Button1{margin:2px}
	.qdbtn{width:150px;height:68px;background:url(/user/Images/qdbtn.png) no-repeat;border:0px;margin-top:15px; text-indent:-99999px; cursor:pointer;margin-bottom:5px;}
    </style>

</head>
<body leftmargin=0 topmargin=0 bgcolor="transparent" style="font-family:'微软雅黑';color:#555;background:#f9f4e1">
   <form id="form1" runat="server">
        <asp:Panel ID="LoginPanel" runat="server" Width="100%">
        <div class="clear"></div>
        <div style="padding:15px;font-size:15px;">
               用户<%=__info.UserName %>当前 <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
        </div>  
        <table id="PopLogin"  style="BORDER-COLLAPSE: collapse" borderColor=#eae3d1 cellSpacing=0 width=95% align=center bgColor=#fef8dc border=1>   
            <tr>       
               <%= GetSignIn()%>
            </tr>              
        </table>
        <div style="text-align:center">
           <input type="button" ID="Button1"  value="领取奖励" onclick="SignIn()"  />
            <%--<asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />--%>
        </div>
        <div style="text-align:center;font-size:15px">
        	您已经连续签到<font color="#cc0000"><%=Total %></font>天，今天可以领取<font color="#669b00"><%=UserNum %></font><%=TypeName %></div>
        <div style="display:none;text-align:center;font-size:15px">
        	<a href="<%=Url2 %>"><img src="/user/Images/meiri.png" width="100" height="75" /></a>
            <a href="<%=Url3 %>"><img src="/user/Images/zhou.png" width="100" height="75" /></a>
            <a href="<%=Url4 %>"><img src="/user/Images/yue.png" width="100" height="75" /></a>
            <a href="<%=Url5 %>"><img src="/user/Images/niuren.png" width="100" height="75" /></a>
        </div>        
            
        </asp:Panel>
       <script>
           function SignIn() {
               jQuery.ajax({
                   url: "signin.aspx?action=SignIn&rnd="+Math.random(), success: function (d) {
                       KesionJS.Alert(d,'top.location.href="index.aspx";');
                       
                   }
               });
           }

        </script>

    
       <asp:Panel ID="LoginOKPanel" runat="server" Width="100%" Visible="false">
           <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></asp:Panel>
    </form>
</body>
</html>

