<%@ Page Language="C#"   MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.UCtenterConfig" Codebehind="KS.UCenterConfig.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
	  <KS:topnav id="TopNav1" runat="server" text="Ucenter系统参数设置"></KS:topnav>
      <div class="content-area">
    <script>
        function showSetting() {
            if (jQuery("#<%=UctenterStatus.ClientID%> :radio[checked]").val() == "1") {
                jQuery("#showSetting").show();
            } else {
                jQuery("#showSetting").hide();
            }
        }
        $(function () {
            showSetting();
        });
    </script>
		  <table id="tbs" width="100%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
         <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>同步UCenter会员中心：</b></td>
                <td class="righttd">
                   <asp:RadioButtonList ID="UctenterStatus" runat="server" RepeatDirection="horizontal">
                    <asp:ListItem Value="1" Selected>正常</asp:ListItem>
                    <asp:ListItem Value="0">关闭</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
         </tr>
        <tbody id="showSetting">
          <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>UC版本：</b></td>
                <td class="righttd">
					<asp:TextBox ID="UC_CLIENT_VERSION" runat="server" CssClass="textbox"></asp:TextBox>
                 
                </td>
         </tr>
		 <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>应用ID：</b></td>
                <td class="righttd">
                  <asp:TextBox ID="UC_APPID" runat="server" CssClass="textbox"></asp:TextBox>
                     <span class="tips">在UCenter中该应用的ID号。</span>
                </td>
         </tr>
		   <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>通信密钥：</b></td>
                <td class="righttd">
					<asp:TextBox ID="UC_KEY" runat="server"  Width="298" CssClass="textbox"></asp:TextBox>
                    <span class="tips">在UCenter中该应用的密钥。</span>
                </td>
         </tr>
                   <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>DZ数据库主机：</b></td>
                <td class="righttd">
                  <asp:TextBox ID="UC_DBHOST" runat="server" CssClass="textbox"></asp:TextBox>
                  <span class="tips">TIPS:没有启用DZ论坛，此处请留空，否则会出错。</span>
                </td>
         </tr>
                   <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>DZ数据库登入名：</b></td>
                <td class="righttd">
                  <asp:TextBox ID="UC_DBUSER" runat="server" CssClass="textbox"></asp:TextBox>
                </td>
         </tr>     <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>DZ数据库密码：</b></td>
                <td class="righttd">
                  <asp:TextBox ID="UC_DBPW" runat="server" CssClass="textbox"></asp:TextBox>
                </td>
         </tr>     <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>DZ数据库名字：</b></td>
                <td class="righttd">
                  <asp:TextBox ID="UC_DBNAME" runat="server" CssClass="textbox"></asp:TextBox>
                </td>
         </tr>

			       <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>UCenter安装URL：</b></td>
                <td class="righttd">
                  <asp:TextBox ID="UC_API" runat="server" CssClass="textbox"></asp:TextBox>
                    <span class="tips">填写UCenter接口的访问URL，如：http://www.kesion.com/uc_server/。</span>
                </td>
         </tr>
			<tr style="display:none">
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>默认编码：</b></td>
                <td class="righttd">
                  <asp:TextBox ID="UC_CHARSET" runat="server" CssClass="textbox"></asp:TextBox>
                </td>
         </tr>
			<tr style="display:none">
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>UCenter IP：</b></td>
                <td class="righttd">
                  <asp:TextBox ID="UC_IP" runat="server" CssClass="textbox"></asp:TextBox>
                </td>
         </tr>
			    
</tbody>
			  </table>
	  <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit"  />
   </div>   
</asp:Content>
