<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_UserBlogComment" Codebehind="UserBlogComment.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel runat="server" ID="MainPanel">
 
	<div class="r_tybox nomar">

        <div class="tabs">
            <ul>
                <li><a href="UserMessage.aspx">留言管理</a></li>
                <li class="puton"><a href="UserBlogComment.aspx">博文评论管理</a></li>
                <li><a href="UserAlbumComment.aspx">相册评论管理</a></li>
            </ul>

       
    </asp:Panel>

    <asp:Panel ID="Panel1" runat="server" Visible="true">
    <div class="r_padbox">
    <div class="tabs2">
        <ul>
        <li<%=Kesion.Publics.KSCMS.S("showType")==""?" class='puton'":string.Empty %>><a href="UserBlogComment.Aspx"><span>所有记录</span></a></li>
        <li<%=Kesion.Publics.KSCMS.S("showType")=="1"?" class='puton'":string.Empty %>><a href="UserBlogComment.Aspx?showType=1"><span>未审核的记录</span></a></li>
        <li<%=Kesion.Publics.KSCMS.S("showType")=="2"?" class='puton'":string.Empty %>><a href="UserBlogComment.Aspx?showType=2"><span>已审核的记录</span></a></li>
        </ul>
    </div>

    <KS:ksgv id="List" runat="server" AutoGenerateColumns="False" CssClass="border" EmptyDataText="无记录" PagerType="CustomNumeric" Width="99%" HorizontalAlign="center" GridLines="None" OnRowDataBound="List_RowDataBound" OnRowCommand="List_RowCommand" OnRowCreated="List_RowCreated" >
            <Columns>
                <asp:BoundField HeaderText="ID号" DataField="ID" ItemStyle-CssClass="splittd">
                    <ItemStyle HorizontalAlign=Center Width="80" />
                </asp:BoundField>


                <asp:TemplateField HeaderText="标题" ItemStyle-CssClass="splittd" ItemStyle-Width="400" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" >
                    <ItemTemplate>
                        <%# (bool)string.IsNullOrEmpty(Eval("Title").ToString())? "(无)": "<a href='"+Kesion.HtmlTags.BasicField.GetBlogArticleUrl(Utils.StrToInt(Eval("LogID").ToString()),Eval("userid").ToString()) +"' target='_blank'>"+Eval("Title")+"</a>"%>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:BoundField HeaderText="留言时间" ItemStyle-CssClass="splittd" DataField="AddTime" >
                    <itemstyle width="200px" horizontalalign="Center" />
                </asp:BoundField>

                <asp:TemplateField HeaderText="状态" ItemStyle-CssClass="splittd" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80">
                    <ItemTemplate>
                        <%# Eval("Flag").ToString() == "1" ?"已审核":"<span style='color:red;'>未审核</span>" %>
                    </ItemTemplate>
                </asp:TemplateField>

            
                <asp:TemplateField ItemStyle-CssClass="splittd" HeaderText="↓管理操作">
                    <itemstyle width="300px" horizontalalign="Center" />
                 <itemtemplate>

                 <asp:LinkButton ID="LinkButton2" runat="server" commandargument=<%#Eval("ID") %> commandname="detail">查看/回复</asp:LinkButton> &nbsp;&nbsp;
                 <asp:LinkButton ID="LinkButton3" runat="server" commandargument=<%#Eval("ID") %> commandname="check">审核</asp:LinkButton> &nbsp;&nbsp;
                 <asp:LinkButton runat="server" id="delete" commandargument=<%#Eval("ID") %> commandname="del">删除</asp:LinkButton>
                
            
            
    </itemtemplate>
           
                </asp:TemplateField>
            </Columns>
            <HeaderStyle CssClass="title" />
            <RowStyle CssClass="tdbg" />
                <PagerStyle CssClass="Page" HorizontalAlign="Right" />
                <EmptyDataRowStyle CssClass="emptycss" />
        </KS:ksgv>
        <asp:Panel ID="Panel2" runat="server" Height="30px" Width="100%">

               <div class="fy_box"><KS:Page ID="Page1" runat="server" /></div>
          </div>
          </div> 
          
        </asp:Panel>
    </asp:Panel>

    <asp:Panel runat="server" ID="Mdatil" Visible="false">
         <table cellspacing="1" cellpadding="3" class="border" width="100%" align="center" border="0">
          <tr class="tdbg">
                <td width="100" style="text-align:right;">用户：</td>
                <td><label runat="server" id="labSender"></label></td>
              
            </tr>
            <tr class="tdbg">
                <td style="text-align:right;">留言主题</td>
                <td><label runat="server" id="labTitle"></label></td>
            </tr>
             <tr class="tdbg">
                <td style="text-align:right;">留言内容</td>
                <td><label runat="server" id="labText"></label></td></tr>
             
          <tr class="tdbg">
              <td  style="text-align:right;">回复留言</td>
                  <td>
                      <textarea id="txtReplyContent" runat="server" class="textbox" cols="70" name="Content"  rows="4" style="height:100px;width:500px; color:#777;"></textarea>
  
                 </td>
              </tr>
            <tr class="tdbg">
                 <td width="100" style="text-align:right;"></td>
                     <td class="splittd" style="height:50px; text-align:left;border-bottom:0px; font-size:12px">
                         <input type="hidden" value="0" runat="server" id="mid">
                    <asp:Button ID="Button1" runat="server" OnClientClick="return CheckForm()" class="button" text=" 回 复 " OnClick="Unnamed1_Click" />　
                         　 <asp:Button runat="server" class="button" text=" 返 回 " OnClick="Unnamed1_Click2" />

                     </td>
                 </tr>
          </table>

        <script>
            function CheckForm() {
                if ($('#<%=this.txtReplyContent.ClientID%>').val() == "") {
                    alert("请输入你的回复内容！");
                    $('#<%=this.txtReplyContent.ClientID%>').focus();
                    return false;
                }
                return true;
            }
       </script>

    </asp:Panel>


</asp:Content>

