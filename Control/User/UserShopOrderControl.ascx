<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserShopOrderControl.ascx.cs" Inherits="Kesion.NET.WebSite.User.UserShopOrderControl" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.BLL" %>
<%@ Import Namespace="Kesion.Cache" %>

<%
    if (KSCMS.S("from") == "listuserdetail")
    { %>
<div class="content-area">    
 <div class="tabs_header">
    <ul class="tabs">
        <li><a href="javascript:;" onclick="loadUserDetail(<%=Utils.StrToInt(KSCMS.S("userid")) %>,0)"><span>基本信息</span></a></li>
        <li class='active'><a href="javascript:;" onclick="loadUserDetail(<%=Utils.StrToInt(KSCMS.S("userid")) %>,3,1)"><span>订单记录</span></a></li>
        <li><a href="javascript:;" onclick="loadUserDetail(<%=Utils.StrToInt(KSCMS.S("userid")) %>,1,1)"><span>登录记录</span></a></li>
        <li><a href="javascript:;" onclick="loadUserDetail(<%=Utils.StrToInt(KSCMS.S("userid")) %>,2,1)"><span>手机绑定记录</span></a></li>
    </ul>
 </div>
<%} %>
 <asp:Repeater ID="RptShopOrder" runat="server" onitemdatabound="Repeater1_ItemDataBound">
          <HeaderTemplate>
          <table width="99%" class="CTable nTable"  border="0" cellpadding="1" cellspacing="1">
              <tr class="CTitle">
               <td align="center"><b>采购时间</b></td>
               <td align="center"><b>订单编号</b></td>
               <td align="center"><b>用户名</b></td>
               <td align="center"><b>数量</b></td>
               <td align="center"><b>金额(元)</b></td>
              </tr>
          </HeaderTemplate>
         <ItemTemplate>
           <tr onmouseover="this.className='CtrMouseOver'" onmouseout="this.className='CtrMouseOut'">
                <td class="Ctd" style="text-align:center"> <%# Eval("Inputtime") %> </td>
                <td class="Ctd" style="text-align:center"> <%# Eval("orderid") %> </td>
                <td class="Ctd" style="text-align:center"> <%# Eval("username") %> </td>
                <td class="Ctd" style="text-align:center"> <%# DataFactory.GetOnlyValue("select sum(num) From KS_ProOrderItem Where orderid='"+Eval("OrderID")+"'") %> </td>
                <td class="Ctd" style="text-align:center"> <%# Kesion.APPCode.Public.ReturnShopPrice(Convert.ToString(Eval("NoUseCouponMoney"))) %> </td>
              </tr>
       </ItemTemplate>
             <FooterTemplate>
              <tr class="tdbg emptycss" style="display:<%# bool.Parse((RptShopOrder.Items.Count==0).ToString())?"":"none"%>">
                <td class="Ctd" style="text-align:center" colspan="12">
                  还没有任何的订单！
                </td>
               </tr> 
              <tr class="tdbg" style="display:<%# bool.Parse((RptShopOrder.Items.Count>0).ToString())?"":"none"%>">
                <td class="Ctd" style="text-align:right" colspan="4">
                  本页合计：
                </td>
                  <td class="Ctd price-color" style="text-align:center; font-size:18px">
                      <%=MyCache.GetCurrencySymbol %><%=Kesion.APPCode.Public.ReturnShopPrice(pageTotalMoney) %>
                  </td>
               </tr> 
                 <tr class="tdbg" style="display:<%# bool.Parse((RptShopOrder.Items.Count>0).ToString())?"":"none"%>">
                <td class="Ctd" style="text-align:right" colspan="4">
                  所有合计：
                </td>
                  <td class="Ctd price-color" style="text-align:center; font-size:18px">
                      <%=MyCache.GetCurrencySymbol %><%=Kesion.APPCode.Public.ReturnShopPrice(DataFactory.GetOnlyValue("Select Sum(NoUseCouponMoney) From KS_ProOrder o  inner JOIN  KS_User u on U.username=o.username"+param)) %>
                  </td>
               </tr> 
           </table>
          </FooterTemplate>
</asp:Repeater>
<asp:Label ID="LabPage" runat="server" CssClass="pageList"></asp:Label>
</div>