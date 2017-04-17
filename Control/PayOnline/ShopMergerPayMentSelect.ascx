<%@ Control Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.PayOnline.ShopMergerPayMentSelect" Codebehind="ShopMergerPayMentSelect.ascx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.BLL" %>
<%@ Import Namespace="System.Data" %>
<table  cellspacing="1" cellpadding="3" class="border" width="98%" align="center" border="0">
	 <tr class="title">
             <td colspan="2" > 确认及选择支付接口平台</td>
     </tr>
    <%if (!string.IsNullOrEmpty((new TemporaryVar()).UserName)){ %>
     <tr class="tdbg">
         <td class="splittd lefttd" style="height: 25px">用 户 名： </td>
         <td class="splittd">
          <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
         </td>
     </tr>
    <%} %>
     <tr class="tdbg">
         <td class="splittd lefttd" style="height: 25px">支付编号： </td>
         <td class="splittd">
          <asp:Label ID="Label2" runat="server" Text="0"></asp:Label> </td>
     </tr>
     <tr class="tdbg">
         <td class="splittd lefttd" style="height: 25px">购买商品： </td>
         <td class="splittd" valign="top"><asp:Label ID="Label3" runat="server" Text="0"></asp:Label></td>
     </tr>
    <tr class="tdbg">
         <td class="splittd lefttd" style="height: 25px">需要支付：</td>
         <td class="splittd">
           <%=MyCache.GetCurrencySymbol %><span style="font-size:16px;font-weight:bold;color:#ff6600"><%=Kesion.APPCode.Public.ReturnShopPrice(totalPayMoney) %></span> <%=MyCache.GetCurrencyUnit %><span class="tips">(不含手续费)</span>
         </td>
     </tr>
     <tr class="tdbg">
         <td class="splittd lefttd">选择支付平台：</td>
         <td  class="splittd">

             <div class="paylist">
                 <ul>
                <%
                    string payId = "0";
                 StringBuilder sb = new StringBuilder();
                 using (DataTable dt = CommonData.GetDataTable(4))
                 {
                     if (dt.Rows.Count > 0)
                     {
                         DataView dv = dt.DefaultView;
                         DataTable dtt = dv.ToTable();
                         foreach (DataRow drr in dtt.Rows)
                         {
                            
                             if (drr["isdefault"].ToString() == "1" && Utils.StrToInt(payId)==0)
                             {
                                 payId = drr["id"].ToString();
                             }

                             sb.AppendLine(string.Format(@"<li{2} payid=""{3}""><img src=""{0}"" title=""{1}"" alt=""{1}""/></li>", drr["logo"].ToString(), drr["platname"].ToString(), drr["isdefault"].ToString() == "1" ? @" class=""paycurr""" : string.Empty, drr["id"].ToString()));
                         }
                     }
                 }
                 Response.Write(sb.ToString());
              %>
                 </ul>
             </div>

         </td>
     </tr>
     
     <tr class="tdbg">
         <td colspan="2" style="height:70px;padding-left:220px;">

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
              function doPay() {
                  window.open('../PayConfirm.aspx?from=ShopMerger&PayOrderID=<%=this.Label2.Text%>&PlatID=' + pid);
              }
            </script>
             <input type="button" class="button" value="下 一 步" onclick="doPay()" />
             </td>
     </tr>
    </table>