<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CountByClassAndMonthControl.ascx.cs" Inherits="Kesion.NET.WebSite.CountByClassAndMonthControl" %>
<%@ Import Namespace="Kesion.Cache" %>
<KS:TopNav ID="TopNav1" runat="server" />
<div class="content-area">
  <div class="tabs_header">
    <ul class="tabs">
    <li><a href="KS.ModelCount.aspx?action=CountByModel"><span>按模型数据统计</span></a></li>
    <li class='active'><a href="KS.ModelCount.aspx?action=CountByClassAndMonth"><span>按栏目/月份统计</span></a></li>
    <li><a href="KS.ModelCount.aspx?action=CountByClassAndInputer"><span>按栏目/录入者统计</span></a></li>
    <li><a href="KS.ModelCount.aspx?action=CountByInputerAndMonth"><span>按录入者/月份统计</span></a></li>
    </ul>
   </div>
<asp:Panel ID="Panel1" runat="server" Width="100%">
<script type="text/javascript">
    function showTime() {
        var checkrad = jQuery("#<%=this.RdbCountDate.ClientID%> :radio[checked]").val();
        if (checkrad == "2") {
            jQuery("#showdate").css("display", "");
        } else {
            jQuery("#showdate").css("display", "none");
        }
              
       }
    </script>
    <table  width="98%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable">
		<tr>
			<td align='right' class='lefttd'><strong>选择栏目：</strong></td>
			<td class="righttd">
    <select style="WIDTH: 300px; HEIGHT: 280px" multiple="multiple" size=2 name="ClassID" id="ClassID">
      <%=MyCache.GetClassOptionList(0) %>
    </select>

			</td>
		</tr>
		<tr>
			<td align='right' class='lefttd'><strong>统计子栏目选项：</strong></td>
			<td class="righttd">
			<asp:RadioButtonList ID="RdbCountSubClass" runat="server">
			<asp:ListItem Value="1">不统计选中栏目的子栏目文档</asp:ListItem>
			<asp:ListItem Value="2" Selected="true">统计选中栏目及选中栏目子栏目的文档</asp:ListItem>
            </asp:RadioButtonList>
            </td>
        </tr>
		<tr>
			<td align='right' class='lefttd'><strong>统计日期范围：</strong></td>
			<td class="righttd">
                <asp:RadioButtonList ID="RdbCountDate" runat="server" RepeatDirection="horizontal">
                <asp:ListItem Value="2" Selected="True">统计指定时间段的文档</asp:ListItem>
                <asp:ListItem Value="1">统计本年度的文档</asp:ListItem>
                </asp:RadioButtonList>
			<div id="showdate">
			起始日期：<asp:TextBox ID="TxtBeginDate" CssClass="textbox Wdate" Width="200" runat="server" onclick="WdatePicker({dateFmt:'yyyy-MM'});"></asp:TextBox>
			结束日期：<asp:TextBox ID="TxtEndDate" CssClass="textbox Wdate" Width="200" runat="server" onclick="WdatePicker({dateFmt:'yyyy-MM'});"></asp:TextBox>
			</div>
			</td>
		</tr>
        		
	</table>
        <script type="text/javascript">
		showtips('<span class="state"><strong>Tips：</strong><br /></span>栏目可以按住“Shift” 或“Ctrl”键进行多个栏目的选择，不选则表示所有栏目。');
		</script>
	<br />
	<KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" />
	</asp:Panel>
	
	<asp:Panel ID="Panel2" runat="server" Visible="false">
     <asp:Label ID="Label1" runat="server"></asp:Label>
     <div style="margin:10px;text-align:center"><input type="button" value=" 返 回 " onclick="javascript:history.back()" class="button"/></div>
    </asp:Panel>
</div>    