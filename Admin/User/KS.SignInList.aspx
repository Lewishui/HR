<%@ Page Language="C#"MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="True" Title="Untitled Page" Inherits="Kesion.NET.WebSite.Admin_User_SignInList" Codebehind="KS.SignInList.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

 <div id="manage_top" class="menu_top_fixed">
 &nbsp;&nbsp;<strong>用户名：</strong><asp:TextBox ID="TxtKeyWord" runat="server" CssClass="textbox" />

<asp:Button ID="BtnSearch" runat="server" Text="快速搜索" CssClass="button" 
        onclick="BtnSearch_Click" />
</div>
 <div class="menu_top_fixed_height"></div>  
 <div class="content-area">
 	<div class="myTitle">用户签到记录管理</div>
    <script type="text/javascript">
        function GetMyIds() {
            var sid = null;
            for (var i = 0; i < document.getElementsByName("ids").length; i++) {
                var KS = document.getElementsByName("ids")[i];
                if (KS.checked == true) {
                    if (sid == null)
                        sid = KS.value;
                    else
                        sid += "," + KS.value;
                }
            }
            return sid;
        } 
  </script>
<asp:GridView runat="server" EmptyDataText="没有用户签到记录！" ID="grvList" AutoGenerateColumns="False" GridLines="None" CssClass="CTable" Width="99%"  ShowFooter="True" OnRowCreated="list_RowCreated" OnRowCommand="grvList_RowCommand">
          <HeaderStyle CssClass="CTitle" />
        <EmptyDataRowStyle CssClass="emptycss" />
        <Columns>
             <asp:TemplateField HeaderText="选择">
                <itemstyle horizontalalign="Center" width="50px" />
                <itemtemplate>
                    <input type="checkbox"  name="ids" id="ids" value="<%#Eval("ID") %>" />
                </itemtemplate>
              </asp:TemplateField>
             <asp:BoundField DataField="UserID" HeaderText="用户ID" >
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>

            <asp:BoundField DataField="UserName" HeaderText="用户名" >
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>

            <asp:TemplateField HeaderText="领取数量">
            <itemstyle horizontalalign="Center" Height="30px"/>
            <itemtemplate>
                <span class="tips"><%# Eval("num") %>&nbsp;<%# GetType(Utils.StrToInt(Eval("numtype"))) %></span>
            </itemtemplate>
            </asp:TemplateField>
        
            <asp:BoundField DataField="AddDate" HeaderText="签到时间时间" >
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="UserIP" HeaderText="IP地址" >
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField> 
             <asp:TemplateField HeaderText="删除">
              <itemstyle width="50px"  CssClass="Ctd" horizontalalign="Center"/>
              <itemtemplate>
             <asp:LinkButton runat="server" id="delete" ToolTip="删除" CssClass="delete"  commandargument=<%#Eval("id") %> commandname="del"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>
        </Columns>

</asp:GridView><br />
    <input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">全部选中</label>
    <asp:Button ID="Button2" runat="server" CssClass="button" OnClientClick="return(GetIDS('del'));" OnClick="Button2_Click" Text="批量删除"></asp:Button>
     <KS:Page ID="Page1" runat="server" />
   </div>     
</asp:Content>



