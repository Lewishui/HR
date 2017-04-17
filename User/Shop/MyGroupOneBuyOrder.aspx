<%@ Page Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_MyGroupOneBuyOrder" Title="我的订单" Codebehind="MyGroupOneBuyOrder.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.BLL" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.HtmlTags" %>
<%@ Import Namespace="Kesion.APPCode" %>

<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

<asp:Panel ID="ListPannel" runat="server">
<style>
.border .wait,.border .wff,.border .wfk,.border .wxf{color:red;}
.border .yff,.border .yfq,.border .yqs,.border .confirm{color:green;}
.border .yxf {
color:#999; }
.border .wx{color:#999;}
.border .jq{color:#888;}
.border .tk{color:Purple}
.border .ddff{color:brown;}
.border .list_link{line-height:22px;border-left:1px solid #efefef;padding:5px;}
.border .img img{border:1px solid #ccc;padding:1px;}
</style>
<div class="r_tybox nomar">
	<div class="tabs">	
			<ul>
				<li<%if ((Utils.StrToInt(KSCMS.S("show"))==0)) Response.Write (" class='puton'"); %>><a href="MyGroupOneBuyOrder.aspx">正在进行(<%=DataFactory.GetOnlyValue("select count(1) From KS_ProGroupOneOrder Where status=1 and UserName='"+(new TemporaryVar()).UserName+"'")  %>)</a></li>
				<li<%if (KSCMS.S("show")=="2") Response.Write (" class='puton'"); %>><a href="MyGroupOneBuyOrder.aspx?show=2">即将揭晓(<%=DataFactory.GetOnlyValue("select count(1) From KS_ProGroupOneOrder Where status=3  and UserName='"+(new TemporaryVar()).UserName+"'")   %>)</a></li>
				<li<%if (KSCMS.S("show")=="-1") Response.Write (" class='puton'"); %>><a href="MyGroupOneBuyOrder.aspx?show=-1">所有的夺宝(<%=DataFactory.GetOnlyValue("select count(1) From KS_ProGroupOneOrder Where status>0 and UserName='"+(new TemporaryVar()).UserName+"'")  %>)</a></li>
                                <li><a href="MyGroupOneList.aspx">中奖记录(<%=DataFactory.GetOnlyValue("select count(1) From KS_ProGroupOneOrder Where iswin=2 and UserName='"+(new TemporaryVar()).UserName+"'")  %>)</a></li>
			</ul>
	</div>

	<div class="r_padbox">
    
  
    <div class="message"><div style="padding:20px">夺宝搜索：
    
        <asp:DropDownList ID="DrpTJ" runat="server">
            <asp:ListItem Value="1">夺宝号</asp:ListItem>            
        </asp:DropDownList>
        关键字：<asp:TextBox ID="TxtKey" runat="server" CssClass="textbox" />
        <asp:Button Text="搜索订单" runat="server" CssClass="button" OnClick="Unnamed1_Click" />
        </div>
   </div>
  <asp:Repeater ID="Repeater1" runat="server"  onitemdatabound="Repeater1_ItemDataBound" >

          <HeaderTemplate>
          <table width="98%" align="center" border="0" cellpadding="1" cellspacing="1" class="border">
              <tr class="title">
               <td height="25" width="40" nowrap><b>序号</b></td>
               <td style="width:500px;text-align:left">&nbsp;&nbsp;<b>商品信息</b></td>
               <td width="80" align="center"><b>单价</b></td>
               <td width="80" align="center"><b>数量</b></td>
               <td width="70" align="center"><b>实付</b></td>
               <td width="70" align="center" nowrap><b>状态</b></td>
               <td width="70" align="center" nowrap><b>操作</b></td>
              </tr>
          </HeaderTemplate>
         <ItemTemplate>
         
             <TR class="title1">
				 <td colspan="7" style="padding-top:2px;padding-bottom:2px;padding-left:10px;">
				 <strong>
				<%# Container.ItemIndex + 1 + (CurrPage - 1) * PageSize%>、 <%# "参与期号："+Eval("issue")%>&nbsp;&nbsp;下单时间：<%# Utils.FormatHumanizedTime(Convert.ToDateTime(Eval("InputTime"))) %></strong></td>
			</TR>
			<tr>
			<tr class="tdbg">
              <td class="list_link" align="center" width="25"></td>
			  <td  colspan="3" align="left">
             <asp:Repeater ID="Repeater2" runat="server">
               <ItemTemplate>
               <table width="100%" class="table1" cellpadding="0" cellspacing="0" border="0">
               <tr class="TR_BG_list">
                  <td class="splittd" align="left" style="width:500px">
                    <table border='0' width="100%" cellpadding="0" cellspacing="0">
		               <tr>
			            <td width="60" height="70" align="center" class="img"><img onerror="this.src='<%=MyCache.GetCacheShopConfig(9) %>';" src='<%# Eval("DefaultPic") %>' width='50' height='50' align='left'/></td>
			            <td>
                         <%--<%# GetTitle(Convert.ToString(Eval("title")), Convert.ToString(Eval("fileName")), Convert.ToString(Eval("TurnUrl")), Utils.StrToInt(Eval("channelid")), Utils.StrToInt(Eval("classid")), Utils.StrToInt(Eval("infoid")), Convert.ToString(Eval("attributeCart")), Utils.StrToInt(Eval("attrid")))%>--%>	  
                            <a href="../../shop/GroupOneShow.aspx?id=<%# Eval("infoid") %>" target="_blank"><%# DataFactory.GetOnlyValue("select subject from KS_ProGroupOne where id="+Eval("infoid"))%></a>       
                            <%#getstatus(Convert.ToInt16( Eval("infoid")),(Convert.ToInt16(Eval("status"))),Convert.ToInt16(DataFactory.GetOnlyValue("select sum(joinnumber) from KS_ProGroupOneOrder where issue="+Utils.StrToInt(Eval("issue")))),Convert.ToString(Eval("issue")),Convert.ToString(Eval("username")),Convert.ToInt16(Eval("iswin")))%>
                          

                             </td>
		              </tr>
		             </table>
                  </td>
                  <td class="splittd" style="width:80px;"><%=MyCache.GetCurrencySymbol%><%# Public.ReturnShopPrice(Convert.ToString(Eval("Price")))%></td>
                  <td class="splittd" style="width:80px;text-align:center"><%#Convert.ToInt16(DataFactory.GetOnlyValue("select joinnumber from KS_ProGroupOneOrder where orderid='"+Eval("orderid")+"'")) %></td>
                </table> 
               
               </ItemTemplate>
             </asp:Repeater>
             </td>
             <td class="list_link" style="text-align:center" valign="top">  
                 <%#MyCache.GetCurrencySymbol%><%#Public.ReturnShopPrice(Convert.ToString(Convert.ToDouble(Eval("Price"))*Convert.ToDouble(DataFactory.GetOnlyValue("select joinnumber from KS_ProGroupOneOrder where orderid='"+Eval("orderid")+"'"))))%>       
              </td>
             <td class="list_link" style="text-align:center" nowrap valign="top">
                 <%#GetNowStatus(Convert.ToInt16( Eval("status")),Convert.ToInt16( Eval("iswin"))) %>
             </td>
				<td nowrap class="list_link" style="text-align:center" valign="top">
				<%#"<a style='color:blue' href='javascript:;' onclick='viewlist("+Convert.ToInt16(Eval("id"))+")'>我的参与号码</a>"%>							
                </td>

             </tr>
             
         </ItemTemplate>
          <FooterTemplate>
           <tr class="tdbg" style="display:<%# bool.Parse((Repeater1.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="7">
                  还没有任何的订单！
                </td>
               </tr> 
           </table>
          </FooterTemplate>
        </asp:Repeater>
        <script>

            function viewlist(id) {
                //alert(id);
                //"+Eval("orderid")+" &orderid='" + orderid + "'
                parent.openWin("你的参与号码", "/user/Shop/MyGroupOneBuyOrder.aspx?action=viewlist&id=" + id + "", false, 500, 400);
            }
            
        </script>
        
        
           <br />
    
     <div class="fy_box"><KS:Page ID="Page1" runat="server" /></div>
    </asp:Panel>

     <asp:Panel ID="viewpanel" runat="server">
     <h3 class="code-title">你本期总共参与了<%=DataFactory.GetOnlyValue("select sum(buyamount) as joinamount from  KS_ProGroupOneLottery  Where orderid='"+orderid+"'")%>人次</h3>

    <KS:KSGV ID="list1" cssclass="CTable CodeTb" runat="server" AutoGenerateColumns="False" Width="99%" EmptyDataText="没有任何的记录!" GridLines="None" OnRowDataBound="list1_RowDataBound"   AllowPaging="True" OnPageIndexChanging="list1_PageIndexChanging" PageSize="5" >
        <Columns>           
            <asp:TemplateField HeaderText="">
                <itemstyle horizontalalign="Center"  />
                <itemtemplate>
                    <span class="date"><%#Eval("adddate") %></span>
                    <p class="codebox"><%#Eval("SerialNumber") %></p>
                </itemtemplate>
            </asp:TemplateField>
                                
        </Columns>
        <HeaderStyle CssClass="CTitle" />
        <EmptyDataRowStyle CssClass="emptycss" />
         
    </KS:KSGV>
          <br />
       
         
         </asp:Panel>
   
	</div>
</div>

</asp:Content>

