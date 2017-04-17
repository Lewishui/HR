<%@ Page Language="C#" ValidateRequest="false" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_UserLoginLog" Title="会员登录记录管理" Codebehind="KS.UserLoginLog.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.BLL" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

 <asp:Panel ID="Panel1" runat="server">
      <KS:TopNav ID="TopNav1" runat="server" Text="会员登录及手机绑定记录管理" />
  <div class="content-area">    
   <div class="myTitle">
   	  <div class="quickSearch notitle">
        <strong>搜索记录：</strong><asp:TextBox ID="TxtKeyWord" runat="server" CssClass="textbox" Width="200px" />
                 <asp:DropDownList ID="DrpSearchType" runat="server">
                     <asp:ListItem Value="0">用户名</asp:ListItem>
                     <asp:ListItem Value="1">用户IP</asp:ListItem>
                     <asp:ListItem Value="2">备注</asp:ListItem>
                 </asp:DropDownList>
               <asp:Button ID="BtnSearch" runat="server" CssClass="button" Text=" 搜 索 " OnClick="BtnSearch_Click" />
        </div>
      </div>  
  <div>
       <div class="tabs_header">
    <ul class="tabs">
        <li class='active'><a href="KS.UserLoginLog.aspx"><span>会员登录记录</span></a></li>
        <li><a href="KS.UserMobileLog.aspx"><span>会员手机绑定记录</span></a></li>
    </ul>
    </div>
        <KS:KSGV ID="MessageView" cssclass="CTable" runat="server" AutoGenerateColumns="False" DataKeyNames="FieldID" GridLines="None"
            OnRowDataBound="FieldListView_RowDataBound" OnRowCommand="list_RowCommand" PagerType="CustomNumeric" Width="99%" EnableTheming="True" EmptyDataText="找不到会员登录记录!">
            <Columns>
              <asp:TemplateField HeaderText="选择">
                <itemstyle horizontalalign="Center" width="50px" />
                <itemtemplate>
                    <input type="checkbox"  name="ids" id="ids" value='<%#Eval("id") %>' />
                </itemtemplate>
              </asp:TemplateField>
            <asp:TemplateField HeaderText="登录设备">
                <itemstyle width="45px" HorizontalAlign="Center" />
                <itemtemplate>
                     <span style="color:#999;"><%# Utils.OrderDeviceName(Utils.StrToInt(Eval("DeviceType"))) %></span>
             </itemtemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="username" HeaderText="用户名" />
            <asp:BoundField DataField="adddate" HeaderText="登录时间">
            <itemstyle width="120px" HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="UserIP" HeaderText="登录IP">
            <itemstyle width="100px" HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="备注说明">
            <itemstyle HorizontalAlign="center" />
            <itemtemplate>
                <%# Eval("Remark") %>
            </itemtemplate>
            </asp:TemplateField>
        </Columns>
            <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
        </KS:KSGV>
        <asp:Panel ID="Panel3" runat="server" Height="30px">
              <div style="margin-top:5px;overflow:hidden;"></div>
            &nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">全部选中</label>
            <input type="button" value="删除选中的记录" onmouseover="this.className='button_on';" onmouseout="this.className='button';" class="button" onclick="if (GetIDS('del')){this.form.action='?action=del';this.form.submit()}" id="Button1" />             
</asp:Panel>  
        <br />

        </div>
        
          <KS:Page ID="Page1" runat="server" />
          
         
    <div style="border:1px dashed #cccccc; background-color:#f0f9fe; margin-top:10px ;padding:10px; text-align: left; font-size: 12px;">
     <strong>特别提醒：</strong> 如果用户登录记录表记录太多，影响了系统性能，可以删除一定时间段前的记录以加快速度。 
     <div>
     <strong>删除范围：</strong><asp:RadioButtonList ID="RdbDelType" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
      <asp:ListItem Value="1">10天前</asp:ListItem>
      <asp:ListItem Value="2">1个月前</asp:ListItem>
      <asp:ListItem Value="3">2个月前</asp:ListItem>
      <asp:ListItem Value="4">3个月前</asp:ListItem>
      <asp:ListItem Value="5">6个月前</asp:ListItem>
      <asp:ListItem Value="6" Selected>1年前</asp:ListItem>
         </asp:RadioButtonList>
         <asp:Button ID="BtnDel" runat="server" Text="执行删除" OnClick="BtnDel_Click" CssClass="button" /></div>
     </div>
         
       
 
 </asp:Panel>
 </div>
  
</asp:Content>

