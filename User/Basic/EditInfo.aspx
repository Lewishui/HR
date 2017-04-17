<%@ Page Language="C#" MasterPageFile="~/User/User.master" ValidateRequest="false" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_EditInfo" Title="Untitled Page" Codebehind="EditInfo.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

<script type="text/javascript" src="<%=ResolveUrl("~/KS_Inc/DatePicker/WdatePicker.js") %>"></script>
    <% Kesion.APPCode.EditorAPI.EchoHead();%>
<script>
    function checkform() {
        if ($("#<%=this.TxtRealName.ClientID %>").val() == '') {
            $.dialog.alert('������������ʵ����!', function() {
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
				<li class='puton'><a href="editinfo.aspx">�޸��ҵ�����</a></li>
				<li><a href="userFace.aspx">�ϴ�ͷ��</a></li>
				<li><a href="editPass.aspx">�޸�����</a></li>
				<li><a href="EditQuestion.aspx">�޸İ�ȫ����</a></li>
			</ul>
        </div>

		<div class="r_padbox">
              <div class="padtitle">������Ϣ</div>
         <table  cellspacing="1" cellpadding="3" class="border" width="100%" align="center" border="0">
                <tr class="tdbg">
                 <td class="lefttd">�û����ƣ�</td>
                 <td style="text-align:left"><asp:TextBox ID="UserName" CssClass="textbox" ReadOnly="true" Enabled="false" runat="server"></asp:TextBox></td>
                </tr>
        
                <tr class="tdbg">
                <td class="lefttd">�������䣺</td>
                <td style="text-align:left"><asp:TextBox ID="Email" runat="server" CssClass="textbox" MaxLength="100"></asp:TextBox><span class="tips">���������������ַ��</span></td>
                </tr>
                <tr class="tdbg">
                <td class="lefttd">��ʵ������</td>
                <td style="text-align:left"><asp:TextBox ID="TxtRealName" runat="server" CssClass="textbox" MaxLength="10"></asp:TextBox><span class="tips">������������ʵ������</span></td>
                </tr>       
                <tr class="tdbg">
                <td class="lefttd">���ڵ�����</td>
                <td style="text-align:left">
                    <%=string.Format(@"<script src='../../plus/area.aspx?classname=textbox&pid={0}&cityid={1}&countyid={2}'></script>", __info.ProID, __info.CityID, __info.CountyId) %>
                </td>
                </tr>
                <tr class="tdbg">
                 <td class="lefttd">���ֻ���</td>
                 <td style="text-align:left">
                 <%if (string.IsNullOrEmpty(__info.Mobile))
                   {
                       Response.Write("δ��");
                   }
                   else
                   {
                       Response.Write(__info.Mobile);
                   } %>
                 <span class="tips"><a href="MobileBind.aspx" style="font-weight:bold">�󶨹���</a></span></td>
                </tr>
                <tr class="tdbg">
                    <td class="lefttd">�Ա�</td>
                     <td style="text-align:left">
                      <asp:RadioButtonList ID="RdbSex" runat="server" RepeatDirection="Horizontal">
                       <asp:ListItem Value="��" Selected="True">��</asp:ListItem>
                       <asp:ListItem Value="Ů">Ů</asp:ListItem>
                      </asp:RadioButtonList>
                     </td>
                </tr>
         </table>
        
        <div class="padtitle">����ѡ��</div>
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
              <span><asp:Button ID="Button1" OnClientClick="return(checkform())" CssClass="button" runat="server" Text="OK,�ύ�޸�" OnClick="Button1_Click" /></span>
              <span><input type="reset" class="button" value="����¼��" /></span>
          </div>
      
      		<div class="clear"></div>
      </div>
</div>
</asp:Content>

