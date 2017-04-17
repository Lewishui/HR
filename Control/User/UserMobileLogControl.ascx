<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserMobileLogControl.ascx.cs" Inherits="Kesion.NET.WebSite.User.MobileLogControl" %>
<%@ Import Namespace="Kesion.Publics" %>


<%
    if (KSCMS.S("from") == "listuserdetail")
    { %>
<div class="content-area">    
 <div class="tabs_header">
    <ul class="tabs">
        <li><a href="javascript:;" onclick="loadUserDetail(<%=Utils.StrToInt(KSCMS.S("userid")) %>,0)"><span>基本信息</span></a></li>
        <li><a href="javascript:;" onclick="loadUserDetail(<%=Utils.StrToInt(KSCMS.S("userid")) %>,3,1)"><span>订单记录</span></a></li>
        <li><a href="javascript:;" onclick="loadUserDetail(<%=Utils.StrToInt(KSCMS.S("userid")) %>,1,1)"><span>登录记录</span></a></li>
        <li class='active'><a href="javascript:;" onclick="loadUserDetail(<%=Utils.StrToInt(KSCMS.S("userid")) %>,2,1)"><span>手机绑定记录</span></a></li>
    </ul>
 </div>
<%} %>
<asp:Repeater ID="LogMobileView" runat="server">
          <HeaderTemplate>
          <table width="99%" class="CTable nTable"  border="0" cellpadding="1" cellspacing="1">
              <tr class="CTitle">
               <td align="center"><b>绑定设备</b></td>
               <td align="center"><b>用户名</b></td>
               <td align="center"><b>绑定时间</b></td>
               <td align="center"><b>绑定时IP</b></td>
               <td align="center"><b>绑定手机号</b></td>
              </tr>
          </HeaderTemplate>
         <ItemTemplate>
           <tr onmouseover="this.className='CtrMouseOver'" onmouseout="this.className='CtrMouseOut'">
                <td class="Ctd" style="text-align:center">  <span style="color:#999;"><%# Utils.OrderDeviceName(Utils.StrToInt(Eval("DeviceType"))) %></span> </td>
                <td class="Ctd" style="text-align:center"><%# Eval("username") %> </td>
                <td class="Ctd" style="text-align:center"><%# Eval("AddDate") %>  </td>
                <td class="Ctd" style="text-align:center"> <%# Eval("UserIP") %> </td>
                <td class="Ctd" style="text-align:center">  <%# Eval("mobile") %></td>
              </tr>
       </ItemTemplate>
             <FooterTemplate>
              <tr class="tdbg emptycss" style="display:<%# bool.Parse((LogMobileView.Items.Count==0).ToString())?"":"none"%>">
                <td class="Ctd" style="text-align:center" colspan="12">
                  还没有任何的绑定记录！
                </td>
               </tr> 
             
           </table>
          </FooterTemplate>
</asp:Repeater>

<asp:Label ID="LabPage" runat="server"></asp:Label>
</div>