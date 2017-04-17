<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_TemplateMsg" Title="Untitled Page" Codebehind="KS.TemplateMsg.aspx.cs" %>
<%@ Import Namespace="System.Xml" %>
<%@ Import Namespace="Kesion.BLL" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Newtonsoft.Json" %>
<%@ Import Namespace="Newtonsoft.Json.Linq" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
       <KS:TopNav ID="TopNav2" runat="server" Text="微信模板消息设置" />
 <div class="content-area">
   
	<link href="/admin/weixin/images/style.css" rel="stylesheet" />
                <link rel="stylesheet" type="text/css" href="/admin/weixin/images/font/css/font-awesome.min.css">

 
       <table width="100%" border="0" cellpadding="1" cellspacing="1" class="template_msg_top" style="border-bottom:none;  border:1px solid #e7e7eb;"> 
            <tr>
               <td class="lefttd" align="right"><b>是否启用模板消息功能：</b></td>
               <td class="righttd">
                   <asp:RadioButtonList ID="RdbTemplateMsg" RepeatDirection="Horizontal" runat="server" OnSelectedIndexChanged="RdbTemplateMsg_SelectedIndexChanged" AutoPostBack="true">
                    <asp:ListItem Value="1" Selected class="star_input">启用</asp:ListItem>
                    <asp:ListItem Value="0" class="star_input">不启用</asp:ListItem>
                   </asp:RadioButtonList>
                </td>
       <td><span class="tips">1、只有认证通过的微信服务号才能使用本功能。<br />
           2、需要登录微信公众平台中心，将行业分类设置为：IT科技/互联网|电子商务，IT科技/IT软件与服务</span>
       </td>
	</tr></table>	

    <asp:Panel ID="listPanel" runat="server" Width="100%">
        <table width="100%" border="0" cellpadding="1" cellspacing="1" class="template_msg_top" style="margin-bottom: -1px;border-bottom:none; border:1px solid #e7e7eb;"> 
         <tr>
              <td style="padding-left:15px;"><asp:Button ID="Button1" OnClientClick="return(check())" CssClass="button" runat="server" Text="一键获取我的模板ID" onclick="Button1_Click" style="vertical-align: middle;"/>
<input type="checkbox" name="chkall" id="chkall" onclick="selectAll(this.checked);"/><label for="chkall">全部选中</label>                  &nbsp;&nbsp;</td>
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
                    KesionJS.Alert('温馨提示：最多只能选择25个模板消息，您当前选择了' + num + '个！');
                    return false;
                } else {
                    return true;
                }
            }
        </script>

        <KS:KSGV ID="list" cssclass="template_msg" runat="server" width="100%" AutoGenerateColumns="False" EmptyDataText="暂无模板消息记录!" GridLines="None" OnRowDataBound="list_RowDataBound" PagerType="CustomNumeric">
            <Columns>
			  <asp:BoundField HeaderText="序号" DataField="id">
                    <ItemStyle HorizontalAlign="Center"  Width="10%" />
                </asp:BoundField>
             <asp:BoundField HeaderText="模板库编号" DataField="templateID">
                    <ItemStyle HorizontalAlign="Center"  Width="20%" />
                </asp:BoundField>
            <asp:TemplateField HeaderText="启用">
                <ItemStyle HorizontalAlign="Center"  Width="10%"  />
                <ItemTemplate>
                 <asp:HiddenField ID="Hidenable" Value='<%# Eval("enable") %>' runat="server" />
                 <asp:CheckBox ID="CkbEnable" runat="server" />
                 </ItemTemplate>
            </asp:TemplateField>  

             <asp:BoundField HeaderText="标题" DataField="name">
                    <ItemStyle HorizontalAlign="Center"  Width="20%" />
            </asp:BoundField>
             <asp:BoundField HeaderText="我的模板ID" DataField="MyTemplateID">
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
            showtips('<span class="state"><strong>说明：</strong><br /></span>1、使用请先执行一键获取我的模板ID；<br/>2、微信限制每次最多只能同时开通15个模板消息，如果获取我的模板ID提示数量已过过15个，请登录微信公众平台管理里，先删除模板，再重新获取；');
		</script>
      </div>
    
   
   
     </asp:Panel>
  
  
  </div>
</asp:Content>

