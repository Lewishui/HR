<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master"AutoEventWireup="true" CodeBehind="KS.MenuList.aspx.cs" Inherits="Kesion.NET.Mobile.Admin.Weixin.KS_MenuList"%>
    <asp:Content ID="Content1" ContentPlaceHolderID="KSContent" runat="server">
        <link rel="stylesheet" type="text/css" href="/admin/weixin/images/font/css/font-awesome.min.css">
        <link href="/admin/weixin/images/style.css" rel="stylesheet" />
        <div class="messagebox">
            <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound">
                <HeaderTemplate>
                    <table width="100%" class="CTable menu_list_table" align="center" border="0" cellpadding="0"  cellspacing="0">
                        <tr class="CTitle">
                            <td>
                                菜单名称
                            </td>
                            <td>
                                显示顺序
                            </td>
                            <td>
                                操作
                            </td>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td style="font-weight: bold;">
                            <%#Eval("ClassName") %>
                        </td>
                        <td align="center">
                            <%#Eval("OrderID")%>
                        </td>
                        <td align="center">
                            <a href="KS.MenuList.aspx?action=ParentDown&menuid=<%#Eval("id") %>">
                                <i class="fa fa-arrow-down" style="color: #2694D2;">
                                </i>
                            </a>
                            <a href="KS.MenuList.aspx?action=ParentUp&menuid=<%#Eval("id") %>">
                                <i class="fa fa-arrow-up" style="color: #CE9738;">
                                </i>
                            </a>
                        </td>
                    </tr>
                    <asp:Repeater ID="Repeater2" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td style="padding-left: 30px;">
                                    <img src="/admin/weixin/images/menu.png" style="margin: 5px;" />
                                    <%#Eval("ClassName")%>
                                </td>
                                <td align="center">
                                    <%#Eval("OrderID")%>
                                </td>
                                <td align="center">
                                    <a href="KS.MenuList.aspx?action=ChildDown&menuid=<%#Eval("id")%>&parentid=<%#Eval("ParentID ")%>">
                                        <i class="fa fa-arrow-down" style="color: #2694D2;">
                                        </i>
                                    </a>
                                    <a href="KS.MenuList.aspx?action=ChildUp&menuid=<%#Eval("id")%>&parentid=<%#Eval("ParentID ")%>">
                                        <i class="fa fa-arrow-up" style="color: #CE9738;">
                                        </i>
                                    </a>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </ItemTemplate>
                <FooterTemplate>
                    <tr width="100%" style="display:<%# bool.Parse((Repeater1.Items.Count==0).ToString())?"":"none "%>">
                        <td class="empty" colspan="7">
                            你还没有菜单信息
                        </td>
                    </tr>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
        </div>
        <br />
        <div class="openKey" style=" font-weight:normal;">
            排序完，请到自定义菜单的页面点击同步菜单
        </div>
</asp:Content>