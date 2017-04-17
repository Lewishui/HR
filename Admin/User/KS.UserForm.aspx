<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_UserForm" Title="Untitled Page" Codebehind="KS.UserForm.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="ListPanel" runat="server" Height="50px" Width="100%">
      <div id="manage_top" class="menu_top_fixed">
             <ul>
            <li><strong>管理操作：</strong></li>
            <li class="curr"><a href="KS.UserForm.aspx">用户表单管理</a></li>
            <li><a href="KS.UserField.aspx">用户字段管理</a></li>
        </ul>
    </div>
     <div class="menu_top_fixed_height"></div> 
     <div class="content-area"> 
        <div class="myTitle">用户表单管理
            <span style="float:right"><asp:Button ID="Button2" runat="server" Text="添加用户表单" CssClass="button" OnClick="addclassbutton_Click" /></span></div>
        <KS:KSGV ID="List" cssclass="CTable" runat="server" GridLines="None" AutoGenerateColumns="False" EmptyDataText="没有添加任何用户表单" PagerType="CustomNumeric" Width="99%" OnRowDataBound="List_RowDataBound" OnRowCreated="List_RowCreated" OnRowCommand="List_RowCommand">
            <HeaderStyle CssClass="CTitle" />
            <Columns>
                       <asp:TemplateField HeaderText="选择">
                
                <itemtemplate>
<input type="checkbox"  name="ids" id="ids" value="<%#Eval("formid") %>" />
           
</itemtemplate>
                <itemstyle horizontalalign="Center" Height="30px" width="50px" />
            </asp:TemplateField>
                <asp:BoundField DataField="formid" HeaderText="ID">
                    <itemstyle horizontalalign="Center" width="60px" />
                </asp:BoundField>
                <asp:BoundField DataField="formname" HeaderText="表单名称">
                    <itemstyle horizontalalign="Center" width="120px" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="简要说明">
                  <itemtemplate>
                   <span class="tips"><%# Eval("note") %></span>
                  </itemtemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="编辑">
                  <itemstyle horizontalalign="Center" width="25px"/>
                  <itemtemplate>
                     <asp:LinkButton CssClass="edit" ToolTip="编辑" ID="LinkButton1" runat="server" commandargument=<%#Eval("formid") %> commandname="modify"><img src="../../admin/images/Edit.gif" border="0" title="修改" /></asp:LinkButton>
                  </itemtemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="删除">
                    <itemtemplate>
                         <asp:LinkButton CssClass="delete" ToolTip="删除" runat="server" id="delete" commandargument=<%#Eval("formid") %> commandname="del"></asp:LinkButton>
                    </itemtemplate>
                    <itemstyle horizontalalign="Center" width="25px" />
                </asp:TemplateField>
            </Columns>
            <EditRowStyle CssClass="emptycss" />
        </KS:KSGV>
          <div style="margin-top:2px;overflow:hidden;"></div>
            &nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">全部选中</label>
        <asp:Button ID="BtnDel" runat="server" Text="批量删除"  OnClientClick="return(confirm(&#39;确定要执行删除操作吗?&#39;));" CssClass="button" OnClick="delclassbutton_Click" onmousedown="return(GetIDS(&#39;&#39;));" />
     </div>

    </asp:Panel>
</div>    
    <asp:Panel ID="AddPanel" runat="server" Width="100%" Visible="false">
        <KS:TopNav ID="TopNav1" runat="server" Text="新增用户组" />
<div class="content-area">        
      <table width="99%" align='center' border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 150px"><b>表单名称：</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="FormName" runat="server" Width="268px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="FormName"
                    ErrorMessage="请填写表单名称!" Display="Dynamic"></asp:RequiredFieldValidator></td>
          </tr>
          <tr>
              <td align="right" class="lefttd" height="30" style="width: 150px">
                  <strong>字段选择：</strong><br />
                      </td>
              <td>
                  <KS:KSGV ID="FieldList" CssClass="CTable table-border sTable" runat="server" AutoGenerateColumns="False" HorizontalAlign="Left" PagerType="CustomNumeric" Width="100%">
                      <Columns>
                          <asp:TemplateField HeaderText="选择">
                          <itemstyle horizontalalign="center" />
                          <itemtemplate>
                           <input type="checkbox" value='<%#Eval("Name") %>' name="id"/>
                          </itemtemplate>
                          </asp:TemplateField>
                          <asp:BoundField DataField="FieldAlias" HeaderText="字段别名" />
                          <asp:BoundField DataField="Name" HeaderText="字段名称" >
                          <itemstyle horizontalalign="center" />
                          </asp:BoundField>
                          <asp:BoundField DataField="orderid" HeaderText="字段序号">
                              <itemstyle horizontalalign="Center" />
                          </asp:BoundField>
                      </Columns>
                  </KS:KSGV>
              </td>
          </tr>
          <tr>
              <td align="right" class="lefttd" style="width: 150px; height: 30px">
                  <strong>表单录入模板：</strong>
                  <br />
                  <asp:CheckBox ID="AutoCreateTemplate" onclick="createTemplate(this)" runat="server" Text="自动生成模板" />
                  <script>
                      function createTemplate(obj) {
                         var fieldid='';
						  jQuery('input[name="id"]:checked').each(function(){
							 if (fieldid==''){
							 fieldid=jQuery(this).val();
							 }else{fieldid+=","+jQuery(this).val();}
				});
                          jQuery.get("KS.UserForm.Aspx", { action: "gettemplate",fieldid: fieldid}, function(v) {
                              jQuery('#<%=this.Template.ClientID %>').val(v);
                          });
                      }
                  </script>
                  </td>
              <td class="righttd" style="height: 30px">
                  &nbsp;<asp:TextBox CssClass="textbox" ID="Template" runat="server" Height="200px" TextMode="MultiLine" Width="80%"></asp:TextBox></td>
          </tr>
          <tr>
              <td align="right" class="lefttd" style="width: 150px; height: 30px">
                  <strong>表单备注说明：</strong></td>
              <td class="righttd" style="height: 30px">
                  &nbsp;<asp:TextBox CssClass="textbox" ID="Note" runat="server" Height="70px" TextMode="MultiLine" Width="80%"></asp:TextBox></td>
          </tr>
       </table>
        <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" />
    </asp:Panel>
    
  </div>  
</asp:Content>

