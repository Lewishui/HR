<%@ Control Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.CountByModelControl" Codebehind="CountByModelControl.ascx.cs" %>
<KS:TopNav ID="TopNav1" runat="server" />
<div class="content-area">
  <div class="tabs_header">
    <ul class="tabs">
    <li class='active'><a href="#"><span>��ģ������ͳ��</span></a></li>
    <li><a href="KS.ModelCount.aspx?action=CountByClassAndMonth"><span>����Ŀ/�·�ͳ��</span></a></li>
    <li><a href="KS.ModelCount.aspx?action=CountByClassAndInputer"><span>����Ŀ/¼����ͳ��</span></a></li>
    <li><a href="KS.ModelCount.aspx?action=CountByInputerAndMonth"><span>��¼����/�·�ͳ��</span></a></li>
    </ul>
   </div>
<%=getModelTotal() %>
</div>