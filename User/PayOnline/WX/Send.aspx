<%@ Page Language="C#" AutoEventWireup="true" Inherits="WeiPayWeb.Send" Codebehind="Send.aspx.cs" %>
<div align="center">
        <ul style="font-size:30px;font-weight:bold;margin-top:100px;text-align:left;">
           正在打开微信客户端，请按提示完成支付......
           <br />
            订单号：<%=orderId%><br />
            商品名称：<%=itemstr%><br />
            支付金额：<%=(vmoney)%>
        </ul>
	</div>

<script src="http://static.ydbimg.com/Scripts/jquery-1.9.1.js" type="text/javascript"></script>
<script src="http://static.ydbimg.com/API/YdbOnline.js" type="text/javascript"></script>
<script type="text/javascript">
        //YDB.SetWxpayInfo(ProductName, Desicript, Price, OuttradeNo, attach);
        //参数说明：ProductName 名称, Desicript 描述, Price 支付金额, OuttradeNo 订单编号,attach 附加参数。
		function WxPay(){
        var YDB = new YDBOBJ();
        YDB.SetWxpayInfo("在线支付订单号<%=orderId%>", "<%=itemstr%>", "<%=(vmoney)%>", "<%=orderId%>", "<%=flag%>");
		}
        $(document).ready(function () {
            WxPay();
        })
</script>
