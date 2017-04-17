<%@ Page Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_MyCommentList" Title="商品评价管理" Codebehind="MyCommentList.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.BLL" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.HtmlTags" %>

<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<div class="r_tybox nomar">

<asp:Panel ID="ListPannel" runat="server">
	<div class="tabs">	
        <ul>
            <%if (KSCMS.S("fight") != "1")
                { %>
            <li><a href="myorder.aspx">全部订单(<%=DataFactory.GetOnlyValue("select count(1) From KS_ProOrder Where ordertype!=2 and  UserName='" + (new TemporaryVar()).UserName + "'")  %>)</a></li>
            <li<%if (KSCMS.S("show") == "2") Response.Write(" class='puton'"); %>><a href="myorder.aspx?show=2">三个月内的订单(<%=DataFactory.GetOnlyValue("select count(1) From KS_ProOrder Where datediff(month,[InputTime],getdate())<=2 and ordertype!=2 and UserName='" + (new TemporaryVar()).UserName + "'")  %>)</a></li>
            <li<%if (KSCMS.S("show") == "-2") Response.Write(" class='puton'"); %>><a href="myorder.aspx?show=-2">待付款订单(<%=DataFactory.GetOnlyValue("select count(1) From KS_ProOrder Where MoneyReceipt<=0 and ordertype!=2 and UserName='" + (new TemporaryVar()).UserName + "'")  %>)</a></li>
            <li<%if (KSCMS.S("show") == "-3") Response.Write(" class='puton'"); %>><a href="myorder.aspx?show=-3">待收货订单(<%=DataFactory.GetOnlyValue("select count(1) From KS_ProOrder Where DeliverStatus=1 and ordertype!=2 and UserName='" + (new TemporaryVar()).UserName + "'")  %>)</a></li>
            <li><a href="mycomment.aspx">待评价(<%=DataFactory.GetOnlyValue("select count(1) From KS_ProOrder a inner Join KS_ProOrderItem b on a.OrderID=b.OrderID Where (a.DeliverStatus=2 or a.status=2) and b.IsCmt=0 and ordertype!=2 and a.UserName='" + (new TemporaryVar()).UserName + "'")  %>)</a></li>
			<li  class="puton"><a href="mycommentList.aspx">已评价(<%=DataFactory.GetOnlyValue("select count(1) From KS_ProOrder a inner Join KS_ProOrderItem b on a.OrderID=b.OrderID Where (a.DeliverStatus=2 or a.status=2) and b.IsCmt=1 and a.UserName='" + (new TemporaryVar()).UserName + "'")  %>)</a></li>
        <%}
            else if (KSCMS.S("fight") == "1")
            {%>
            <li><a href="MyFightGroupBuyOrder.aspx">所有(<%=DataFactory.GetOnlyValue("select count(1) From KS_ProOrder Where ordertype=2 and UserName='"+(new TemporaryVar()).UserName+"'")  %>)</a></li>
			<li<%if (KSCMS.S("show")=="1") Response.Write (" class='puton'"); %>><a href="MyFightGroupBuyOrder.aspx?show=1">拼团中(<%=DataFactory.GetOnlyValue("select count(1) From KS_ProOrder a inner join KS_ProOrderItem o on a.orderid=o.orderid inner join KS_ProFightGroup f on o.infoid=f.id  Where ordertype=2 and GoupNum<>-1 and isend=0  and datediff(hour,InputTime,getdate())<limittime and UserName='"+(new TemporaryVar()).UserName+"'")%>)</a></li>
            <li<%if (KSCMS.S("show")=="2") Response.Write (" class='puton'"); %>><a href="MyFightGroupBuyOrder.aspx?show=2">单独购(<%=DataFactory.GetOnlyValue("select count(1) From KS_ProOrder a inner join KS_ProOrderItem o on a.orderid=o.orderid inner join KS_ProFightGroup f on o.infoid=f.id  Where ordertype=2 and GoupNum=-1 and isend=-1  and UserName='"+(new TemporaryVar()).UserName+"'")%>)</a></li>
			<li<%if (KSCMS.S("show")=="3") Response.Write (" class='puton'"); %>><a href="MyFightGroupBuyOrder.aspx?show=3">已成团(<%=DataFactory.GetOnlyValue("select count(1) From KS_ProOrder a inner join KS_ProOrderItem o on a.orderid=o.orderid inner join KS_ProFightGroup f on o.infoid=f.id  Where ordertype=2 and GoupNum<>-1 and isend=1  and UserName='"+(new TemporaryVar()).UserName+"'")%>)</a></li>
            <li<%if (KSCMS.S("show")=="4") Response.Write (" class='puton'"); %>><a href="MyFightGroupBuyOrder.aspx?show=4">不成团(<%=DataFactory.GetOnlyValue("select count(1) From KS_ProOrder a inner join KS_ProOrderItem o on a.orderid=o.orderid inner join KS_ProFightGroup f on o.infoid=f.id  Where ordertype=2 and GoupNum<>-1 and isend=2   and datediff(hour,InputTime,getdate())>=limittime and UserName='"+(new TemporaryVar()).UserName+"'")%>)</a></li>
            <li><a href="mycomment.aspx?fight=1">待评价(<%=DataFactory.GetOnlyValue("select count(1) From KS_ProOrder a inner Join KS_ProOrderItem b on a.OrderID=b.OrderID Where (a.DeliverStatus=2 or a.status=2) and b.IsCmt=0 and ordertype=2 and a.UserName='" + (new TemporaryVar()).UserName + "'")  %>)</a></li>
			<li class='puton'><a href="mycommentList.aspx?fight=1">已评价(<%=DataFactory.GetOnlyValue("select count(1) From KS_ProOrder a inner Join KS_ProOrderItem b on a.OrderID=b.OrderID Where (a.DeliverStatus=2 or a.status=2) and b.IsCmt=1 and ordertype=2 and a.UserName='" + (new TemporaryVar()).UserName + "'")  %>)</a></li>
        <%} %>
        </ul>
	</div>


  <asp:Repeater ID="Repeater1" runat="server">
          <HeaderTemplate>
<div class="r_padbox">	          
          <table width="98%" align="center" border="0" cellpadding="1" cellspacing="1" class="border">
              <tr class="title">
               <td height="25" ><b>序号</b></td>
               <!--<td><b>订单号</b></td>-->
               <td><b>评价商品</b></td>
               <td style="text-align:center"><b>评价内容</b></td>
               <td style="text-align:center"><b>评价时间</b></td>
               <td style="text-align:center"><b>评价</b></td>
               <td style="text-align:center"><b>星星</b></td>
               <td style="text-align:center"><b>状态</b></td>
              </tr>
          </HeaderTemplate>
         <ItemTemplate>
             <TR>
				 <td class="splittd" style="text-align:center">
				 <strong>
				<%# Container.ItemIndex + 1 + (CurrPage - 1) * PageSize%>、
				</strong>
				</td>
                <!--<td class="splittd" ></td>-->
                <td class="splittd" title="订单号：<%# Eval("OrderID")%>">
                <%# Kesion.NET.WebSite.Admin.Shop.Admin_ShopComment.GetProductTitle(Utils.StrToInt(Eval("ProID")),Utils.StrToInt(Eval("OrderType"))) %>
                </td>
                 <td class="splittd" > <%# Utils.CutStr(Convert.ToString(Eval("Content")),60) %></td>
                 <td class="splittd" style="text-align:center"> <%# Utils.FormatHumanizedTime(Convert.ToDateTime(Eval("AddDate"))) %></td>
                 <td class="splittd" style="text-align:center"> <%# Convert.ToString(Eval("CmtType"))=="0"?"好评":(Convert.ToString(Eval("CmtType"))=="1"?"中评":"差评") %></td>
                 <td class="splittd" style="text-align:center"> <img src="../../SysImg/star/star-<%# Eval("StarNum") %>.jpg" title="<%# Eval("StarNum") %>颗星"/></td>
                 <td class="splittd" style="text-align:center">                 
                     <%# Convert.ToString(Eval("status"))=="1"?"<span style='color:green'>已审核</span>":"<span style='color:red'>未审核</span>" %>
               </td>
			</TR>
			
             
         </ItemTemplate>
          <FooterTemplate>
           <tr class="tdbg emptycss" style="display:<%# bool.Parse((Repeater1.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="7">
                 您没有评价！
                </td>
               </tr> 
           </table>
          </FooterTemplate>
        </asp:Repeater>
       <br />
     <div class="fy_box"><KS:Page ID="Page1" runat="server" /></div>
</asp:Panel>


	</div>
</div>
</asp:Content>

