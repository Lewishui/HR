<%@ Page Language="C#" ValidateRequest="false" EnableEventValidation="false" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_AddMoney" Title="预付款" Codebehind="KS.AddMoney.aspx.cs" %>
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
                jQuery("#<%=TxtRemark.ClientID%>").val("后台充值");
            } else {
                jQuery("#<%=TxtRemark.ClientID%>").val("后台扣费");
            }
        }

    </script>
     <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable" style="table-layout:fixed"> 
          <% if (groupId > 0){ %>
         <tr>
              <td align="right" class="lefttd" style="width:150px"><strong>用 户 组：</strong></td>
              <td class="righttd">&nbsp;<%=userNames %></td>
          </tr>
         <%}else{ %>
          <tr>
              <td align="right" class="lefttd" style="width:150px"><strong>用 户 名：</strong></td>
              <td class="righttd" style="word-break:break-all;">&nbsp;<%=userNames %></td>
          </tr>
         <%} %>
         <tr>
             <td align="right" class="lefttd" style="text-align: right">
                 <strong>充值类型：</strong></td>
             <td class="righttd">
                  <asp:DropDownList ID="DrpCZType" runat="server">
                      <asp:ListItem Value="0">预付款</asp:ListItem>
                      <asp:ListItem Value="1">点券</asp:ListItem>
                      <asp:ListItem Value="2">积分</asp:ListItem>
                  </asp:DropDownList>
                 <span id="shows" style="display:none">
                  <asp:CheckBox ID="CkbAvailableScore"  Checked="true" runat="server" Text="同时加入可用积分"/></span>
            </td>
         </tr>
        
         <tr>
             <td align="right" class="lefttd" style="text-align: right">
                 <strong>操作类型：</strong></td>
             <td class="righttd">
                 <asp:RadioButtonList ID="RdbType" runat="server" RepeatDirection="Horizontal">
                     <asp:ListItem Selected="True" Value="1">增加</asp:ListItem>
                     <asp:ListItem Value="2">减少</asp:ListItem>
                 </asp:RadioButtonList></td>
         </tr>
           <tr>
              <td align="right" class="lefttd" style="text-align: right">
                  <strong>操作金额：</strong></td>
              <td class="righttd">
                  &nbsp;<asp:TextBox CssClass="textbox" ID="TxtPoint" runat="server" style="text-align:center" Width="61px" Text="100"></asp:TextBox></td>
          </tr>
          <tbody id="ShowDiscount">
              <tr>
              <td align="right" class="lefttd" style="text-align: right">
                  <strong>折 扣 率：</strong></td>
              <td class="righttd">
                  &nbsp;<asp:TextBox CssClass="textbox" ID="TxtDiscount" runat="server" style="text-align:center" Width="61px" Text="1"></asp:TextBox>
                  折&nbsp;&nbsp;<span class="tips">如0.9表示9折。</span>
              </td>
            </tr>
              <tr>
              <td align="right" class="lefttd" style="text-align: right">
                  <strong>实收金额：</strong></td>
              <td class="righttd">
                  &nbsp;<asp:TextBox CssClass="textbox" ID="TxtRealMoney" runat="server" style="text-align:center" Width="61px" Text="100"></asp:TextBox>
                  元
              </td>
            </tr>
          </tbody>
           <tr>
              <td align="right" class="lefttd" style="text-align: right">
                  <strong>备注说明：</strong></td>
              <td class="righttd">
                  &nbsp;<asp:TextBox CssClass="textbox" ID="TxtRemark" runat="server" TextMode="multiLine" Width="364px" Height="80" Text="后台充值"></asp:TextBox>&nbsp;</td>
          </tr>
      </table>
      <div class="pop-button">
          <% if (!string.IsNullOrEmpty(KSCMS.S("groupId"))){ %>
      <asp:Button ID="Button3" runat="server" CssClass="button" Text="确定充值" OnClick="Button2_Click" />
          <%}else{ %>
      <asp:Button ID="Button1" runat="server" CssClass="button" Text="确定充值" OnClick="Button1_Click" />
          <%} %>
         <asp:Button ID="Button2" runat="server" CssClass="button" Text="关闭取消" /></div>
</asp:Panel>

<asp:Panel ID="Panel2" runat="server" Width="100%" Visible="false">
    <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
         <tr>
              <td align="right" class="lefttd" style="width:150px"><strong>用 户 名：</strong></td>
              <td class="righttd">&nbsp;<%=userNames %></td>
          </tr>
      <tr>
          <td align="right" class="lefttd" style="text-align: right">
                  VIP有效时间设置
            </td>
           <td><asp:TextBox ID="TextBox1" runat="server" CssClass="textbox Wdate"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" ></asp:TextBox></td>
     </tr>
      <tr>
          <td align="right" class="lefttd" style="text-align: right">
      开通或关闭VIP 
         </td>
         <td>
              <asp:RadioButtonList ID="RdbEnable" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                    <asp:ListItem Value="0" Selected="0">关闭</asp:ListItem>
                    <asp:ListItem Value="1">开通</asp:ListItem>
                </asp:RadioButtonList>
      </td>
      </tr> 
    </table>
    <div class="pop-button">
       <asp:Button ID="Button4" runat="server" CssClass="button" Text="确认开通" OnClick="Button3_Click" />
      <asp:Button ID="Button5" runat="server" CssClass="button" Text="关闭取消" OnClientClick="parent.isreload = false;parent.box.close();" />
    </div>
   
</asp:Panel>

</asp:Content>
