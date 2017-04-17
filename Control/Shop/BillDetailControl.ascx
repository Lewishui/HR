<%@ Control Language="C#" AutoEventWireup="True" Inherits="Kesion.NET.WebSite.Shop.BillDetailControl" Codebehind="BillDetailControl.ascx.cs" %>
<%@ Import Namespace="Kesion.Cache"%>
<%@ Import Namespace="Kesion.Publics"%>
<%@ Import Namespace="Kesion.APPCode"%>
<%@ Import Namespace="Kesion.BLL"%>
<KS:TopNav ID="TopNav1" runat="server" Text="�鿴�ᱦ��ϸ��Ϣ" />


<asp:PlaceHolder ID="PlaceHolder1" runat="server">
    <div class="content-area">
<style>
 .wait,.wff,.wfk,.wxf{color:red;}
 .yff,.yfq, .yqs, .confirm,.yxf{color:green;}
.wx{color:#999;}
.jq{color:#888;}
.ddff{color:brown;}
.list_link{line-height:22px;border-left:1px solid #efefef;padding:5px;}
.border .img img{border:1px solid #ccc;padding:1px;}
</style>
<div class="message"><strong>
    �ᱦ��ţ�<asp:Label ID="LabOrderID" runat="server" Text="Label"></asp:Label>
    ����״̬��<%=Kesion.NET.WebSite.User_MyGroupOneList.GetNowStatus(Utils.StrToInt(dr["status"].ToString()), dr["realname"].ToString(), dr["mobile"].ToString())%>
      </strong>
  </div>


<table border="0" cellpadding="2" cellspacing="1"  width="99%" class="CTable">
   <tr align="center" class="CTitle">
        <td  style="text-align:left;">
            <b>�ͻ���Ϣ</b> (�ᱦ�ˣ�<font color='red'><asp:Label ID="LabUserName" runat="server" Text="Label"></asp:Label></font> 
           &nbsp; �ᱦʱ�䣺<asp:Label ID="LabInputTime" runat="server" Text="Label"></asp:Label> )&nbsp;
        </td>
    </tr>

  
    <tr>
     <td height="35">
     
       <%if (string.IsNullOrEmpty(dr["mobile"].ToString()) && string.IsNullOrEmpty(dr["realname"].ToString()))
           { %>
          <div class="nosetaddress">�н��ߣ�δ�����ͻ���ַ��</div>
      <%}
    else
    { %>
   <table cellspacing="1" cellpadding="2" width="100%" align=center border=0>
    <tr class=tdbg>
      <td align=right width="12%">�ջ���������</td>
      <td width="38%"><asp:Label ID="LabContactMan" runat="server" Text=""></asp:Label></td>
      <td align=right width="12%">��ϵ�绰��</td>
      <td width="38%">
          <asp:Label ID="LabMobile" runat="server" Text=""></asp:Label> <asp:Label ID="LabTel" runat="server" Text=""></asp:Label></td>
    </tr>
    <tr class=tdbg vAlign=top>
      <td align=right width="12%">�ջ��˵�ַ��</td>
      <td width="38%">
       <%=dr["address"].ToString()%>
      <td align=right width="12%">�������룺</td>
      <td width="38%"><%=dr["zipCode"].ToString()%></td>
    </tr>
    <tr class=tdbg>

    <tr class=tdbg vAlign=top>
      <td align=right width="12%">�ͻ����ڣ�</td>
      <td width="38%"><%=(dr["DeliveryDate"].ToString() == "0" || string.IsNullOrEmpty(dr["DeliveryDate"].ToString())) ? "δ�ʹ�" : dr["DeliveryDate"].ToString()%></td>
         <td align=right width="12%">
              �ᱦ���ԣ�</td>
      <td width="38%"><%=dr["Remark"].ToString()%></td>
    </tr>
         </table>
         <%} %>

     </td>
    
    </tr>
    
     <tr class="CTitle">
        <td style="text-align:left;"><b>��Ʒ�嵥</b></td>
    </tr>
    <tr>
    <td>	
    
       <asp:GridView ID="GVGroupBuy" style="border-bottom:none" runat="server" AutoGenerateColumns="False" CssClass="CTable" EmptyDataText="û������!"  Width="99%" CellPadding="1" CellSpacing="1" GridLines="None">
         <Columns>
         
              <asp:TemplateField HeaderText="��ƷͼƬ">
                <itemstyle horizontalalign="Center"/>
                <itemtemplate>
                    <img onerror="this.src='../../sysimg/nopic.gif'" src='<%# string.IsNullOrEmpty(Convert.ToString(Eval("DefaultPic")))?MyCache.GetCacheShopConfig(9):Kesion.BLL.BaseFun.GetFullImageSrc(Convert.ToString(Eval("DefaultPic")))  %>' width="40" height="40" style="border:1px solid #efefef;padding:1px" />			
                </itemtemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="��Ʒ����">
                <itemstyle horizontalalign="Left" width="350px" />
               <itemtemplate>
                <%# string.IsNullOrEmpty(Convert.ToString(Eval("subject")))?Eval("Title"):ordertype=="2"?("<a href='"+ Kesion.HtmlTags.BasicField.GetGroupOneBuyUrl(Convert.ToInt32(Eval("id"))) +"' target='_blank'>"+ Eval("subject").ToString() +"</a>"): ("<a href='"+ Kesion.HtmlTags.BasicField.GetGroupOneBuyUrl(Convert.ToInt32(Eval("id"))) +"' target='_blank'>"+ Eval("subject").ToString() +"</a>")%>
                </itemtemplate>
              </asp:TemplateField>
             <asp:TemplateField HeaderText="�ں�">
                <itemstyle horizontalalign="Center"/>
                <itemtemplate>
                <%# Eval("issue")%>
                </itemtemplate>
              </asp:TemplateField> 
               <asp:TemplateField HeaderText="�������">
                <itemstyle horizontalalign="Center" />
                <itemtemplate>
                   <%# Eval("Joinnumber") %>
                </itemtemplate>
              </asp:TemplateField>
             

              <asp:TemplateField HeaderText="�ܽ��">
                <itemstyle horizontalalign="Center"/>
                <itemtemplate>
               <%=MyCache.GetCurrencySymbol %><%# Public.ReturnShopPrice(Utils.StrToDecimal(Eval("OrderTotalPrice")))%>
                </itemtemplate>
              </asp:TemplateField> 

              
              <asp:TemplateField HeaderText="С��">
                <itemstyle horizontalalign="Center"/>
                <itemtemplate>
                <%=MyCache.GetCurrencySymbol %><%# Public.ReturnShopPrice(Utils.StrToDecimal(Eval("OrderTotalPrice"))-Utils.StrToDecimal(Eval("savemoney")))%>
                </itemtemplate>
              </asp:TemplateField> 

                <asp:TemplateField HeaderText="��ע">
                <itemstyle horizontalalign="Center"/>
                <itemtemplate>
                    <%#Eval("remark") %>
                </itemtemplate>
              </asp:TemplateField>
         </Columns>
             <HeaderStyle CssClass="Title" Height="23px" />
             <RowStyle CssClass="tdbg" Height="22px" />
        </asp:GridView>
    	
        
         <asp:GridView ID="OrderItemList" style="border-bottom:none" runat="server" AutoGenerateColumns="False" CssClass="CTable" EmptyDataText="û������!"  Width="99%" CellPadding="1" CellSpacing="1" GridLines="None">
         <Columns>
         
              <asp:TemplateField HeaderText="��ƷͼƬ">
                <itemstyle horizontalalign="Center" />
                <itemtemplate>
                    <img onerror="this.src='../../sysimg/nopic.gif'" src='<%# string.IsNullOrEmpty(Convert.ToString(Eval("DefaultPic")))?MyCache.GetCacheShopConfig(9):Kesion.BLL.BaseFun.GetFullImageSrc(Convert.ToString(Eval("DefaultPic")))  %>' width="60" height="45" style="border:1px solid #efefef;padding:1px" />
                </itemtemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="��Ʒ����">
                <itemstyle horizontalalign="Left" />
                <itemtemplate>
                    <%# getProOrder(Utils.StrToInt((Eval("ClassID"))), Convert.ToString(Eval("FileName") + ""), Convert.ToString(Eval("TurnUrl") + ""), Utils.StrToInt(Eval("ItemID")), Utils.StrToInt(Eval("ChannelID")), Utils.StrToInt(Eval("InfoID")), string.IsNullOrEmpty(Convert.ToString(Eval("ITitle") + "")) ? Convert.ToString(Eval("Title") + "") : Convert.ToString(Eval("ITitle")), Utils.StrToInt(Eval("isBundleSale")), Utils.StrToInt(Eval("isChangeBuy")), Utils.StrToInt(Eval("isLimitBuy")),Convert.ToString(Eval("AttributeCart")),Utils.StrToInt(Eval("attrID")))%>
                    <span class="tips">(���ţ�<%# Eval("ProID") %>)</span>
                </itemtemplate>
              </asp:TemplateField>
            
             

               <asp:TemplateField HeaderText="����">
                <itemstyle horizontalalign="Center" />
                <itemtemplate>
                   <%# Convert.ToInt16(Eval("isBundleSale"))==1?"--":Convert.ToString(Eval("Num"))+" "+Convert.ToString(Eval("Unit")) %>
                </itemtemplate>
              </asp:TemplateField>
              
             
              <asp:TemplateField HeaderText="ԭ��" Visible="false">
                <itemstyle horizontalalign="Center" width="50px"/>
                <itemtemplate>
                <%=MyCache.GetCurrencySymbol %><%# Public.ReturnShopPrice(Utils.StrToDecimal(Eval("Price_Original")))%>
                </itemtemplate>
              </asp:TemplateField> 
              
            
              <asp:TemplateField HeaderText="С��">
                <itemstyle horizontalalign="Center" width="90px"/>
                <itemtemplate>
                
                  
                   <%# Convert.ToDecimal(Eval("TotalPrice")) > 0 ? MyCache.GetCurrencySymbol + Public.ReturnShopPrice(Utils.StrToDecimal(Eval("TotalPrice"))) : string.Empty%>

                </itemtemplate>
              </asp:TemplateField> 

            
            
              <asp:TemplateField HeaderText="��ע">
                <itemstyle horizontalalign="Center"/>
                <itemtemplate>
                    <%#Eval("remark") %>
                </itemtemplate>
              </asp:TemplateField>
         </Columns>
             <HeaderStyle CssClass="Title" Height="23px" />
             <RowStyle CssClass="tdbg" Height="22px" />
        </asp:GridView>
        
        <table border="0" cellpadding="0" cellspacing="0" class="CTable" style="border-top:none" width="99%">
        <tr>
         <td height="40" style="padding:3px"class="tdbg">
             ��Ʒ��<%=MyCache.GetCurrencySymbol %><asp:Label ID="LabGoodsMoney" runat="server" Text="Label"></asp:Label> <%=MyCache.GetCurrencyUnit %>&nbsp; 
         
         ֧����ʽ���Żݣ�<span style="color:green"><%=MyCache.GetCurrencySymbol %><asp:Label ID="LabPayDiscount" runat="server" Text="Label"></asp:Label></span> <%=MyCache.GetCurrencyUnit %>
         �ᱦ����Ʒ���-֧����ʽ�Żݣ�<span style="color:green"><%=MyCache.GetCurrencySymbol %><asp:Label ID="LabNoUseCouponMoney" runat="server" Text="0"></asp:Label> <%=MyCache.GetCurrencyUnit %>        </span> </td>
         <td class="tdbg" width="300">
         �ᱦ��<span style="color:#555"><%=MyCache.GetCurrencySymbol %><asp:Label ID="LabNoUseCouponMoney1" runat="server" Text="Label"></asp:Label></span> <%=MyCache.GetCurrencyUnit %>
         
         �Ѹ��<span style="color:Red"><%=MyCache.GetCurrencySymbol %><%#Convert.ToInt16(Eval("status"))==2 %><asp:Label ID="LabMoneyReceive" runat="server" Text="Label"></asp:Label></span> <%=MyCache.GetCurrencyUnit %>
       
         Ӧ����<span style="font-weight:bold;font-size:15px;color:#ff6600"><%=MyCache.GetCurrencySymbol %><asp:Label ID="LabTotalOrderMoney" runat="server" Text="Label"></asp:Label></span> <%=MyCache.GetCurrencyUnit %>
        
         </td>
        </tr>
        </table>
        <br />

         &nbsp;&nbsp;ע:<font color=blue>�����������</font>ָ���ǹ���Ĵ�����һ�ο��Թ����ݲ�ֹһ��,<font color=red>���ܽ�</font>ָ����ϵͳ�Զ�����������û��ᱦ���ܽ���������ָϵͳ�Զ�������ļ۸񣬱����������ռ۸��ԡ�Ӧ����Ϊ׼��

        <br />
   </td>
   </tr>
</table>

<asp:Panel ID="PanelConsumer" runat="server">
    <div style="margin:15px 0px 5px 7px"><B>�������ټ�¼</B>  </div>

    <script>
        var box='';
        function showOrderDetail(statusCode){
            var w = 800;
            
            box=jQuery.dialog.open("<%=KSCMS.GetInstallDir()+MyCache.GetCacheConfig(4)%>/content/showboxbill.aspx?action=order&orderid=<%=dr["orderid"].ToString()%>&statusCode="+statusCode,{ 
                title:'�鿴�����¼',
                width:w,
                height:415,

                cancelVal: 'ȡ��',
                max:false,
                min:false,
                cancel: true /*Ϊtrue�ȼ���function(){}*/ 
            });
        }
    </script>
    <asp:Repeater ID="RepeaterConsumer" runat="server" >
          <HeaderTemplate>
            <table class="CTable" cellSpacing=1 cellPadding=2 width="99%" align="center" border=0>
                <tr align="center" class="CTitle" >
        	   <td style="width:150px;text-align:center">����ʱ��</td>
                <td align="Left">������Ϣ</td>
        	    <td align="center">������</td>
        	    <td align="center">����</td>
              </tr>

          </HeaderTemplate>
           <ItemTemplate>
           <tr class="tdbg">
              <td class="Ctd" align="center"><%# Eval("Adddate") %> </td>
              <td class="Ctd" style="word-break:break-all">
              <%# Eval("Remark") %>
              </td>
              <td class="Ctd" align="center"><%# Eval("inputer") %></td>
               <td class="splittd" align="center">
                     <%#  Convert.ToString(Eval("StatusCode"))=="6" ||(Convert.ToString(Eval("StatusCode"))=="4")?"<a href='javascript:;' onclick='showOrderDetail("+ Eval("statusCode") +")'>�鿴����</a>":( Convert.ToString(Eval("StatusCode"))=="3"?"<a href='javascript:;' onclick='showOrderDetail("+ Eval("statusCode") +")'>�鿴����</a>":"-") %> 
              </td>
           </tr>     
           </ItemTemplate>

         <FooterTemplate>
             <tr class="tdbg" style="display:<%# bool.Parse((RepeaterConsumer.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="7">
                  ��û�и��ټ�¼!
                </td>
               </tr> 
            </table>
        </FooterTemplate>
    </asp:Repeater>

   
</asp:Panel>


 </asp:PlaceHolder>






<table width="100%" align="center" id="showDelviery" runat="server" visible="false">
<tr>
 <td>
  <script type="text/javascript">
		showtips(' <asp:Label ID="LabDeliveryInfo" runat="server"></asp:Label>');
		</script>
 </td>
</tr>
</table>
<br /><br /><br />
<div style="text-align:center" class="footer_page">
   <asp:Panel ID="printPanel" runat="server" HorizontalAlign="center" Visible="false">
        <%--<input type="button" class="button" id="btnPrints" value="��ӡ..." onclick="jQuery('#<%=this.printPanel.ClientID %>').hide();window.print();return false;"/>--%>
        <input type="button" class="button" id="showOrder" value="ȡ������" onclick="history.back();" /><br /><br />
        </asp:Panel>
        <asp:Panel ID="footPanel" runat="server">
     
            <%if (KSSecurity.CheckPurview(3)){ %>
        <input type="button" class="button" id="deliveryBtn" runat="server" value="�� ��"/>
            <%} %>
            <%if (KSSecurity.CheckPurview(4)){ %>
        <input type="button" class="button" id="signBtn" runat="server" value="�ͻ���ǩ��" visible="false"/>
        <input type="button" class="button" id="finishBtn" runat="server" value="�� ��" visible="false"/>
            <%} %>            
            <%if (KSSecurity.CheckPurview(8)){ %>
        <input type="button" class="button" id="printExpresBtn" runat="server" value="��ӡ��ݵ�"/>
            <%} %>      
            <%if (KSSecurity.CheckPurview(6)){ %>
        <asp:Button ID="Button1" runat="server" CssClass="button" OnClick="Button1_Click" Text="����Word" />
            <%} %>
        <input type="button" class="button" id="backBtn" value="�� ��" onclick="location.href = 'KS.ShopBill.aspx';" />
            <br /><br />
        <script type="text/javascript">
            var id = "<%=id %>";
            jQuery(document).ready(function() {

                jQuery("#<%=this.printExpresBtn.ClientID %>").click(function() {
                    window.open('<%=KSCMS.GetInstallDir()+MyCache.GetCacheConfig(4)%>/Shop/KS.ShopPrintExpress.aspx?ordertype=3&id=' + id);
                });

               
                jQuery("#<%=this.deliveryBtn.ClientID %>").bind("click", function () {
                    parent.openWin("¼�뷢����Ϣ", "<%=KSCMS.GetInstallDir()+MyCache.GetCacheConfig(4)%>/Shop/KS.ShopBill.aspx?action=deliverybill&id=" + id, true, 850, 550);
                });
                
                
                jQuery("#<%=this.signBtn.ClientID %>").bind("click", function() {
                    KesionJS.Confirm("ȷ���û���ǩ������", 'location.href="<%=KSCMS.GetInstallDir()+MyCache.GetCacheConfig(4)%>/Shop/KS.ShopBill.aspx?id=' + id + '&action=signorder";', null);
                });
                jQuery("#<%=this.finishBtn.ClientID %>").bind("click", function() {
                    KesionJS.Confirm("����һ�����壬�Ͳ������ٶԸö��������κβ�����ȷ��������", 'location.href="<%=KSCMS.GetInstallDir()+MyCache.GetCacheConfig(4)%>/Shop/KS.ShopBill.aspx?id=' + id + '&action=finishorder";', null);
                });
         
            });
        </script>    
        </div>
         </asp:Panel>

 </div>



