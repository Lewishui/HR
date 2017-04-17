<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.Mobile.Admin.Weixin.KS_WeiXinCount" Codebehind="KS.WeiXinCount.aspx.cs" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="Kesion.BLL" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.Cache" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" runat="server">
    <link href="/admin/weixin/images/style.css" rel="stylesheet" />
    <KS:TopNav ID="TopNav1" runat="server" Text="微信统计" />
 <div class="content-area">   
   <asp:Panel ID="Panel1" runat="server">

       <div>
	       <div class="top_count">

			   <div class="count_left">
				   <a href="KS.Sendmsg.aspx?adddate=<%=DateTime.Now.ToShortDateString()%> ">
					   <span class="tap_inner o1">
							<i class="icon_index_tap"></i>
							<em class="number"><%=Utils.StrToInt(DataFactory.GetOnlyValue("select count(*) from KS_WeixinMsg where datediff(day,[AddTime],getdate())=0 and MsgType!='event'") )%></em>
							<strong class="title">新消息</strong>
					   </span>
				   </a>
				   <a href="KS.Userlist.aspx?adddate=<%=DateTime.Now.ToShortDateString()%> ">
					   <span class="tap_inner no_extra o2">
							<i class="icon_index_tap"></i>
							<em class="number"><%=Utils.StrToInt(DataFactory.GetOnlyValue("select count(*) from KS_WeixinOpenuser where datediff(day,[Subscribe_Time],getdate())=0 ") )%></em>
							<strong class="title">新增人数</strong>
					   </span>
				   
				   </a>
			       <div class="clear"></div>
			   </div>
			   <div class="count_right">
				   <a href="KS.Userlist.aspx">
					   <span class="tap_inner o3">
							<i class="icon_index_tap"></i>
							<em class="number"><%=Utils.StrToInt(DataFactory.GetOnlyValue("select count(*) from KS_WeixinOpenuser ") )%></em>
							<strong class="title">总用户数</strong>
					   </span>
				   </a>
			   </div>
			   <div class="clear"></div>
           </div>
          

           <div class="bottom_count">
               <div class="bottom_count_item">
                   <div  class="count_item_title">
                     <span><i class="count_icon icon1"></i>新关注人数</span>
                    
                   </div>
                   <div class="count_item_con">
				       <div class="count_item_con_left"><span class="ui_trendgrid_number"><strong><%=Utils.StrToInt(DataFactory.GetOnlyValue("select count(*) from KS_WeixinOpenuser where datediff(day,[Subscribe_Time],getdate())=0 ") )%></strong></span></div>
                       <div class="count_item_con_right">
						   <dd>日 <%= ToDayTitle%><%=ThisDayRate %></dd>
						   <dd>周 <%=WeekTitle %><%=ThisWeekRate %> </dd>
						   <dd style="border-bottom: none;">月 <%=MonthTitle %><%=ThisMonthRate %> </dd>
					   </div>
                   </div>
               </div>
               
               <div class="bottom_count_item two">

                 <div class="count_item_title"><span><i class="count_icon icon2"></i>素材管理</span></div>
                   <div class="midel">
                       <a href="KS.Picmsg.aspx">总素材数（<%=Utils.StrToInt(DataFactory.GetOnlyValue("select count(*) from KS_WeixinPigmsg") )%>）</a>
                   </div>
                   <div class="down">
                       <a href="KS.Picmsg.aspx?adddate=<%=DateTime.Now.ToShortDateString()%>">今日新增素材数（<%=Utils.StrToInt(DataFactory.GetOnlyValue("select count(*) from KS_WeixinPigmsg where datediff(day,[AddTime],getdate())=0 ") )%>）</a>
                   </div>
               </div>
               <div class="bottom_count_item">
                   <div class="count_item_title">
                       <span><i class="count_icon icon3"></i>关键字管理</span>
                   </div>
                   <div class="midel">
                        <a href="KS.Keyword.aspx">总关键字数（<%=Utils.StrToInt(DataFactory.GetOnlyValue("select count(*) from KS_WeixinKeyWord ") )%>）</a>
                   </div>
                   <div class="down">
                      <a href="KS.Keyword.aspx?adddate=<%=DateTime.Now.ToShortDateString()%>">今日新增关键字数（<%=Utils.StrToInt(DataFactory.GetOnlyValue("select count(*) from KS_WeixinKeyWord where datediff(day,[AddTime],getdate())=0 ") )%>）</a>
                   </div>
               </div>
			   <div class="clear"></div>
           </div>

            <div class="fans_count">

             <asp:Repeater ID="Repeater1" runat="server" >
			  <HeaderTemplate>
				 <table width="96%" class="CTable count_table" align="center" border="0" cellpadding="0" cellspacing="0" >
						<tr class="CTitle">
						  <td>微信头像</td>
						  <td>昵称（备注名）</td>
						  <td>性别</td>
						  <td>关注时间</td>
						  <td>城市</td>
						
						</tr>       
			 </HeaderTemplate>
			<ItemTemplate>
				<tr>    
					
					 <td align="center"> 
					   
						   <img src="<%# Eval("headimgurl")%>" height="40" width="50">
							
					 
				  </td>
					 <td align="center" style="color: #999;"><%# Eval("nickname")%><%#Convert.ToString(Eval("Remark").ToString())==string.Empty?"":"<font color='red'>("+Eval("Remark").ToString()+")</font>" %></td>
					 <td align="center" style="color: #999;"><%# Eval("sex").ToString()=="1"?"男":"女"%></td>
					 <td align="center" style="color: #999;"><%# Eval("subscribe_time")%></td>
					 <td align="center" style="color: #999;"><%# Eval("city")%></td>

				</tr>
		     </ItemTemplate>
		     <FooterTemplate>
			  
				 <tr width="100%" style="display:<%# bool.Parse((Repeater1.Items.Count==0).ToString())?"":"none"%>">
				
						<td class="empty" colspan="9" style="padding: 10px;text-align: center;">
						  今日暂无新增的粉丝信息
						</td>
				  </tr>
				  
				  </table>
			 </FooterTemplate>
			</asp:Repeater>

           </div>



       </div>

      

       <KS:Page ID="Page1" runat="server" />
   </asp:Panel>
   
  </div>
</asp:Content>
