<%@ Page Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.SignInList" Title="Untitled Page" Codebehind="SignInList.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <div class="r_tybox nomar">
     <div class="tabs">	
           <li<%=KSCMS.S("flag")==""?" class='puton'":string.Empty %>><a href="SignInList.Aspx">�ҵ�ǩ����¼</a></li>
           <li<%=KSCMS.S("flag")=="1"?" class='puton'":string.Empty %>><a href="SignInList.Aspx?flag=1">ǩ������</a></li>
        </div> 
          
    <asp:Panel ID="Panellist" runat="server">
    <div class="toptips tips">
     <span style="float:right">�����ڴ˲鿴����ǩ����</span> ���У�<asp:Label ID="Lab_Total_Info" runat="server" Text=""></asp:Label> ��ǩ����¼
   </div>
    <asp:Repeater ID="Repeater3" runat="server">
    <HeaderTemplate>
<div class="r_padbox">
         <table id="tablist2" width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
      <tr align="center" class="title">
        	<td>�û���</td>
        	<td>��ȡ����</td>
        	<td>ǩ��ʱ��</td>
            <td>IP��ַ</td>        	
        </tr>
    </HeaderTemplate>
    <ItemTemplate>
      <tr class="tdbg">
          <td class="splittd" align="center" nowrap><%#Eval("UserName") %></td>
          <td class="splittd" align="center" nowrap><%# Eval("num") %>&nbsp;<%# GetType(Utils.StrToInt(Eval("numtype"))) %></td>
          <td class="splittd" align="center" nowrap><%#Convert.ToDateTime(Eval("AddDate")).ToShortDateString() %></td>
          <td class="splittd" align="center" nowrap><%#Eval("UserIP")%></td>
        
      </tr>  

     </ItemTemplate>
     <FooterTemplate>
         <tr class="tdbg" style="display:<%# bool.Parse((Repeater3.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="10">
                  û��ǩ����¼��
                </td>
           </tr> 
      </table>
     </FooterTemplate>
    </asp:Repeater>
</asp:Panel>

<asp:Panel ID="Panellist1" runat="server">
    <div class="toptips tips">
     <span style="float:right">�����ڴ˲鿴����ǩ����</span> ���У�<asp:Label ID="Label1" runat="server" Text=""></asp:Label> ��ǩ����¼
   </div>
    <asp:Repeater ID="Repeater1" runat="server">
    <HeaderTemplate>
<div class="r_padbox">
         <table id="tablist2" width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
      <tr align="center" class="title">
        	<td>����</td>
        	<td>�û���</td>
        	<td>ǩ������</td>
            <td>����ǩ��״̬</td>        	
        </tr>
    </HeaderTemplate>
    <ItemTemplate>
        
      <tr class="tdbg">
          <td class="splittd" align="center" nowrap><%# Container.ItemIndex + 1%></td>
          <td class="splittd" align="center" nowrap><%#Eval("UserName") %></td>
          <td class="splittd" align="center" nowrap><%#Eval("countnum") %></td>
          <td class="splittd" align="center" nowrap><%# Kesion.BLL.DataFactory.Exists("KS_SignIn","username='"+Eval("username")+"' and year(adddate)="+DateTime.Now.Year+" and month(adddate)="+DateTime.Now.Month+" and day(adddate)="+DateTime.Now.Day)?"��ǩ��":"δǩ��" %></td>
        
      </tr>  

     </ItemTemplate>
     <FooterTemplate>
         <tr class="tdbg" style="display:<%# bool.Parse((Repeater1.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="10">
                  û��ǩ����¼��
                </td>
           </tr> 
      </table>
     </FooterTemplate>
    </asp:Repeater>
</asp:Panel>
	<div class="fy_box"><KS:Page ID="Page1" runat="server" /></div>
    <br /><br /><br />
	</div>
</asp:Content>