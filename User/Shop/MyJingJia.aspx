<%@ Page Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.MyJingJia" Title="Untitled Page" Codebehind="MyJingJia.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

<asp:Panel ID="PanList" runat="server">
 <div class="r_tybox nomar">
    <div class="toptips">
     共参与：<asp:Label ID="Lab_Total_Info" runat="server" Text=""></asp:Label> 件商品的竞拍
   </div>
    <asp:Repeater ID="Repeater1" runat="server">
    <HeaderTemplate>
	<div class="r_padbox nopadtop">
         <table id="tablist" width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
      <tr align="center" class="title">
        	<td width="300">商品名称</td>
        	<td>起拍价</td>
        	<td>竞拍状态</td>
        	<td>竞拍次数</td>
        	<td>我的出价</td>
        	<td>出价日期</td>
        	<td>得标情况</td>
        	<td>详情</td>
        </tr>
    </HeaderTemplate>
    <ItemTemplate>
      <tr class="tdbg">
          <td class="splittd"><%# (CurrPage-1)*PageSize+Container.ItemIndex+1%>、
              <a href="<%# Kesion.HtmlTags.BasicField.GetItemUrl(Utils.StrToInt(Eval("ChannelID")),Utils.StrToInt(Eval("ClassID")),Utils.StrToInt(Eval("InfoID")),Convert.ToString(Eval("FileName")),Convert.ToString(Eval("TurnUrl"))) %>" target="_blank"><%# Eval("title") %></a></td>
          <td class="splittd" style="text-align:center"><%# Kesion.APPCode.Public.ReturnShopPrice(Convert.ToDecimal(Eval("Money"))) %></td>
          <td class="splittd" style="text-align:center"><%# Convert.ToString(Eval("isend")).Equals("1")?"<span style='color:#999'>已结束</span>":"<span style='color:green'>正常</span>" %></td>
          <td class="splittd" style="text-align:center">
              <a title="查看详情"　style="text-decoration:underline" href="MyJingJiaRecord.aspx?infoid=<%# Eval("infoid") %>"><%# Eval("Times") %>次</a>
          </td>
          <td class="splittd" style="text-align:center"><%# Kesion.APPCode.Public.ReturnShopPrice(Convert.ToDecimal(GetMyJingJiaInfo(Convert.ToInt32(Eval("InfoID")),"money"))) %></td>
          <td class="splittd" style="text-align:center"><%#GetMyJingJiaInfo(Convert.ToInt32(Eval("InfoID")),"adddate") %></td>
          <td class="splittd" style="text-align:center">
          <%# GetMyJingJiaQK(Convert.ToInt32(Eval("InfoID")), Convert.ToInt32(GetMyJingJiaInfo(Convert.ToInt32(Eval("InfoID")),"id")),Convert.ToInt32(Eval("num")),Convert.ToInt32(Eval("isend"))) %>
          
          </td>
          <td class="splittd" style="text-align:center">
               <a title="查看详情确认"<%# GetMyJingJiaInfo(Convert.ToInt32(Eval("InfoID")),"iszb")=="1"?"":" style='display:none' " %> href="MyJingJiaRecord.aspx?action=confirm&infoid=<%# Eval("infoid") %>&askid=<%# GetMyJingJiaInfo(Convert.ToInt32(Eval("InfoID")),"id") %>">确认</a>

          </td>
      </tr>  

     </ItemTemplate>
     <FooterTemplate>
         <tr class="tdbg emptycss" style="display:<%# bool.Parse((Repeater1.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="10">
                 您没有参与任何的商品竞拍！
                </td>
           </tr> 
      </table>
     </FooterTemplate>
    </asp:Repeater>
    

    
     <div class="fy_box"><KS:Page ID="Page1" runat="server" /></div>
     
  
</asp:Panel>
	</div>
</div>

</asp:Content>