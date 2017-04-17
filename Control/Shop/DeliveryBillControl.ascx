<%@ Control Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Shop.DeliveryBillControl" Codebehind="DeliveryBillControl.ascx.cs" %>
<%@ Import Namespace="Kesion.Cache"%>
<asp:Panel ID="Panel1" runat="server">
<table class="CTable" cellSpacing=1 cellPadding=1 width="99%" border=0>
    <tr class=tdbg>
      <td align=right width="15%">客户姓名：</td>
      <td><asp:Label ID="LabClientName" runat="server" Text=""></asp:Label>(用户名：<asp:Label ID="LabUserName" runat="server" Text=""></asp:Label>)</td>
        
    </tr>
    <tr class=tdbg>
      <td align=right width="15%">支付内容：</td>
      <td>
          订单编号：<asp:Label ID="LabOrderID" runat="server" Text=""></asp:Label>
          订单金额：<span style="font-weight:bold;font-size:16px;color:brown"><%=MyCache.GetCurrencySymbol %><asp:Label ID="LabOrderTotalPrice" runat="server" Text=""></asp:Label></span> <%=MyCache.GetCurrencyUnit %>   已付款： <%=MyCache.GetCurrencySymbol %><span style="font-weight:bold;font-size:16px;color:green"><asp:Label ID="LabMoneyReceipt" runat="server" Text=""></asp:Label></span> <%=MyCache.GetCurrencyUnit %>
        
      </td>
    </tr>
    <tr class=tdbg>
      <td align=right width="15%">收货信息：</td>
      <td>
      收货地址：<asp:Label ID="LabAddress" runat="server" Text=""></asp:Label>（收 货 人：<asp:Label ID="LabRealName" runat="server" Text=""></asp:Label>
      &nbsp;&nbsp;联系电话：<asp:Label ID="LabTel" runat="server" Text=""></asp:Label>
      &nbsp;&nbsp;邮政编码：<asp:Label ID="LabZipCode" runat="server" Text=""></asp:Label>）
      
      
      </td>
    </tr>
    
    <tr class=tdbg id="alipay" visible="false" runat="server">
      <td align=right width="15%">支付宝交易号：</td>
      <td><asp:Label ID="LabAlipaytradeno" Text="" runat="server"></asp:Label>
      <br /><span style='font-weight:Bold;color:green'>本单采用支付宝担保交易,发货操作同时改变支付宝订单状态。</span></td>
    </tr>

    
    <tr class=tdbg>
      <td align=right width="15%">发货日期：</td>
      <td>
          <asp:TextBox  CssClass="textbox" ID="TxtDeliverDate" runat="server"></asp:TextBox>
          格式:YYYY-MM-DD hh:mm:ss</td>
    </tr>
    <tr class=tdbg>
      <td align=right width="15%">快递公司：</td>
      <td>
         <asp:DropDownList CssClass="select" ID="DrpDeliveryCorpId" runat="server"></asp:DropDownList>
     快递单号：<asp:TextBox  CssClass="textbox" ID="TxtExpressOrderID" runat="server" Width="200px"></asp:TextBox> </td>
    </tr>
  
    <tr class=tdbg>
      <td align=right width="15%">经手人：</td>
      <td>
      <asp:TextBox  CssClass="textbox" ID="TxtAdminName" runat="server" Width="200px"></asp:TextBox>
    </tr>
    <tr class=tdbg>
      <td align=right width="15%">备注：</td>
      <td>
      <asp:TextBox  CssClass="textbox" ID="TxtRemark" runat="server" Width="350px"></asp:TextBox>
    </tr>
    
    <tr class=tdbg>
      <td align=right width="15%">通知会员：</td>
      <td>
      <asp:CheckBox ID="SendMessageToUser" runat="server" Checked="true" Text="同时使用站内短信通知会员已经发货" /><br />
      <asp:CheckBox ID="SendMailToUser" runat="server" Checked="true" Text="同时发送邮件通知会员已经发货" />
            <%
       if (MyCache.GetCacheConfig(32) == "1")
        {  
      %>
     <br /> <asp:CheckBox ID="SendMobileToUser" runat="server" Checked="true" Text="同时发送手机短信通知会员已经发货" /></td>
      <%} %>
      
      </td>
    </tr>

    <tr class=tdbg align=middle>
      <td colSpan=2 height=30>
      <asp:Button ID="BtnSave" runat="server" Text="确定发货" CssClass="button" OnClick="BtnSave_Click" />
 &nbsp;
        <Input class=button onclick="parent.isreload = false; parent.box.close();" type=button value=取消返回 name=Submit></td>
    </tr>
  </table>
</asp:Panel>

