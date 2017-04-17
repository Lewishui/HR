<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="True" Inherits="Kesion.NET.WebSite.Admin_FieldStatus" Title="字段管理" Codebehind="KS.FieldStatus.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics"%>
<%@ Import Namespace="Kesion.Cache"%>
<%@ Import Namespace="Kesion.BLL"%>
<%@ Import Namespace="System.Data"%>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <style>
        .list {
        }
            .list li {width:100px;float:left;
            }
    </style>
    <asp:Panel ID="listPanel" runat="server" Width="100%">
         <div class="list checklist"><ul>
        <asp:Repeater ID="FieldList" runat="server">
            <ItemTemplate>
                <li>
                 <label><%#Eval("FieldAlias")%><input type="checkbox" value="1" name="<%#Eval("name")%>" <%# Convert.ToString(Eval("ManageItem"))=="1"?" checked":"" %>/>
                 </label></li>
            </ItemTemplate>
        </asp:Repeater>
       </ul></div>
        <asp:Panel ID="Panel1" runat="server" CssClass="pop-button">
            <asp:Button ID="Button1" runat="server" Text="批量保存" OnClick="Button1_Click" />
            </asp:Panel>

     </asp:Panel>

  </asp:Content>