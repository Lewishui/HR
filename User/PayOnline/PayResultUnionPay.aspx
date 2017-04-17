<%@ Page Language="C#" AutoEventWireup="True"  CodeBehind="PayResultUnionPay.aspx.cs" Inherits="BackUnionPayResponse" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.BLL" %>
<%@ Import Namespace="Kesion.Components" %>
<%@ Import Namespace="System.Security.Cryptography" %>
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="upacp_sdk_net.com.unionpay.sdk" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <table  border="1">
    <%
        // **************演示后台接收银联返回报文交易结果展示***********************
        
        if (Request.HttpMethod == "POST")
        {
            // 使用Dictionary保存参数
            Dictionary<string, string> resData = new Dictionary<string, string>();

            NameValueCollection coll = Request.Form;

            string[] requestItem = coll.AllKeys;

            for (int i = 0; i < requestItem.Length; i++)
            {
                resData.Add(requestItem[i], Request.Form[requestItem[i]]);
            }

            string respcode = resData["respCode"];

             // 返回报文中不包含UPOG,表示Server端正确接收交易请求,则需要验证Server端返回报文的签名
                if (SDKUtil.Validate(resData, Encoding.UTF8))
                {
                    //Response.Write("商户端验证返回报文签名成功\n");
                   
                    var PaymentPlatId =12; //银联支付
                    var payPlatform = PlatForm.GetPlatFormById(PaymentPlatId);

                    var order_no = KSCMS.S("orderId");
                    var total_fee = Utils.StrToFloat(KSCMS.S("txnAmt")) / 100;

                    PlatForm.UpdateUserMoney((new TemporaryVar()).UserName, order_no, Utils.StrToFloat(total_fee), string.Format(Utils.GetLanguageNode("//language/node[@name='user']/payonline/payremark"), payPlatform.PlatName,payPlatform.ID));
                   Kesion.APPCode.OrderProcess.DoPayOnlineTips(order_no); //订单付款成功提醒管理员
                    KSCMS.Die("success");
                    
                    
                    
                    
                    //商户端根据返回报文内容处理自己的业务逻辑 ,DEMO此处只输出报文结果
                   /* StringBuilder builder = new StringBuilder();

                    builder.Append("<tr><td align=\"center\" colspan=\"2\"><b>商户端接收银联返回报文并按照表格形式输出结果</b></td></tr>");
                    
                    for (int i = 0; i < requestItem.Length; i++)
                    {
                        builder.Append("<tr><td width=\"30%\" align=\"right\">" + requestItem[i] + "</td><td style='word-break:break-all'>" + Request.Form[requestItem[i]] + "</td></tr>");
                    }
                    
                    builder.Append("<tr><td width=\"30%\" align=\"right\">商户端验证银联返回报文结果</td><td>验证签名成功.</td></tr>");
                    Response.Write(builder.ToString());*/
                    
                }
                else
                {
                    Response.Write("<tr><td width=\"30%\" align=\"right\">商户端验证银联返回报文结果</td><td>验证签名失败.</td></tr>");
                }       
        
        }

         %>
         </table>
    </form>
</body>

</html>

    
    
   