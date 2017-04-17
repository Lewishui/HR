<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CallBack.aspx.cs" Inherits="Kesion.NET.WebSite.Api.WeiXin.WeiXinCallBack" %>
<%@ Import Namespace="Kesion.Cache"%>
<%@ Import Namespace="Kesion.Publics"%>
<%@ Import Namespace="Kesion.BLL"%>
<%@ Import Namespace="System.Text"%>
<%@ Import Namespace="System.IO"%>
<%@ Import Namespace="Newtonsoft.Json"%>
<%@ Import Namespace="Newtonsoft.Json.Linq"%>


<script runat="server" type="text/C#">
   protected void Page_Load(object sender, EventArgs e)
 
   {
    if (MyCache.GetAccountAPIConfig("weixin", "enable") != "true")
    {
        Utils.ShowError("对不起，本站没有开通微信登录!", "error.gif", 2, KSCMS.GetInstallDir());
    }
    if (Session["state"] == null)
    {
        Utils.ShowError("会话超时，请重新登录!", "error.gif", 2, KSCMS.GetInstallDir());
    }
    else
    {
        if (Session["state"].ToString() == KSCMS.S("state"))
        {
            weixin_callback();
        }
        else
        {
            Utils.ShowError("会话超时，请重新登录!", "error.gif", 2, KSCMS.GetInstallDir());
        }
    }

   }
    
    private void weixin_callback(){
        string ApiID=MyCache.GetAccountAPIConfig("weixin","apiid");
        string ApiKey=MyCache.GetAccountAPIConfig("weixin","apikey");
        string CallBack = Utils.UrlEncode(MyCache.GetAccountAPIConfig("weixin", "apireturnurl"));

        string token_url = "https://api.weixin.qq.com/sns/oauth2/access_token";
        token_url += "?appid="+ApiID+"&secret="+ApiKey+"&code="+KSCMS.S("code")+"&grant_type=authorization_code";
        Uri url = new Uri(token_url);
        string result = CollectionCommon.GetHttpPage(url, "utf-8");

        if (result.IndexOf("errcode") != -1)
        {
            JObject jsonObj = JObject.Parse(result);
            JS.Alert(@"出错啦！错别提示:<h3>Error:</h3>"+jsonObj["errcode"].ToString()+"<h3>Description:</h3>"+jsonObj["errmsg"].ToString());
        }
        else
        {
            JObject jsonObj = JObject.Parse(result);
            Session["access_token"] = jsonObj["access_token"].ToString();
            Session["weixinopenid"] = jsonObj["openid"].ToString();
            Session["ApiID"] = ApiID;

            if (Session["weixinopenid"] == null)
            {
                Utils.ShowError("出错啦，没有返回openid！", "error.gif", 2, KSCMS.GetInstallDir());

            }
            else
            {

                if (Session["TokenFrom"] != null) //后台授权
                {
                    if (Session["TokenFrom"].ToString() == "admin")
                    {
                        Kesion.NET.WebSite.APPCode.Api.CommonCls.SaveTokenToAccount("weixin", Session["access_token"].ToString(), Session["weixinopenid"].ToString());
                        KSCMS.Die("<script>alert('恭喜，登录授权成功！');top.box.close();</" + "script>");
                    }
                }
                KSCMS.W(@"<div style='margin-top:90px;color:#666;font-size:16px;text-align:center;'><img src='../images/loadingAnimation.gif'/><br/><br/>正在登录中，请稍候！！！如果长时间没有反应请<a href=""javascript:;"" onclick=""top.location.href='weixinbind.aspx';"" style='color:red'>点此跳转</a>。</div>");
                Response.Redirect("weixinbind.aspx");
            }
           
            
            
        }

        
        
    }
    
    
</script>