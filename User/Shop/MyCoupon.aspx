<%@ Page Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.MyCoupon" Title="Untitled Page" Codebehind="MyCoupon.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <div class="r_tybox nomar">
     <div class="tabs">	
              <ul>
                  <li<%=KSCMS.S("flag")==""?" class='puton'":string.Empty %>><a href="MyCoupon.Aspx">我的优惠券</a></li>
                  <li<%=KSCMS.S("flag")=="3"?" class='puton'":string.Empty %>><a href="MyCoupon.Aspx?flag=3">我的红包</a></li>
                  <li<%=KSCMS.S("flag")=="1"?" class='puton'":string.Empty %>><a href="MyCoupon.Aspx?flag=1">预约码申请</a></li>
                  <li<%=KSCMS.S("flag")=="2"?" class='puton'":string.Empty %>><a href="MyCoupon.Aspx?flag=2">我的预约码</a></li>
              </ul>
        </div> 
<asp:Panel ID="PanList" runat="server">
    <div class="toptips tips">
     <span style="float:right">可以在此查看及管理您的所有优惠券！</span> 共有：<asp:Label ID="Lab_Total_Info" runat="server" Text=""></asp:Label> 张优惠券
   </div>
     <table width="98%" border="0" cellpadding="1" cellspacing="1" class="border"> 
    <tr class="tdbg">
                <td class="lefttd" height="30" style="text-align:left">&nbsp;&nbsp;&nbsp;&nbsp;<strong>添加优惠券</strong> 券号: 
                    <asp:TextBox CssClass="textbox" ID="TxtCouponNum" runat="server"></asp:TextBox>
                     <span style="color:Red">*</span>
                     <asp:Button ID="BtnAddCoupon" OnClientClick="return(check());" CssClass="button" runat="server" Text="确定添加" 
                        onclick="BtnAddCoupon_Click" />
                </td>
            
            </tr>
      </table>
   
    <asp:Repeater ID="Repeater1" runat="server">
    <HeaderTemplate>
<div class="r_padbox">

    </HeaderTemplate>
    
    <ItemTemplate>
  
          
         <div class="coupon_box">
              <div class="coupon_bd cp-bg-<%# Repeater1.Items.Count+1 %>">
                  <div class="coupon_upper">
                       <div class="cp_price fl"><sup><i class="rmb">￥</i></sup><%# Math.Round(Convert.ToDecimal(Eval("facevalue")),2)%></div>
                       <div class="clear"></div>
                       <div class="cp_info">
                         <p><span>名称：</span><%# Eval("couponname") %></p>
                         <p><span>优惠券号：</span><%# Eval("couponnum") %></p>
                         <p><span>截止时间：</span><%# Convert.ToDateTime(Eval("enddate")).ToShortDateString() %></p>
                         <p><span>使用情况：</span><%# Convert.ToString(Eval("useflag")) == "1" ? (Math.Round(Convert.ToDecimal(Eval("availablemoney")), 2) > 0 ? "已使用，未用完" : "已用完")+("<a style=\'color:blue\' href='javascript:;' onclick=\"KesionJS.Alert('<div class=tips>" + Eval("note") + "</div>');\" >（详情）</a>") : "<font color=#999999>未使用</font>"%></p>  
                       </div>
                       
                    </div>
                    <div class="used_info">
                       <%# GetLimitTips(Convert.ToInt16(Eval("limitType")),Convert.ToString(Eval("limitProIds")),Convert.ToString(Eval("limitClassIds"))) %>
                    </div>
              </div>

          </div>
           
     </ItemTemplate>
     <FooterTemplate>
         <div class="emptycss" style="display:<%# bool.Parse((Repeater1.Items.Count==0).ToString())?"":"none"%>">
                  没有可用的优惠券！
           </div> 
        </div>
     </FooterTemplate>
    </asp:Repeater>
    
   
   
   
   <script>
       function check() {
           if ($("#<%=this.TxtCouponNum.ClientID %>").val() == '') {
               $.dialog.alert('请输入优惠券号!', function() {
                   $("#<%=this.TxtCouponNum.ClientID %>").focus();
               });
           return false;
       }
       return true;
       }
   </script>
   
</asp:Panel>
         <asp:Panel ID="PanelPacket" runat="server">
    <div class="toptips tips">
     <span style="float:right">可以在此查看及管理您的所有红包！</span> 共有：<asp:Label ID="Label3" runat="server" Text=""></asp:Label> 张红包
   </div>
    <asp:Repeater ID="Repeater4" runat="server">
    <HeaderTemplate>
<div class="r_padbox">
    </HeaderTemplate>
    <ItemTemplate>
    	<div class="packet_item">
              <div class="packet_bd">
                  <div class="packet_upper">
                       <div class="cp_price"><i class="rmb">￥</i><%# Math.Round(Convert.ToDecimal(Eval("facevalue")),2)%><span class="num"><%# Eval("couponnum") %></span></div>
                       <div class="clear"></div>
                       <div class="cp_info">
                         <p class="bt"><%# Eval("couponname") %></p>
                         <p><%# Convert.ToDateTime(Eval("enddate")).ToShortDateString() %> 到期</p>
                         <p><%# Convert.ToString(Eval("useflag")) == "1" ? (Math.Round(Convert.ToDecimal(Eval("availablemoney")), 2) > 0 ? "已使用，未用完" : "已用完")+("<a style=\'color:blue\' href='javascript:;' onclick=\"KesionJS.Alert('<div class=tips>" + Eval("note") + "</div>');\" >（详情）</a>") : "<font color=#999999>未使用</font>"%></p>
                       </div>
                      
                    </div>
                    <div class="box_b"><%# GetLimitTips(Convert.ToInt16(Eval("limitType")),Convert.ToString(Eval("limitProIds")),Convert.ToString(Eval("limitClassIds"))) %></div>
              </div>

          </div>

     </ItemTemplate>
     <FooterTemplate>
         <div style="display:<%# bool.Parse((Repeater4.Items.Count==0).ToString())?"":"none"%>">
                  没有可用的红包！
           </div> 
     </div>
     </FooterTemplate>
    </asp:Repeater>
    
</asp:Panel>
    <asp:Panel ID="PanelOrder" runat="server">
    <div class="toptips tips">
     <span style="float:right">可以在此查看及管理您的所有申请的预约码！</span> 共有：<asp:Label ID="Label1" runat="server" Text=""></asp:Label> 张预约码
   </div>
    <asp:Repeater ID="Repeater2" runat="server">
    <HeaderTemplate>
<div class="r_padbox">
         <table id="tablist1" width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
      <tr align="center" class="title">
        	<td>分类ID</td>
        	<td>分类名称</td>
        	<td>有效使用时间</td>
        	<td>开放申请</td>
            <td>是否可申请</td>
        	<td>申请</td>        	
        </tr>
    </HeaderTemplate>
    <ItemTemplate>
      <tr class="tdbg">
          <td class="splittd" align="center" nowrap><%# Eval("TypeID") %></td>
          <td class="splittd" align="center" nowrap> <img src='<%# Eval("DefaultPic") %>' width="45" height="45"/> <%# Eval("TypeName") %> </td>
          <td class="splittd" align="center" nowrap><%#Convert.ToDateTime(Eval("BeginDate")).ToShortDateString() %>--<%# Convert.ToDateTime(Eval("EndDate")).ToShortDateString()  %></td>
          <td class="splittd" align="center" nowrap><font color="green"><%#Convert.ToString( Eval("IsOpenApply"))=="1"?"是":"否" %></font></td>
           <td class="splittd" align="center" nowrap><%#Convert.ToDateTime(DateTime.Now)>=Convert.ToDateTime(Eval("BeginDate"))&Convert.ToDateTime(DateTime.Now)<=Convert.ToDateTime(Eval("EndDate"))?"<font color='blue'>是</font>":"<font color='red'>否</font>"%></td>
          <td class="splittd" align="center" ><%#Convert.ToDateTime(DateTime.Now)>=Convert.ToDateTime(Eval("BeginDate"))&Convert.ToDateTime(DateTime.Now)<=Convert.ToDateTime(Eval("EndDate"))?"<a class='apply'  href='../../shop/bookCodeApply.aspx?id="+Eval("typeid")+"' title='申请预约码地址URL' target='_blank'>申请</a>":"---" %></td>          
      </tr>  

     </ItemTemplate>
     <FooterTemplate>
         <tr class="tdbg" style="display:<%# bool.Parse((Repeater2.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="10">
                  没有申请预约码的记录！
                </td>
           </tr> 
      </table>
     </FooterTemplate>
    </asp:Repeater>
    
   
</asp:Panel>
    <asp:Panel ID="PanelCode" runat="server">
    <div class="toptips tips">
     <span style="float:right">可以在此查看及管理您的所有预约码！</span> 共有：<asp:Label ID="Label2" runat="server" Text=""></asp:Label> 张预约码
   </div>
    <asp:Repeater ID="Repeater3" runat="server">
    <HeaderTemplate>
<div class="r_padbox">
         <table id="tablist2" width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
      <tr align="center" class="title">
        	<td>预约码卡号</td>
        	<td>预约码分类</td>
        	<td>生成时间</td>
            <td>有效使用时间</td>
        	<td>使用时间</td>
        	<td>使用情况</td>
            <td>是否过期</td>
        </tr>
    </HeaderTemplate>
    <ItemTemplate>
      <tr class="tdbg">
          <td class="splittd" align="center" nowrap><%#Eval("CodeID") %></td>
          <td class="splittd" align="center" nowrap><%#Eval("typename") %></td>
          <td class="splittd" align="center" nowrap><%#Convert.ToDateTime(Eval("AddDate")).ToShortDateString() %></td>
          <td class="splittd" align="center" nowrap><%#Convert.ToDateTime(Eval("BeginDate")).ToShortDateString() %>--<%# Convert.ToDateTime(Eval("EndDate")).ToShortDateString()  %></td>
          <td class="splittd" align="center" nowrap><%# Convert.ToString(Eval("UseTime")) == "" ? "---":Convert.ToString(Eval("UseTime"))%></td>
          <td class="splittd" align="center" nowrap><%# Convert.ToString(Eval("IsUsed")) == "1" ? "<font color='red'>已使用</font>":"<font color='green'>未使用</font>"%> </td>
          <td class="splittd" align="center" nowrap><%#Convert.ToDateTime(DateTime.Now)>Convert.ToDateTime(Eval("EndDate"))?"<font color='red'>已过期</font>":"<font color='gray'>否</font>"%></td>
      </tr>  

     </ItemTemplate>
     <FooterTemplate>
         <tr class="tdbg" style="display:<%# bool.Parse((Repeater3.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="10">
                  没有可用的预约码！
                </td>
           </tr> 
      </table>
     </FooterTemplate>
    </asp:Repeater>
</asp:Panel>
	<div class="fy_box"><KS:Page ID="Page1" runat="server" /></div>
    <br /><br /><br />
	</div>
</asp:Content>