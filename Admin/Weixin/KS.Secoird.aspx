<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master"  AutoEventWireup="true" Inherits="Kesion.Weixin.WebSite.weixin_secoird" Codebehind="KS.Secoird.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<link href="/admin/weixin/images/style.css" rel="stylesheet" />
  <div id="manage_top" class="toptitle menu_top_fixed">
 二维码设置
  </div>
  <div class="menu_top_fixed_height"></div> 
  
 <div class="content-area"> 
   <div class="content01">
   <ul class="make_code">  
   <li style="width: 100%;border-bottom: 1px solid #e7e7eb;"><img src="<%=ss %>" width="248" height="240" /></li>
   <li style="padding: 10px;"> <asp:Label ID="Label1" runat="server" Text="Label" style="margin-bottom: 10px;display: block;">请输入关键字</asp:Label>
    <asp:TextBox ID="TextBox1" runat="server" CssClass="textbox" style="margin-bottom: 10px; width:228px;"></asp:TextBox>
    <asp:Button ID="btn" runat="server" Text="生成二维码" OnClick="btn_Click"   CssClass="button" style="width: 100%;height: 29px;line-height: 29px;"/></li>

    
  </ul>
  </div>
</div>  
</asp:Content>

