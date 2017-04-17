<%@ Page Language="C#" MasterPageFile="~/User/User.master" ValidateRequest="false" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_EditInfo" Title="Untitled Page" Codebehind="EditInfo.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

<script type="text/javascript" src="<%=ResolveUrl("~/KS_Inc/DatePicker/WdatePicker.js") %>"></script>
    <% Kesion.APPCode.EditorAPI.EchoHead();%>
<script>
    function checkform() {
        if ($("#<%=this.TxtRealName.ClientID %>").val() == '') {
            $.dialog.alert('请输入您的真实姓名!', function() {
                $("#<%=this.TxtRealName.ClientID %>").focus();
            });
            return false;
        }
        <%=sb.ToString()%>
    return true;
    }
</script>

	<div class="r_tybox nomar">

        <div class="tabs">	
			<ul>
				<li class='puton'><a href="editinfo.aspx">修改我的资料</a></li>
				<li><a href="userFace.aspx">上传头像</a></li>
				<li><a href="editPass.aspx">修改密码</a></li>
				<li><a href="EditQuestion.aspx">修改安全问题</a></li>
			</ul>
        </div>

		<div class="r_padbox">
              <div class="padtitle">基本信息</div>
         <table  cellspacing="1" cellpadding="3" class="border" width="100%" align="center" border="0">
                <tr class="tdbg">
                 <td class="lefttd">用户名称：</td>
                 <td style="text-align:left"><asp:TextBox ID="UserName" CssClass="textbox" ReadOnly="true" Enabled="false" runat="server"></asp:TextBox></td>
                </tr>
        
                <tr class="tdbg">
                <td class="lefttd">电子邮箱：</td>
                <td style="text-align:left"><asp:TextBox ID="Email" runat="server" CssClass="textbox" MaxLength="100"></asp:TextBox><span class="tips">请输入您的邮箱地址。</span></td>
                </tr>
                <tr class="tdbg">
                <td class="lefttd">真实姓名：</td>
                <td style="text-align:left"><asp:TextBox ID="TxtRealName" runat="server" CssClass="textbox" MaxLength="10"></asp:TextBox><span class="tips">请输入您的真实姓名。</span></td>
                </tr>       
                <tr class="tdbg">
                <td class="lefttd">所在地区：</td>
                <td style="text-align:left">
                    <%=string.Format(@"<script src='../../plus/area.aspx?classname=textbox&pid={0}&cityid={1}&countyid={2}'></script>", __info.ProID, __info.CityID, __info.CountyId) %>
                </td>
                </tr>
                <tr class="tdbg">
                 <td class="lefttd">绑定手机：</td>
                 <td style="text-align:left">
                 <%if (string.IsNullOrEmpty(__info.Mobile))
                   {
                       Response.Write("未绑定");
                   }
                   else
                   {
                       Response.Write(__info.Mobile);
                   } %>
                 <span class="tips"><a href="MobileBind.aspx" style="font-weight:bold">绑定管理</a></span></td>
                </tr>
                <tr class="tdbg">
                    <td class="lefttd">性别：</td>
                     <td style="text-align:left">
                      <asp:RadioButtonList ID="RdbSex" runat="server" RepeatDirection="Horizontal">
                       <asp:ListItem Value="男" Selected="True">男</asp:ListItem>
                       <asp:ListItem Value="女">女</asp:ListItem>
                      </asp:RadioButtonList>
                     </td>
                </tr>
         </table>
        
        <div class="padtitle">其他选项</div>
        <table  cellspacing="1" cellpadding="3" class="border" width="100%" align="center" border="0">
              <tr>
                  <td>
                     <div class="reg_box_l">
                       <ul id="diyoption" runat="server"></ul>
                    </div>
                  </td>
           </tr>
          </table>
    
          <div class="cz_btn" style="padding-left:165px;">
              <span><asp:Button ID="Button1" OnClientClick="return(checkform())" CssClass="button" runat="server" Text="OK,提交修改" OnClick="Button1_Click" /></span>
              <span><input type="reset" class="button" value="重新录入" /></span>
          </div>
      
      		<div class="clear"></div>
      </div>
</div>
</asp:Content>

