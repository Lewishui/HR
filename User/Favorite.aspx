<%@ Page Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_Favorite_1" Title="Untitled Page" Codebehind="Favorite.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.HtmlTags" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

    <div class="r_tybox nomar">

        <div class="tabs">	
              <ul>
                  <li<%=KSCMS.S("flag")==""?" class='puton'":string.Empty %>><a href="Favorite.Aspx">我收藏的文档</a></li>
                 <%if (Utils.GetSysInfo("//sysinfo/model/mall").ToString().ToLower() == "true") { %>
                  <li<%=KSCMS.S("flag")=="2"?" class='puton'":string.Empty %>><a href="Favorite.Aspx?flag=2">我收藏的商品</a></li>
                  <li<%=KSCMS.S("flag")=="3"?" class='puton'":string.Empty %>><a href="Favorite.Aspx?flag=3">我收藏的拼团商品</a></li>
                 <%} %>
                  <li<%=KSCMS.S("flag")=="1"?" class='puton'":string.Empty %>><a href="Favorite.Aspx?flag=1">我收藏的问吧问题</a></li>
              </ul>
        </div> 
    	<div class="clear"></div>
        <div class="tips">这里显示的是您感兴趣的信息，对收藏已久没有价值的信息您可以进行取消收藏操作！</div>
  
  <asp:Panel ID="PanDoc" runat="server">
    <asp:Repeater ID="Repeater1" runat="server">
    <HeaderTemplate>
	<div class="r_padbox nopadtop" style="padding-bottom:0px">
     <table id="tablist" width="100%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
      <tr class="title">
        	<td width="50" align="center">选择</td>
        	<td width="110" align="center"> 图片</td>
            <td align="center"> 标题 </td>
            <td width="100" align="center">收藏时间 </td>
	        <td align="center" width="70">操作</td>
        </tr>
    </HeaderTemplate>
    <ItemTemplate>
      <tr class="tdbg">
          <td class="splittd" align="center"><input type="checkbox" name="ids" value="<%#Eval("ID") %>" /></td>
          <td class="splittd" align="center"><img width="102" height="79" onerror="this.src='/sysimg/nopic.gif'" src="<%# GetPhoto(Convert.ToString(Eval("DefaultPic"))) %>" /></td>
          <td class="splittd">
          <%# KSCMS.S("flag") == "3"?Eval("subject"):GetSubject(Convert.ToInt16(Eval("ChannelID")),Utils.StrToInt(Eval("ClassID")),Utils.StrToInt(Eval("InfoID")),Convert.ToString(Eval("FileName")), Convert.ToString(Eval("TurnUrl")), Convert.ToString(Eval("Title")))%>
          <div style="margin-top:10px;color:#999999;">
          分类:<%# MyCache.GetCacheClass(Convert.ToInt16(Eval("ClassID")),1) %>&nbsp;&nbsp;
          发布时间:<%# GetAddTime(Convert.ToDateTime(Eval("PubDate")))%>&nbsp;&nbsp;
          <%#KSCMS.S("flag") == "3"?"":"点击数:"+Eval("Hits")+"人次" %>
             <%#KSCMS.S("flag") == "3"?"单买价：<span style='text-decoration:line-through'>￥"+ Utils.StrToFloat(Eval("singleprice")).ToString("F2")+"元</span> &nbsp;&nbsp;拼团价：<span style='color:#ff3300;font-weight:bold'>￥"+ Utils.StrToFloat(Eval("FightGroupPrice")).ToString("F2")+"元":KSCMS.S("flag") == "2"?"市场价：<span style='text-decoration:line-through'>￥"+ Utils.StrToFloat(Eval("price")).ToString("F2")+"元</span> &nbsp;&nbsp;商城价：<span style='color:#ff3300;font-weight:bold'>￥"+ Utils.StrToFloat(Eval("price_member")).ToString("F2")+"元":""%></span>
          </div>
          </td>

          <td class="splittd" align="center">
          <span style="color:#ff6600;">
          <%# Utils.FormatHumanizedTime(Convert.ToDateTime(Eval("AddDate")))%>
          </span>
          </td>
          <td class="splittd" align="center">
               <%# KSCMS.S("flag") == "2"?@"<a href=""/?app=orderinfo&newwin=1&id="+ Eval("InfoID") +@""" class=""deletebtn"" target=""_blank"">购买</a>":"" %>
               <a href="javascript:;" class="deletebtn" onclick="$.dialog.confirm('确定取消该收藏吗?',function(){ location.href='Favorite.Aspx?flag=<%=KSCMS.S("flag") %>&action=Cancel&ids=<%#Eval("ID") %>';},function(){});">取 消</a>
          
          </td>
       
      </tr>  

     </ItemTemplate>
     <FooterTemplate>
     <tr class="tdbg emptycss" style="display:<%# bool.Parse((Repeater1.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="10" >
                  您还没有收藏任何信息哦！
                </td>
           </tr> 
    </table>
     </FooterTemplate>
    </asp:Repeater>
 </asp:Panel>

  <asp:Panel ID="PanAsk" runat="server" Visible="false">
    <asp:Repeater ID="Repeater2" runat="server">
    <HeaderTemplate>
     <table id="tablist" width="100%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
      <tr class="title">
        	<td width="50" align="center">选择</td>
            <td align="center">问题</td>
            <td width="100" align="center">收藏时间 </td>
            <td align="center">是否解决</td>
            <td align="center" nowrap>悬赏分</td>
	        <td align="center" width="70">操作</td>
        </tr>
    </HeaderTemplate>
    <ItemTemplate>
      <tr class="tdbg">
          <td class="splittd" align="center"><input class="cleckbtn" type="checkbox" name="ids" value="<%#Eval("ID") %>" /></td>
          <td class="splittd" style="text-align:left">
            <a href="<%# BasicField.GetAskUrl(Convert.ToInt16(Eval("TopicID"))) %>" target="_blank"><%# Eval("Title") %></a>
           <div class="tips2">提问时间：<%# Utils.FormatHumanizedTime(Convert.ToDateTime(Eval("PubDate")))%> 是否审核：<%#Convert.ToString(Eval("verify"))=="1"?"<span style='color:green'>已审核</span>":"<span style='color:red'>未审核</span>" %> 分类：<%# MyCache.GetCacheAskCategory(Convert.ToInt16(Eval("ClassID")),"classname") %></div>
           
          </div>
          </td>
          <td class="splittd" align="center">
          <span style="color:#ff6600;">
          <%# Utils.FormatHumanizedTime(Convert.ToDateTime(Eval("AddDate")))%>
          </span>
          </td> 
          <td class="splittd" style="text-align:center"><%#Convert.ToString(Eval("IsSolve")) == "1" ? "<span style='color:green'>已解决</span>" : Convert.ToInt16(Eval("IsSolve"))==2?"已关闭":"<span style='color:red'>未解决</span>"%></td>
          <td class="splittd" style="text-align:center"><font color=red><%# Convert.ToSingle(Convert.ToString(Eval("reward"))).ToString()%>
</font> 分</td>
          <td class="splittd" align="center">
          <a href="javascript:;" class="deletebtn" onclick="$.dialog.confirm('确定取消该收藏吗?',function(){ location.href='Favorite.Aspx?flag=1&action=Cancel&ids=<%#Eval("ID") %>';},function(){});">取 消</a>
          </td>
       
      </tr>  

     </ItemTemplate>
     <FooterTemplate>
     <tr class="tdbg emptycss" style="display:<%# bool.Parse((Repeater2.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="10" >
                  您还没有收藏任何问题哦！
                </td>
           </tr> 
    </table>
     </FooterTemplate>
    </asp:Repeater>
 </asp:Panel>

	
   <div class="r_padbox nopadtop">
        <div class="clear"></div>
        <div class="cz_btn">
            <span><input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/>全选&nbsp;</span>
            <span><asp:Button ID="btnDelete" runat="server" CssClass="button" Text="取消选中的收藏" OnClick="btnDelete_Click" /></span>
         </div>
     	
        <div class="fy_box"><KS:Page ID="Page1" runat="server" /></div>

		</div>
	</div>

</asp:Content>