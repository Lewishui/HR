<%@ Page Language="C#" MasterPageFile="~/User/UserNoLogin.master" AutoEventWireup="True" Inherits="Kesion.NET.WebSite.User_PayOnline_1" Title="����֧��" Codebehind="PayOnline.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.BLL" %>
<%@ Import Namespace="System.Data" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

<asp:Panel ID="PnlStep1" runat="server" Width="100%">

	<div class="r_tybox nomar">

        <div class="tabs">	
            <ul>             
               <li class='puton'><a href="<%=MyCache.GetCacheConfig(0) %>user/payonline.aspx">���߳�ֵ</a></li>
               <li><a href="<%=MyCache.GetCacheConfig(0) %>user/basic/UserCard.aspx">��ֵ����ֵ</a></li>
               <li><a href="<%=MyCache.GetCacheConfig(0) %>user/basic/FeePackages.aspx">�����ײͰ�</a></li>
                 <li><a href="<%=MyCache.GetCacheConfig(0) %>user/basic/UserVip.aspx">VIP��Ա����</a></li>
            </ul>
        </div>

        <div class="r_padbox">
	<div class="padtitle">Ԥ����ֵ</div>
    <table cellspacing="1" cellpadding="3" class="border" width="100%" align="center" border="0">
     <tr class="tdbg">
         <td style="height:50px; text-align:left;" class="splittd">
             &nbsp; ����,<asp:Label ID="LabUserName" runat="server"></asp:Label> !������ݼ���<asp:Label ID="LabGroupName" runat="server" Text="Label"></asp:Label>,
             ����Ԥ��� <%=MyCache.GetCurrencySymbol %><font color=red><asp:Label ID="LabMoney" runat="server" /></font> <%=MyCache.GetCurrencyUnit %>(<a href="basic/LogMoney.aspx"><span style="color:#3c93e5;">��ϸ</span></a>)��
             ����<asp:Label ID="LabPoint" runat="server" Text="Label"></asp:Label>(<a href="basic/Consumer.aspx"><span style="color:#3c93e5;">��ϸ</span></a>)
             ������<font color=green><asp:Label ID="LabScore" runat="server" Text="Label"></asp:Label></font> ��(<a href="basic/LogScore.aspx"><span style="color:#3c93e5;">��ϸ</span></a>)��
             </td>
     </tr>
     <tr class="tdbg">
         <td class="splittd" style="height:50px; text-align:left">
            &nbsp; ���γ�ֵ��<input type="text" class="textbox" name="money" id="money" style="width:50px"  value="100"/>
           <%=MyCache.GetCurrencyUnit %>
         </td>
     </tr>
     <tr class="tdbg">
         <td class="splittd" style="height:50px; text-align:left; padding-left:0px">
           <div class="padtitle">֧��ƽ̨</div>

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
                 string orderID = string.Concat("OP", DateTime.Now.ToString("yy"), DateTime.Now.ToString("MM"), DateTime.Now.ToString("dd"), DateTime.Now.ToString("HH"), DateTime.Now.ToString("mm"), DateTime.Now.ToString("ss"));

              %>
                 </ul>
             </div>

         </td>
     </tr>
     <tr class="tdbg">
         <td class="splittd" style="height:50px;border-bottom:0px;">
             <input type="button" value="ȷ��֧��" class="button" onclick="return(doPay())" />
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
                      if ($("#money").val()==''){
                          KesionJS.Alert('�������ֵ���!','$("#money").focus();');
                          return false;
                      }
                      window.open('PayConfirm.aspx?OrderID=<%=orderID%>&PlatID=' + pid + '&Money='+$("#money").val());
                      return false;
                   }
               </script>
         </td>
     </tr>


    </table>
    

    <asp:Repeater ID="Repeater1" runat="server">
    <HeaderTemplate>
	<div class="padtitle">��ʷ��ֵ��¼</div>
     <table id="tablist" width="100%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
      <tr align="center" class="title">
        	<td>���</td>
        	<td>��ֵ����</td>
        	<td>ʱ��</td>
        	<td>��ֵ���</td>
        	<td>ʵ��</td>
        	<td>״̬</td>
        	<td>֧��ƽ̨</td>
        	<td>����</td>
        </tr>
    </HeaderTemplate>
    <ItemTemplate>
      <tr class="tdbg">
          <td class="splittd" style="text-align:center"><%# Container.ItemIndex + 1 + (CurrPage - 1) * PageSize%>��</td>
          <td class="splittd"><%# Eval("orderid") %></td>
          <td class="splittd"> 
           <%# Utils.FormatHumanizedTime(Convert.ToDateTime(Eval("AddDate")))%>
          </td>
          <td class="splittd" nowrap><%=MyCache.GetCurrencySymbol %><%# Math.Round(Convert.ToDecimal(Eval("paymoney")),2)%> <%=MyCache.GetCurrencyUnit %></td>
          <td class="splittd" nowrap><%=MyCache.GetCurrencySymbol %><span style="font-size:16px;font-weight:bold;color:#ff6600"><%# Math.Round(Convert.ToDecimal(Eval("realmoney")),2)%></span> <%=MyCache.GetCurrencyUnit %></td>
          <td class="splittd" style="text-align:center">
          <%# GetPayStatus(Convert.ToInt32(Eval("status"))) %>
          </td>
          <td class="splittd">
          <%# Eval("platname") %>
          </td>
          <td class="splittd"  style="text-align:center">
          <%# Eval("status").ToString() == "0" ? "<a href='?action=del&id=" + Eval("id") + @"' onclick=""return(confirm('ȷ��ɾ����'))"">ɾ��</a> | <a target='_blank' href='PayConfirm.aspx?from=recharge&platid="+Eval("platid")+"&orderid=" + Eval("orderid") + "'>֧��</a>" : "---"%>
          
          </td>

      </tr>  

     </ItemTemplate>
     <FooterTemplate>
         <tr class="tdbg" style="display:<%# bool.Parse((Repeater1.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="10">
                  û�г�ֵ��¼��
                </td>
           </tr> 
      </table>
     </FooterTemplate>
    </asp:Repeater>
    
   <br />
    
     	<div class="fy_box"><KS:Page ID="Page1" runat="server" /></div>
     
     </div>
    </div> 
     
</asp:Panel>

<asp:Panel ID="PnlStep2" runat="server" Visible="false" Width="100%">
 
 <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
</asp:Panel>




</asp:Content>

