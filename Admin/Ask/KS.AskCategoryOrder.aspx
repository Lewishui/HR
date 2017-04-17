<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_AskCategoryOrder" Title="一级分类排序" Codebehind="KS.AskCategoryOrder.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
   <script language="JavaScript">
    document.oncontextmenu=new Function("event.returnValue=false;");
    document.onselectstart=new Function("event.returnValue=false;");
    </script>
    
    <!--<KS:TopNav ID="TopNav2" runat="server" Text="&lt;ul&gt;&lt;li id='p9'&gt;&lt;b&gt;&lt;/b&gt;&lt;a href='javascript:history.back();'&gt;返回&lt;/a&gt;&lt;/li&gt; 一级问答分类排序" />-->
    <div id="manage_top" class="toptitle menu_top_fixed">
       	一级问答分类排序
        <ul><li id='p9'><b></b><a href="javascript:;" onclick="location.href='KS.AskCategory.aspx';">返回</a></li> </ul>
    </div>
    <div class="menu_top_fixed_height"></div> 
    <div class="content-area">
    
    <KS:KSGV ID="list" runat="server" CssClass="CTable" AutoGenerateColumns="False" EmptyDataText="还没有添加分类!" GridLines="None" OnRowDataBound="list_RowDataBound" PagerType="CustomNumeric" Width="99%" OnDataBound="list_DataBound" OnRowCommand="list_RowCommand">
        <EmptyDataRowStyle CssClass="emptycss" />
        <Columns>
            <asp:BoundField DataField="classid" HeaderText="分类ID" >
                <itemstyle horizontalalign="Center" width="50px" />
            </asp:BoundField>
            <asp:BoundField DataField="classname" HeaderText="分类名称" />
            <asp:BoundField DataField="root" HeaderText="序号" >
                <itemstyle horizontalalign="Center" width="100px" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="一级分类排序操作">
            <itemtemplate>
             <table border="0" cellpadding="0" cellspacing="0" align="center">
                <tr>
                <td style="width: 49%" nowrap>
                       <asp:DropDownList ID="DropUpOrder" runat="server" AutoPostBack="False">
                          <asp:ListItem Selected="True" Value="0">↑向上移动</asp:ListItem>
                         </asp:DropDownList>
                        &nbsp;<asp:Button runat="server" ID="UpButton" onmouseover="this.className='button_on';" onmouseout="this.className='button';" class="button" Text="修改" commandname="uporder" commandargument=<%#Eval("root") %>></asp:Button>

              </td>
              <td>&nbsp;</td>
              <td style="width: 49%" nowrap>
               <asp:DropDownList ID="DropDownOrder" runat="server" AutoPostBack="False">
                  <asp:ListItem Selected="True" Value="0">↓向下移动</asp:ListItem>
               </asp:DropDownList>&nbsp;<asp:Button ID="DownButton" onmouseover="this.className='button_on';" onmouseout="this.className='button';" class="button" Text="修改" commandname="downorder" commandargument=<%#Eval("root") %> runat="server" />
            </td>
            </table>
</itemtemplate>
            
            </asp:TemplateField>
        </Columns>
        <HeaderStyle CssClass="CTitle" />
    </KS:KSGV>
    <KS:Page ID="Page1" runat="server" />
    
   </div> 
</asp:Content>

