<%@ Page Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_Consumer" Title="Untitled Page" Codebehind="Consumer.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

<div class="r_tybox nomar">
        <div class="tabs">	
			<ul>
				<li><a href="LogMoney.aspx">�ʽ���ϸ</a></li>
				<li  class="puton"><a href="Consumer.aspx"><%=MyCache.GetCacheConfig(49) %>��ϸ</a></li>
				<li><a href="LogScore.aspx">������ϸ</a></li>
			</ul>
		</div>
        <div class="clear"></div>
        <div class="tips"><a href='Consumer.aspx' style="color:#ff6600">�����м�¼[<%=InNum+OutNum %>]</a> ��<a href='Consumer.aspx?IncomeOrPayOut=1' style="color:Green">�����¼[<%=InNum %>]</a> ��<a href='?IncomeOrPayOut=2'  style="color:blue">֧����¼[<%=OutNum %>]</a></div>
		   
    <asp:Repeater ID="Repeater1" runat="server">
    <HeaderTemplate>
    <div class="r_padbox nopadtop">
    <table id="tablist" width="100%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
      <tr align="center" class="title">
        	<td width="60" align="center">�û�</td>
        	<td align="center">����ʱ��</td>
            <td align="center" nowrap> ����(<%=MyCache.GetCacheConfig(50) %>) </td>
            <td align="center" nowrap> ֧��(<%=MyCache.GetCacheConfig(50) %>) </td>
            <td align="center">ժҪ</td>
	        <td align="center" nowrap>���(<%=MyCache.GetCacheConfig(50) %>)</td>
	        <td align="center">��ע</td>
        </tr>
    </HeaderTemplate>
    <ItemTemplate>
       <tr class="tdbg">
          <td class="splittd" align="center"><%# Eval("UserName") %></td>
          <td class="splittd" style="text-align:center">
         <%# Utils.FormatHumanizedTime(Convert.ToDateTime(Eval("AddDate")))%>
          </td>
          <td class="splittd" align="center"><%# GetPoint(Convert.ToDouble(Eval("point")),Convert.ToInt16(Eval("Inoroutflag")),1) %></td>
          <td class="splittd" align="center">
         <%# GetPoint(Convert.ToDouble(Eval("point")),Convert.ToInt16(Eval("Inoroutflag")),2) %>
          </td>
          <td class="splittd" align="center">
          <%#GetOpType(Convert.ToInt16(Eval("Inoroutflag"))) %>
          </td>
          <td class="splittd" align="center">
          <%# GetNowPoint(Convert.ToDouble(Eval("nowpoint"))) %>
          </td>
          <td class="splittd" style="width:200px;word-break:break-all;color:#999;">
          <%#Eval("remark") %>
          </td>
      </tr>      
    </ItemTemplate>
     <FooterTemplate>
      <tr class="tdbg emptycss" style="display:<%# bool.Parse((Repeater1.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="10">
                  û�����Ѽ�¼��
                </td>
           </tr> 
    </table>
     </FooterTemplate>
    </asp:Repeater>
    
    <div class="fy_box"><KS:Page ID="Page1" runat="server" /></div>

	</div>
</div>

</asp:Content>

