<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Collect_CollectProcess" Title="Untitled Page" Codebehind="KS.CollectProcess.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
  <KS:TopNav ID="TopNav2" runat="server" Text="�ɼ��������ڳ�ʼ��" />
    <div class="content-area">
    <asp:Panel ID="PannelStep1" runat="server" Width="100%">
    <div style="text-align:center"><br />
        <script type="text/javascript">
		showtips('<p align="center"><span>���ɼ�ϵͳ�����ſ�Ѵ������޹�˾��������,ϵͳ���ڳ�ʼ��,���Ժ�...<img src="../../admin/images/loading.gif"><br/><br /></span><strong><font color=red>ʹ������:�ɼ���Ϣ����漰����Ȩ���������ſ�Ѵ������޹�˾�޹�!</font></strong><br /><br />');
		</script>
		<script language="javascript" type="text/javascript">
		 Reload=function(){
		  location.href="?ItemId=<%=M_ItemID %>&Action=start";
		 }
		 window.setTimeout("Reload()",3000);
		</script>
    </div>
    </asp:Panel>
    
    <asp:Panel ID="PannelStep2" runat="server" Width="100%" Visible="false">
    <table width="98%" border="0" align="center" cellpadding="0" cellspacing="1">
	  <tr>
	   <td height="45" colspan="2" align="left">
	    </td>
	    </tr>
	   </table>
    
    </asp:Panel>
    
   </div>
</asp:Content>

