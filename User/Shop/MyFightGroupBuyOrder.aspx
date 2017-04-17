<%@ Page Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_MyFightGroupBuyOrder" Title="我的订单" Codebehind="MyFightGroupBuyOrder.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.BLL" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.HtmlTags" %>
<%@ Import Namespace="Kesion.APPCode" %>

<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

<asp:Panel ID="ListPannel" runat="server">
<style>
.border .wait,.border .wff,.border .wfk,.border .wxf{color:red;}
.border .yff,.border .yfq,.border .yqs,.border .confirm{color:green;}
.border .yxf {
color:#999; }
.border .wx{color:#999;}
.border .jq{color:#888;}
.border .tk{color:Purple}
.border .ddff{color:brown;}
.border .list_link{line-height:22px;border-left:1px solid #efefef;padding:5px;}
.border .img img{border:1px solid #ccc;padding:1px;}
</style>
<div class="r_tybox nomar">
	<div class="tabs">	
			<ul>
				<li<%if (string.IsNullOrEmpty(KSCMS.S("show"))) Response.Write (" class='puton'"); %>><a href="MyFightGroupBuyOrder.aspx">所有(<%=DataFactory.GetOnlyValue("select count(1) From KS_ProOrder Where ordertype=2 and UserName='"+(new TemporaryVar()).UserName+"'")  %>)</a></li>
				<li<%if (KSCMS.S("show")=="1") Response.Write (" class='puton'"); %>><a href="MyFightGroupBuyOrder.aspx?show=1">拼团中(<%=DataFactory.GetOnlyValue("select count(1) From KS_ProOrder a inner join KS_ProOrderItem o on a.orderid=o.orderid inner join KS_ProFightGroup f on o.infoid=f.id  Where ordertype=2 and GoupNum<>-1 and isend=0  and datediff(hour,InputTime,getdate())<limittime and UserName='"+(new TemporaryVar()).UserName+"'")%>)</a></li>
                <li<%if (KSCMS.S("show")=="2") Response.Write (" class='puton'"); %>><a href="MyFightGroupBuyOrder.aspx?show=2">单独购(<%=DataFactory.GetOnlyValue("select count(1) From KS_ProOrder a inner join KS_ProOrderItem o on a.orderid=o.orderid inner join KS_ProFightGroup f on o.infoid=f.id  Where ordertype=2 and GoupNum=-1 and isend=-1  and UserName='"+(new TemporaryVar()).UserName+"'")%>)</a></li>
				<li<%if (KSCMS.S("show")=="3") Response.Write (" class='puton'"); %>><a href="MyFightGroupBuyOrder.aspx?show=3">已成团(<%=DataFactory.GetOnlyValue("select count(1) From KS_ProOrder a inner join KS_ProOrderItem o on a.orderid=o.orderid inner join KS_ProFightGroup f on o.infoid=f.id  Where ordertype=2 and GoupNum<>-1 and isend=1  and UserName='"+(new TemporaryVar()).UserName+"'")%>)</a></li>
                <li<%if (KSCMS.S("show")=="4") Response.Write (" class='puton'"); %>><a href="MyFightGroupBuyOrder.aspx?show=4">不成团(<%=DataFactory.GetOnlyValue("select count(1) From KS_ProOrder a inner join KS_ProOrderItem o on a.orderid=o.orderid inner join KS_ProFightGroup f on o.infoid=f.id  Where ordertype=2 and GoupNum<>-1 and isend=2   and datediff(hour,InputTime,getdate())>=limittime and UserName='"+(new TemporaryVar()).UserName+"'")%>)</a></li>
                    <li><a href="mycomment.aspx?fight=1">待评价(<%=DataFactory.GetOnlyValue("select count(1) From KS_ProOrder a inner Join KS_ProOrderItem b on a.OrderID=b.OrderID Where (a.DeliverStatus=2 or a.status=2) and b.IsCmt=0 and ordertype=2 and a.UserName='" + (new TemporaryVar()).UserName + "'")  %>)</a></li>
				<li><a href="mycommentList.aspx?fight=1">已评价(<%=DataFactory.GetOnlyValue("select count(1) From KS_ProOrder a inner Join KS_ProOrderItem b on a.OrderID=b.OrderID Where (a.DeliverStatus=2 or a.status=2) and b.IsCmt=1 and ordertype=2 and a.UserName='" + (new TemporaryVar()).UserName + "'")  %>)</a></li>
			</ul>
	</div>

	<div class="r_padbox">
    
  
    <div class="message"><div style="padding:20px">订单搜索：
    
        <asp:DropDownList ID="DrpTJ" runat="server">
            <asp:ListItem Value="1">订单号</asp:ListItem>            
        </asp:DropDownList>
        关键字：<asp:TextBox ID="TxtKey" runat="server" CssClass="textbox" />
        <asp:Button Text="搜索订单" runat="server" CssClass="button" OnClick="Unnamed1_Click" />
        </div>
   </div>
  <asp:Repeater ID="Repeater1" runat="server"  onitemdatabound="Repeater1_ItemDataBound" >

          <HeaderTemplate>
          <table width="98%" align="center" border="0" cellpadding="1" cellspacing="1" class="border">
              <tr class="title">
               <td height="25" width="40" nowrap><b>序号</b></td>
               <td style="width:500px;text-align:left">&nbsp;&nbsp;<b>商品</b></td>
               <td width="80" align="center"><b>单价</b></td>
               <td width="80" align="center"><b>数量</b></td>
               <td width="70" align="center"><b>总价</b></td>
               <td width="70" align="center" nowrap><b>状态</b></td>
               <td width="70" align="center" nowrap><b>操作</b></td>
              </tr>
          </HeaderTemplate>
         <ItemTemplate>
         
             <TR class="title1">
				 <td colspan="7" style="padding-top:2px;padding-bottom:2px;padding-left:10px;">
				 <strong>
				<%# Container.ItemIndex + 1 + (CurrPage - 1) * PageSize%>、 订单编号：<%#Eval("orderid")%>&nbsp;&nbsp;下单时间：<%# Utils.FormatHumanizedTime(Convert.ToDateTime(Eval("InputTime"))) %></strong><%# Convert.ToInt16(Eval("ordertype")) == 1 ? "<span style='color:Red'>团购</span>":string.Empty%><%# Convert.ToInt32(Eval("changescore")) >0 ? " <span style='color:green'>积分兑换</span>" : string.Empty%></td>
			</TR>
			<tr>
			<tr class="tdbg">
              <td class="list_link" align="center" width="25"></td>
			  <td  colspan="3" align="left">
             <asp:Repeater ID="Repeater2" runat="server">
               <ItemTemplate>
               <table width="100%" class="table1" cellpadding="0" cellspacing="0" border="0">
               <tr class="TR_BG_list">
                  <td class="splittd" align="left" style="width:500px">
                    <table border='0' width="100%" cellpadding="0" cellspacing="0">
		               <tr>
			            <td width="60" height="70" align="center" class="img"><img onerror="this.src='<%=MyCache.GetCacheShopConfig(9) %>';" src='<%# Eval("DefaultPic") %>' width='50' height='50' align='left'/></td>
			            <td>
                         <%# GetTitle(Convert.ToString(Eval("title")), Convert.ToString(Eval("fileName")), Convert.ToString(Eval("TurnUrl")), Utils.StrToInt(Eval("channelid")), Utils.StrToInt(Eval("classid")), Utils.StrToInt(Eval("infoid")), Convert.ToString(Eval("attributeCart")), Utils.StrToInt(Eval("attrid")))%>	            
		               </td>
		              </tr>
		             </table>
                  </td>
                  <td class="splittd" style="width:80px;"><%=MyCache.GetCurrencySymbol%><%# Public.ReturnShopPrice(Convert.ToString(Eval("Price"))) %></td>
                  <td class="splittd" style="width:80px;text-align:center"><%#Eval("num") %></td>
                </table> 
               
               </ItemTemplate>
             </asp:Repeater>
             </td>
             <td class="list_link" style="text-align:center" valign="top">
              <%# Utils.StrToInt(Eval("ChangeScore")) > 0 ? ""+Eval("ChangeScore") +"分+": string.Empty%>
              <%=MyCache.GetCurrencySymbol%><%# Public.ReturnShopPrice(Convert.ToString(Eval("OrderTotalPrice")))%></td>
             <td class="list_link" style="text-align:center" nowrap valign="top">
             <%# GetFightOrderStatus(Utils.StrToInt(Eval("isend")),Convert.ToString(Eval("OrderID")),Utils.StrToInt(Eval("status")), Convert.ToInt16(Eval("DeliverStatus")), Utils.StrToDecimal(Convert.ToString(Eval("MoneyReceipt"))), Utils.StrToDecimal(Convert.ToString(Eval("OrderTotalPrice"))))%>
             </td>
				<td nowrap class="list_link" style="text-align:center" valign="top">
                    <a href="ShowMyOrder.aspx?id=<%# Eval("id") %>">订单详情</a><br />
				    <a href="ShowMyFightOrder.aspx?id=<%# Eval("id") %>&groupnum=<%# Eval("GoupNum") %>" target="_blank">拼团详情</a>
                   <%--      <%# ((((float)Convert.ToDouble(Eval("MoneyReceipt")) > 0 &&Convert.ToString(Eval("DeliverStatus")) == "0") || Convert.ToString(Eval("DeliverStatus")) == "2") && Utils.StrToInt(Eval("status"))<=1 && Utils.StrToInt(Eval("IsBusinessConfirm"))==0) ? "<br/><a href='?action=UserOrderReturns&ordertype=fightgrouporder&id=" + Eval("id") + "'>退货退款</a>" : string.Empty%>--%>
                    <%# Convert.ToString(Eval("status")) == "0" && Convert.ToString(Eval("DeliverStatus")) == "0" && Utils.StrToFloat(Convert.ToString(Eval("MoneyReceipt"))) == 0 ? "<br /><a href='?action=delorder&id=" + Eval("id") + @"' onClick=""return(confirm('此操作不可逆，确定执行删除操作吗？'))"">订单删除</a>" : ""%>
				<%# Convert.ToDecimal(Eval("OrderTotalPrice"))>0 && Convert.ToString(Eval("PayStatus")) != "1" && Convert.ToInt16(Eval("status")) < 2  ? "<br/><a href='?action=UserOrderPay&id=" + Eval("id") + "'>订单支付</a>" : ""%>				
				<%# Convert.ToString(Eval("DeliverStatus")) == "1" ? @"<br/><a href='javascript:;' onclick=""KesionJS.Confirm('此操作不可逆，您确定收到商品了吗？', 'location.href=\'shop/ShowMyOrder.aspx?id=" + Eval("id") + @"&action=signorder\';', null);"">确认收货</a>" : ""%>
                 <%# !string.IsNullOrEmpty(MyCache.GetShopCommonConfig(42)) && Convert.ToString(Eval("ConsumptionMode")) == "1" && Convert.ToString(Eval("DeliverStatus")) != "0" ? "<br/><a href='ExpressLog.aspx?action=ExpressLog&OrderID="+Eval("OrderID")+"'>查看物流</a>" : string.Empty %>
                    <%# (Convert.ToString(Eval("Status"))== "1" &&  Convert.ToString(Eval("DeliverStatus")) == "2")? @"<br/><a href='javascript:;' onclick=""KesionJS.Confirm('订单一旦结清，就可能再对该订单进行任何操作，确定结清吗？', 'location.href=\'shop/ShowMyOrder.aspx?id=" + Eval("id") + @"&action=finishorder\';', null);"">结清订单</a>" : ""%>

				</td>

             </tr>
             
         </ItemTemplate>
          <FooterTemplate>
           <tr class="tdbg" style="display:<%# bool.Parse((Repeater1.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="7">
                  还没有任何的订单！
                </td>
               </tr> 
           </table>
          </FooterTemplate>
        </asp:Repeater>
        
        
        
           <br />
    
     <div class="fy_box"><KS:Page ID="Page1" runat="server" /></div>
    </asp:Panel>


<asp:Panel ID="ControlPannel" runat="server" Visible="false">
        <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
</asp:Panel>
	</div>
</div>

</asp:Content>

