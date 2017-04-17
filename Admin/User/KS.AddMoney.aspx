<%@ Page Language="C#" ValidateRequest="false" EnableEventValidation="false" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_AddMoney" Title="Ԥ����" Codebehind="KS.AddMoney.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

 <asp:Panel ID="Panel1" runat="server" Width="100%">
    <script>
        function doChanage(v) {
            if (v == 0) {
                $("#ShowDiscount").show();
            } else {
                $("#ShowDiscount").hide();
            }
            if (v == "2") {
                $("#shows").show();
            } else{ 
                $("#shows").hide();
            }
        }
        $(function () {
            $("#<%=this.TxtPoint.ClientID%>").keyup(function () {
                setRealMoney();
            });
            $("#<%=this.TxtDiscount.ClientID%>").keyup(function () {
                setRealMoney();
            });
        });
        function setRealMoney() {
            if ($("#<%=DrpCZType.ClientID%> option:selected").val() == 0) {
                var money = parseFloat($("#<%=this.TxtPoint.ClientID%>").val());
                var discount = parseFloat($("#<%=this.TxtDiscount.ClientID%>").val());
                $("#<%=TxtRealMoney.ClientID%>").val(money*discount);
            }
        }
        function setTypeTips() {
            var checkrad = jQuery("#<%=RdbType.ClientID%> :radio[checked]").val();
            if (checkrad == "1") {
                jQuery("#<%=TxtRemark.ClientID%>").val("��̨��ֵ");
            } else {
                jQuery("#<%=TxtRemark.ClientID%>").val("��̨�۷�");
            }
        }

    </script>
     <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable" style="table-layout:fixed"> 
          <% if (groupId > 0){ %>
         <tr>
              <td align="right" class="lefttd" style="width:150px"><strong>�� �� �飺</strong></td>
              <td class="righttd">&nbsp;<%=userNames %></td>
          </tr>
         <%}else{ %>
          <tr>
              <td align="right" class="lefttd" style="width:150px"><strong>�� �� ����</strong></td>
              <td class="righttd" style="word-break:break-all;">&nbsp;<%=userNames %></td>
          </tr>
         <%} %>
         <tr>
             <td align="right" class="lefttd" style="text-align: right">
                 <strong>��ֵ���ͣ�</strong></td>
             <td class="righttd">
                  <asp:DropDownList ID="DrpCZType" runat="server">
                      <asp:ListItem Value="0">Ԥ����</asp:ListItem>
                      <asp:ListItem Value="1">��ȯ</asp:ListItem>
                      <asp:ListItem Value="2">����</asp:ListItem>
                  </asp:DropDownList>
                 <span id="shows" style="display:none">
                  <asp:CheckBox ID="CkbAvailableScore"  Checked="true" runat="server" Text="ͬʱ������û���"/></span>
            </td>
         </tr>
        
         <tr>
             <td align="right" class="lefttd" style="text-align: right">
                 <strong>�������ͣ�</strong></td>
             <td class="righttd">
                 <asp:RadioButtonList ID="RdbType" runat="server" RepeatDirection="Horizontal">
                     <asp:ListItem Selected="True" Value="1">����</asp:ListItem>
                     <asp:ListItem Value="2">����</asp:ListItem>
                 </asp:RadioButtonList></td>
         </tr>
           <tr>
              <td align="right" class="lefttd" style="text-align: right">
                  <strong>������</strong></td>
              <td class="righttd">
                  &nbsp;<asp:TextBox CssClass="textbox" ID="TxtPoint" runat="server" style="text-align:center" Width="61px" Text="100"></asp:TextBox></td>
          </tr>
          <tbody id="ShowDiscount">
              <tr>
              <td align="right" class="lefttd" style="text-align: right">
                  <strong>�� �� �ʣ�</strong></td>
              <td class="righttd">
                  &nbsp;<asp:TextBox CssClass="textbox" ID="TxtDiscount" runat="server" style="text-align:center" Width="61px" Text="1"></asp:TextBox>
                  ��&nbsp;&nbsp;<span class="tips">��0.9��ʾ9�ۡ�</span>
              </td>
            </tr>
              <tr>
              <td align="right" class="lefttd" style="text-align: right">
                  <strong>ʵ�ս�</strong></td>
              <td class="righttd">
                  &nbsp;<asp:TextBox CssClass="textbox" ID="TxtRealMoney" runat="server" style="text-align:center" Width="61px" Text="100"></asp:TextBox>
                  Ԫ
              </td>
            </tr>
          </tbody>
           <tr>
              <td align="right" class="lefttd" style="text-align: right">
                  <strong>��ע˵����</strong></td>
              <td class="righttd">
                  &nbsp;<asp:TextBox CssClass="textbox" ID="TxtRemark" runat="server" TextMode="multiLine" Width="364px" Height="80" Text="��̨��ֵ"></asp:TextBox>&nbsp;</td>
          </tr>
      </table>
      <div class="pop-button">
          <% if (!string.IsNullOrEmpty(KSCMS.S("groupId"))){ %>
      <asp:Button ID="Button3" runat="server" CssClass="button" Text="ȷ����ֵ" OnClick="Button2_Click" />
          <%}else{ %>
      <asp:Button ID="Button1" runat="server" CssClass="button" Text="ȷ����ֵ" OnClick="Button1_Click" />
          <%} %>
         <asp:Button ID="Button2" runat="server" CssClass="button" Text="�ر�ȡ��" /></div>
</asp:Panel>

<asp:Panel ID="Panel2" runat="server" Width="100%" Visible="false">
    <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
         <tr>
              <td align="right" class="lefttd" style="width:150px"><strong>�� �� ����</strong></td>
              <td class="righttd">&nbsp;<%=userNames %></td>
          </tr>
      <tr>
          <td align="right" class="lefttd" style="text-align: right">
                  VIP��Чʱ������
            </td>
           <td><asp:TextBox ID="TextBox1" runat="server" CssClass="textbox Wdate"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" ></asp:TextBox></td>
     </tr>
      <tr>
          <td align="right" class="lefttd" style="text-align: right">
      ��ͨ��ر�VIP 
         </td>
         <td>
              <asp:RadioButtonList ID="RdbEnable" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                    <asp:ListItem Value="0" Selected="0">�ر�</asp:ListItem>
                    <asp:ListItem Value="1">��ͨ</asp:ListItem>
                </asp:RadioButtonList>
      </td>
      </tr> 
    </table>
    <div class="pop-button">
       <asp:Button ID="Button4" runat="server" CssClass="button" Text="ȷ�Ͽ�ͨ" OnClick="Button3_Click" />
      <asp:Button ID="Button5" runat="server" CssClass="button" Text="�ر�ȡ��" OnClientClick="parent.isreload = false;parent.box.close();" />
    </div>
   
</asp:Panel>

</asp:Content>
