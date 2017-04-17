<%@ Page Language="C#" AutoEventWireup="true" Inherits="WeiPayWeb.WeiPay" Codebehind="WeiPay.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<!DOCTYPE html>
<html>
<head>
    <title>[<%=MyCache.GetCacheConfig(1) %>] ΢��֧��</title>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK" />
    <script src="JS/jquery.js" type="text/javascript"></script>
    <script src="JS/lazyloadv3.js" type="text/javascript"></script>
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1" />
 <style>
 	*{ padding:0; margin:0;}
	html{ font-size:20px;}
	body{ background:#EEEEEE;}
 	@media screen and (min-width:320px){ 
	html{font-size:20px}
	}
	@media screen and (min-width:380px){ 
	html{ font-size:23px;}  
	}
	
	@media screen and (min-width:640px){ 
	html{ font-size:30px;}  
	}
  .lefttd{width:80px;}
    .s_btn{padding:0 10px } 
 	.s_btn .button{display: block; width:100%;font-weight: 400;text-align: center;vertical-align: middle;cursor: pointer;border: 1px solid transparent;padding: 6px 0px;font-size: 14px;line-height: 1.42857143;border-radius: 4px; color:#fff;background-color: #da4453;border-color: #da4453; }
	.headbar{ margin:1rem 0.5rem 0 0.5rem;}
	.headbar h3 font{ width:1.8rem; height:1.8rem; padding-right:0.8rem; float:left; display:inline-block}
	.headbar h3 font img{ width:100%; height:100%; }
	.headbar h3{ height:1.8rem; line-height:1.8rem; font-size:0.8rem;}
	
	.s_btn .button{display: block; padding: 0.3rem 0;font-size: 0.9rem; margin: 1.0rem auto; width:100%; border-color: #47AEF0; background: #47AEF0; color: #fff; text-align: center; border:0;border-radius: 0.15rem; white-space: nowrap;overflow: hidden; vertical-align: middle;}
	input[type="submit"],input[type="text"],input[type="reset"],input[type="button"],button ,select,textarea{-webkit-appearance: none;}
	.allorder{ margin:0.5rem; background:#fff; border-radius:0.3rem; padding:0.5rem;}
	.splittd{ height:1.2rem; font-size:0.7rem; color:#666;}
 </style>
</head>
<body>
<div class="headbar clearfix"><h3><font><img src="../../images/wc.png"></font>΢��֧��</h3></div> 
 <form id="form1" runat="server">
 
     <div class="allorder">
          <table cellspacing="1" cellpadding="3" class="border" width="98%"  align="center" border="0">
                     <tr class="tdbg">
                        <td class="splittd lefttd">�� �� �ţ�</td>
                        <td class="splittd"><asp:Label ID="lblOrderSN" runat="server" Text=""></asp:Label></td>
                     </tr>
                      <tr class="tdbg">
                        <td class="splittd lefttd">֧����</td>
                        <td class="splittd"> <asp:Label ID="lblPrice" runat="server" Text=""></asp:Label>Ԫ</td>
                     </tr>
                      <tr class="tdbg">
                        <td class="splittd lefttd" nowrap>��Ʒ�嵥��</td>
                        <td class="splittd"> <asp:Label ID="lblBody" runat="server" Text=""></asp:Label></td>
                     </tr>
                   
                     
                       <tr style="display:none">
                         <td class="splittd lefttd">�Զ��������</td>
                        <td class="splittd">  <asp:Label ID="lblAttach" runat="server" Text=""></asp:Label>    </td>
                     </tr>
                     
                      <tr class="tdbg" style="display:none">
                        <td class="splittd lefttd">OpenId��</td>
                        <td class="splittd">  <asp:Label ID="lblOpenId" runat="server" Text=""></asp:Label>    </td>
                     </tr>
                 </table>
        </div>
               <div class="s_btn"><input type="button" class="button" value="ȷ��֧��" id="getBrandWCPayRequest" onclick="SavePay()" /></div>

        </form>
        <div class="footer">

</div>

</body>
</html>

<%
    Session["PayResultPass"] = Kesion.Publics.Utils.RndNum(10);
  %>
<script type="text/javascript">

function SavePay(){
    WeixinJSBridge.invoke('getBrandWCPayRequest', {
                   "appId": "<%= WeiPay.PayConfig.AppId %>", //���ں����ƣ����̻�����
                   "timeStamp": "<%= TimeStamp %>", //ʱ���
                   "nonceStr": "<%= NonceStr %>", //�����
                   "package": "<%= Package %>", //��չ��
                   "signType": "MD5", //΢��ǩ����ʽ:1.sha1
                   "paySign": "<%= PaySign %>" //΢��ǩ��
               }, 
               function(res) {
                   if (res.err_msg == "get_brand_wcpay_request:ok") {
                      // alert("΢��֧���ɹ�!");
                       location.href = "<%=MyCache.GetCacheConfig(0)+MyCache.GetCacheConfig(73)%>/user/payresult.aspx?pass=<%=Session["PayResultPass"].ToString()%>&issuccess=1&orderid=<%=OrderSN%>&from=<%=Attach%>";
                   } else if (res.err_msg == "get_brand_wcpay_request:cancel") {
                       alert("�û�ȡ��֧��!");
                   } else {
                       alert(res.err_msg);
                       alert("֧��ʧ��!");
                       location.href = "<%=MyCache.GetCacheConfig(0)+MyCache.GetCacheConfig(73)%>/user/payresult.aspx?pass=<%=Session["PayResultPass"].ToString()%>&issuccess=0&orderid=<%=OrderSN%>&from=<%=Attach%>";
                   }
                   // ʹ�����Ϸ�ʽ�ж�ǰ�˷���,΢���Ŷ�֣����ʾ��res.err_msg�����û�֧���ɹ��󷵻�ok����������֤�����Կɿ���
                   //���΢���Ŷӽ��飬���յ�ok����ʱ�����̻���̨ѯ���Ƿ��յ����׳ɹ���֪ͨ�����յ�֪ͨ��ǰ��չʾ���׳ɹ��Ľ��棻����ʱδ�յ�֪ͨ���̻���̨�������ò�ѯ�����ӿڣ���ѯ�����ĵ�ǰ״̬����������ǰ��չʾ��Ӧ�Ľ��档
               });    
}
   
</script>