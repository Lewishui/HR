<%@ Control Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Shop.CountSaleControl" Codebehind="CountSaleControl.ascx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<div class="tabs_header">
    <ul class="tabs">
    <li><a href="?action=CountSaleWMY"><span>总销售额</span></a></li>
    <li><a href="?action=CountSaleWMY&showType=1"><span>今日</span></a></li>
    <li><a href="?action=CountSaleWMY&showType=2"><span>本周</span></a></li>
    <li><a href="?action=CountSaleWMY&showType=3"><span>本月</span></a></li>
    <li><a href="?action=CountSaleWMY&showType=4"><span>本年度</span></a></li>
    <li class='active'><a href="KS.ShopStats.aspx?action=CountSale"><span>按时间段查看</span></a></li>
    </ul>
</div>
 <table width="99%"  border="0" cellpadding="1" cellspacing="1" class="CTable">
					  <tr class="tdbg">
						<td height='25' class='clefttitle' colspan='4' style="text-align:left"><strong>按月查看走势(已结清订单的销售额)</strong> </td>
					  </tr>
					  <tr class="tdbg">
						<td height="30">&nbsp;&nbsp;
                            <strong>时间段：</strong>
						<asp:DropDownList ID="DrpStartYear" runat="server">
						
						</asp:DropDownList>
						年
						<asp:DropDownList ID="DrpStartMonth" runat="server">
						</asp:DropDownList>
						月
						至
						<asp:DropDownList ID="DrpEndYear" runat="server">
						</asp:DropDownList>
						年
						<asp:DropDownList ID="DrpEndMonth" runat="server">
						</asp:DropDownList>月

                        <strong>配货点：</strong>
                        <asp:DropDownList ID="DrpShopStore" runat="server"></asp:DropDownList>
						<asp:Button ID="Button1" runat="server" CssClass="button" Text=" 查看走势 " OnClick="Button1_Click1"></asp:Button>
						</td>
					  </tr>
					  <tr class="tdbg">
						<td height='25' class='clefttitle' colspan='4' style="text-align:left"><strong>按年查看走势(已结清订单的销售额)</strong> </td>
					  </tr>
					  <tr class="tdbg">
						<td height="30">&nbsp;&nbsp;
                             <strong>年份：</strong>
						<asp:DropDownList ID="DrpYearStart" runat="server">
						</asp:DropDownList>
						年
						至
						<asp:DropDownList ID="DrpYearEnd" runat="server">
						</asp:DropDownList>年
						 <strong>配货点：</strong>
                        <asp:DropDownList ID="DrpShopStore1" runat="server"></asp:DropDownList>
						<asp:Button ID="Button2" runat="server" CssClass="button" Text=" 查看走势 " OnClick="Button2_Click" />
						</td>
					  </tr>
		</table>   

      <!-- 营业额 -->
	  <div style="margin:10px;font-weight:Bold;color:#ff6600;font-size:14px"><asp:Label ID="LabTips2" runat="server"></asp:Label>，有效销售额走势</div>
      <table width="90%" id="turnover-table">
        <tr><td align="center">
          <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
            codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0"
            width="100%" height="420" id="Object1" align="middle">
            <param NAME="movie" VALUE="../../ks_inc/part/column3d.swf?dataXML=<chart caption='' xAxisName='营业额(单位:<%=MyCache.GetCurrencyUnit %>)' showValues='0' decimals='0' formatNumberScale='0'><%=SalesXmlStr%></chart>">
            <param NAME="quality" VALUE="high">
            <param NAME="bgcolor" VALUE="#FFFFFF">
            <embed src="../../ks_inc/part/column3d.swf?dataXML=<chart caption='' xAxisName='营业额(单位:<%=MyCache.GetCurrencyUnit %>)' showValues='0' decimals='0' formatNumberScale='0'><%=SalesXmlStr%></chart>" quality="high" bgcolor="#FFFFFF"  width="100%" height="420" name="FCColumn2" align="middle" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer"></object>
        </td></tr>
      </table>
    </div>

 <!--
<div style="margin:10px;font-weight:Bold;color:#ff6600;font-size:14px">有效订单走势(<asp:Label ID="LabTips1" runat="server"></asp:Label>)</div>
   <div id="tabbody-div">
      <!-- 订单数量 
      <table width="90%" id="order-table">
        <tr><td align="center">
          <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
            codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0"
            width="100%" height="420" id="FCColumn2" align="middle">
            <param NAME="movie" VALUE="../../ks_inc/part/column3d.swf?dataXML=<chart caption='' xAxisName='订单数(单位:个)' showValues='0' decimals='0' formatNumberScale='0'><%=OrderXmlStr%></chart>">
            <param NAME="quality" VALUE="high">
            <param NAME="bgcolor" VALUE="#FFFFFF">
            <embed src="../../ks_inc/part/column3d.swf?dataXML=<chart caption='' xAxisName='订单数(单位:个)' showValues='0' decimals='0' formatNumberScale='0'><%=OrderXmlStr%></chart>" quality="high" bgcolor="#FFFFFF"  width="100%" height="420" name="FCColumn2" align="middle" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer"></object>
        </td></tr>
      </table>

   --> 




<script type="text/javascript">
showtips('<span class="state"><strong>说明：</strong><br /></span>“有效销售额”指的是订单已被被结单，并未退款的订单销售总额!');
</script>
