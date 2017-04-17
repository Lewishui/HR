<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Kesion.NET.WebSite.Api.qq.QQLogin" %>
<%@ Import Namespace="Kesion.Cache"%>
<%@ Import Namespace="Kesion.Publics"%>
<%
    
    if (MyCache.GetAccountAPIConfig("qq", "enable") != "true")
    {
        Utils.ShowError("对不起，本站没有开通QQ账号登录!", "error.gif", 2, KSCMS.GetInstallDir());
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
    string ApiID=MyCache.GetAccountAPIConfig("qq","apiid");
    string ApiKey=MyCache.GetAccountAPIConfig("qq","apikey");
    string CallBack=Utils.UrlEncode(MyCache.GetAccountAPIConfig("qq","apireturnurl"));

    string url = "https://graph.qq.com/oauth2.0/authorize?response_type=code&client_id=" + ApiID + "&redirect_uri=" + CallBack + "&state=" + Session["state"] + "&scope=add_one_blog,get_user_info,add_share,check_page_fans,add_t,del_t,add_pic_t,get_repost_list,get_info,get_other_info,get_fanslist,get_idolist,add_idol,del_idol";
	KSCMS.W(@"<div style='margin-top:90px;color:#666;font-size:16px;text-align:center;'><img src='../images/loadingAnimation.gif'/><br/><br/>正在转向qq登录授权页面，请稍候！！！如果长时间没有反应请<a href=""javascript:;"" onclick=""top.location.href='" + url + @"';"" style='color:red'>点此跳转</a>。</div>");

    Response.Redirect(url);

%>