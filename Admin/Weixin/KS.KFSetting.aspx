<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_KFSetting" Title="Untitled Page" Codebehind="KS.KFSetting.aspx.cs" %>
<%@ Import Namespace="System.Xml" %>
<%@ Import Namespace="Kesion.BLL" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Newtonsoft.Json" %>
<%@ Import Namespace="Newtonsoft.Json.Linq" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
       <KS:TopNav ID="TopNav2" runat="server" Text="΢�Ŷ�ͷ�ϵͳ����" />
  <div class="content-area">     
	<link href="/admin/weixin/images/style.css" rel="stylesheet" />
	<link rel="stylesheet" type="text/css" href="/admin/weixin/images/font/css/font-awesome.min.css">

 
       <table width="100%" border="0" cellpadding="0" cellspacing="0" class="CTable template_msg_top" style="border:1px solid #e7e7eb;"> 
            <tr>
               <td class="lefttd" align="right"><b>�Ƿ����ö�ͷ����ܣ�</b></td>
               <td class="righttd">
                   <asp:RadioButtonList ID="RdbEnabledKF" RepeatDirection="Horizontal" runat="server" OnSelectedIndexChanged="RdbTemplateMsg_SelectedIndexChanged" AutoPostBack="true">
                    <asp:ListItem Value="1" Selected class="star_input">����</asp:ListItem>
                    <asp:ListItem Value="0" class="star_input">������</asp:ListItem>
                   </asp:RadioButtonList>
                </td>
       <td><span class="tips">1��ֻ����֤ͨ����΢�ŷ���Ų���ʹ�ñ����ܡ�<br />
           2����Ҫ��¼΢�Ź���ƽ̨���ģ���ӹ��ܲ�����ÿͷ�ģ�顣<br />
           3����Ҫ��¼΢�Ź���ƽ̨������ӹ��ż���΢�źź󣬾Ϳ��Ե�<a href="https://mpkf.weixin.qq.com/" target="_blank">https://mpkf.weixin.qq.com/</a>�������߿ͷ�ϵͳ�����пͷ���ͨ��<br /></span>
       </span></td>
	</tr></table>	

    <asp:Panel ID="listPanel" runat="server" Width="100%">
        <table width="97%" border="0" cellpadding="0" cellspacing="0" class="CTable template_msg_top" style=" margin-bottom:-1px;border:1px solid #e7e7eb;"> 
         <tr>
              <td style="padding-left:15px;"><asp:Button ID="Button1" CssClass="button" runat="server" Text="��΢��ͬ�����ŵ���վ" onclick="Button1_Click" style="vertical-align: middle;"/>
                  <!--
<input type="checkbox" name="chkall" id="chkall" onclick="selectAll(this.checked);"/><label for="chkall">ȫ��ѡ��</label>     -->             &nbsp;&nbsp;</td>
             </tr>
        </table>
        <script>
            function selectAll(b) {
                $(".template_msg").find("input[type='checkbox']").each(function () {
                    $(this).prop("checked", b);
                });
            }
           
        </script>

        <KS:KSGV ID="list" cssclass="CTable  template_msg" runat="server" Width="100%" AutoGenerateColumns="False" EmptyDataText="���޿ͷ���Ա!" GridLines="None" OnRowDataBound="list_RowDataBound" PagerType="CustomNumeric">
            <Columns>
			  <asp:BoundField HeaderText="���" DataField="id">
                    <ItemStyle HorizontalAlign="Center"  Width="10%" />
                </asp:BoundField>
             <asp:BoundField HeaderText="�ͷ���" DataField="kf_account">
                    <ItemStyle HorizontalAlign="Center"  />
                </asp:BoundField>
            <asp:TemplateField HeaderText="�ͷ�ͷ��">
                <ItemStyle HorizontalAlign="Center"   />
                <ItemTemplate>
                <img src='<%# Eval("kf_headimgurl") %>'  width="80"/>
                 </ItemTemplate>
            </asp:TemplateField>  

             <asp:BoundField HeaderText="�ͷ�ID" DataField="kf_id">
                    <ItemStyle HorizontalAlign="Center"  Width="20%" />
            </asp:BoundField>
             <asp:BoundField HeaderText="�ͷ��ǳ�" DataField="kf_nick">
                    <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
                 <asp:BoundField HeaderText="��΢�ź�" DataField="kf_wx">
                    <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            
            </Columns>
           
            <PagerStyle CssClass="Page" HorizontalAlign="Right" />
            <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
      </KS:KSGV>
      
   
     </asp:Panel>
  </div>   

</asp:Content>

