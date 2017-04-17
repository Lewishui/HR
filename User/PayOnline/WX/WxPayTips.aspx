<%@ Page Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User.PayOnline.WX.WxPayTips" Codebehind="WxPayTips.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.BLL" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="System.Data" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta http-equiv="Cache-control" content="max-age=1700">
<meta name="viewport" content="user-scalable=no, width=device-width">
<meta name="MobileOptimized" content="320">
<meta name="author" content="kesion.com">
    <title></title>
    <style>
        .tips {
            line-height:30px;
			padding:25px 10px 0 10px;
			margin:0 auto;
			width:70%;
			
        }
        .success {font-size:20px;color:green;font-weight:bold; }
        .error {font-size:20px;color:red;font-weight:bold; }
        .money {
            color:brown;font-weight:bold;font-size:20px;
        }
    </style>
    <link href="/3g/Template01/user/images/user.css" rel="stylesheet" type="text/css">
    <link href="/3g/Template01/user/fonts/css/font-awesome.min.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="headbar clearfix">
   <div class="back"><a href="javascript:;" onClick="history.back()"><i class="fa fa-chevron-left"></i></a></div>
   <h3>充值提醒</h3>
   <div class="right_head fr">
      <a href="/3g/user/index.aspx" class="myuser"><i class="fa fa-user"></i></a>
   </div>
</div> 
<div class="clear" style="height:10px;"></div>
    <form id="form1" runat="server">
    <div class="tips">
             <%
                 string orderid = Utils.RemoveXss(KSCMS.S("orderid"));
                 if (string.IsNullOrEmpty(KSCMS.S("orderid")))
                 {
                     orderid = KSCMS.S("OuttradeNo");
                 }
                 string from = KSCMS.S("from");
                 if (string.IsNullOrEmpty(KSCMS.S("from")))
                 {
                     from = KSCMS.S("attach");
                 }

                 StringBuilder sb = new StringBuilder();
                 int issuccess = Utils.StrToInt(KSCMS.S("issuccess"));
                 if (!string.IsNullOrEmpty(KSCMS.S("issuccess")))
                 {
                     if (issuccess == 1)
                     {
                         Response.Write(@"<div class=""success"">恭喜，支付成功！</div>");
                     }
                     else
                     {
                         Response.Write(@"<div class=""error"">对不起，支付失败！</div>");
                     }
                 }
                 if (string.IsNullOrEmpty(orderid)) KSCMS.Die("error!");

                 if (from == "ShopMerger")
                 {
                     sb.AppendLine("支 付 号：" + orderid + "<br />");
                     sb.AppendLine("付款时间：" + DateTime.Now + "<br />");
                 }
                 else if (from == "shop")  //商城购物单个订单
                 {
                     using (DataTable dt = DataFactory.GetDataTable("select top 1 * From KS_ProOrder Where OrderID='" + orderid + "'"))
                     {
                         if (dt.Rows.Count > 0)
                         {
                             DataRow dr = dt.Rows[0];
                             sb.AppendLine("订 单 号：" + dr["orderid"].ToString() + "<br />");
                             sb.AppendLine(@"已付款：<span class=""money"">" + MyCache.GetCurrencySymbol + Kesion.APPCode.Public.ReturnShopPrice(dr["MoneyReceipt"].ToString()) + MyCache.GetCurrencyUnit + @"</span><br />");
                             sb.AppendLine("付款时间：" + dr["paytime"].ToString() + "<br />");
                             sb.AppendLine("商品清单：");
                             using (DataTable dtt = DataFactory.GetDataTable("select title,num from  KS_ProOrderItem where orderid='" + dr["orderid"].ToString() + "'"))
                             {
                                 if (dtt.Rows.Count > 0)
                                 {
                                     foreach (DataRow drr in dtt.Rows)
                                     {
                                         sb.AppendLine(drr["title"].ToString() + "&nbsp;<span style='color:#999'>x&nbsp;" + drr["num"].ToString() + "</span><br/>");
                                     }
                                 }
                             }
                         }
                     }

                 }
                 else if (KSCMS.S("from") == "feepackages")
                 {
                     #region  购买套餐包
                     if (orderid.IndexOf("_") == -1)
                     {
                         sb.AppendLine("<li>无效订单号!</li>");
                     }
                     else
                     {
                         int packId = Utils.StrToInt(orderid.Split('_')[1]);
                         using (DataTable dt = DataFactory.GetDataTable("Select top 1 * From KS_UserFeePackages Where ID=" + packId))
                         {
                             if (dt.Rows.Count <= 0)
                             {
                                 sb.AppendLine("<li>套餐包已失效!</li>");
                             }
                             else
                             {
                                 DataRow dr = dt.Rows[0];
                                 sb.AppendLine("<li>"+string.Format(Utils.GetLanguageNode("//language/node[@name='user']/payonline/feepackages"), dr["title"].ToString())+"</li>");

                             }
                         }
                     }
                     #endregion
                 }
                 else if (KSCMS.S("from") == "form")
                 {
                     #region 表单支付
                     if (orderid.IndexOf("_") == -1)
                     {
                         sb.AppendLine("无效订单号!");
                     }
                     else
                     {
                         string[] arr = orderid.Split('_');
                         using (DataTable dt = Kesion.BLL.DataFactory.GetDataTable("Select top 1 * From KS_Form Where FormID=" + Utils.StrToInt(arr[1]) + ""))
                         {
                             if (dt.Rows.Count <= 0)
                             {

                             }
                             else
                             {
                                 DataRow dr = dt.Rows[0];
                                 string subject = dr["subject"].ToString();
                                 sb.AppendLine(string.Format(Utils.GetLanguageNode("//language/node[@name='user']/payonline/formpay"), subject));

                             }
                         }

                     }
                     #endregion
                 }
                 else
                 {
                     using (DataTable dt = DataFactoryUser.GetDataTable("Select top 1 * From KS_RechargeRecords Where OrderID='" + orderid + "'"))
                     {
                         if (dt.Rows.Count > 0)
                         {
                             DataRow dr = dt.Rows[0];
                             sb.AppendLine("订单号：" + dr["orderid"].ToString() + "<br />");
                             sb.AppendLine("用户名：" + dr["username"].ToString() + "<br />");
                             sb.AppendLine(@"充值金额：<span class=""money"">" + MyCache.GetCurrencySymbol + Kesion.APPCode.Public.ReturnShopPrice(dr["realMoney"].ToString()) + MyCache.GetCurrencyUnit + "</span><br />");
                             sb.AppendLine("充值时间：" + dr["paytime"].ToString() + "<br />");
                             sb.AppendLine(@"当前余额：<span class=""money"">" + MyCache.GetCurrencySymbol + Kesion.APPCode.Public.ReturnShopPrice(UserManage.GetUserInfo(dr["username"].ToString()).Money) + MyCache.GetCurrencyUnit + "</span><br />");

                         }
                     }

                 }

                 Response.Write(sb.ToString());
            %>
    </div>
    </form>
    <div class="footer">
   <ul>
      <li>
         <a href="/3g/index.aspx">
            <div class="fa fa-home"></div>
            <p>主页</p>
         </a>
         <a href="/3g/shop/shoppingcart.aspx">
            <div class="fa fa-shopping-cart"></div>
            <p>购物车</p>
         </a>
         <a href="/3g/user/index.aspx">
            <div class="fa fa-user"></div>
            <p>会员中心</p>
         </a>
         
         <a href="javascript:;" onClick="history.back()">
            <div class="fa fa-long-arrow-left"></div>
            <p>返回</p>
         </a>
      </li>
   </ul>
</div>
</body>
</html>
