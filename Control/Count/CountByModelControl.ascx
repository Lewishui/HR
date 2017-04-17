<%@ Control Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.CountByModelControl" Codebehind="CountByModelControl.ascx.cs" %>
<KS:TopNav ID="TopNav1" runat="server" />
<div class="content-area">
  <div class="tabs_header">
    <ul class="tabs">
    <li class='active'><a href="#"><span>按模型数据统计</span></a></li>
    <li><a href="KS.ModelCount.aspx?action=CountByClassAndMonth"><span>按栏目/月份统计</span></a></li>
    <li><a href="KS.ModelCount.aspx?action=CountByClassAndInputer"><span>按栏目/录入者统计</span></a></li>
    <li><a href="KS.ModelCount.aspx?action=CountByInputerAndMonth"><span>按录入者/月份统计</span></a></li>
    </ul>
   </div>
<%=getModelTotal() %>
</div>