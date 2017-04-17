<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_KeyTags" Title="关键字Tags管理" Codebehind="KS.KeyTags.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
  <asp:Panel runat="server" ID="listPannel" Width="100%">  
      <div id="manage_top" class="menu_top_fixed">
       <ul class="titleTab"><li><strong>管理操作：</strong></li>
          <li><a href="KS.Author.aspx">作者管理</a></li>
          <li><a href="KS.CopyFrom.aspx">来源管理</a></li>
          <li class="curr"><a href="KS.KeyTags.aspx">关键字管理</a></li>
       </ul>
      </div>  
      <div class="menu_top_fixed_height"></div> 
      <div class="content-area">
         <div class="myTitle">
         	 关键字管理
      		 <span class="fr"><asp:LinkButton ID="addtags" CssClass="button" runat="server" OnClick="addtags_Click">添加Tags</asp:LinkButton></span>
          </div>
      <KS:KSGV ID="list" cssclass="CTable" runat="server" AutoGenerateColumns="False" Width="99%" EmptyDataText="没有添加任何关键字Tags" GridLines="None" OnRowDataBound="list_RowDataBound" OnRowCommand="list_RowCommand" OnRowCreated="list_RowCreated">
          <Columns>
              <asp:TemplateField HeaderText="选择">
                <ItemStyle HorizontalAlign="Center"  Width="30px"/>
                <ItemTemplate>
                <input type="checkbox"  name="ids" id="ids" value="<%#Eval("tagsid") %>" />
                </ItemTemplate>
                </asp:TemplateField>

              <asp:BoundField DataField="FirstAlphabet" HeaderText="首字母" >
               <itemstyle horizontalalign="Center" />
              </asp:BoundField>
              <asp:BoundField DataField="" HeaderText="" />
              
              <asp:TemplateField HeaderText="TAGS名称">
                <itemstyle horizontalalign="Center" />
                <itemtemplate>
                    <a href="<%# Kesion.HtmlTags.BasicField.GetTagsUrl(Convert.ToString(Eval("TagsID"))) %>" target="_blank"><%# Eval("KeyText") %></a>
               </itemtemplate>
              </asp:TemplateField>
              
              <asp:BoundField DataField="tagshits" DataFormatString="{0} 次" HeaderText="使用频率（次数）" >
                  <itemstyle horizontalalign="Center" />
              </asp:BoundField>
              <asp:BoundField DataField="todayhits" DataFormatString="{0} 次" HeaderText="今日（次数）" >
                  <itemstyle horizontalalign="Center" />
              </asp:BoundField>
              <asp:BoundField DataField="yesterdayhits" DataFormatString="{0} 次" HeaderText="昨日（次数）" >
                  <itemstyle horizontalalign="Center" />
              </asp:BoundField>
              <asp:BoundField DataField="weekhits" DataFormatString="{0} 次" HeaderText="本周（次数）" >
                  <itemstyle horizontalalign="Center" />
              </asp:BoundField>
              <asp:BoundField DataField="lastusetime" HeaderText="最后使用时间" >
                  <itemstyle horizontalalign="Center" />
              </asp:BoundField>

               <asp:TemplateField HeaderText="状态">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                   <a href="?action=status&id=<%#Eval("tagsid")%>" <%# Convert.ToString(Eval("status"))=="0"?"class='no' title='锁定'":"class='ok' title='正常'" %>></a>
              </itemtemplate>
            </asp:TemplateField>


             <asp:TemplateField HeaderText="编辑">
                    <itemstyle width="30px" horizontalalign="Center"/>
                       <itemtemplate>
             <asp:LinkButton ID="LinkButton1" CssClass="edit" ToolTip="编辑" runat="server" commandargument=<%#Eval("tagsid") %> commandname="modify"><img src="../../admin/images/Edit.gif" border="0" title="修改" /></asp:LinkButton>
                    </itemtemplate>
                </asp:TemplateField>
            <asp:TemplateField HeaderText="删除">
                    <itemstyle width="30px" horizontalalign="Center"/>
                       <itemtemplate>
             <asp:LinkButton runat="server" id="delete" ToolTip="删除" CssClass="delete" commandargument=<%#Eval("tagsid") %> commandname="del"><img src="../../admin/images/del.gif" border="0" title="删除"/></asp:LinkButton>
                    </itemtemplate>
                </asp:TemplateField>

          </Columns>
            <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
      </KS:KSGV>
      <div class="listedit">
          <input type='checkbox' name='chkall' id='chkall' onClick='CheckAll(this.form);'/><label for="chkall">全部选中</label>
          <asp:LinkButton ID="edittags" CssClass="button" runat="server" OnClick="edittags_Click">编辑Tags</asp:LinkButton>
          <asp:LinkButton ID="deltags" CssClass="button" runat="server" OnClick="deltags_Click">删除Tags</asp:LinkButton>
          <asp:LinkButton ID="LinkButton2" CssClass="button" OnClientClick="return(GetIDS());" runat="server" OnClick="Button1_Click">批量锁定</asp:LinkButton>
          <asp:LinkButton ID="LinkButton3" CssClass="button" OnClientClick="return(GetIDS());" runat="server" OnClick="Button2_Click">批量解锁</asp:LinkButton>
          </div>
    </div>

      <KS:Page ID="Page1" runat="server" />

  </asp:Panel>
  </div>
  <asp:Panel runat="server" ID="addPannel" Width="100%" Visible="false">
    <KS:TopNav ID="TopNav1" runat="server" Text="添加关键字Tags" />
    <div class="content-area">
        <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 198px"><b>关键字Tags名称：</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox ID="KeyText" CssClass="textbox" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="KeyText"
                    ErrorMessage="请输入关键字Tags名称!"></asp:RequiredFieldValidator></td>
          </tr>
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 198px"><b>关键字所属首字母：</b></td>
            <td class="righttd">
               &nbsp;<asp:DropDownList ID="DrpFirstAlphabet" runat="server">
               </asp:DropDownList></td>
          </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>Tags状态：</strong></td>
                <td class="righttd">
                    <asp:RadioButtonList ID="Status" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True" Value="1">正常</asp:ListItem>
                        <asp:ListItem Value="0">锁定</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
        </table>
      <br />
      <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" />
  </asp:Panel>
</div>  
</asp:Content>

