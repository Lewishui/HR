<%@ Page Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_MyGroupOneList" Title="我的订单" Codebehind="MyGroupOneList.aspx.cs" %>
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
				<li><a href="MyGroupOneBuyOrder.aspx">正在进行(<%=DataFactory.GetOnlyValue("select count(1) From KS_ProGroupOneOrder Where status=1 and UserName='"+(new TemporaryVar()).UserName+"'")  %>)</a></li>
				<li><a href="MyGroupOneBuyOrder.aspx?show=2">即将揭晓(<%=DataFactory.GetOnlyValue("select count(1) From KS_ProGroupOneOrder Where status=3  and UserName='"+(new TemporaryVar()).UserName+"'")  %>)</a></li>
				<li><a href="MyGroupOneBuyOrder.aspx?show=-1">所有的夺宝(<%=DataFactory.GetOnlyValue("select count(1) From KS_ProGroupOneOrder Where status>0 and UserName='"+(new TemporaryVar()).UserName+"'")  %>)</a></li>
                <li class='puton'><a href="MyGroupOneList.aspx">中奖记录(<%=DataFactory.GetOnlyValue("select count(1) From KS_ProGroupOneOrder Where iswin=2 and UserName='"+(new TemporaryVar()).UserName+"'")  %>)</a></li>
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
               <td width="80" align="center"><b>幸运号</b></td>
               <td width="80" align="center"><b>参与次数</b></td>
               <td width="70" align="center"><b>实付</b></td>
               <td width="70" align="center" nowrap><b>状态</b></td>
               <td width="70" align="center" nowrap><b>操作</b></td>
              </tr>
          </HeaderTemplate>
         <ItemTemplate>
         
             <TR class="title1">
				 <td colspan="7" style="padding-top:2px;padding-bottom:2px;padding-left:10px;">
				 <strong>
				<%# Container.ItemIndex + 1 + (CurrPage - 1) * PageSize%>、 <%#"参与期号："+Eval("issue")%>&nbsp;&nbsp;下单时间：<%# Utils.FormatHumanizedTime(Convert.ToDateTime(Eval("InputTime"))) %></strong></td>
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
                            <a href="../../shop/GroupOneShow.aspx?id=<%# Eval("infoid") %>&orderid=<%# Eval("orderid") %>" target="_blank"><%# DataFactory.GetOnlyValue("select subject from KS_ProGroupOne where id="+Eval("infoid"))%></a>       

                             </td>
		              </tr>
		             </table>
                  </td>
                  <td class="splittd" style="width:80px;"><%#Eval("WinNumber")%></td>
                  <td class="splittd" style="width:80px;text-align:center"><%#Convert.ToInt16(Eval("jointimes")) %></td>
                </table> 
               
               </ItemTemplate>
             </asp:Repeater>
             </td>
             <td class="list_link" style="text-align:center" valign="top">  
                 <%=MyCache.GetCurrencySymbol%><%#Public.ReturnShopPrice(Convert.ToString(Convert.ToDouble(Eval("Price"))*Convert.ToDouble(DataFactory.GetOnlyValue("select sum(joinnumber) from KS_ProGroupOneOrder where issue="+Utils.StrToInt(Eval("issue"))))))%>       
              </td>
             <td class="list_link" style="text-align:center" nowrap valign="top">

                 <%#GetNowStatus(Convert.ToInt16( Eval("status")),Convert.ToString(Eval("realname")),Convert.ToString(Eval("mobile"))) %>
             </td>
				<td nowrap class="list_link" style="text-align:center" valign="top">
               <a href="?action=showdetail&id=<%# Eval("id") %>">订单详情</a>
                    <br />
              <%#string.IsNullOrEmpty(Eval("realname").ToString())&&string.IsNullOrEmpty(Eval("mobile").ToString())&&string.IsNullOrEmpty(Eval("address").ToString())?"<a href='javascript:;' onclick='addAdress("+Convert.ToInt32(Eval("id"))+",0)'>设置</a>":string.Empty%>	
			 <br /><%#Convert.ToInt16(Eval("status"))==2&&Convert.ToInt16(Eval("iswin"))==2&&!string.IsNullOrEmpty(Eval("realname").ToString())&&!string.IsNullOrEmpty(Eval("mobile").ToString())&&!string.IsNullOrEmpty(Eval("address").ToString())?"<a href='javascript:;' onclick='addAdress("+Convert.ToInt16(Eval("id"))+",1)'>查看/修改地址</a>":string.Empty%>
                  <br/>
                    <%# Convert.ToString(Eval("DeliverStatus")) == "1" ? @"<br/><a href='javascript:;' onclick=""KesionJS.Confirm('此操作不可逆，您确定收到商品了吗？', 'location.href=\'shop/MyGroupOneList.aspx?id=" + Eval("id") + @"&action=signorder&message="+Convert.ToInt16(Eval("ConsumptionMode"))+@"\';', null);"">确认收货</a>" : ""%>	
                   <%#Convert.ToInt16(Eval("status"))>4&&Convert.ToInt16(Eval("iswin"))==2?GetCommentTips(Convert.ToInt16(Eval("status")),Convert.ToInt16(Eval("deliverStatus")),Convert.ToString(Eval("orderId"))):"" %>
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
            function addAdress(id, v) {
                if (v == 0)
                { top.openWin("设置收货地址", "/user/Shop/MyGroupOneList.aspx?action=addadress&type=0&id=" + id + "", true, 650, 450); }
              else
                { top.openWin("查看/修改地址", "/user/Shop/MyGroupOneList.aspx?action=addadress&type=1&id=" + id + "", true, 650, 450); }
            }
        </script>
        
           <br />
    
     <div class="fy_box"><KS:Page ID="Page1" runat="server" /></div>
    </asp:Panel>    
    <asp:Panel ID="adressPanel" runat="server">
        <br />
        <script>
             function checkform() {
           
            var realname = jQuery("#<%=this.txtname.ClientID %>").val();
            if (realname == '') {
                $.dialog.alert('请输入收货人姓名!', function() {
                jQuery("#<%=this.txtname.ClientID %>").focus();
                });
                return false;
            }
            var tel = jQuery("#<%=this.txtphone.ClientID %>").val();
            if (tel == '') {
                $.dialog.alert('请输入电话号码!', function () {
                    jQuery("#<%=this.txtphone.ClientID %>").focus();
                });
                return false;
            }
            if (tel != '' && tel.length < 7) {
                KesionJS.Alert('电话号码格式不正确，请重新输入!', 'jQuery("#<%=this.txtphone.ClientID %>").focus()');
                return false;
            }
             var address = jQuery("#<%=this.txtadress.ClientID %>").val();
            if (address == '') {
                $.dialog.alert('请输入收货地址!', function() {
                jQuery("#<%=this.txtadress.ClientID %>").focus();
                });
                return false;
            }
            var zipcode = jQuery("#<%=this.txtcode.ClientID %>").val();
            if (zipcode == '') {
                $.dialog.alert('请输入邮政编码!', function() {
                jQuery("#<%=this.txtcode.ClientID %>").focus();
                });
                return false;
            }


            return true;
        }
        </script>
        <table width="98%" align="center" border="0" cellpadding="1" cellspacing="1" class="border"> 
            <tr class="tdbg">
                <td class="lefttd">收件人姓名：</td>
                <td class="righttd">
                    <asp:TextBox ID="txtname" runat="server" Width="200px" MaxLength="100" CssClass="textbox"></asp:TextBox> <span style="color:Red">*</span>
                </td>
            </tr>
            <tr class="tdbg">
                <td class="lefttd">收件人电话：</td>
                <td class="righttd">
                    <asp:TextBox ID="txtphone" runat="server" Width="200px" MaxLength="100" CssClass="textbox"></asp:TextBox> <span style="color:Red">*</span>
                </td>
            </tr>
           <tr class="tdbg">
                <td class="lefttd">收件人邮编：</td>
                <td class="righttd">
                    <asp:TextBox ID="txtcode" runat="server" Width="200px" MaxLength="100" CssClass="textbox"></asp:TextBox> <span style="color:Red">*</span>
                </td>
            </tr>
           <tr class="tdbg">
                <td class="lefttd">收件人地址：</td>
                <td class="righttd">
                    <asp:TextBox ID="txtadress" runat="server" Width="200px" MaxLength="100" CssClass="textbox"></asp:TextBox> <span style="color:Red">*</span>
                </td>
            </tr>
           <tr class="tdbg">
                <td class="lefttd">收件人邮箱：</td>
                <td class="righttd">
                    <asp:TextBox ID="txtEmail" runat="server" Width="200px" MaxLength="100" CssClass="textbox"></asp:TextBox>
                </td>
            </tr>
            <tr class="tdbg">
                <td class="lefttd">备注：</td>
                <td class="righttd">
                    <asp:TextBox ID="txtremark" runat="server" Width="200px" CssClass="textbox"></asp:TextBox>
                </td>
            </tr>
        </table>
        <div style="text-align:center">
              <div class="cz_btn">
                <asp:HiddenField ID="HidID" Value="0" runat="server" />
              	<span><asp:Button ID="Button2"  OnClientClick="return(checkform())" CssClass="button" runat="server" 
                      Text="OK,提交" onclick="Button1_Click" /></span>
                      <span><input type="button" onclick="top.box.close()" class="button" value="关闭取消" /></span>
                    </div>
               </div>    

    </asp:Panel>
 

<asp:Panel ID="detailPannel" runat="server" Visible="false">
    <div class="r_tybox nomar">
        <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
        </div>
</asp:Panel>


</asp:Content>

