<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Kesion.NET.WebSite.Api.WeiXin.WeiXinLogin" %>
<%@ Import Namespace="Kesion.Cache"%>
<%@ Import Namespace="Kesion.Publics"%>
<%

    if (MyCache.GetAccountAPIConfig("weixin", "enable") != "true")
    {
        Utils.ShowError("对不起，本站没有开通微信登录!", "error.gif", 2, KSCMS.GetInstallDir());
    }
    if (Utils.IsWeixinDevice()) //微信端打开
    {
        
        Kesion.Weixin.ks_weixin.CheckWeiXinLogin();  //微信自动登录
        KSCMS.Die("");

    }else if (Utils.IsAppDevice())  //APP中打开
    {
        %>
   <!-- <input type="button" value="微信登录"  onClick="WxLogin()"  style="width:80px; height:40px;" />-->
    <script src="/ks_inc/jquery.js" type="text/javascript"></script>
    <script src="http://static.ydbimg.com/API/YdbOnline.js" type="text/javascript"></script>
    <script type="text/javascript">
	$(document).ready(function(){
	    WxLogin();
    });
    function WxLogin(){
        var YDB = new YDBOBJ();
        YDB.WXLogin(0,"<%=MyCache.GetCacheConfig(5)%>/user/api/weixin/appwxlogin.aspx");
    }
    </script>
  <%KSCMS.Die("loading....");
      }

      #region 记录来源页面,以便登录成功返回
      if (!string.IsNullOrEmpty(KSCMS.S("backurl")))
      {
          new TemporaryVar().ComeUrl = KSCMS.S("backurl");
      }
      else
      {
          if (KSCMS.GetComeUrl() != null && KSCMS.GetComeUrl().ToLower().IndexOf("backurl=") != -1)  //登录来的,如原商城要求登录，再点注册
          {
              (new TemporaryVar()).ComeUrl = Utils.SplitString(KSCMS.GetComeUrl().ToLower(), "backurl=")[1];
          }
          else
          {
              (new TemporaryVar()).ComeUrl = KSCMS.GetComeUrl();
          }
      }
      // KSCMS.Die(new TemporaryVar().ComeUrl);
      #endregion

      Session["TokenFrom"] = KSCMS.S("tokenfrom");  //标注后台登录


      Session["state"] = Utils.RndNum(10);
      string ApiID=MyCache.GetAccountAPIConfig("weixin","apiid");
      string ApiKey=MyCache.GetAccountAPIConfig("weixin","apikey");
      string CallBack=Utils.UrlEncode(MyCache.GetAccountAPIConfig("weixin","apireturnurl"));

      string url = "https://open.weixin.qq.com/connect/qrconnect?appid=" + ApiID + "&redirect_uri=" + CallBack + "&response_type=code&scope=snsapi_login&state=" + Session["state"] + "#wechat_redirect";
      KSCMS.W(@"<div style='margin-top:90px;color:#666;font-size:16px;text-align:center;'><img src='../images/loadingAnimation.gif'/><br/><br/>正在转向微信登录授权页面，请稍候！！！如果长时间没有反应请<a href=""javascript:;"" onclick=""top.location.href='" + url + @"';"" style='color:red'>点此跳转</a>。</div>");

      Response.Redirect(url);

%>