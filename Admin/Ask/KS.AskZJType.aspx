<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_AskZJType" Title="专家分类管理" Codebehind="KS.AskZJType.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="ListPanel" runat="server" Width="100%">
    <div id="manage_top" class="menu_top_fixed">
         <ul>
           <li id='p1'><asp:LinkButton ID="addclassbutton" runat="server" OnClick="addclassbutton_Click"><b></b>添加专家类别</asp:LinkButton></li>
           <li id='p4'><asp:LinkButton ID="editclassbutton" runat="server" OnClick="editclassbutton_Click"><b></b>编辑专家类别</asp:LinkButton></li>
           <li id='p3'><asp:LinkButton ID="delclassbutton" runat="server" OnClick="delclassbutton_Click"><b></b>删除专家类别</asp:LinkButton></li></ul>
    </div>  
   <div class="menu_top_fixed_height"></div>      
   <div class="content-area"> 

 <div class="tabs_header">
    <ul class="tabs">
    <li><a href="KS.AskCategory.aspx"><span>问吧主题分类</span></a></li>
    <li class='active'><a href="KS.AskZJType.aspx"><span>问吧专家分类</span></a></li>
    </ul>
 </div>
    <KS:ksgv id="List" cssclass="CTable" runat="server" AutoGenerateColumns="False" EmptyDataText="没有添加任何专家类别!" PagerType="CustomNumeric" Width="99%" HorizontalAlign="Center" GridLines="None" OnRowDataBound="List_RowDataBound" OnRowCommand="List_RowCommand" OnRowCreated="List_RowCreated">
        <Columns>
         <asp:TemplateField HeaderText="选择">
                <itemstyle horizontalalign="Center" Height="30px" width="50px" />
                <itemtemplate>
                <input type="checkbox"  name="ids" id="ids" value="<%#Eval("typeid") %>" />
                </itemtemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="类别ID" DataField="TypeID" >
                <itemstyle width="50px" horizontalalign="Center" />
            </asp:BoundField>
            <asp:BoundField HeaderText="类别名称" DataField="TypeName" HtmlEncode="False" >
                <itemstyle  width="150px"  verticalalign="Middle"  horizontalalign="Center"/>
            </asp:BoundField>
            <asp:BoundField HeaderText="排列序号" DataField="OrderID">
                <itemstyle verticalalign="Middle"  horizontalalign="Center"/>
            </asp:BoundField>
            <asp:TemplateField HeaderText="编辑">
                  <itemstyle horizontalalign="Center" width="25px"/>
                        <itemtemplate>
                         <asp:LinkButton CssClass="edit" ToolTip="编辑" ID="LinkButton1" runat="server" commandargument=<%#Eval("typeid") %> commandname="modify"></asp:LinkButton>
                  </itemtemplate>
              </asp:TemplateField>
            <asp:TemplateField HeaderText="删除">
                <itemstyle horizontalalign="Center" width="25px"/>
             <itemtemplate>
             
             <asp:LinkButton runat="server" CssClass="delete" ToolTip="删除" id="delete" commandargument=<%#Eval("typeid") %> commandname="del"></asp:LinkButton>
            
            
</itemtemplate>
           
            </asp:TemplateField>
        </Columns>
        <HeaderStyle CssClass="CTitle" />
        <EmptyDataRowStyle CssClass="emptycss" />
       
    </KS:ksgv>
    
     <KS:Page ID="Page1" runat="server" />
                <asp:Panel ID="Panel1" runat="server" Height="30px" Width="100%">
                <br />
        <script type="text/javascript">
		showtips('<span class="state"><strong>操作说明：</strong><br /></span>专家类别一旦建立，建议尽量少改动。最好不要删除操作以免导致专家所属类别无法关联。');
		</script>

            </asp:Panel>
</asp:Panel>
</div>

     
    <asp:Panel ID="AddPanel" runat="server"  Width="100%" Visible="false">
    <KS:TopNav ID="TopNav1" runat="server" Text="添加专家类别" />
    <div class="content-area">
    <table width="99%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 198px"><b>专家类别名称：</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="TypeName" runat="server" Width="203px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TypeName"
                    ErrorMessage="请填写专家类别名称!" Display="Dynamic"></asp:RequiredFieldValidator> <span class="tips">如：护理保健、孕前检查等。</span></td>
        </tr>


        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>排 序 号：</strong></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="OrderID" runat="server" Width="60px"></asp:TextBox><span class="tips">序号越小排在越前面。</span></td>
        </tr>
      </table>
      <br />
        <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" />
      
    </asp:Panel>

  </div>
</asp:Content>
