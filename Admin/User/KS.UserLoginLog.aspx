<%@ Page Language="C#" ValidateRequest="false" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_UserLoginLog" Title="��Ա��¼��¼����" Codebehind="KS.UserLoginLog.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.BLL" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

 <asp:Panel ID="Panel1" runat="server">
      <KS:TopNav ID="TopNav1" runat="server" Text="��Ա��¼���ֻ��󶨼�¼����" />
  <div class="content-area">    
   <div class="myTitle">
   	  <div class="quickSearch notitle">
        <strong>������¼��</strong><asp:TextBox ID="TxtKeyWord" runat="server" CssClass="textbox" Width="200px" />
                 <asp:DropDownList ID="DrpSearchType" runat="server">
                     <asp:ListItem Value="0">�û���</asp:ListItem>
                     <asp:ListItem Value="1">�û�IP</asp:ListItem>
                     <asp:ListItem Value="2">��ע</asp:ListItem>
                 </asp:DropDownList>
               <asp:Button ID="BtnSearch" runat="server" CssClass="button" Text=" �� �� " OnClick="BtnSearch_Click" />
        </div>
      </div>  
  <div>
       <div class="tabs_header">
    <ul class="tabs">
        <li class='active'><a href="KS.UserLoginLog.aspx"><span>��Ա��¼��¼</span></a></li>
        <li><a href="KS.UserMobileLog.aspx"><span>��Ա�ֻ��󶨼�¼</span></a></li>
    </ul>
    </div>
        <KS:KSGV ID="MessageView" cssclass="CTable" runat="server" AutoGenerateColumns="False" DataKeyNames="FieldID" GridLines="None"
            OnRowDataBound="FieldListView_RowDataBound" OnRowCommand="list_RowCommand" PagerType="CustomNumeric" Width="99%" EnableTheming="True" EmptyDataText="�Ҳ�����Ա��¼��¼!">
            <Columns>
              <asp:TemplateField HeaderText="ѡ��">
                <itemstyle horizontalalign="Center" width="50px" />
                <itemtemplate>
                    <input type="checkbox"  name="ids" id="ids" value='<%#Eval("id") %>' />
                </itemtemplate>
              </asp:TemplateField>
            <asp:TemplateField HeaderText="��¼�豸">
                <itemstyle width="45px" HorizontalAlign="Center" />
                <itemtemplate>
                     <span style="color:#999;"><%# Utils.OrderDeviceName(Utils.StrToInt(Eval("DeviceType"))) %></span>
             </itemtemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="username" HeaderText="�û���" />
            <asp:BoundField DataField="adddate" HeaderText="��¼ʱ��">
            <itemstyle width="120px" HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="UserIP" HeaderText="��¼IP">
            <itemstyle width="100px" HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="��ע˵��">
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
            &nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">ȫ��ѡ��</label>
            <input type="button" value="ɾ��ѡ�еļ�¼" onmouseover="this.className='button_on';" onmouseout="this.className='button';" class="button" onclick="if (GetIDS('del')){this.form.action='?action=del';this.form.submit()}" id="Button1" />             
</asp:Panel>  
        <br />

        </div>
        
          <KS:Page ID="Page1" runat="server" />
          
         
    <div style="border:1px dashed #cccccc; background-color:#f0f9fe; margin-top:10px ;padding:10px; text-align: left; font-size: 12px;">
     <strong>�ر����ѣ�</strong> ����û���¼��¼���¼̫�࣬Ӱ����ϵͳ���ܣ�����ɾ��һ��ʱ���ǰ�ļ�¼�Լӿ��ٶȡ� 
     <div>
     <strong>ɾ����Χ��</strong><asp:RadioButtonList ID="RdbDelType" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
      <asp:ListItem Value="1">10��ǰ</asp:ListItem>
      <asp:ListItem Value="2">1����ǰ</asp:ListItem>
      <asp:ListItem Value="3">2����ǰ</asp:ListItem>
      <asp:ListItem Value="4">3����ǰ</asp:ListItem>
      <asp:ListItem Value="5">6����ǰ</asp:ListItem>
      <asp:ListItem Value="6" Selected>1��ǰ</asp:ListItem>
         </asp:RadioButtonList>
         <asp:Button ID="BtnDel" runat="server" Text="ִ��ɾ��" OnClick="BtnDel_Click" CssClass="button" /></div>
     </div>
         
       
 
 </asp:Panel>
 </div>
  
</asp:Content>

