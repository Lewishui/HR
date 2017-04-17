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
    <li<%=KSCMS.S("showType")==""?" class='active'":string.Empty %>><a href="?<%=UtilsQueryParam.Get("showtype") %>"><span>��Ʒ����������</span></a></li>
    <li<%=KSCMS.S("showType")=="1"?" class='active'":string.Empty %>><a href="?showType=1&<%=UtilsQueryParam.Get("showtype") %>"><span>����</span></a></li>
    <li<%=KSCMS.S("showType")=="2"?" class='active'":string.Empty %>><a href="?showType=2&<%=UtilsQueryParam.Get("showtype") %>"><span>����</span></a></li>
    <li<%=KSCMS.S("showType")=="3"?" class='active'":string.Empty %>><a href="?showType=3&<%=UtilsQueryParam.Get("showtype") %>"><span>����</span></a></li>
    <li<%=KSCMS.S("showType")=="4"?" class='active'":string.Empty %>><a href="?showType=4&<%=UtilsQueryParam.Get("showtype") %>"><span>�����</span></a></li>
    <li<%=KSCMS.S("showType")=="5"?" class='active'":string.Empty %>><a href="?showType=5&<%=UtilsQueryParam.Get("showtype") %>"><span>��ʱ��β鿴</span></a></li>
    </ul>
</div>
<table width="99%" border="0" cellpadding="1" cellspacing="1" class="CTable">
	<tr class="tdbg">
		<td height="30" style="width:100px;text-align:right;font-weight:bold">�� �� �㣺</td>
        <td>
            <asp:DropDownList ID="DrpShopStore" runat="server">
            </asp:DropDownList>
          &nbsp;&nbsp;<span style="width:100px;text-align:right;font-weight:bold">������</span>
           <asp:DropDownList ID="DrpProvince" runat="server">
            </asp:DropDownList>
           <asp:DropDownList ID="DrpCity" runat="server">
            </asp:DropDownList>
        </td>
	</tr>
    <%if (KSCMS.S("showType")=="5"){ %>
    <tr class="tdbg">
        <td style="text-align:right;font-weight:bold">ʱ �� �Σ�</td>
		<td height="30">��ʼ���ڣ�<asp:TextBox CssClass="textbox Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" Width="150" ID="TxtBeginDate" runat="server"></asp:TextBox>
		&nbsp;&nbsp;�������ڣ�<asp:TextBox CssClass="textbox Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" Width="150" ID="TxtEndDate" runat="server"></asp:TextBox> </td>
	</tr>
    <tr class="tdbg">
        <td style="text-align:right;font-weight:bold"></td>
		<td height="30">
            <asp:Button ID="BtnSearch" runat="server" Text="��ѯ" CssClass="button" OnClick="BtnSearch_Click" />
		</td>
	</tr>
    <%} %>
</table><br />
    <div id="PrintBox">
 <asp:GridView ID="SalePMList" cssclass="CTable" AllowSorting="true" style="border-bottom:none" runat="server" AutoGenerateColumns="False" EmptyDataText="û����������!"  Width="99%" CellPadding="1" CellSpacing="1" GridLines="None" OnRowDataBound="SalePMList_RowDataBound" OnRowCreated="SalePMList_RowCreated" OnSorting="SalePMList_Sorting">
         <Columns>
              <asp:TemplateField HeaderText="���">
                <itemstyle horizontalalign="Center" />
                <itemtemplate>
                   <%# this.SalePMList.PageIndex * this.SalePMList.PageSize + Container.DataItemIndex + 1%> 
                </itemtemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="��Ʒ����">
                <itemstyle horizontalalign="Left" />
                <itemtemplate>
                   <a href='<%# Kesion.HtmlTags.BasicField.GetItemUrl(Utils.StrToInt(Eval("ChannelID")),Utils.StrToInt(Eval("InfoID"))) %>' target='_blank'><%# Eval("Title")%></a> 
                </itemtemplate>
              </asp:TemplateField>
              <asp:BoundField DataField="SaleNum" DataFormatString="{0} ��" HeaderText="��������" SortExpression="SaleNum">
                <itemstyle width="140px" horizontalalign="Center" ForeColor="green" />
              </asp:BoundField>

              <asp:BoundField DataField="SaleMoney" DataFormatString="{0:c}" HeaderText="�����۶�" SortExpression="SaleMoney">
                <itemstyle width="140px" horizontalalign="Center" ForeColor="green" />
              </asp:BoundField>

               <asp:TemplateField HeaderText="�����۶�" Visible="false">
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
showtips('<span class="state"><strong>˵����</strong><br /></span>�����ͷ�ġ������������������۶�ɷֱ�ʵ��������!');
</script>
</div>
       