<%@ Page Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_Order" Title="我的订单" Codebehind="MyOrder.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.BLL" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.HtmlTags" %>
<%@ Import Namespace="Kesion.APPCode" %>

<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

<asp:Panel ID="ListPannel" runat="server">
<style>
.border .wait,.border .wff,.border .wfk,.border .wxf{color:red;}
.border .yff,.border .yfq,.border .yqs,.border .confirm,.border .yxf{color:green;}
.border .wx{color:#999;}
.border .jq{color:#888;}
.border .tk{color:Purple}
.border .ddff{color:brown;}
.border .list_link{line-height:22px;border-left:1px solid #efefef;padding:5px;}
.border .img img{border:1px solid #ccc;padding:1px;}
</style>

<script>
    function GetMyIds() {
        var sid = null;
        for (var i = 0; i < document.getElementsByName("ids").length; i++) {
            var KS = document.getElementsByName("ids")[i];
            if (KS.checked == true) {
                if (sid == null)
                    sid = KS.value;
                else
                    sid += "," + KS.value;
            }
        }
        return sid;
    }
    function CheckIds(action) {
        if (GetMyIds() == null) {
            if (action == "pay") {
                KesionJS.Alert('请选择要合并付款的订单！');
            } else if (action == "del") {
                KesionJS.Alert('请选择要批量删除的订单！');
            }
            return false;
        }
        if (action == "del") {
            return (confirm('已付款或是已结清的订单不可以删除，此操作不可逆，确认删除吗？'));
        }
    }
    function showHelpTips() {
        top.$.dialog({ title:'了解商品订购流程',content: $('#showbuytips').html(), fixed: true });
    } 
</script>
<div class="r_tybox nomar">
	<div class="tabs">	
			<ul>
				<li<%if (string.IsNullOrEmpty(KSCMS.S("show"))) Response.Write (" class='puton'"); %>><a href="myorder.aspx">全部订单(<%=DataFactory.GetOnlyValue("select count(1) From KS_ProOrder Where  ordertype!=2 and UserName='"+(new TemporaryVar()).UserName+"'")  %>)</a></li>
				<li<%if (KSCMS.S("show")=="2") Response.Write (" class='puton'"); %>><a href="myorder.aspx?show=2">三个月内的订单(<%=DataFactory.GetOnlyValue("select count(1) From KS_ProOrder Where ordertype!=2 and datediff(month,[InputTime],getdate())<=2 and UserName='"+(new TemporaryVar()).UserName+"'")  %>)</a></li>
				<li<%if (KSCMS.S("show")=="-2") Response.Write (" class='puton'"); %>><a href="myorder.aspx?show=-2">待付款订单(<%=DataFactory.GetOnlyValue("select count(1) From KS_ProOrder Where MoneyReceipt<=0 and ordertype!=2 and UserName='"+(new TemporaryVar()).UserName+"'")  %>)</a></li>
				<li<%if (KSCMS.S("show")=="-3") Response.Write (" class='puton'"); %>><a href="myorder.aspx?show=-3">待收货订单(<%=DataFactory.GetOnlyValue("select count(1) From KS_ProOrder Where DeliverStatus=1 and ordertype!=2 and UserName='"+(new TemporaryVar()).UserName+"'")  %>)</a></li>
				<li><a href="mycomment.aspx">待评价(<%=DataFactory.GetOnlyValue("select count(1) From KS_ProOrder a inner Join KS_ProOrderItem b on a.OrderID=b.OrderID Where (a.DeliverStatus=2 or a.status=2) and b.IsCmt=0 and ordertype!=2 and a.UserName='" + (new TemporaryVar()).UserName + "'")  %>)</a></li>
				<li><a href="mycommentList.aspx">已评价(<%=DataFactory.GetOnlyValue("select count(1) From KS_ProOrder a inner Join KS_ProOrderItem b on a.OrderID=b.OrderID Where (a.DeliverStatus=2 or a.status=2) and b.IsCmt=1 and a.UserName='" + (new TemporaryVar()).UserName + "'")  %>)</a></li>
			</ul>
	</div>
		<div class="r_padbox">

    <div style="display:none" id="showbuytips">
 	<strong>商品订购流程：</strong><br />
   <table width="800" border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td rowspan="5">1、客户下单-&gt;</td>
    <td rowspan="5">2、客户付款-&gt;</td>
    <td rowspan="5">3、客户申请退款?</td>
    <td rowspan="2" width="30" align="center">是</td>
    <td rowspan="2">管理员处理-&gt;</td>
    <td colspan="6" height="30">同意退款（结单）。</td>
  </tr>
  <tr>
    <td colspan="6" height="30">妥协交易，订单恢复正常。</td>
  </tr>
  <tr>
    <td rowspan="3" align="center">否</td>
    <td rowspan="3">4、管理员发货(开具发票)-&gt;</td>
    <td rowspan="3">5、客户确认收货-&gt;</td>
    <td rowspan="3">申请退换货？</td>
    <td rowspan="2" width="30" align="center">是</td>
    <td>申请退货退款</td>
    <td rowspan="2">管理员处理</td>
    <td height="30">同意退款或妥协交易（结单）。</td>
  </tr>
  <tr>
    <td height="30">申请换货</td>
    <td>同意换货，重新发货，订单状态恢复到步骤5</td>
  </tr>
  <tr>
    <td width="30" align="center">否</td>
    <td colspan="3" height="30">6、客户或管理员结清订单。</td>
  </tr>
</table>
</div>

    <div style="margin-bottom:5px;padding-left:10px;">
     <span style="float:right"><a href="javascript:;" onclick="showHelpTips()" style="cursor:help;color:red;font-size:14px;font-family:黑体;font-weight:bold">了解订购流程？</a></span>
    
    </div>
  <asp:Repeater ID="Repeater1" runat="server"  onitemdatabound="Repeater1_ItemDataBound" >
          <HeaderTemplate>
          <table width="98%" align="center" border="0" cellpadding="1" cellspacing="1" class="border">
              <tr class="title">
               <td height="25" width="40" nowrap><b></b></td>
               <td style="width:500px;text-align:left">&nbsp;&nbsp;<b>商品</b></td>
               <td width="80" align="center"><b>单价</b></td>
               <td width="80" align="center"><b>数量</b></td>
               <td width="70" align="center"><b>实付</b></td>
               <td width="70" align="center" nowrap><b>状态</b></td>
               <td width="70" align="center" nowrap><b>操作</b></td>
              </tr>
          </HeaderTemplate>
         <ItemTemplate>
             <TR class="title1">
				 <td colspan="7" style="padding-top:2px;padding-bottom:2px;padding-left:10px;">
                  <input type="checkbox" name="ids" id="ids" value='<%# Eval("OrderID") %>' <%# (Utils.StrToInt(Eval("status"))==2 ||Utils.StrToInt(Eval("paystatus"))==1)?" disabled":string.Empty %>/>
				 <strong>
				 订单编号：<%#Eval("orderid")%>&nbsp;&nbsp;下单时间：<%# Utils.FormatHumanizedTime(Convert.ToDateTime(Eval("InputTime"))) %></strong><%# Convert.ToInt16(Eval("ordertype")) == 1 ? (string.Concat("<span style='color:Red'>团购</span>",!string.IsNullOrEmpty(Eval("verifycode").ToString())?" 消费验证码[<span style='color:green'>"+Eval("verifycode").ToString()+"</span>]":string.Empty)):string.Empty%><%# Convert.ToInt32(Eval("changescore")) >0 ? " <span style='color:green'>积分兑换</span>" : string.Empty%></td>
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
                         <%# getProOrder(Utils.StrToInt((Eval("ClassID"))), Convert.ToString(Eval("FileName") + ""), Convert.ToString(Eval("TurnUrl") + ""), Utils.StrToInt(Eval("ItemID")), Utils.StrToInt(Eval("ChannelID")), Utils.StrToInt(Eval("InfoID")), string.IsNullOrEmpty(Convert.ToString(Eval("Title") + "")) ? Convert.ToString(Eval("Title") + "") : Convert.ToString(Eval("Title")), Utils.StrToInt(Eval("isBundleSale")), Utils.StrToInt(Eval("isChangeBuy")), Utils.StrToInt(Eval("isLimitBuy")),Convert.ToString(Eval("AttributeCart")),Utils.StrToInt(Eval("attrID")))%>
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
              <%=MyCache.GetCurrencySymbol%><%# Public.ReturnShopPrice(Convert.ToString(Eval("OrderTotalPrice")))%>
            
             </td>
             <td class="list_link" style="text-align:center" nowrap valign="top">
             <%# Kesion.APPCode.OrderProcess.GetOrderStatus(true,Utils.StrToInt(Eval("orderType")),Convert.ToString(Eval("OrderID")),Utils.StrToInt(Eval("ConsumptionMode")),Utils.StrToInt(Eval("IsBusinessConfirm")),Convert.ToString(Eval("alipaytradestatus")), Convert.ToInt16(Eval("status")), Convert.ToInt16(Eval("DeliverStatus")), Utils.StrToDecimal(Convert.ToString(Eval("MoneyReceipt"))), Utils.StrToDecimal(Convert.ToString(Eval("OrderTotalPrice"))))%>
             </td>
				<td nowrap class="list_link" style="text-align:center" valign="top">
				<a href="ShowMyOrder.aspx?id=<%# Eval("id") %>">订单详情</a>
				<%# ((((float)Convert.ToDouble(Eval("MoneyReceipt")) > 0 &&Convert.ToString(Eval("DeliverStatus")) == "0") || Convert.ToString(Eval("DeliverStatus")) == "2") && Utils.StrToInt(Eval("status"))<=1 && Utils.StrToInt(Eval("IsBusinessConfirm"))==0&&Utils.StrToInt(Eval("ordertype"))!=2)||(BaseFun.CheckTableExists("KS_ProFightGroup") && (Utils.StrToInt(Eval("GoupNum"))==-1||Utils.StrToInt(Eval("GoupNum"))!=-1&&Utils.StrToInt(Eval("JoinNum"))==Utils.StrToInt(DataFactory.GetOnlyValue("select FightGroupNum from KS_ProFightGroup a inner join KS_ProOrderItem b on a.id=b.infoid where orderid='"+Eval("orderid")+"'")))&&Utils.StrToInt(Eval("ordertype"))==2) ? "<br/><a href='?action=returns&ordertype=order&id=" + Eval("id") + "'>退货退款</a>" : string.Empty%>
				
				<%# Convert.ToString(Eval("DeliverStatus")) == "1" ? @"<br/><a href='javascript:;' onclick=""KesionJS.Confirm('此操作不可逆，您确定收到商品了吗？', 'location.href=\'shop/ShowMyOrder.aspx?id=" + Eval("id") + @"&action=signorder\';', null);"">确认收货</a>" : ""%>
				<%# (Convert.ToString(Eval("Status"))== "1" &&  Convert.ToString(Eval("DeliverStatus")) == "2")? @"<br/><a href='javascript:;' onclick=""KesionJS.Confirm('订单一旦结清，就可能再对该订单进行任何操作，确定结清吗？', 'location.href=\'shop/ShowMyOrder.aspx?id=" + Eval("id") + @"&action=finishorder\';', null);"">结清订单</a>" : ""%>
				<%# Convert.ToString(Eval("status")) == "0" && Convert.ToString(Eval("DeliverStatus")) == "0" && Utils.StrToFloat(Convert.ToString(Eval("MoneyReceipt"))) == 0 ? "<br /><a href='?action=delorder&id=" + Eval("id") + @"' onClick=""return(confirm('此操作不可逆，确定执行删除操作吗？'))"">订单删除</a>" : ""%>
				<%# Convert.ToDecimal(Eval("OrderTotalPrice"))>0 && Convert.ToString(Eval("PayStatus")) != "1" && Convert.ToInt16(Eval("status")) < 2  ? "<br/><a href='?action=pay&id=" + Eval("id") + "'>订单支付</a>" : ""%>
                <%# !string.IsNullOrEmpty(MyCache.GetShopCommonConfig(42)) && Convert.ToString(Eval("ConsumptionMode")) == "1" && Convert.ToString(Eval("DeliverStatus")) == "1" ? "<br/><a href='ExpressLog.aspx?OrderID="+Eval("OrderID")+"'>查看物流</a>" : string.Empty %>
                <br />
                 <%# GetCommentTips(Convert.ToInt16(Eval("orderType")),Convert.ToInt16(Eval("status")),Convert.ToInt16(Eval("deliverStatus")),Convert.ToString(Eval("orderId"))) %>
                 <%#(Utils.StrToInt(Eval("ordertype"))<=1 && (Utils.StrToInt(Eval("DeliverStatus"))==1||Utils.StrToInt(Eval("DeliverStatus"))==2))?@"<br/><input type=""button"" value=""再次购买"" class=""button"" onclick=""window.open('MyOrder.aspx?action=rebuy&orderid="+ Eval("orderID")+@"')"" />":string.Empty %> 
				</td>
             </tr>
         </ItemTemplate>
          <FooterTemplate>
           <tr class="tdbg emptycss" style="display:<%# bool.Parse((Repeater1.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="7">
                  还没有任何的订单！
                </td>
               </tr> 
           </table>
          </FooterTemplate>
        </asp:Repeater>
           <br />
       <div class="cz_btn">
        	<span><label><input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/>全选</label></span>
        	<span><asp:Button ID="BtnBatchPay" runat="server" Text="合并付款" OnClientClick="return(CheckIds('pay'))" CssClass="button" OnClick="BtnBatchPay_Click" /></span>
        	<span><asp:Button ID="BtnBatchDel" runat="server" Text="批量删除" OnClientClick="return(CheckIds('del'));" CssClass="button" OnClick="BtnBatchDel_Click" /></span>
       </div>
       <div class="fy_box"><KS:Page ID="Page1" runat="server" /></div>
       
</asp:Panel>


<div class="r_tybox nomar">
<asp:Panel ID="PayPannel" runat="server" Visible="false">
        <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
</asp:Panel>
</div>
	</div>
</div>


</asp:Content>

