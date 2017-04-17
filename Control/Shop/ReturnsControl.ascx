<%@ Control Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Shop.ReturnsControl" Codebehind="ReturnsControl.ascx.cs" %>
  <%@ Import Namespace="Kesion.Cache"%>
<asp:Panel ID="Panel1" runat="server" Width="100%">
<table class="Border" cellSpacing=1 cellPadding=2 width="99%" align="center" border=0>
    <tr class=tdbg>
      <td align=right width="15%">�ͻ�������</td>
      <td><asp:Label ID="LabUserName" runat="server" Text=""></asp:Label>(<asp:Label ID="LabClientName" runat="server" Text=""></asp:Label>)</td>
    </tr>
    <tr class=tdbg>
      <td align=right width="15%">֧�����ݣ�</td>
      <td>
        <table cellSpacing=2 cellPadding=0 border=0>
          <tr class=tdbg>
            <td align=right width="15%">������ţ�</td>
            <td><asp:Label ID="LabOrderID" runat="server" Text=""></asp:Label></td>
            <td>&nbsp;</td>
          </tr>
          <tr class=tdbg>
            <td align=right width="15%">������</td>
            <td>
                <span style="font-weight:bold;font-size:16px;color:brown"><%=MyCache.GetCurrencySymbol %><asp:Label ID="LabOrderTotalPrice" runat="server" Text=""></asp:Label></span> <%=MyCache.GetCurrencyUnit %>
                &nbsp;&nbsp;�� �� �<span style="font-weight:bold;font-size:16px;color:green"><%=MyCache.GetCurrencySymbol %><asp:Label ID="LabMoneyReceipt" runat="server" Text=""></asp:Label></span> <%=MyCache.GetCurrencyUnit %>
                
                </td>
            <td></td>
          </tr>

        </table>
      </td>
    </tr>
    <tr class=tdbg style="display:none">
      <td align=right width="15%">�ջ���Ϣ��</td>
      <td>
      ���ͷ�ʽ��<asp:Label ID="LabDeliveryType" runat="server" Text=""></asp:Label><br />
      �� �� �ˣ�<asp:Label ID="LabRealName" runat="server" Text=""></asp:Label><br />
      �ջ���ַ��<asp:Label ID="LabAddress" runat="server" Text=""></asp:Label><br />
      ��ϵ�绰��<asp:Label ID="LabTel" runat="server" Text=""></asp:Label><br />
      �������룺<asp:Label ID="LabZipCode" runat="server" Text=""></asp:Label><br />
      </td>
    </tr>
    
    <tr class=tdbg>
      <td align=right width="15%">�˻��˿����ڣ�</td>
      <td>
          <asp:TextBox  CssClass="textbox" ID="TxtDeliverDate" runat="server"></asp:TextBox>
          ��ʽ:YYYY-MM-DD hh:mm:ss</td>
    </tr>

    <tr class="tdbg">
      <td align="right" width="15%">�����ˣ�</td>
      <td>
      <asp:TextBox  CssClass="textbox" ID="TxtAdminName" runat="server" Width="200px"></asp:TextBox>
    </tr>
    <tr class="tdbg">
      <td align="right" width="15%">�˻��˿�ԭ��</td>
      <td>
      <asp:TextBox  CssClass="textbox" ID="TxtRemark" runat="server" Width="350px"></asp:TextBox>
      <span class="tips">����֪ͨ�ĸ������ݣ����Բ��</span>
    </tr>
    <tbody id="refund" runat="server">
     <tr class="tdbg">
      <td align="right" width="15%">�˿��</td>
      <td>
      <asp:TextBox  CssClass="textbox" ID="TxtMoney" runat="server" Width="50px"></asp:TextBox> <%=MyCache.GetCurrencyUnit %>
      </td>
    </tr>
     <tr class="tdbg">
      <td align="right" width="15%">�˿ʽ��</td>
      <td>
       <asp:RadioButtonList ID="RdbReturnMoneyType" runat="server">
        <asp:ListItem Value="1" Selected="True">������ӵ���Ա�ʽ������</asp:ListItem>
        <asp:ListItem Value="2">����������ʽ��������ת�ʣ��ֽ𽻸��ȵ�</asp:ListItem>
        <asp:ListItem Value="3">ԭ·�˻�</asp:ListItem>
       </asp:RadioButtonList>
      </td>
    </tr>
     <tbody id='returnbank' style='display:none'>
     <tr class="tdbg">
        <td  align="right">����������Ϣ��</td>
         <td> 
          �������ƣ�<asp:TextBox ID="TxtMoneyReturnBankName" MaxLength="100" width="200" runat="server" CssClass="textbox"></asp:TextBox> <span class="tips">���й���������ĳĳ������</span>
          <br />���п��ţ�<asp:TextBox ID="TxtMoneyReturnBankCard" MaxLength="100" width="200"  runat="server" CssClass="textbox"></asp:TextBox> <span class="tips">����ȷ��д���п��š�</span>
          <br />�� �� ����<asp:TextBox ID="TxtMoneyReturnCardName" MaxLength="100" width="200" runat="server" CssClass="textbox"></asp:TextBox> <span class="tips">����ȷ��д���п�������</span>

         </td>
     </tr>
    
     </tbody>
    
    </tbody>
    <tr class=tdbg>
      <td align=right width="15%">֪ͨ��Ա��</td>
      <td>
      <asp:CheckBox ID="SendMessageToUser" runat="server" Checked="true" Text="ͬʱʹ��վ�ڶ���֪ͨ��Ա�Ѿ��ɹ��˻��˿�" /><br />
      <asp:CheckBox ID="SendMailToUser" runat="server" Checked="true" Text="ͬʱ�����ʼ�֪ͨ��Ա�Ѿ��ɹ��˻��˿�" /><br />
      <asp:CheckBox ID="SendMessageToAgent" runat="server" Checked="true" Text="ͬʱʹ��վ�ڶ���֪ͨҵ��Ա(�Ƽ���)�Ѿ��ɹ��˻��˿�" /><br />
      <asp:CheckBox ID="SendMailToAgent" runat="server" Checked="true" Text="ͬʱ�����ʼ�֪ͨҵ��Ա(�Ƽ���)�Ѿ��ɹ��˻��˿�" /><br />
      <%
       if (MyCache.GetCacheConfig(32) == "1")
        {  
      %>
      <asp:CheckBox ID="SendMobileToUser" runat="server" Checked="true" Text="ͬʱ�����ֻ�����֪ͨ��Ա�Ѿ��ɹ��˻��˿�" /></td>
      <%} %>
    </tr>
    <tr class=tdbg align=middle>
      <td colSpan=2 height=30 style="color:Red">
     ע�⣺�˿���Ϣһ��¼�룬�Ͳ������޸Ļ�ɾ��,���Ҷ������Զ��������ϣ������ڱ���֮ǰȷ����������</td>
    </tr>

    <tr class=tdbg align=middle>
      <td colSpan=2 height=30>
      <asp:Button ID="BtnSave" runat="server" Text="ȷ���˻�" CssClass="button" OnClick="BtnSave_Click" />
 &nbsp;
        <Input class=button onclick="parent.isreload = false; parent.box.close();" type=button value=ȡ������ name=Submit></td>
    </tr>
  </table>

<script>
    function showbank() {
        var checkrad = jQuery("#<%=this.RdbReturnMoneyType.ClientID %> :radio[checked]").val();
        if (checkrad == 2) {
            jQuery("#returnbank").show();
        } else {
            jQuery("#returnbank").hide();
        }
    }
    jQuery(document).ready(function() {
        showbank();
    });
</script>
</asp:Panel>

<asp:Panel ID="Panel2" runat="server" Width="100%" Visible="false">
<table class="Border" cellSpacing=1 cellPadding=2 width="99%" align="center" border=0>
    <tr class=tdbg>
      <td align=right width="15%">�ͻ�������</td>
      <td><%=dr["username"].ToString()%>(<%=dr["realname"].ToString()%>)</td>
    </tr>
    <tr class=tdbg>
      <td align=right width="15%">֧�����ݣ�</td>
      <td>
        <table cellSpacing=2 cellPadding=0 border=0>
          <tr class=tdbg>
            <td align=right width="15%">������ţ�</td>
            <td><%=dr["orderid"].ToString()%></td>
            <td>&nbsp;</td>
          </tr>
          <tr class=tdbg>
            <td align=right width="15%">������</td>
            <td>
                <span style="font-weight:bold;font-size:16px;color:brown"><%=MyCache.GetCurrencySymbol %><%=Kesion.APPCode.Public.ReturnShopPrice(dr["orderTotalPrice"].ToString())%></span> <%=MyCache.GetCurrencyUnit %>
                &nbsp;&nbsp;�� �� �<span style="font-weight:bold;font-size:16px;color:green"><%=MyCache.GetCurrencySymbol %><%=Kesion.APPCode.Public.ReturnShopPrice(dr["moneyReceipt"].ToString())%></span> <%=MyCache.GetCurrencyUnit %>
                
                </td>
            <td></td>
          </tr>

        </table>
      </td>
    </tr>

    
    <tr class=tdbg>
      <td align=right width="15%">�����������ڣ�</td>
      <td>
          <asp:TextBox  CssClass="textbox" ID="TxtChangeDate" runat="server"></asp:TextBox>
          ��ʽ:YYYY-MM-DD hh:mm:ss</td>
    </tr>

    <tr class="tdbg">
      <td align="right" width="15%">�����ˣ�</td>
      <td>
      <asp:TextBox  CssClass="textbox" ID="TxtChangeHandler" runat="server" Width="200px"></asp:TextBox>
    </tr>
    <tr class=tdbg>
      <td align=right width="15%">��ݹ�˾��</td>
      <td>
         <asp:DropDownList CssClass="select" ID="DrpDeliveryCorpId" runat="server"></asp:DropDownList>
      </td>
    </tr>
    <tr class="tdbg">
      <td align="right" width="15%">��ݵ��ţ�</td>
      <td>
      <asp:TextBox  CssClass="textbox" ID="TxtChangeExpressOrderID" runat="server" Width="350px"></asp:TextBox>
    </tr>

    <tr class=tdbg>
      <td align=right width="15%">֪ͨ��Ա��</td>
      <td>
      <asp:CheckBox ID="CkbMessageTF" runat="server" Checked="true" Text="ͬʱʹ��վ�ڶ���֪ͨ��Ա�Ѿ��ɹ�����" /><br />
      <asp:CheckBox ID="CkbEmailTF" runat="server" Checked="true" Text="ͬʱ�����ʼ�֪ͨ��Ա�Ѿ��ɹ�����" /><br />
      <%
       if (MyCache.GetCacheConfig(32) == "1")
        {  
      %>
      <asp:CheckBox ID="CkbMobileTF" runat="server" Checked="true" Text="ͬʱ�����ֻ�����֪ͨ��Ա�Ѿ��ɹ�����" /></td>
      <%} %>
    </tr>
    <tr class=tdbg align=middle>
      <td colSpan=2 height=30 style="color:Red">
     ע�⣺������Ϣһ��¼�룬�Ͳ������޸Ļ�ɾ���������ڱ���֮ǰȷ����������</td>
    </tr>

    <tr class=tdbg align=middle>
      <td colSpan=2 height=30>
      <asp:Button ID="BtnChangeSave" runat="server" Text="ȷ������" OnClientClick="return(checkForm());" CssClass="button" OnClick="BtnChangeSave_Click" />
 &nbsp;
        <Input class=button onclick="parent.isreload = false; parent.box.close();" type=button value=ȡ������ name=Submit></td>
    </tr>
  </table>

    <script>
        function checkForm() {
            if ($("#<%=TxtChangeHandler.ClientID%>").val() == '') {
                KesionJS.Alert('�����뾭����!', "$('#<%=TxtChangeHandler.ClientID%>').focus();");
                return false;
            }
            if ($("#<%=TxtChangeExpressOrderID.ClientID%>").val() == '') {
                KesionJS.Alert('�������ݵ���!', "$('#<%=TxtChangeExpressOrderID.ClientID%>').focus();");
                return false;
            }
        }
    </script>

</asp:Panel>