<%@ Page Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_MyGroupOneList" Title="�ҵĶ���" Codebehind="MyGroupOneList.aspx.cs" %>
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
				<li><a href="MyGroupOneBuyOrder.aspx">���ڽ���(<%=DataFactory.GetOnlyValue("select count(1) From KS_ProGroupOneOrder Where status=1 and UserName='"+(new TemporaryVar()).UserName+"'")  %>)</a></li>
				<li><a href="MyGroupOneBuyOrder.aspx?show=2">��������(<%=DataFactory.GetOnlyValue("select count(1) From KS_ProGroupOneOrder Where status=3  and UserName='"+(new TemporaryVar()).UserName+"'")  %>)</a></li>
				<li><a href="MyGroupOneBuyOrder.aspx?show=-1">���еĶᱦ(<%=DataFactory.GetOnlyValue("select count(1) From KS_ProGroupOneOrder Where status>0 and UserName='"+(new TemporaryVar()).UserName+"'")  %>)</a></li>
                <li class='puton'><a href="MyGroupOneList.aspx">�н���¼(<%=DataFactory.GetOnlyValue("select count(1) From KS_ProGroupOneOrder Where iswin=2 and UserName='"+(new TemporaryVar()).UserName+"'")  %>)</a></li>
			</ul>
	</div>

	<div class="r_padbox">
    
  
    <div class="message"><div style="padding:20px">�ᱦ������
    
        <asp:DropDownList ID="DrpTJ" runat="server">
            <asp:ListItem Value="1">�ᱦ��</asp:ListItem>            
        </asp:DropDownList>
        �ؼ��֣�<asp:TextBox ID="TxtKey" runat="server" CssClass="textbox" />
        <asp:Button Text="��������" runat="server" CssClass="button" OnClick="Unnamed1_Click" />
        </div>
   </div>
  <asp:Repeater ID="Repeater1" runat="server"  onitemdatabound="Repeater1_ItemDataBound" >

          <HeaderTemplate>
          <table width="98%" align="center" border="0" cellpadding="1" cellspacing="1" class="border">
              <tr class="title">
               <td height="25" width="40" nowrap><b>���</b></td>
               <td style="width:500px;text-align:left">&nbsp;&nbsp;<b>��Ʒ��Ϣ</b></td>
               <td width="80" align="center"><b>���˺�</b></td>
               <td width="80" align="center"><b>�������</b></td>
               <td width="70" align="center"><b>ʵ��</b></td>
               <td width="70" align="center" nowrap><b>״̬</b></td>
               <td width="70" align="center" nowrap><b>����</b></td>
              </tr>
          </HeaderTemplate>
         <ItemTemplate>
         
             <TR class="title1">
				 <td colspan="7" style="padding-top:2px;padding-bottom:2px;padding-left:10px;">
				 <strong>
				<%# Container.ItemIndex + 1 + (CurrPage - 1) * PageSize%>�� <%#"�����ںţ�"+Eval("issue")%>&nbsp;&nbsp;�µ�ʱ�䣺<%# Utils.FormatHumanizedTime(Convert.ToDateTime(Eval("InputTime"))) %></strong></td>
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
               <a href="?action=showdetail&id=<%# Eval("id") %>">��������</a>
                    <br />
              <%#string.IsNullOrEmpty(Eval("realname").ToString())&&string.IsNullOrEmpty(Eval("mobile").ToString())&&string.IsNullOrEmpty(Eval("address").ToString())?"<a href='javascript:;' onclick='addAdress("+Convert.ToInt32(Eval("id"))+",0)'>����</a>":string.Empty%>	
			 <br /><%#Convert.ToInt16(Eval("status"))==2&&Convert.ToInt16(Eval("iswin"))==2&&!string.IsNullOrEmpty(Eval("realname").ToString())&&!string.IsNullOrEmpty(Eval("mobile").ToString())&&!string.IsNullOrEmpty(Eval("address").ToString())?"<a href='javascript:;' onclick='addAdress("+Convert.ToInt16(Eval("id"))+",1)'>�鿴/�޸ĵ�ַ</a>":string.Empty%>
                  <br/>
                    <%# Convert.ToString(Eval("DeliverStatus")) == "1" ? @"<br/><a href='javascript:;' onclick=""KesionJS.Confirm('�˲��������棬��ȷ���յ���Ʒ����', 'location.href=\'shop/MyGroupOneList.aspx?id=" + Eval("id") + @"&action=signorder&message="+Convert.ToInt16(Eval("ConsumptionMode"))+@"\';', null);"">ȷ���ջ�</a>" : ""%>	
                   <%#Convert.ToInt16(Eval("status"))>4&&Convert.ToInt16(Eval("iswin"))==2?GetCommentTips(Convert.ToInt16(Eval("status")),Convert.ToInt16(Eval("deliverStatus")),Convert.ToString(Eval("orderId"))):"" %>
                   </td>
             </tr>
             
         </ItemTemplate>
          <FooterTemplate>
           <tr class="tdbg" style="display:<%# bool.Parse((Repeater1.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="7">
                  ��û���κεĶ�����
                </td>
               </tr> 
           </table>
          </FooterTemplate>
        </asp:Repeater>
        <script>
            function addAdress(id, v) {
                if (v == 0)
                { top.openWin("�����ջ���ַ", "/user/Shop/MyGroupOneList.aspx?action=addadress&type=0&id=" + id + "", true, 650, 450); }
              else
                { top.openWin("�鿴/�޸ĵ�ַ", "/user/Shop/MyGroupOneList.aspx?action=addadress&type=1&id=" + id + "", true, 650, 450); }
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
                $.dialog.alert('�������ջ�������!', function() {
                jQuery("#<%=this.txtname.ClientID %>").focus();
                });
                return false;
            }
            var tel = jQuery("#<%=this.txtphone.ClientID %>").val();
            if (tel == '') {
                $.dialog.alert('������绰����!', function () {
                    jQuery("#<%=this.txtphone.ClientID %>").focus();
                });
                return false;
            }
            if (tel != '' && tel.length < 7) {
                KesionJS.Alert('�绰�����ʽ����ȷ������������!', 'jQuery("#<%=this.txtphone.ClientID %>").focus()');
                return false;
            }
             var address = jQuery("#<%=this.txtadress.ClientID %>").val();
            if (address == '') {
                $.dialog.alert('�������ջ���ַ!', function() {
                jQuery("#<%=this.txtadress.ClientID %>").focus();
                });
                return false;
            }
            var zipcode = jQuery("#<%=this.txtcode.ClientID %>").val();
            if (zipcode == '') {
                $.dialog.alert('��������������!', function() {
                jQuery("#<%=this.txtcode.ClientID %>").focus();
                });
                return false;
            }


            return true;
        }
        </script>
        <table width="98%" align="center" border="0" cellpadding="1" cellspacing="1" class="border"> 
            <tr class="tdbg">
                <td class="lefttd">�ռ���������</td>
                <td class="righttd">
                    <asp:TextBox ID="txtname" runat="server" Width="200px" MaxLength="100" CssClass="textbox"></asp:TextBox> <span style="color:Red">*</span>
                </td>
            </tr>
            <tr class="tdbg">
                <td class="lefttd">�ռ��˵绰��</td>
                <td class="righttd">
                    <asp:TextBox ID="txtphone" runat="server" Width="200px" MaxLength="100" CssClass="textbox"></asp:TextBox> <span style="color:Red">*</span>
                </td>
            </tr>
           <tr class="tdbg">
                <td class="lefttd">�ռ����ʱࣺ</td>
                <td class="righttd">
                    <asp:TextBox ID="txtcode" runat="server" Width="200px" MaxLength="100" CssClass="textbox"></asp:TextBox> <span style="color:Red">*</span>
                </td>
            </tr>
           <tr class="tdbg">
                <td class="lefttd">�ռ��˵�ַ��</td>
                <td class="righttd">
                    <asp:TextBox ID="txtadress" runat="server" Width="200px" MaxLength="100" CssClass="textbox"></asp:TextBox> <span style="color:Red">*</span>
                </td>
            </tr>
           <tr class="tdbg">
                <td class="lefttd">�ռ������䣺</td>
                <td class="righttd">
                    <asp:TextBox ID="txtEmail" runat="server" Width="200px" MaxLength="100" CssClass="textbox"></asp:TextBox>
                </td>
            </tr>
            <tr class="tdbg">
                <td class="lefttd">��ע��</td>
                <td class="righttd">
                    <asp:TextBox ID="txtremark" runat="server" Width="200px" CssClass="textbox"></asp:TextBox>
                </td>
            </tr>
        </table>
        <div style="text-align:center">
              <div class="cz_btn">
                <asp:HiddenField ID="HidID" Value="0" runat="server" />
              	<span><asp:Button ID="Button2"  OnClientClick="return(checkform())" CssClass="button" runat="server" 
                      Text="OK,�ύ" onclick="Button1_Click" /></span>
                      <span><input type="button" onclick="top.box.close()" class="button" value="�ر�ȡ��" /></span>
                    </div>
               </div>    

    </asp:Panel>
 

<asp:Panel ID="detailPannel" runat="server" Visible="false">
    <div class="r_tybox nomar">
        <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
        </div>
</asp:Panel>


</asp:Content>

