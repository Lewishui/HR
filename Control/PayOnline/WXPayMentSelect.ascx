<%@ Control Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.PayOnline.WXPayMentSelect" Codebehind="WXPayMentSelect.ascx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.BLL" %>
<%@ Import Namespace="System.Data" %>
<script>
    $(function () {
        checkInterval=setInterval("checkPayStatus();", 5000); 
    });
    function checkPayStatus() {
        $.ajax({
            type: "get", async: false, url: "payonline/wx/checkstatus.aspx?orderid=<%=orderId%>&flag=<%=flag%>&anticache=" + Math.floor(Math.random() * 1000), cache: false, success: function (d) {
                if (d != '' && d.indexOf("success|") != -1) {
                    KesionJS.Alert('恭喜，支付成功!', "location.href ='"+ d.split('|')[1]+"';");
                }
            }
        });
    }
</script>
<style>
.wxtable tr td{ padding:5px 15px;}
.wxzfbox{width:221px;float:right;margin-top:55px;margin-right:160px;background:#fff;border-top:1px solid #e9e9e9;border:1px solid #e5e5e5;box-shadow: 0px 1px 10px #e5e9ed; padding:20px 40px; border-radius:10px;}
.wxzfbox .wxtit{ background:#0793e3;color:#fff; text-align:center; padding:10px 0px; font-size:14px; line-height:20px;}
.wxzfbox .wxinfo{ margin-top:10px;}
.wxzfbox .wxinfo .tips{ display:block; font-size:12px;color:#55ac36;}
.wxzfbox .wxinfo ul li{font-size:14px; padding:5px 0px 5px 75px; line-height:20px; position:relative;word-wrap:break-word;}
.wxzfbox .wxinfo ul li .button{width:100%;height:40px !important; line-height:100%; font-family:Microsoft Yahei;border-radius:3px; background:#51a6e6;color:#fff;border:0px;font-size:16px;border:0px;}
.wxzfbox .wxinfo ul li span{color:#999;width:75px;float:left; position:absolute;top:5px;left:0;}
</style>

<div style="width:100%;height:630px; background:#eee url(../../user/images/52d38974d25e2.jpg) no-repeat 35% -100px;">
	<div class="mainbox">
        <div class="wxzfbox">
        	<img src="../../user/images/wxzf.png" height="45" style="margin-bottom:15px;" />
        <img  style="width:209px;height:209px; background:url(../../user/img/codebg.png) no-repeat; padding:6px;"  src="../../plus/chart.ashx?text=<%=MyCache.GetCacheConfig(5) %>/user/payonline/wx/send.aspx?orderid=<%=orderId %>%26flag=<%=flag %>%26uid=<%=new Kesion.Publics.TemporaryVar().UserID %>" />
                 <!--
           <img style="width:209px;height:209px; background:url(../../user/img/codebg.png) no-repeat; padding:6px;" src="../../plus/chart.ashx?text=<%=MyCache.GetCacheConfig(5) %>/user/payonline/wx/send.aspx?orderid=<%=orderId %>%26flag=<%=flag %>" />
            -->
            <div class="wxinfo">
            	<ul>
                	<li><span>订单编号：</span><%=orderId %></li>
                	<li><span>订单金额：</span><%=MyCache.GetCurrencySymbol %><%=realmoney.ToString()%><%=MyCache.GetCurrencyUnit %></li>
                	<li><span>实付金额：</span><strong style="font-size:20px;color:#ea4939"><%=MyCache.GetCurrencySymbol %><%=vmoney.ToString() %><%=MyCache.GetCurrencyUnit %></strong></li>
                    <%if (RateByUser==1) { %>
                    <li><span>&nbsp;</span><div class="tips">(手续费率<%=rate.ToString() %>%)</div></li>
                    <%} %>
                </ul>    
            </div>
           
        </div>
    </div>
</div>


<div style="clear:both"></div>