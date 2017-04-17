<%@ Control Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Shop.BankPayControl" Codebehind="BankPayControl.ascx.cs" %>
<%@ Import Namespace="Kesion.Cache"%>
<table class="CTable" cellSpacing=1 cellPadding=1 width="99%" border=0>
    <tr class=tdbg>
      <td align=right width="15%">�ͻ�������</td>
      <td><asp:Label ID="LabClientName" runat="server" Text=""></asp:Label>(�û�����<asp:Label ID="LabUserName" runat="server" Text=""></asp:Label>)</td>
        
    </tr>
    <tr class=tdbg>
      <td align=right width="15%">֧�����ݣ�</td>
      <td>
        <table cellSpacing="2" cellPadding="0" border="0">
          <tr class=tdbg style="display:none">
            <td align=right width="15%">������ţ�</td>
            <td><asp:Label ID="LabOrderID" runat="server" Text=""></asp:Label></td>
            <td>&nbsp;</td>
          </tr>
          <tr class=tdbg>
            <td align=right width="15%">������</td>
            <td>
               <span style="font-weight:bold;font-size:16px;color:brown">  <%=MyCache.GetCurrencySymbol %><asp:Label ID="LabOrderTotalPrice" runat="server" Text=""></asp:Label></span> <%=MyCache.GetCurrencyUnit %></td>
            <td>�� �� �<span style="font-weight:bold;font-size:16px;color:green"> <%=MyCache.GetCurrencySymbol %><asp:Label ID="LabMoneyReceipt" runat="server" Text=""></asp:Label></span> <%=MyCache.GetCurrencyUnit %></td>
</td>
          </tr>

        </table>
      </td>
    </tr>
    <tr class=tdbg>
      <td align=right width="15%">������ڣ�</td>
      <td>
          <asp:TextBox  CssClass="textbox" ID="TxtPayDate" runat="server"></asp:TextBox>
          ��ʽ:YYYY-MM-DD hh:mm:ss</td>
    </tr>
    <tr class=tdbg>
      <td align=right width="15%">����</td>
      <td>
          <%=MyCache.GetCurrencySymbol %><asp:TextBox  CssClass="textbox" ID="TxtMoney" MaxLength="10" runat="server" Width="54px"></asp:TextBox> <%=MyCache.GetCurrencyUnit %></td>
    </tr>
    <tr class=tdbg>
      <td align=right width="15%">��ע��</td>
      <td>
      <asp:TextBox  CssClass="textbox" ID="TxtRemark" runat="server" Width="350px"></asp:TextBox>
    </tr>
     <tr class="tdbg">
      <td align="right" width="15%">����Ա��</td>
      <td>
      <asp:TextBox  CssClass="textbox" ID="TxtHandlerName" runat="server" Width="200px"></asp:TextBox>
    </tr>
    <tr class=tdbg>
      <td align=right width="15%">֪ͨ��Ա��</td>
      <td>
      <asp:CheckBox ID="SendMessageToUser" runat="server" Checked="true" Text="ͬʱʹ��վ�ڶ���֪ͨ��Ա�Ѿ�֧���ɹ�" /><br />
      <asp:CheckBox ID="SendMailToUser" runat="server" Checked="true" Text="ͬʱ�����ʼ�֪ͨ��Ա�Ѿ�֧���ɹ�" /><br />
      <%
       if (MyCache.GetCacheConfig(32) == "1")
        {  
      %>
      <asp:CheckBox ID="SendMobileToUser" runat="server" Checked="true" Text="ͬʱ�����ֻ�����֪ͨ��Ա�Ѿ�֧���ɹ�" /></td>
      <%} %>
    </tr>
   
    <tr class=tdbg align=middle>
      <td colSpan=2 height=30>
      <asp:Button ID="BtnSave" runat="server" Text="��������Ϣ" CssClass="button" OnClick="BtnSave_Click" />
 &nbsp;
        <Input class=button onclick="parent.isreload = false; parent.box.close();" type=button value=ȡ������ name=Submit></td>
    </tr>
 <tr class=tdbg>
      <td colSpan=2 height=30><B><font color=#ff0000>ע�⣺�����Ϣһ��¼�룬�Ͳ������޸Ļ�ɾ���������ڱ���֮ǰȷ����������</font></B></td>
    </tr>
  </table>
