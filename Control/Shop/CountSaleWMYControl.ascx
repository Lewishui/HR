<%@ Control Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Shop.CountSaleWMYControl" Codebehind="CountSaleWMYControl.ascx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>
<script>
    function doChange(v, t) {
        switch(t)
        {
            case 0:
                location.href = '?storeid=' + v + '&<%=UtilsQueryParam.Get("storeid") %>';
                break;
            case 1:
                location.href = '?provinceid=' + v + '&<%=UtilsQueryParam.Get("provinceid") %>';
                break;
            case 2:
                location.href = '?cityid=' + v + '&<%=UtilsQueryParam.Get("cityid") %>';
                break;
        }
    }
</script>

<div class="tabs_header">
    <ul class="tabs">
    <li<%=KSCMS.S("showType")==""?" class='active'":string.Empty %>><a href="?<%=UtilsQueryParam.Get("showtype") %>"><span>总销售额</span></a></li>
    <li<%=KSCMS.S("showType")=="1"?" class='active'":string.Empty %>><a href="?showType=1&<%=UtilsQueryParam.Get("showtype") %>"><span>今日</span></a></li>
    <li<%=KSCMS.S("showType")=="2"?" class='active'":string.Empty %>><a href="?showType=2&<%=UtilsQueryParam.Get("showtype") %>"><span>本周</span></a></li>
    <li<%=KSCMS.S("showType")=="3"?" class='active'":string.Empty %>><a href="?showType=3&<%=UtilsQueryParam.Get("showtype") %>"><span>本月</span></a></li>
    <li<%=KSCMS.S("showType")=="4"?" class='active'":string.Empty %>><a href="?showType=4&<%=UtilsQueryParam.Get("showtype") %>"><span>本年度</span></a></li>
    <li><a href="KS.ShopStats.aspx?action=CountSale"><span>按时间段查看</span></a></li>
    </ul>
</div>

<table width="99%" border="0" cellpadding="1" cellspacing="1" class="CTable">
	<tr class="tdbg">
		<td height="30" style="width:100px;text-align:right;font-weight:bold">配 货 点：</td>
        <td>
            <asp:DropDownList ID="DrpShopStore" runat="server">
            </asp:DropDownList> &nbsp;&nbsp;<span style="width:100px;text-align:right;font-weight:bold">地区：</span>
           <asp:DropDownList ID="DrpProvince" runat="server">
            </asp:DropDownList>
           <asp:DropDownList ID="DrpCity" runat="server">
            </asp:DropDownList>
        </td>
	</tr>

</table>

 <table width="99%" style="margin-top:10px" border="0" cellpadding="1" cellspacing="1" class="CTable">
      <tr>
        <td align="center">
         <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"  codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" WIDTH="650" HEIGHT="400" id="OrderGeneral" align="middle">
          <PARAM NAME="FlashVars" value="&dataXML=<graph caption='<%=string.IsNullOrEmpty(storeName) ? string.Empty : "配货点：" + storeName + "," %>销售额概况(单位：元)' decimalPrecision='2' formatNumberScale='0' showPercentageValues='0' showNames='1' showValues='1' showPercentageInLabel='0' pieYScale='45' pieBorderAlpha='40' pieFillAlpha='70' pieSliceDepth='15' pieRadius='100' outCnvBaseFontSize='13' baseFontSize='12'><set value='<%=YQR%>' name='已付款,未结清' color='FFCC33' /><set value='<%=YCJ%>' name='已结清(有效订单)' color='33FF66' /><set value='<%=THTK%>' name='退货退款' color='CCC000' /><set value='<%=WQR%>' name='未付款' color='FF6600'  /><set value='<%=WX%>' name='无效订单(作废)' color='999999'  /></graph>">
          <PARAM NAME="movie" value="../../ks_inc/part/pie3d.swf?chartWidth=650&chartHeight=400">
          <PARAM NAME="quality" value="high">
          <PARAM NAME="bgcolor" value="#FFFFFF">
          <param name="wmode" value="opaque" />
          <EMBED src="../../ks_inc/part/pie3d.swf?chartWidth=650&chartHeight=400" FlashVars="&dataXML=<graph caption='<%=string.IsNullOrEmpty(storeName) ? string.Empty : "配货点：" + storeName + "," %>销售额概况(单位：元)' decimalPrecision='2' formatNumberScale='0' showPercentageValues='0' showNames='1' showValues='1' showPercentageInLabel='0' pieYScale='45' pieBorderAlpha='40' pieFillAlpha='70' pieSliceDepth='15' pieRadius='100' outCnvBaseFontSize='13' baseFontSize='12'><set value='<%=YQR%>' name='已付款,未结清' color='FFCC33' /><set value='<%=YCJ%>' name='已结清(有效订单)' color='33FF66' /><set value='<%=THTK%>' name='退货退款' color='CCC000' /><set value='<%=WQR%>' name='未付款' color='FF6600'  /><set value='<%=WX%>' name='无效订单(作废)' color='999999'  /></graph>" quality="high" bgcolor="#FFFFFF" WIDTH="650" HEIGHT="400" wmode="opaque" NAME="OrderGeneral" ALIGN="middle" TYPE="application/x-shockwave-flash" PLUGINSPAGE="http://www.macromedia.com/go/getflashplayer"></EMBED>
          </OBJECT>
        </td>
      </tr>
</table>