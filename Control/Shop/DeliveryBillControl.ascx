<%@ Control Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Shop.DeliveryBillControl" Codebehind="DeliveryBillControl.ascx.cs" %>
<%@ Import Namespace="Kesion.Cache"%>
<asp:Panel ID="Panel1" runat="server">
<table class="CTable" cellSpacing=1 cellPadding=1 width="99%" border=0>
    <tr class=tdbg>
      <td align=right width="15%">�ͻ�������</td>
      <td><asp:Label ID="LabClientName" runat="server" Text=""></asp:Label>(�û�����<asp:Label ID="LabUserName" runat="server" Text=""></asp:Label>)</td>
        
    </tr>
    <tr class=tdbg>
      <td align=right width="15%">֧�����ݣ�</td>
      <td>
          ������ţ�<asp:Label ID="LabOrderID" runat="server" Text=""></asp:Label>
          ������<span style="font-weight:bold;font-size:16px;color:brown"><%=MyCache.GetCurrencySymbol %><asp:Label ID="LabOrderTotalPrice" runat="server" Text=""></asp:Label></span> <%=MyCache.GetCurrencyUnit %>   �Ѹ�� <%=MyCache.GetCurrencySymbol %><span style="font-weight:bold;font-size:16px;color:green"><asp:Label ID="LabMoneyReceipt" runat="server" Text=""></asp:Label></span> <%=MyCache.GetCurrencyUnit %>
        
      </td>
    </tr>
    <tr class=tdbg>
      <td align=right width="15%">�ջ���Ϣ��</td>
      <td>
      �ջ���ַ��<asp:Label ID="LabAddress" runat="server" Text=""></asp:Label>���� �� �ˣ�<asp:Label ID="LabRealName" runat="server" Text=""></asp:Label>
      &nbsp;&nbsp;��ϵ�绰��<asp:Label ID="LabTel" runat="server" Text=""></asp:Label>
      &nbsp;&nbsp;�������룺<asp:Label ID="LabZipCode" runat="server" Text=""></asp:Label>��
      
      
      </td>
    </tr>
    
    <tr class=tdbg id="alipay" visible="false" runat="server">
      <td align=right width="15%">֧�������׺ţ�</td>
      <td><asp:Label ID="LabAlipaytradeno" Text="" runat="server"></asp:Label>
      <br /><span style='font-weight:Bold;color:green'>��������֧������������,��������ͬʱ�ı�֧��������״̬��</span></td>
    </tr>

    
    <tr class=tdbg>
      <td align=right width="15%">�������ڣ�</td>
      <td>
          <asp:TextBox  CssClass="textbox" ID="TxtDeliverDate" runat="server"></asp:TextBox>
          ��ʽ:YYYY-MM-DD hh:mm:ss</td>
    </tr>
    <tr class=tdbg>
      <td align=right width="15%">��ݹ�˾��</td>
      <td>
         <asp:DropDownList CssClass="select" ID="DrpDeliveryCorpId" runat="server"></asp:DropDownList>
     ��ݵ��ţ�<asp:TextBox  CssClass="textbox" ID="TxtExpressOrderID" runat="server" Width="200px"></asp:TextBox> </td>
    </tr>
  
    <tr class=tdbg>
      <td align=right width="15%">�����ˣ�</td>
      <td>
      <asp:TextBox  CssClass="textbox" ID="TxtAdminName" runat="server" Width="200px"></asp:TextBox>
    </tr>
    <tr class=tdbg>
      <td align=right width="15%">��ע��</td>
      <td>
      <asp:TextBox  CssClass="textbox" ID="TxtRemark" runat="server" Width="350px"></asp:TextBox>
    </tr>
    
    <tr class=tdbg>
      <td align=right width="15%">֪ͨ��Ա��</td>
      <td>
      <asp:CheckBox ID="SendMessageToUser" runat="server" Checked="true" Text="ͬʱʹ��վ�ڶ���֪ͨ��Ա�Ѿ�����" /><br />
      <asp:CheckBox ID="SendMailToUser" runat="server" Checked="true" Text="ͬʱ�����ʼ�֪ͨ��Ա�Ѿ�����" />
            <%
       if (MyCache.GetCacheConfig(32) == "1")
        {  
      %>
     <br /> <asp:CheckBox ID="SendMobileToUser" runat="server" Checked="true" Text="ͬʱ�����ֻ�����֪ͨ��Ա�Ѿ�����" /></td>
      <%} %>
      
      </td>
    </tr>

    <tr class=tdbg align=middle>
      <td colSpan=2 height=30>
      <asp:Button ID="BtnSave" runat="server" Text="ȷ������" CssClass="button" OnClick="BtnSave_Click" />
 &nbsp;
        <Input class=button onclick="parent.isreload = false; parent.box.close();" type=button value=ȡ������ name=Submit></td>
    </tr>
  </table>
</asp:Panel>

