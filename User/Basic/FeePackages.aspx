<%@ Page Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_FeePackages" Title="在线购买收费套餐包" Codebehind="FeePackages.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.BLL" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="System.Data" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

<asp:Panel ID="PnlStep1" runat="server" Width="100%">

   	<div class="r_tybox nomar">
      <div class="tabs">	
		<ul>             
           <li><a href="<%=MyCache.GetCacheConfig(0) %>user/payonline.aspx">在线充值</a></li>
           <li><a href="<%=MyCache.GetCacheConfig(0) %>user/basic/UserCard.aspx">充值卡充值</a></li>
           <li class='puton'><a href="<%=MyCache.GetCacheConfig(0) %>user/basic/FeePackages.aspx">购买套餐包</a></li>
          <li><a href="<%=MyCache.GetCacheConfig(0) %>user/basic/UserVip.aspx">VIP会员购买</a></li>
		</ul>
	</div>

   <div class="r_padbox">
     <asp:Panel ID="page1Panel" runat="server" Visible="false">
     <div class="fy_box"><KS:Page ID="Page2" runat="server" /></div>
     </asp:Panel>
    <asp:Repeater ID="Repeater1" runat="server">
    <HeaderTemplate>
      
         <div class="padtitle">选择要购买的收费套餐服务包</div>
         <table id="tablist" width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
    
    </HeaderTemplate>
    <ItemTemplate>
      <tr class="tdbg">
          <td class="splittd" style="padding-bottom:20px;"> 
             <label><input<%# Container.ItemIndex==0?" checked":""%> type="radio" name="packid" value='<%# Eval("id") %>' /><%# Eval("Title") %></label>
              （原价：<span style='font-size:14px;text-decoration:line-through;'><%=MyCache.GetCurrencySymbol %><%# Math.Round(Utils.StrToFloat(Eval("price")),2) %> <%=MyCache.GetCurrencyUnit %></span> &nbsp;&nbsp;折扣：<%# GetDiscount(Utils.StrToFloat(Eval("discount"))) %>&nbsp;&nbsp;实付：<span style='color:green;font-weight:bold;font-size:14px'><%=MyCache.GetCurrencySymbol %><%# Math.Round(Convert.ToDouble(Eval("price"))*Convert.ToDouble(Eval("discount")),2) %></span> <%=MyCache.GetCurrencyUnit %>）
             <%# !string.IsNullOrEmpty(Convert.ToString(Eval("Descript")))?@"<div class=""tips"">"+Eval("Descript")+"</div>":string.Empty %>
          </td>

      </tr>  

     </ItemTemplate>
     <FooterTemplate>
         <tr class="tdbg" style="display:<%# bool.Parse((Repeater1.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="10">
                  没有可供购买的收费套餐！
                </td>
           </tr> 
      </table>
     </FooterTemplate>
    </asp:Repeater>
   
    <div style="padding-left:2px;margin-top:5px;<%=Repeater1.Items.Count==0?"display:none;":""%>">

 <table cellspacing="1" cellpadding="3" class="border" width="98%" align="center" border="0">
        <tr class="tdbg">
         <td class="splittd" style="height:50px">
            &nbsp; <strong>选择在线支付：</strong>

              <div class="paylist">
                 <ul>
             <%
                 string payId = "0";
                 StringBuilder sb = new StringBuilder();
                 using (DataTable dt = CommonData.GetDataTable(4))
                 {
                     if (dt.Rows.Count > 0)
                     {
                         foreach (DataRow dr in dt.Rows)
                         {
                             if (Utils.IsShowPayMentOnDevice(dr["showdevice"].ToString()))
                             {
                                 if (dr["isdefault"].ToString() == "1")
                                 {
                                     payId = dr["id"].ToString();
                                 }
                                 sb.AppendLine(string.Format(@"<li{2} payid=""{3}""><img src=""{0}"" title=""{1}"" alt=""{1}""/></li>", dr["logo"].ToString(), dr["platname"].ToString(), dr["isdefault"].ToString() == "1" ? @" class=""paycurr""" : string.Empty, dr["id"].ToString()));
                             }
                         }
                     }
                 }
                 Response.Write(sb.ToString());
                 string orderID = string.Concat("Pack", DateTime.Now.ToString("yy"), DateTime.Now.ToString("MM"), DateTime.Now.ToString("dd"), DateTime.Now.ToString("HH"), DateTime.Now.ToString("mm"), DateTime.Now.ToString("ss"));

              %>
                 </ul>
             </div>

         </td>
     </tr>
        </table>
        <div align="center">
          <div class="cz_btn">
            <input type="hidden" name="action" id="action" value="" />
            <span><input type="button" value="在线支付" class="button" onclick="payOnline();" /></span>
            <span><input type="button"  class="button" value="账户余额支付" onclick="check();"/></span>
          </div>
        </div>
   <br />
   <br />
   <br />
     <asp:Panel ID="pagePanel" runat="server" Visible="false">
     <KS:Page ID="Page1" runat="server" />
     </asp:Panel>
     <script>
         var pid=<%=payId%>;
         $(document).ready(function(){
             $(".paylist").find("li").click(function(){
                 pid=$(this).attr("payid");
                 $(".paylist").find("li").attr("style","");
                 $(".paylist").find("li").removeClass("paycurr");
                 $(this).addClass("paycurr");
             });
         });

        function payOnline() {
             var id = $("input[name='packid']:checked").val();
             window.open('../PayConfirm.aspx?from=feepackages&PlatID=' + pid + '&id='+id);
         }
         function check() {
             jQuery("#action").val("dobuy");
             KesionJS.Confirm("此操作不可逆，确定购买选中的套餐吗？", "jQuery('#aspnetForm').submit();", "");
             return false;
         }
     </script>
     
</div>

    <style>
    .noexpire{color:Green;}
    .expire{color:brown;}
    </style>
        <div class="padtitle">已购买的套餐包</div>
   <table  cellspacing="1" cellpadding="3" class="border" width="98%" align="center" border="0">

     <tr class="tdbg">
         <td class="splittd">
         
          <asp:Repeater ID="MyPackRepeater" runat="server">
    <HeaderTemplate>
        <table id="tablist" width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
      <tr align="center" class="title">
        	<td width="40" align="center">序号</td>
        	<td align="center" style="width:200px">套餐名称</td>
        	<td align="center">购买时间</td>
            <td align="center"> 有期期 </td>
            <td align="center"> 拥有权限 </td>

        </tr>
    </HeaderTemplate>
    <ItemTemplate>
      <tr class="tdbg" style="cursor:pointer;" onclick="jQuery('#s<%# Container.ItemIndex+1 %>').toggle();">
          <td class="splittd" style="text-align:center"> 
             <%# Container.ItemIndex+1 %>
          </td>
          <td class="splittd"> 
             <%# Eval("title") %>
          </td>
          <td class="splittd" nowrap style="text-align:center;color:#999;"> 
             <%# Eval("AddDate") %>
          </td>
          <td class="splittd"> 
             <%# GetExpireDate(Convert.ToDateTime(Eval("PackBeginDate")),Convert.ToInt16(Eval("packdays"))) %>
          </td>
          <td class="splittd">
             <%# GetPurview(Convert.ToUInt16(Eval("limit")),Convert.ToInt16(Eval("ContentTF")),Convert.ToInt16(Eval("ExamTF")),Convert.ToString(Eval("ContentClassIDs")),Convert.ToString(Eval("ExamClassIDs"))) %>
          </td>

      </tr>  
      <tbody id="s<%# Container.ItemIndex+1 %>" style="display:none">
      <tr class="tdbg">
       <td class="splittd" style="text-align:center">&nbsp;</td>
       <td class="splittd tips" colspan="4">
         <div class="tips"><strong>介绍：</strong> <%# Eval("Descript") %></div>
       </td>
      
      </tr>
</tbody>
     </ItemTemplate>
     <FooterTemplate>
         <tr class="tdbg" style="display:<%# bool.Parse((MyPackRepeater.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="10">
                  您没有购买任何收费套餐！
                </td>
           </tr> 
      </table>
     </FooterTemplate>
    </asp:Repeater>
         
         </td>
     </tr>
    </table>
    </div>
       </div>
</asp:Panel>



</asp:Content>

