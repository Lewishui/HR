<%@ Page Language="C#"  Title="会员充值" MasterPageFile="~/User/user.master"  AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Course.User_UserVIP" Codebehind="UserVIP.aspx.cs" %>

<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

<asp:Panel ID="PnlStep1" runat="server" Width="100%">
    	<div class="r_tybox nomar">
      <div class="tabs">	
		<ul>             
           <li><a href="<%=MyCache.GetCacheConfig(0) %>user/payonline.aspx">在线充值</a></li>
           <li><a href="<%=MyCache.GetCacheConfig(0) %>user/basic/UserCard.aspx">充值卡充值</a></li>
           <li><a href="<%=MyCache.GetCacheConfig(0) %>user/basic/FeePackages.aspx">购买套餐包</a></li>
           <li class='puton'><a href="<%=MyCache.GetCacheConfig(0) %>user/basic/UserVip.aspx">VIP会员购买</a></li>
		</ul>
	</div>
 <div class="r_padbox">
   		<div class="padtitle">会员续费</div>

         <table cellspacing="1" cellpadding="3" class="border" width="100%" align="center" border="0">	
             <tr class="tdbg">
                 <td style="height:50px" class="splittd">
                     &nbsp; 您好,<asp:Label ID="LabUserName" runat="server"></asp:Label> !您的身份级别：<font color=red><asp:Label ID="LabGroupName" runat="server" Text="Label"></asp:Label></font>,
                     <asp:Label ID="Label1" runat="server" ></asp:Label>&nbsp; <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label> 
                     <br />
                    &nbsp;  可用预存款 <font color=red><asp:Label ID="LabMoney" runat="server" /></font> 元(<a href="<%=MyCache.GetCacheConfig(0) %>user/basic/LogMoney.aspx"><span style="color:blue;">明细</span></a>)，
                     可用<asp:Label ID="LabPoint" runat="server" Text="Label"></asp:Label>(<a href="<%=MyCache.GetCacheConfig(0) %>user/basic/Consumer.aspx"><span style="color:blue;">明细</span></a>)
                     ，积分<font color=green><asp:Label ID="LabScore" runat="server" Text="Label"></asp:Label></font> 分(<a href="<%=MyCache.GetCacheConfig(0) %>user/basic/LogScore.aspx"><span style="color:blue;">明细</span></a>)。
                     </td>
             </tr>
             <tr class="tdbg">
                 <td class="tag_left" style="height:50px">
                    &nbsp; 选择会员类型： 
                         <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                         </asp:RadioButtonList>                            
                 </td>
             </tr>
              <tr class="tdbg">
                <td class="tag_left" style="padding-left:20px;">                             
                   VIP充值介绍：<asp:Label ID="Label3" runat="server"></asp:Label> 
                 </td>
             </tr>
              <tr class="tdbg">
                <td class="tag_left" style="padding-left:20px;">                                                 
                     <asp:Button ID="Button1" runat="server" CssClass="button" Text="确认支付" OnClientClick="this.form.target='_parent';" OnClick="BtnNext_Click" />      
                 </td>
             </tr>
        
    
        </table>
    </div>
   
    <asp:Repeater ID="Repeater1" runat="server">
    <HeaderTemplate>
     <div class="r_padbox">
    	<div class="padtitle">消费记录</div>
         <table id="Table1" width="100%" border="0" align="center" cellpadding="1" cellspacing="1" class="border">
      <tr align="center" class="title">
        	<td width="60" align="center">序号</td>
        	<td width="150"  align="center">消费时间</td>       
            <td align="center"  width="110"> 支出(元) </td>
            <td align="center"  width="80">摘要</td>
	        <td align="center"  width="100">余额(元)</td>
	        <td align="center">备注</td>
        </tr>
    </HeaderTemplate>
    <ItemTemplate>
       <tr class="tdbg">
          <td class="splittd" align="center"><%# Repeater1.Items.Count+1 %></td>
          <td class="splittd">
         <%# Eval("PayTime")%>
          </td>
          <td class="splittd" align="center">
         <%# GetMoney(Convert.ToDouble(Eval("money")), Convert.ToInt16(Eval("InComeorPayout")), 2)%>
          </td>
          <td class="splittd" align="center">
          <%#GetOpType(Convert.ToInt16(Eval("InComeorPayout")))%>
          </td>
          <td class="splittd" align="center">
          <%# GetNowMoney(Convert.ToDouble(Eval("currMoney"))) %> 
          </td>
          <td class="splittd" style="word-break:break-all">
          <%#Eval("remark") %>
          </td>
      </tr>      
    </ItemTemplate>
     <FooterTemplate>
      <tr class="tdbg" style="display:<%# bool.Parse((Repeater1.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="10">
                  没有消费记录！
                </td>
           </tr> 
    </table>
     </FooterTemplate>
    </asp:Repeater>
  
     	<div class="fy_box"><KS:Page ID="Page1" runat="server" /></div>
        <div class="clear blank10"></div>
    
    </div> 
     
</asp:Panel>


</asp:Content>





