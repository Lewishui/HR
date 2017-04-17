<%@ Page Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_Favorite" Title="Untitled Page" Codebehind="Comment.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.Cache" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<script language="javascript" type="text/javascript">
function cancel(id)
{
  if (confirm('ȷ��ɾ����������?'))
  {
   location.href='?action=Delete&ids='+id;
  }
}
</script>

    <div class="r_tybox nomar">

        <div class="tabs">	
			<ul>
				<li<%=KSCMS.S("flag")=="1"||string.IsNullOrEmpty(KSCMS.S("flag"))?" class='puton'":string.Empty %>><a href="?flag=1">�û����ҵ�����</a></li>
				<li<%=KSCMS.S("flag")=="2"?" class='puton'":string.Empty %>><a href="?flag=2">�ҷ��������</a></li>
			</ul>
        </div>


    <asp:Repeater ID="Repeater1" runat="server">
    <HeaderTemplate>
    <div class="r_padbox">
     <table id="tablist" width="100%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
         <tr class="title">
          	<td width="50">ѡ��</td>
          	<td>����</td>
          	<td>������</td>
         	<td>ʱ��</td>
          	<td>����</td>
         </tr>
    </HeaderTemplate>
    <ItemTemplate>
      <tr class="tdbg">
        <%if (flag=="2") {%>
          <td class="splittd" align="center"><input class="cleckbtn" type="checkbox" name="ids" value='<%#Eval("id") %>' /></td>
          <%} %>
          <td class="splittd">
          ��������:<%# GetCommentContent(Convert.ToString(Eval("Content")))%>
          <div style="margin-top:10px;color:#999999;">
          ����:<%# MyCache.GetCacheClass(Convert.ToInt16(Eval("ClassID")),1) %>&nbsp;&nbsp;����: <%# GetSubject(Convert.ToInt16(Eval("ChannelID")),Convert.ToInt16(Eval("ClassID")),Convert.ToInt16(Eval("InfoID")),Convert.ToString(Eval("FileName")), Convert.ToString(Eval("TurnUrl")), Convert.ToString(Eval("Title")))%>
          </div>
          </td>

          <td class="splittd" align="center">
               <%#Eval("UserName") %>
          </td>
          <td class="splittd">

         <%# Utils.FormatHumanizedTime(Convert.ToDateTime(Eval("AddDate")))%>
          
          </td>
          <%if (flag=="2") {%>
          <td class="splittd" align="center">
          <div class="bt" onclick='cancel(<%#Eval("ID") %>);'>ɾ ��</div>
          </td>
          <%} %>
      </tr>  

     </ItemTemplate>
     <FooterTemplate>
        <tr class="tdbg emptycss" style="display:<%# bool.Parse((Repeater1.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="10">
                  û�����ۼ�¼��
                </td>
           </tr> 
    </table>
     </FooterTemplate>
    </asp:Repeater>
    <%if (flag=="2")
      { %>
   		<div class="cz_btn">
            <span><input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/>ȫѡ</span>
            <span><asp:Button ID="btnDelete" CssClass="button" runat="server" Text="ɾ��ѡ�е�����" OnClick="btnDelete_Click" /></span>
        </div>
    <%} %>
    
     		<div class="fy_box"><KS:Page ID="Page1" runat="server" /></div>	
		</div>
	</div>

</asp:Content>