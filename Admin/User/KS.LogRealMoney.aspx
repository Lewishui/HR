<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_User_LogRealMoney" Title="Untitled Page" Codebehind="KS.LogRealMoney.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

 <div id="manage_top" class="menu_top_fixed">
 &nbsp;&nbsp;<strong>用户名：</strong><asp:TextBox ID="TxtKeyWord" Width="100" runat="server" CssClass="textbox" />
 &nbsp;&nbsp;<strong>时间：</strong>
   <asp:TextBox ID="TxtBeginDate" placeholder="格式：YYYY-MM-DD" Width="150px" runat="server"  onclick="WdatePicker({dateFmt:&#39;yyyy-MM-dd&#39;});" CssClass="textbox Wdate"></asp:TextBox>至
   <asp:TextBox ID="TxtEndDate" placeholder="格式：YYYY-MM-DD" Width="150px" runat="server" onclick="WdatePicker({dateFmt:&#39;yyyy-MM-dd&#39;});"  CssClass="textbox Wdate"></asp:TextBox>

<asp:Button ID="BtnSearch" runat="server" Text="快速搜索" CssClass="button" onclick="BtnSearch_Click" />
<asp:Button ID="BtnExportExcel" runat="server" Text="导出Excel" CssClass="button" OnClick="BtnExportExcel_Click"  />
     <input type="button" class="button" value="打印本页" onclick="PrintPage('PrintBox')" />
</div>
 <div class="menu_top_fixed_height"></div>
<div class="content-area">  
	<div class="myTitle">内部实收账目明细记录管理</div>
    <div id="PrintBox">
    <asp:GridView runat="server" cssclass="CTable" EmptyDataText="没有预付款明细记录！" ID="grvList" AutoGenerateColumns="False" GridLines="None"  Width="99%" OnRowDataBound="grvList_RowDataBound" ShowFooter="True">
          <HeaderStyle CssClass="CTitle" />
        <EmptyDataRowStyle CssClass="emptycss" />
        <Columns>
            <asp:BoundField DataField="UserName" HeaderText="用户名" >
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="PayTime" HeaderText="消费时间" >
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="IP" HeaderText="IP地址" >
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
           
            <asp:BoundField DataField="InComeorPayOut" HeaderText="摘要" >
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="Inputer" HeaderText="操作员" >
                <ItemStyle HorizontalAlign="Center" Wrap="true" />
            </asp:BoundField>
           <asp:BoundField DataField="money" HeaderText="收入（元）" HtmlEncode="False" DataFormatString="{0:n2}">
                <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="折扣">
            <itemstyle horizontalalign="center"/>
            <itemtemplate>
                <span class="tips"><%# Utils.StrToFloat(Eval("Discount"))*100 %>%</span>
            </itemtemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="realmoney" HeaderText="实收（元）" HtmlEncode="False" DataFormatString="{0:n2}">
                <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
           <asp:TemplateField HeaderText="备注">
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
     <strong>特别提醒：</strong> 如果明细表记录太多，影响了系统性能，可以删除一定时间段前的记录以加快速度。但可能会带来会员在查看以前收过费的信息时重复收费（这样会引发众多消费纠纷问题），无法通过明细记录来真实分析会员的消费习惯等问题。 
     <div>
     <strong>删除范围：</strong><asp:RadioButtonList ID="RdbDelType" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
      <asp:ListItem Value="1">10天前</asp:ListItem>
      <asp:ListItem Value="2">1个月前</asp:ListItem>
      <asp:ListItem Value="3">2个月前</asp:ListItem>
      <asp:ListItem Value="4">3个月前</asp:ListItem>
      <asp:ListItem Value="5">6个月前</asp:ListItem>
      <asp:ListItem Value="6" Selected="True">1年前</asp:ListItem>
         </asp:RadioButtonList>
         <asp:Button ID="BtnDel" runat="server" Text="执行删除" OnClick="BtnDel_Click" CssClass="button" /></div>
     </div>
     
     
  </div>   
</asp:Content>


