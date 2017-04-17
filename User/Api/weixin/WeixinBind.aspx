<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WeixinBind.aspx.cs" Inherits="Kesion.NET.WebSite.Api.WeiXin.WexXinBind" %>
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
        if (MyCache.GetAccountAPIConfig("weixin", "enable") != "true")
        {
            Utils.ShowError("对不起，本站没有开通微信登录!", "error.gif", 2, KSCMS.GetInstallDir());
        }
        if (Session["weixinopenid"] == null || Session["access_token"] == null)
        {
            Utils.ShowError("没有返回openid!", "error.gif", 2, KSCMS.GetInstallDir());
        }
        else
        {
            string action = KSCMS.S("action");
            if (action == "check")
            {
                Kesion.NET.WebSite.APPCode.Api.CommonCls.BindByWeixin();

            }else if (action=="doreg"){

                Kesion.NET.WebSite.APPCode.Api.CommonCls.DoRegSave(4);

            }else{
                string ApiID=MyCache.GetAccountAPIConfig("weixin","apiid");
                string ApiKey=MyCache.GetAccountAPIConfig("weixin","apikey");

                string token_url = "https://api.weixin.qq.com/sns/userinfo?access_token=" + Session["access_token"].ToString() + "&openid=" + Session["weixinopenid"].ToString();

                Uri url = new Uri(token_url);
                string result = CollectionCommon.GetHttpPage(url, "utf-8");
                //   KSCMS.Die(result);

                JObject jsonObj = JObject.Parse(result);
                if (result.IndexOf("errcode") != -1)
                {
                    JS.Alert("出错啦，出错原因：" + jsonObj["errmsg"].ToString());
                }
                else
                {
                    string nickname = Utils.FilterUserName(jsonObj["nickname"].ToString());
                    string sex = jsonObj["sex"].ToString();
                    if (sex == "1")
                    {
                        sex = "男";
                    }
                    else
                    {
                        sex = "女";
                    }
                    string face = jsonObj["headimgurl"].ToString();
                    string unionId = string.Empty;
                    if (jsonObj["unionid"] != null)
                    {
                        unionId = jsonObj["unionid"].ToString();
                        Session["unionid"] = unionId;
                    }
                    string param = string.Empty;
                    if (!string.IsNullOrEmpty(unionId))
                    {
                        param = " Where unionid='" + Utils.ChkSQL(unionId) + "'";
                    }
                    else
                    {
                        param = " Where weixinopenid='" + Utils.ChkSQL(Session["weixinopenid"].ToString()) + "'";
                    }
				
                    using (DataTable dt = DataFactoryUser.GetDataTable("select top 1 * From KS_User "+param))
                    {
                        if (dt.Rows.Count <= 0)
						{
							#region 微课堂绑定操作
							if (Session["optype"] != null && Session["optype"].ToString()!=string.Empty)//绑定的教师不在数据表中
							{
								//绑定教师
								if (Session["optype"].ToString() == "bindtc" || Session["optype"].ToString() == "bindsubtc")
								{
									string SavePath = face;
									if (face.ToLower().IndexOf("http") != -1)  //保存头像到本地
									{
										SavePath = MyCache.GetCacheConfig(0) + "UploadFiles/avatar/KS_User" + unionId + ".jpg";
										Kesion.HtmlTags.Function.CreateFolders(MyCache.GetCacheConfig(0) + "UploadFiles/avatar/");
										if (Kesion.APPCode.Public.SaveRemoteFile(face, SavePath).Equals(true))
										{
											bindtc(Session["weixinopenid"].ToString(), Session["unionid"].ToString(), nickname, 1);
										}
									}
							
									Kesion.NET.WebSite.APPCode.Api.CommonCls.DoBind(4, "使用微信快速登录!", nickname, SavePath, sex, Session["weixinopenid"].ToString());

								}
								else
								{
									JS.AlertClose("登录失败");
									return;
								}
							}
							#endregion

							if (CheckUserLogin.Check() == "success" && !string.IsNullOrEmpty(new TemporaryVar().UserName) && DataFactoryUser.Exists("KS_User", "username='" + Utils.ChkSQL(new TemporaryVar().UserName) + "'"))
                            {
                                DataFactoryUser.ExecuteNonQuery(string.Format(@"Update KS_User Set IsWeixinUnBind=0,weixinopenid='{0}',unionid='{1}' Where UserName='{2}'", Session["weixinopenid"].ToString(), unionId, (new TemporaryVar()).UserName));
                                Session["userinfo"] = null;

                                if (Utils.IsMobileDevice())
                                {
                                    Response.Redirect(string.Format(@"{0}/user/index.aspx", KSCMS.GetInstallDir() + MyCache.GetCacheConfig(73)));
                                    // JS.Alert("恭喜，通过微信账号登录成功！", string.Format(@"{0}/user/index.aspx", KSCMS.GetInstallDir() + MyCache.GetCacheConfig(73)));
                                }
                                else
                                {
                                    Response.Redirect(string.Format(@"{0}user/index.aspx", KSCMS.GetInstallDir()));
                                    // JS.Alert("恭喜，通过微信账号登录成功！", string.Format(@"{0}user/index.aspx", KSCMS.GetInstallDir()));
                                }

                            }
                            else
                            {

                                bool hasUserRecord = false;
                                if (!string.IsNullOrEmpty(unionId))
                                {
                                    if (DataFactoryUser.Exists("KS_User", "weixinopenid='" + Session["weixinopenid"].ToString() + "'") == true)
                                    {
                                        DataFactoryUser.ExecuteNonQuery("Update KS_User Set UnionID='" + unionId + "' WHERE WeixinOpenID='" + Session["weixinopenid"].ToString() + "'");
                                        hasUserRecord = true;
                                    }
                                }
                                if (hasUserRecord == false)
                                {
                                    Kesion.NET.WebSite.APPCode.Api.CommonCls.DoBind(4, "使用微信快速登录!", nickname, face, sex, Session["weixinopenid"].ToString());
                                }
                                else
                                {
                                    using (DataTable dti = DataFactoryUser.GetDataTable("select top 1 * From KS_User WHERE UnionID='"+unionId+"'"))
                                    {
                                        if (dti.Rows.Count > 0)
                                        {
                                            DataRow dr = dti.Rows[0];

                                            doLogin(dr);

                                        }
                                    }
                                }
                            }
                        }
                        else
                        {
                            DataRow dr = dt.Rows[0];
							
							if (Session["optype"] != null && Session["optype"].ToString()!=string.Empty)
							{
								if (Session["optype"].ToString() == "tclogin")
								{
								//	Utils.WriteLog("0");
									doLogin(dr);
									bindtc(Session["weixinopenid"].ToString(), Session["unionid"].ToString(), dr["username"].ToString(), 0);
								}
								else
								{
								//	Utils.WriteLog("2");
									bindtc(Session["weixinopenid"].ToString(), Session["unionid"].ToString(), dr["username"].ToString(), 0);
								}
							}
                            doLogin(dr);

                        }
                    }


                }

            }

        }

    }

    private void doLogin(DataRow dr)
    {
        Kesion.NET.WebSite.APPCode.Api.CommonCls.DoLogin(dr["username"].ToString(), dr["password"].ToString());
        if (Utils.IsMobileDevice())
        {
            Response.Redirect(string.Format(@"{0}/user/index.aspx", KSCMS.GetInstallDir() + MyCache.GetCacheConfig(73)));
            //JS.Alert("恭喜，通过微信账号登录成功！", string.Format(@"{0}/user/index.aspx", KSCMS.GetInstallDir() + MyCache.GetCacheConfig(73)));
        }
        else
        {
            string backurl = new TemporaryVar().ComeUrl;
            if (string.IsNullOrEmpty(backurl)) backurl = KSCMS.GetInstallDir() + "user/index.aspx";
            if (backurl.ToLower().IndexOf("login.aspx") != -1) backurl = KSCMS.GetInstallDir() + "user/index.aspx";
            if (backurl.ToLower().IndexOf("getpass.aspx") != -1) backurl = KSCMS.GetInstallDir() + "user/index.aspx";
            if (backurl.ToLower().IndexOf("activateuser.aspx") != -1) backurl = KSCMS.GetInstallDir() + "user/index.aspx";
            Response.Redirect(backurl);
            // JS.Alert("恭喜，通过微信账号登录成功！", backurl);
        }
    }
	public void bindtc(string openid, string unionid, string username, int type)//username绑定助教使用 type 区分是否要注册
	{
		#region 绑定教师

		string backurl = new TemporaryVar().ComeUrl;
		backurl = backurl.Replace("miniTcSet", "miniLivetc");
		if (backurl.IndexOf("enter") != -1)
		{
			backurl = backurl = "&enter=mini";
		}
		new TemporaryVar().ComeUrl = backurl;
		int ChineseUsername = Utils.StrToInt(MyCache.GetShopCommonConfig(70)); //允许含有中文用户名
		if (ChineseUsername == 0 && Utils.IsHasCN(username)) //不允许有中文时, 要做转换
		{
			username = UtilsPinyin.Convert(username).ToLower();
		}

		if (Session["optype"] != null && Session["courseid"] != null)
		{
			int courseid = Utils.StrToInt(Session["courseid"].ToString());

			if (courseid != 0)
			{
				if (Session["optype"].ToString() == "bindtc")//课程教师
				{
					DataFactory.ExecuteNonQuery("update KS_Course set openid='" + openid + "',unionid='" + unionid + "' where courseid='" + courseid + "'");
				}
				else if (Session["optype"].ToString() == "bindsubtc")//助教
				{
					DataFactory.ExecuteNonQuery("update KS_Course set teachername='" + username + "' where courseid=" + courseid + "");
				}
				else if (Session["optype"].ToString() == "tclogin")
				{
					string teachername = DataFactory.GetOnlyValue("select top 1 teachername from KS_Course where courseid=" + courseid + "");//不是助教
					if (teachername != username)
					{
						if (DataFactory.Exists("KS_Course", "(openid='" + openid + "' or unionid='" + unionid + "') and courseid=" + courseid + ""))
						{
							if (backurl.IndexOf("id=") == -1)
							{
								backurl += "&id=" + courseid;
							}
							Response.Redirect(backurl);
						}
						else
						{
							JS.AlertClose("登录失败");
						}
					}
					else
					{
						if (backurl.IndexOf("id=") == -1)
						{
							backurl += "&id=" + courseid;
						}
						//	backurl += "&id=" + courseid;
						Response.Redirect(backurl);
					}
				}
				//	KSCMS.Die(type.ToString());			
				if (type == 0)
				{
					Session["optype"] = null;
					Session["courseid"] = null;
					JS.Alert("绑定成功！", backurl);
				}
			}
			else
			{
				JS.Alert("操作失败！");
				return;
			}
		}
		#endregion
	}
</script>