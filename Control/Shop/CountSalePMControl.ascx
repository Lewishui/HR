<%@ Control Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Shop.CountSalePMControl" CodeBehind="CountSalePMControl.ascx.cs" %>
<%@ Import Namespace="Kesion.Cache"%>
<%@ Import Namespace="Kesion.Publics"%>
<%@ Import Namespace="Kesion.APPCode"%>

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
<div class="content-area">
<div class="tabs_header">
    <ul class="tabs">
    <li<%=KSCMS.S("showType")==""?" class='active'":string.Empty %>><a href="?<%=UtilsQueryParam.Get("showtype") %>"><span>商品销售总排行</span></a></li>
    <li<%=KSCMS.S("showType")=="1"?" class='active'":string.Empty %>><a href="?showType=1&<%=UtilsQueryParam.Get("showtype") %>"><span>今日</span></a></li>
    <li<%=KSCMS.S("showType")=="2"?" class='active'":string.Empty %>><a href="?showType=2&<%=UtilsQueryParam.Get("showtype") %>"><span>本周</span></a></li>
    <li<%=KSCMS.S("showType")=="3"?" class='active'":string.Empty %>><a href="?showType=3&<%=UtilsQueryParam.Get("showtype") %>"><span>本月</span></a></li>
    <li<%=KSCMS.S("showType")=="4"?" class='active'":string.Empty %>><a href="?showType=4&<%=UtilsQueryParam.Get("showtype") %>"><span>本年度</span></a></li>
    <li<%=KSCMS.S("showType")=="5"?" class='active'":string.Empty %>><a href="?showType=5&<%=UtilsQueryParam.Get("showtype") %>"><span>按时间段查看</span></a></li>
    </ul>
</div>
<table width="99%" border="0" cellpadding="1" cellspacing="1" class="CTable">
	<tr class="tdbg">
		<td height="30" style="width:100px;text-align:right;font-weight:bold">配 货 点：</td>
        <td>
            <asp:DropDownList ID="DrpShopStore" runat="server">
            </asp:DropDownList>
          &nbsp;&nbsp;<span style="width:100px;text-align:right;font-weight:bold">地区：</span>
           <asp:DropDownList ID="DrpProvince" runat="server">
            </asp:DropDownList>
           <asp:DropDownList ID="DrpCity" runat="server">
            </asp:DropDownList>
        </td>
	</tr>
    <%if (KSCMS.S("showType")=="5"){ %>
    <tr class="tdbg">
        <td style="text-align:right;font-weight:bold">时 间 段：</td>
		<td height="30">开始日期：<asp:TextBox CssClass="textbox Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" Width="150" ID="TxtBeginDate" runat="server"></asp:TextBox>
		&nbsp;&nbsp;结束日期：<asp:TextBox CssClass="textbox Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" Width="150" ID="TxtEndDate" runat="server"></asp:TextBox> </td>
	</tr>
    <tr class="tdbg">
        <td style="text-align:right;font-weight:bold"></td>
		<td height="30">
            <asp:Button ID="BtnSearch" runat="server" Text="查询" CssClass="button" OnClick="BtnSearch_Click" />
		</td>
	</tr>
    <%} %>
</table><br />
    <div id="PrintBox">
 <asp:GridView ID="SalePMList" cssclass="CTable" AllowSorting="true" style="border-bottom:none" runat="server" AutoGenerateColumns="False" EmptyDataText="没有销售数据!"  Width="99%" CellPadding="1" CellSpacing="1" GridLines="None" OnRowDataBound="SalePMList_RowDataBound" OnRowCreated="SalePMList_RowCreated" OnSorting="SalePMList_Sorting">
         <Columns>
              <asp:TemplateField HeaderText="序号">
                <itemstyle horizontalalign="Center" />
                <itemtemplate>
                   <%# this.SalePMList.PageIndex * this.SalePMList.PageSize + Container.DataItemIndex + 1%> 
                </itemtemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="商品名称">
                <itemstyle horizontalalign="Left" />
                <itemtemplate>
                   <a href='<%# Kesion.HtmlTags.BasicField.GetItemUrl(Utils.StrToInt(Eval("ChannelID")),Utils.StrToInt(Eval("InfoID"))) %>' target='_blank'><%# Eval("Title")%></a> 
                </itemtemplate>
              </asp:TemplateField>
              <asp:BoundField DataField="SaleNum" DataFormatString="{0} 件" HeaderText="总销售量" SortExpression="SaleNum">
                <itemstyle width="140px" horizontalalign="Center" ForeColor="green" />
              </asp:BoundField>

              <asp:BoundField DataField="SaleMoney" DataFormatString="{0:c}" HeaderText="总销售额" SortExpression="SaleMoney">
                <itemstyle width="140px" horizontalalign="Center" ForeColor="green" />
              </asp:BoundField>

               <asp:TemplateField HeaderText="总销售额" Visible="false">
                <itemstyle width="150px" horizontalalign="Center" />
                <itemtemplate>
               <%=MyCache.GetCurrencySymbol%><%# Public.ReturnShopPrice(Utils.StrToDecimal(Eval("SaleMoney")))%><%=MyCache.GetCurrencyUnit %>
                </itemtemplate>
              </asp:TemplateField> 

              
         </Columns>
            <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
 </asp:GridView>
</div>
<script type="text/javascript">
showtips('<span class="state"><strong>说明：</strong><br /></span>点击表头的“总销售量”或“总销售额”可分别实现排序功能!');
</script>
</div>
       