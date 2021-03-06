﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SinaBind.aspx.cs" Inherits="Kesion.NET.WebSite.Api.sina.SinaBind" %>
<%@ Import Namespace="Kesion.Cache"%>
<%@ Import Namespace="Kesion.Publics"%>
<%@ Import Namespace="Kesion.BLL"%>
<%@ Import Namespace="System.Text"%>
<%@ Import Namespace="System.Data"%>
<%@ Import Namespace="Newtonsoft.Json"%>
<%@ Import Namespace="Newtonsoft.Json.Linq"%>


<script runat="server" type="text/C#">
    protected void Page_Load(object sender, EventArgs e)

    {
        if (MyCache.GetAccountAPIConfig("sina", "enable") != "true")
        {
            Utils.ShowError("对不起，本站没有开通新浪微博账号登录!", "error.gif", 2, KSCMS.GetInstallDir());
        }
        if (Session["sinaid"] == null || Session["sina_access_token"] == null)
        {
            Utils.ShowError("没有返回uid!", "error.gif", 2, KSCMS.GetInstallDir());
        }
        else
        {
            string action = KSCMS.S("action");
            if (action == "check")
            {
                Kesion.NET.WebSite.APPCode.Api.CommonCls.BindBySina();

            }else if (action=="doreg"){

                Kesion.NET.WebSite.APPCode.Api.CommonCls.DoRegSave(2);

            }else{
                string ApiID=MyCache.GetAccountAPIConfig("sina","apiid");
                string ApiKey=MyCache.GetAccountAPIConfig("sina","apikey");

                string graph_url = "https://api.weibo.com/2/users/show.json";
                graph_url += "?access_token=" + Session["sina_access_token"].ToString() + "&uid=" + Session["sinaid"].ToString();
                Uri url = new Uri(graph_url);
                string result = CollectionCommon.GetHttpPage(url, "utf-8");

                if (result.IndexOf("error") != -1)
                {
                    Utils.ShowError("出错啦！授权失败！", "error.gif", 2, KSCMS.GetInstallDir());
                }
                else
                {
                    JObject jsonObj = JObject.Parse(result);

                    string nickname = Utils.FilterUserName(jsonObj["screen_name"].ToString());
                    string sex = jsonObj["gender"].ToString();
                    if (sex == "m")
                    {
                        sex = "男";
                    }
                    else
                    {
                        sex = "女";
                    }
                    string face = jsonObj["profile_image_url"].ToString();

                    using (DataTable dt = DataFactoryUser.GetDataTable("select top 1 * From KS_User Where sinaid='" + Utils.ChkSQL(Session["sinaid"].ToString()) + "'"))
                    {
                        if (dt.Rows.Count <= 0)
                        {
                             if (CheckUserLogin.Check() == "success" && !string.IsNullOrEmpty(new TemporaryVar().UserName) && DataFactoryUser.Exists("KS_User", "username='" + Utils.ChkSQL(new TemporaryVar().UserName) + "'"))
                            {
                                DataFactoryUser.ExecuteNonQuery(string.Format(@"Update KS_User Set sinaid='{0}',sinatoken='{1}' Where UserName='{2}'", Session["sinaid"].ToString(), Session["sina_access_token"].ToString(), (new TemporaryVar()).UserName));
                                Session["userinfo"] = null;

                                // JS.Message("恭喜，通过新浪微博账号登录成功！", "success.gif", string.Format(@"location.href='{0}user/?mainurl=basic/ApiBind.aspx';", KSCMS.GetInstallDir()));
                                if (Utils.IsMobileDevice())
                                {

                                    Response.Redirect(string.Format(@"{0}/user/index.aspx", KSCMS.GetInstallDir() + MyCache.GetCacheConfig(73)));
                                   // JS.Alert("恭喜，通过新浪微博账号登录成功！", string.Format(@"{0}/user/index.aspx", KSCMS.GetInstallDir() + MyCache.GetCacheConfig(73)));
                                }
                                else
                                {
                                    Response.Redirect(string.Format(@"{0}user/index.aspx", KSCMS.GetInstallDir()));
                                   // JS.Alert("恭喜，通过新浪微博账号登录成功！", string.Format(@"{0}user/index.aspx", KSCMS.GetInstallDir()));
                                }


                            }
                            else
                            {
                                Kesion.NET.WebSite.APPCode.Api.CommonCls.DoBind(2, "使用新浪微博账号快速登录!", nickname, face, sex, Session["sinaid"].ToString());
                            }
                        }
                        else
                        {

                            DataRow dr = dt.Rows[0];

                            Kesion.NET.WebSite.APPCode.Api.CommonCls.DoLogin(dr["username"].ToString(), dr["password"].ToString());
                            // JS.Message("恭喜，通过新浪微博账号登录成功！", "success.gif", string.Format(@"location.href='{0}';", Kesion.NET.WebSite.APPCode.Api.CommonCls.GetLoginSuccessTurnUrl));
                            if (Utils.IsMobileDevice())
                            {
                                Response.Redirect(string.Format(@"{0}/user/index.aspx", KSCMS.GetInstallDir() + MyCache.GetCacheConfig(73)));
                               // JS.Alert("恭喜，通过新浪微博账号登录成功！", string.Format(@"{0}/user/index.aspx", KSCMS.GetInstallDir() + MyCache.GetCacheConfig(73)));
                            }
                            else
                            {
                                string backurl = new TemporaryVar().ComeUrl;
                                if (string.IsNullOrEmpty(backurl)) backurl = KSCMS.GetInstallDir() + "user/index.aspx";
                                if (backurl.ToLower().IndexOf("login.aspx") != -1) backurl = KSCMS.GetInstallDir() + "user/index.aspx";
                                if (backurl.ToLower().IndexOf("getpass.aspx") != -1) backurl = KSCMS.GetInstallDir() + "user/index.aspx";
                                if (backurl.ToLower().IndexOf("activateuser.aspx") != -1) backurl = KSCMS.GetInstallDir() + "user/index.aspx";
                                Response.Redirect(backurl);
                               // JS.Alert("恭喜，通过新浪微博账号登录成功！", backurl);
                            }
                        }
                    }


                }

            }

        }

    }


</script>