<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin.Shop.Admin_DataBack" Title="数据备份" Codebehind="KS.DataBack.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.BLL" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

<asp:Panel ID="listPanel" runat="server" Width="100%">
   <KS:TopNav ID="top1" runat="server" Text="在线备份数据库" />
    <div class="content-area">
    <div class="con-inner">
      <script>
          function view(tablename) {
              parent.openWin('查看表['+tablename+']的字段', 'System/KS.Data.Table.aspx?tablename=' + tablename, false);
          } 
      </script>



        <table class="CTable">
            <tr>
            <td style="width: 100px"><strong>数据库名称</strong></td>
            <td><asp:TextBox ID="TxtDataBaseName" CssClass="textbox" runat="server" Width="250px"></asp:TextBox>
                <span class="tips">填写数据库的名称</span>
            </td>
            </tr>
            <tr>
                <td style="width: 100px"><strong>备份名称</strong></td>
                <td><asp:TextBox ID="TxtFileName" CssClass="textbox" runat="server" Width="250px"></asp:TextBox>
                    <span class="tips">（如:<%=DateTime.Now.ToShortDateString().Replace("/","-") %>.bak）</span></td>
            </tr>
            <tr>
            <td colspan="2"><asp:Button ID="Button1" CssClass="button" runat="server" Text="备份数据库" OnClick="Button1_Click" /></td>
            </tr>
        </table>
       
        <br />&nbsp;
        <strong>备份记录：</strong>

        <KS:KSGV ID="TableListView" cssclass="CTable" runat="server" AutoGenerateColumns="False"  GridLines="None"
            OnRowDataBound="FieldListView_RowDataBound" PagerType="CustomNumeric" Width="99%" EnableTheming="True" HorizontalAlign="Center" EmptyDataText="没有数据表!" OnRowCommand="TableListView_RowCommand">
            <Columns>
              <asp:TemplateField HeaderText="序号">
                <itemstyle horizontalalign="Center" width="50px" />
                <itemtemplate>
                    <%#Container.DataItemIndex+1%>        
                </itemtemplate>
              </asp:TemplateField>
            
                 <asp:TemplateField HeaderText="备份文件名">
                  <itemstyle/>
                    <ItemTemplate>
                    <%# Eval("Name")%>
                  </ItemTemplate>  
                </asp:TemplateField>
               
                 <asp:TemplateField HeaderText="大小">
                  <itemstyle/>
                    <ItemTemplate>
                    <%# Eval("Size")%>
                  </ItemTemplate>  
                </asp:TemplateField>
               
                 <asp:TemplateField HeaderText="备份时间">
                  <itemstyle/>
                    <ItemTemplate>
                     <%# Eval("Time")%>
                  </ItemTemplate>  
                </asp:TemplateField>
                <asp:TemplateField HeaderText="删除">
                    <itemstyle width="30px" horizontalalign="Center"/>
                      <itemtemplate>
                          <asp:LinkButton OnClientClick="return(confirm('确认删除吗？'))" runat="server" id="delete" CssClass="delete" commandargument=<%#Eval("name") %> commandname="del" ToolTip="删除数据库备份文件"></asp:LinkButton>
                    </itemtemplate>
                </asp:TemplateField>
        
            </Columns>
            <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
        </KS:KSGV>
        <br />



        <table cellpadding="0" cellspacing="0" style="width: 100%;margin-top:10px">
            <tr>
                <td style="height: 25px">&nbsp;
                    
                    </td>
                <td style="font-size: 9pt; height: 25px; text-align: right">
                    <asp:Label ID="Label7" runat="server" Text="当前页码为："></asp:Label>
                    <asp:TextBox ID="labPage" runat="server" AutoPostBack="True" OnTextChanged="labPage_TextChanged"
                        Text="1" Width="30px"></asp:TextBox>
                    &nbsp; &nbsp;
                    <asp:Label ID="Label6" runat="server" Text="总页数："></asp:Label><asp:Label ID="labBackPage"
                        runat="server"></asp:Label>
                    页 每页显示：<asp:Label ID="labperpagenum" runat="server" Text="Label"></asp:Label>
                    条
                    <asp:LinkButton ID="lnkbtnOne" runat="server" Font-Underline="False" ForeColor="Red"
                        OnClick="lnkbtnOne_Click">第一页</asp:LinkButton>
                    <asp:LinkButton ID="lnkbtnUp" runat="server" Font-Underline="False" ForeColor="Red"
                        OnClick="lnkbtnUp_Click">上一页</asp:LinkButton>
                    <asp:LinkButton ID="lnkbtnNext" runat="server" Font-Underline="False" ForeColor="Red"
                        OnClick="lnkbtnNext_Click">下一页</asp:LinkButton>&nbsp;
                    <asp:LinkButton ID="lnkbtnBack" runat="server" Font-Underline="False" ForeColor="Red"
                        OnClick="lnkbtnBack_Click">最后一页</asp:LinkButton>
                    &nbsp;
                </td>
            </tr>
        </table>



        </div>
        
         <br />
       <div class="message">
            <strong>说明：</strong><br />
            1、网站和数据库没有安装在同一台服务器，无法使用此功能；<br />
            2、数据库备份文件存放在网站根目录下的“App_Data/BackUp/”目录；<br />
            3、数据库备份成功后，建议及时通过FTP软件下载到本地电脑存放；<br />

        </div>
		

     </asp:Panel>
     
  </div>
     
</asp:Content>