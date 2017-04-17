<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CountByClassAndInputerControl.ascx.cs" Inherits="Kesion.NET.WebSite.CountByClassAndInputerControl" %>
<%@ Import Namespace="Kesion.Cache" %>
<KS:TopNav ID="TopNav1" runat="server" />
<div class="content-area">
	<div class="tabs_header">
    <ul class="tabs">
    <li><a href="KS.ModelCount.aspx?action=CountByModel"><span>��ģ������ͳ��</span></a></li>
    <li><a href="KS.ModelCount.aspx?action=CountByClassAndMonth"><span>����Ŀ/�·�ͳ��</span></a></li>
    <li class='active'><a href="KS.ModelCount.aspx?action=CountByClassAndInputer"><span>����Ŀ/¼����ͳ��</span></a></li>
    <li><a href="KS.ModelCount.aspx?action=CountByInputerAndMonth"><span>��¼����/�·�ͳ��</span></a></li>
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
			<td align='right' class='lefttd'><strong>ѡ����Ŀ��</strong></td>
			<td class="righttd">
    <select style="WIDTH: 250px; HEIGHT: 280px" multiple="multiple" size=2 name="ClassID" id="ClassID">
      <%=MyCache.GetClassOptionList(0) %>
    </select>
            </td>
			<td align='right' class='lefttd'><strong>ѡ��¼���ߣ�</strong></td>
            <td class="righttd">
                <asp:ListBox ID="LstbInputer" runat="server" Height="280px" Width="180px" SelectionMode="Multiple"></asp:ListBox>
			</td>
		</tr>
		<tr>
			<td align='right' class='lefttd'><strong>ͳ������Ŀѡ�</strong></td>
			<td class="righttd" colspan="3">
			<asp:RadioButtonList ID="RdbCountSubClass" runat="server">
			<asp:ListItem Value="1" Selected="true">��ͳ��ѡ����Ŀ������Ŀ�ĵ�</asp:ListItem>
			<asp:ListItem Value="2">ͳ��ѡ����Ŀ��ѡ����Ŀ����Ŀ���ĵ�</asp:ListItem>
            </asp:RadioButtonList>
            </td>
        </tr>
		<tr>
			<td align='right' class='lefttd'><strong>ͳ�����ڷ�Χ��</strong></td>
			<td class="righttd" colspan="3">
                <asp:RadioButtonList ID="RdbCountDate" runat="server" RepeatDirection="horizontal">
                <asp:ListItem Value="2" Selected="True">ͳ��ָ��ʱ��ε��ĵ�</asp:ListItem>
                <asp:ListItem Value="1">��ָ������(����)</asp:ListItem>
                </asp:RadioButtonList>
			<div id="showdate">
			��ʼ���ڣ�<asp:TextBox ID="TxtBeginDate" CssClass="textbox Wdate" Width="200" runat="server" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});"></asp:TextBox>
			�������ڣ�<asp:TextBox ID="TxtEndDate" CssClass="textbox Wdate" Width="200" runat="server" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});"></asp:TextBox>
			</div>
			</td>
		</tr>
        		
	</table>
        <script type="text/javascript">
		showtips('<span class="state"><strong>Tips��</strong><br /></span>��Ŀ/¼���߿��԰�ס��Shift�� ��Ctrl�������ж��ѡ����Ŀ��ѡ���ʾ���С�');
		</script>
	<br />
	<KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" />
	</asp:Panel>
	
	<asp:Panel ID="Panel2" runat="server" Visible="false">
     <asp:Label ID="Label1" runat="server"></asp:Label>
     <div style="margin:10px;text-align:center"><input type="button" value=" �� �� " onclick="javascript:history.back()" class="button"/></div>
    </asp:Panel>]
 </div>   