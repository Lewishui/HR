<%@ Page Language="C#" MasterPageFile="~/User/User.master" ValidateRequest="false" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_User_EditPass" Title="Untitled Page" Codebehind="EditPass.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

<script>
    function checkform() {
        if ($("#<%=this.OldPass.ClientID %>").val() == '') {
            KesionJS.Alert('���������ľ����룡', "$('#<%=this.OldPass.ClientID %>').focus()");
            return false;
        }
        if ($("#<%=this.PassWord.ClientID %>").val() == '') {
            KesionJS.Alert('���������������룡', "$('#<%=this.PassWord.ClientID %>').focus()");
            return false;
        }
       if ($("#<%=this.PassWord.ClientID %>").val().length<6) {
            KesionJS.Alert('�����볤�Ȳ���������λ��', "$('#<%=this.PassWord.ClientID %>').focus()");
            return false;
       }
       if ($("#<%=this.PassWord.ClientID %>").val() == $("#<%=this.OldPass.ClientID %>").val()) {
            KesionJS.Alert('������;����벻������һ����', "$('#<%=this.PassWord.ClientID %>').focus()");
            return false;
        }

        if ($("#<%=this.RePassWord.ClientID %>").val() == '') {
            KesionJS.Alert('����������ȷ�����룡', "$('#<%=this.RePassWord.ClientID %>').focus()");
            return false;
        }
        if ($("#<%=this.PassWord.ClientID %>").val() != $("#<%=this.RePassWord.ClientID %>").val()) {
            KesionJS.Alert('������������벻һ�£������䣡', "$('#<%=this.PassWord.ClientID %>').focus()");
            return false;
        }
        if ($("#<%=this.TxtVerifyCode.ClientID %>").val() == '') {
            KesionJS.Alert('��������֤�룡', "$('#<%=this.TxtVerifyCode.ClientID %>').focus()");
            return false;
        }
    }
</script>

	<div class="r_tybox nomar">

        <div class="tabs">	
              <ul>
                  <li><a href="editinfo.aspx">�޸��ҵ�����</a></li>
                  <li><a href="userFace.aspx">�ϴ�ͷ��</a></li>
                  <li class='puton'><a href="editPass.aspx">�޸�����</a></li>
                  <li><a href="EditQuestion.aspx">�޸İ�ȫ����</a></li>
              </ul>
        </div>
        <div class="clear"></div>
        <div class="r_padbox">
        	<div class="padtitle">�޸�����</div>
 		<table  cellspacing="1" cellpadding="3" class="border" width="100%" align="center" border="0">

                          <%if (__info.IsApi == 1)
                            { %>
                            <tr class="tdbg">
                            <td colspan="2" style="font-size:14px;color:green;height:80px; text-align:left;line-height:30px;padding:10px;">��ܰ��ʾ������ͨ����������վ�˺ŵ�¼��վ�ģ����������������룬�´ξͿ���ֱ��ʹ���û��� <span style="color:Red"><%=__info.UserName %></span> ���������õ������¼��վ�ˡ�</td>
                          </tr>
                          <%}
                            else
                            { %>
                          <tr class="tdbg">
                            <td  class="lefttd">�� �� �룺</td>
                            <td style="text-align:left;"><asp:TextBox ID="OldPass" CssClass="textbox"  TextMode="password" runat="server"></asp:TextBox><span class="tips">���ľɵ�¼���룬������ȷ��д��</span><span style="color: red">*<asp:RequiredFieldValidator
                                    ID="RequiredFieldValidator1" runat="server" ControlToValidate="OldPass" ErrorMessage="����������룡"></asp:RequiredFieldValidator></span></td>
                          </tr>
                          <%} %>
                          <tr class="tdbg">
                            <td class="lefttd"> �� �� �룺</td>
                            <td style="text-align:left;"><asp:TextBox ID="PassWord" CssClass="textbox" TextMode="password" runat="server"></asp:TextBox><span class="tips">���������������룡</span>
                            <span style="color: red">* 
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="PassWord"
                                    ErrorMessage="�����������룡"></asp:RequiredFieldValidator></span></td>
                          </tr>
                          <tr class="tdbg">
                            <td class="lefttd">ȷ�����룺</td>
                            <td style="text-align:left;"><asp:TextBox ID="RePassWord" CssClass="textbox" TextMode="password" runat="server"></asp:TextBox><span class="tips">ͬ�ϡ�</span>
                              <span style="color: red">* 
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="RePassWord"
                                      Display="Dynamic" ErrorMessage="������ȷ�����룡"></asp:RequiredFieldValidator>
                                  <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="PassWord"
                                      ControlToValidate="RePassWord" Display="Dynamic" ErrorMessage="������������벻һ�£�"></asp:CompareValidator></span></td>
                          </tr>
                          <tr class="tdbg">
                            <td class="lefttd">�� ֤ �룺</td>
                            <td style="text-align:left;">
                                <asp:TextBox ID="TxtVerifyCode" CssClass="textbox" width="50px" runat="server"></asp:TextBox>
                              <span style="color: red">*  </span>
                                <img src="../../plus/ValidateCode.aspx" onclick="this.src=this.src+'?'+Math.random()" />

                            </td>
                          </tr>
                          
                          <tr class="tdbg">
                            <td class="lefttd" style="border-bottom:0px;"></td>
                            <td style="text-align:left;border-bottom:0px;">
                                <div class="cz_btn">
                                      <span><asp:Button OnClientClick="return(checkform());" ID="Button1" CssClass="button" runat="server" OnClick="Button1_Click" Text="OK!ȷ���޸�" /></span>
                                       
                                      <span><input type="reset" class="button" value=" �� �� " /></span>
                                </div>
              				</td>    
                           </tr>                 
            </table>
          </div>
      </div>   

</asp:Content>

