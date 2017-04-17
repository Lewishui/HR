<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_TemplateMsg" Title="Untitled Page" Codebehind="KS.TemplateMsg.aspx.cs" %>
<%@ Import Namespace="System.Xml" %>
<%@ Import Namespace="Kesion.BLL" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Newtonsoft.Json" %>
<%@ Import Namespace="Newtonsoft.Json.Linq" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
       <KS:TopNav ID="TopNav2" runat="server" Text="΢��ģ����Ϣ����" />
 <div class="content-area">
   
	<link href="/admin/weixin/images/style.css" rel="stylesheet" />
                <link rel="stylesheet" type="text/css" href="/admin/weixin/images/font/css/font-awesome.min.css">

 
       <table width="100%" border="0" cellpadding="1" cellspacing="1" class="template_msg_top" style="border-bottom:none;  border:1px solid #e7e7eb;"> 
            <tr>
               <td class="lefttd" align="right"><b>�Ƿ�����ģ����Ϣ���ܣ�</b></td>
               <td class="righttd">
                   <asp:RadioButtonList ID="RdbTemplateMsg" RepeatDirection="Horizontal" runat="server" OnSelectedIndexChanged="RdbTemplateMsg_SelectedIndexChanged" AutoPostBack="true">
                    <asp:ListItem Value="1" Selected class="star_input">����</asp:ListItem>
                    <asp:ListItem Value="0" class="star_input">������</asp:ListItem>
                   </asp:RadioButtonList>
                </td>
       <td><span class="tips">1��ֻ����֤ͨ����΢�ŷ���Ų���ʹ�ñ����ܡ�<br />
           2����Ҫ��¼΢�Ź���ƽ̨���ģ�����ҵ��������Ϊ��IT�Ƽ�/������|��������IT�Ƽ�/IT��������</span>
       </td>
	</tr></table>	

    <asp:Panel ID="listPanel" runat="server" Width="100%">
        <table width="100%" border="0" cellpadding="1" cellspacing="1" class="template_msg_top" style="margin-bottom: -1px;border-bottom:none; border:1px solid #e7e7eb;"> 
         <tr>
              <td style="padding-left:15px;"><asp:Button ID="Button1" OnClientClick="return(check())" CssClass="button" runat="server" Text="һ����ȡ�ҵ�ģ��ID" onclick="Button1_Click" style="vertical-align: middle;"/>
<input type="checkbox" name="chkall" id="chkall" onclick="selectAll(this.checked);"/><label for="chkall">ȫ��ѡ��</label>                  &nbsp;&nbsp;</td>
             </tr>
        </table>
        <script>
            function selectAll(b) {
                $(".template_msg").find("input[type='checkbox']").each(function () {
                    $(this).prop("checked", b);
                });
            }
            function check() {
                var num = 0;
                $(".template_msg").find("input[type='checkbox']").each(function () {
                    if ($(this).prop("checked") == true) {
                        num++;
                    }
                });
                if (num > 25) {
                    KesionJS.Alert('��ܰ��ʾ�����ֻ��ѡ��25��ģ����Ϣ������ǰѡ����' + num + '����');
                    return false;
                } else {
                    return true;
                }
            }
        </script>

        <KS:KSGV ID="list" cssclass="template_msg" runat="server" width="100%" AutoGenerateColumns="False" EmptyDataText="����ģ����Ϣ��¼!" GridLines="None" OnRowDataBound="list_RowDataBound" PagerType="CustomNumeric">
            <Columns>
			  <asp:BoundField HeaderText="���" DataField="id">
                    <ItemStyle HorizontalAlign="Center"  Width="10%" />
                </asp:BoundField>
             <asp:BoundField HeaderText="ģ�����" DataField="templateID">
                    <ItemStyle HorizontalAlign="Center"  Width="20%" />
                </asp:BoundField>
            <asp:TemplateField HeaderText="����">
                <ItemStyle HorizontalAlign="Center"  Width="10%"  />
                <ItemTemplate>
                 <asp:HiddenField ID="Hidenable" Value='<%# Eval("enable") %>' runat="server" />
                 <asp:CheckBox ID="CkbEnable" runat="server" />
                 </ItemTemplate>
            </asp:TemplateField>  

             <asp:BoundField HeaderText="����" DataField="name">
                    <ItemStyle HorizontalAlign="Center"  Width="20%" />
            </asp:BoundField>
             <asp:BoundField HeaderText="�ҵ�ģ��ID" DataField="MyTemplateID">
                    <ItemStyle HorizontalAlign="Center"  Width="40%" />
            </asp:BoundField>

            
            </Columns>
           
            <PagerStyle CssClass="Page" HorizontalAlign="Right" />
            <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
      </KS:KSGV>
      
     <br />
      <div class="warn_templatemsg">
        <script type="text/javascript">
            showtips('<span class="state"><strong>˵����</strong><br /></span>1��ʹ������ִ��һ����ȡ�ҵ�ģ��ID��<br/>2��΢������ÿ�����ֻ��ͬʱ��ͨ15��ģ����Ϣ�������ȡ�ҵ�ģ��ID��ʾ�����ѹ���15�������¼΢�Ź���ƽ̨�������ɾ��ģ�壬�����»�ȡ��');
		</script>
      </div>
    
   
   
     </asp:Panel>
  
  
  </div>
</asp:Content>

