<%@ Control Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Shop.CountOrderControl" Codebehind="CountOrderControl.ascx.cs" %>
 
<div class="tabs_header">
    <ul class="tabs">
    <li><a href="KS.ShopStats.aspx?action=CountOrderWMY"><span>�ܶ�����</span></a></li>
    <li><a href="KS.ShopStats.aspx?action=CountOrderWMY&showType=1"><span>����</span></a></li>
    <li><a href="KS.ShopStats.aspx?action=CountOrderWMY&showType=2"><span>����</span></a></li>
    <li><a href="KS.ShopStats.aspx?action=CountOrderWMY&showType=3"><span>����</span></a></li>
    <li><a href="KS.ShopStats.aspx?action=CountOrderWMY&showType=4"><span>�����</span></a></li>
    <li class='active'><a href="KS.ShopStats.aspx?action=CountOrder"><span>ʱ���</span></a></li>
    </ul>
</div>
<table width="99%" border="0" cellpadding="1" cellspacing="1" class="CTable">
	<tr class="tdbg">
		<td height='25' class='clefttitle' colspan='4'><strong>��ʱ���ͳ��</strong> </td>
	 </tr>
	<tr class="tdbg">
        <td style="text-align:right;font-weight:bold">ʱ �� �Σ�</td>
		<td height="30">��ʼ���ڣ�<asp:TextBox CssClass="textbox Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" Width="150" ID="TxtBeginDate" runat="server"></asp:TextBox>
		&nbsp;&nbsp;�������ڣ�<asp:TextBox CssClass="textbox Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" Width="150" ID="TxtEndDate" runat="server"></asp:TextBox> </td>
	</tr>
	<tr class="tdbg">
		<td height="30" style="text-align:right;font-weight:bold">�� �� �㣺</td>
        <td>
            <asp:DropDownList ID="DrpShopStore" runat="server">
            </asp:DropDownList>
        </td>
	</tr>

	<tr class="tdbg">
        <td></td>
		<td>
		   <asp:Button CssClass="button" Text=" �� ʼ ͳ �� " runat="server" ID="Button1" OnClick="Button1_Click" />
	   </td>
  </tr>
</table>
<strong>
    <asp:Label ID="LabTips" runat="server"></asp:Label>
</strong>
 <table width="99%" style="margin-top:10px" border="0" cellpadding="1" cellspacing="1" class="CTable">
      <tr>
        <td align="center">
         <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"  codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" WIDTH="650" HEIGHT="400" id="OrderGeneral" align="middle">
          <PARAM NAME="FlashVars" value="&dataXML=<graph caption='�����ſ�(��λ����)' decimalPrecision='2' showPercentageValues='0' showNames='1' showValues='1' showPercentageInLabel='0' pieYScale='45' pieBorderAlpha='40' pieFillAlpha='70' pieSliceDepth='15' pieRadius='100' outCnvBaseFontSize='13' baseFontSize='12'><set value='<%=YQR%>' name='�Ѹ���,δ����' color='FFCC33' /><set value='<%=YCJ%>' name='�ѽ���(��Ч����)' color='33FF66' /><set value='<%=THTK%>' name='�˻��˿�' color='CCC000' /><set value='<%=WQR%>' name='δ����' color='FF6600'  /><set value='<%=WX%>' name='��Ч����(����)' color='999999'  /></graph>">
          <PARAM NAME="movie" value="../../ks_inc/part/pie3d.swf?chartWidth=650&chartHeight=400">
          <PARAM NAME="quality" value="high">
          <PARAM NAME="bgcolor" value="#FFFFFF">
          <param name="wmode" value="opaque" />
          <EMBED src="../../ks_inc/part/pie3d.swf?chartWidth=650&chartHeight=400" FlashVars="&dataXML=<graph caption='�����ſ�(��λ����)' decimalPrecision='2' showPercentageValues='0' showNames='1' showValues='1' showPercentageInLabel='0' pieYScale='45' pieBorderAlpha='40' pieFillAlpha='70' pieSliceDepth='15' pieRadius='100' outCnvBaseFontSize='13' baseFontSize='12'><set value='<%=YQR%>' name='�Ѹ���,δ����' color='FFCC33' /><set value='<%=YCJ%>' name='�ѽ���(��Ч����)' color='33FF66' /><set value='<%=THTK%>' name='�˻��˿�' color='CCC000' /><set value='<%=WQR%>' name='δ����' color='FF6600'  /><set value='<%=WX%>' name='��Ч����(����)' color='999999'  /></graph>" quality="high" bgcolor="#FFFFFF" WIDTH="650" HEIGHT="400" wmode="opaque" NAME="OrderGeneral" ALIGN="middle" TYPE="application/x-shockwave-flash" PLUGINSPAGE="http://www.macromedia.com/go/getflashplayer"></EMBED>
          </OBJECT>
        </td>
      </tr>
</table>