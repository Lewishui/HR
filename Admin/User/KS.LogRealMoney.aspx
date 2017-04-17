<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_User_LogRealMoney" Title="Untitled Page" Codebehind="KS.LogRealMoney.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

 <div id="manage_top" class="menu_top_fixed">
 &nbsp;&nbsp;<strong>�û�����</strong><asp:TextBox ID="TxtKeyWord" Width="100" runat="server" CssClass="textbox" />
 &nbsp;&nbsp;<strong>ʱ�䣺</strong>
   <asp:TextBox ID="TxtBeginDate" placeholder="��ʽ��YYYY-MM-DD" Width="150px" runat="server"  onclick="WdatePicker({dateFmt:&#39;yyyy-MM-dd&#39;});" CssClass="textbox Wdate"></asp:TextBox>��
   <asp:TextBox ID="TxtEndDate" placeholder="��ʽ��YYYY-MM-DD" Width="150px" runat="server" onclick="WdatePicker({dateFmt:&#39;yyyy-MM-dd&#39;});"  CssClass="textbox Wdate"></asp:TextBox>

<asp:Button ID="BtnSearch" runat="server" Text="��������" CssClass="button" onclick="BtnSearch_Click" />
<asp:Button ID="BtnExportExcel" runat="server" Text="����Excel" CssClass="button" OnClick="BtnExportExcel_Click"  />
     <input type="button" class="button" value="��ӡ��ҳ" onclick="PrintPage('PrintBox')" />
</div>
 <div class="menu_top_fixed_height"></div>
<div class="content-area">  
	<div class="myTitle">�ڲ�ʵ����Ŀ��ϸ��¼����</div>
    <div id="PrintBox">
    <asp:GridView runat="server" cssclass="CTable" EmptyDataText="û��Ԥ������ϸ��¼��" ID="grvList" AutoGenerateColumns="False" GridLines="None"  Width="99%" OnRowDataBound="grvList_RowDataBound" ShowFooter="True">
          <HeaderStyle CssClass="CTitle" />
        <EmptyDataRowStyle CssClass="emptycss" />
        <Columns>
            <asp:BoundField DataField="UserName" HeaderText="�û���" >
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="PayTime" HeaderText="����ʱ��" >
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="IP" HeaderText="IP��ַ" >
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
           
            <asp:BoundField DataField="InComeorPayOut" HeaderText="ժҪ" >
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="Inputer" HeaderText="����Ա" >
                <ItemStyle HorizontalAlign="Center" Wrap="true" />
            </asp:BoundField>
           <asp:BoundField DataField="money" HeaderText="���루Ԫ��" HtmlEncode="False" DataFormatString="{0:n2}">
                <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="�ۿ�">
            <itemstyle horizontalalign="center"/>
            <itemtemplate>
                <span class="tips"><%# Utils.StrToFloat(Eval("Discount"))*100 %>%</span>
            </itemtemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="realmoney" HeaderText="ʵ�գ�Ԫ��" HtmlEncode="False" DataFormatString="{0:n2}">
                <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
           <asp:TemplateField HeaderText="��ע">
            <itemstyle horizontalalign="Left" Height="30px"/>
            <itemtemplate>
                <div class="tips" style="word-break:break-all;"><%# Eval("Remark") %></div>
            </itemtemplate>
            </asp:TemplateField>
        </Columns>
</asp:GridView>
        </div>
     <KS:Page ID="Page1" runat="server" />
     
     <div style="border:1px dashed #cccccc; background-color:#f0f9fe; margin-top:10px;padding:10px; text-align: left; font-size: 12px;">
     <strong>�ر����ѣ�</strong> �����ϸ���¼̫�࣬Ӱ����ϵͳ���ܣ�����ɾ��һ��ʱ���ǰ�ļ�¼�Լӿ��ٶȡ������ܻ������Ա�ڲ鿴��ǰ�չ��ѵ���Ϣʱ�ظ��շѣ������������ڶ����Ѿ������⣩���޷�ͨ����ϸ��¼����ʵ������Ա������ϰ�ߵ����⡣ 
     <div>
     <strong>ɾ����Χ��</strong><asp:RadioButtonList ID="RdbDelType" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
      <asp:ListItem Value="1">10��ǰ</asp:ListItem>
      <asp:ListItem Value="2">1����ǰ</asp:ListItem>
      <asp:ListItem Value="3">2����ǰ</asp:ListItem>
      <asp:ListItem Value="4">3����ǰ</asp:ListItem>
      <asp:ListItem Value="5">6����ǰ</asp:ListItem>
      <asp:ListItem Value="6" Selected="True">1��ǰ</asp:ListItem>
         </asp:RadioButtonList>
         <asp:Button ID="BtnDel" runat="server" Text="ִ��ɾ��" OnClick="BtnDel_Click" CssClass="button" /></div>
     </div>
     
     
  </div>   
</asp:Content>


