<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_UserPhoto" Codebehind="UserPhoto.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>

<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel runat="server" ID="MainPanel">

	<div class="r_tybox nomar">
    	<div class="r_title"><h4>我的相册管理</h4></div>

        <div class="r_padbox">
            <div class="clear"></div>
            <div class="padnav">
                <span><a href="UserSubPhoto.aspx"  >发布照片</a></span>
            
    </asp:Panel>

    <asp:Panel ID="Panel1" runat="server">
    <div class="tabs2">
        <ul>
            <li<%=Kesion.Publics.KSCMS.S("showType")==""?" class='puton'":string.Empty %>><a href="UserPhoto.Aspx"><span>所有记录</span></a></li>
            <li<%=Kesion.Publics.KSCMS.S("showType")=="1"?" class='puton'":string.Empty %>><a href="UserPhoto.Aspx?showType=1"><span>未审核的记录</span></a></li>
            <li<%=Kesion.Publics.KSCMS.S("showType")=="2"?" class='puton'":string.Empty %>><a href="UserPhoto.Aspx?showType=2"><span>已审核的记录</span></a></li>
        </ul>
    </div>

    <KS:ksgv id="List" runat="server" CssClass="border" AutoGenerateColumns="False" EmptyDataText="您没有上传照片！" PagerType="CustomNumeric" Width="100%" HorizontalAlign="center" GridLines="None" OnRowDataBound="List_RowDataBound" OnRowCommand="List_RowCommand" OnRowCreated="List_RowCreated" >
            <Columns>
                <asp:BoundField HeaderText="ID号" ItemStyle-CssClass="splittd" DataField="PicID" >
                    <ItemStyle HorizontalAlign=Center Width="80" />
                </asp:BoundField>


                <asp:TemplateField HeaderText="标题" ItemStyle-CssClass="splittd" ItemStyle-Width="400" ItemStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <a href="<%#Kesion.HtmlTags.BasicField.GetBlogAlbumUrl(Utils.StrToInt(Eval("PicID").ToString()),Eval("userid").ToString())%>" target="_blank"><img src="<%# Eval("PhotoUrl") %>" width="45" height="45" style="border:1px solid #ccc;padding:1px;"/><%#Eval("Title") %></a>
                    </ItemTemplate>
                </asp:TemplateField>



                <asp:BoundField HeaderText="添加时间" ItemStyle-CssClass="splittd" DataField="AddDate" >
                    <itemstyle width="200px" horizontalalign="Center" />
                </asp:BoundField>

                <asp:TemplateField HeaderText="状态" ItemStyle-CssClass="splittd" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80">
                    <ItemTemplate>
                        <%# Eval("Status").ToString() == "1" ?"已审核":"<span style='color:red;'>未审核</span>" %>
                    </ItemTemplate>
                </asp:TemplateField>

            
                <asp:TemplateField HeaderText="↓管理操作">
                    <itemstyle width="300px" CssClass="splittd" horizontalalign="Center" />
                 <itemtemplate>

                 <asp:LinkButton ID="LinkButton1" runat="server" commandargument=<%#Eval("PicID") %> commandname="modify">修改</asp:LinkButton> &nbsp;&nbsp;
                 <asp:LinkButton runat="server" id="delete" commandargument=<%#Eval("PicID") %> commandname="del">删除</asp:LinkButton>
                
            
            
    </itemtemplate>
           
                </asp:TemplateField>
            </Columns>
           <RowStyle CssClass="tdbg" />
           <HeaderStyle CssClass="title" />
           <EmptyDataRowStyle CssClass="emptycss" />
        </KS:ksgv>
        <asp:Panel ID="Panel2" runat="server" Height="30px" Width="100%">

           
              
              <div class="fy_box"><KS:Page ID="Page1" runat="server" /></div>
                   
       		</div>
       </div>
            
    </asp:Panel>
</asp:Panel>

</asp:Content>

