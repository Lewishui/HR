<%@ Application Language="C#" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.BLL" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.APPCode" %>
<%@ Import Namespace="System.Threading" %>   
<%@ Import Namespace="System.IO" %>   
<%@ Import Namespace="System.Net" %>   
<%@ Import Namespace="System.Timers" %>   
<script RunAt="server">

    public static HttpContext myContext = HttpContext.Current;
    private void TimeEvent(object source, ElapsedEventArgs e)
    {
        #region 首页自动生成
        int autoCreaetIndexTime = Utils.StrToInt(MyCache.GetCacheConfig(44));
        if (autoCreaetIndexTime > 0)
        {
            string FsoIndex = MyCache.GetCacheConfig(14);
            if (FsoIndex.ToLower().IndexOf(".aspx") < 0)
            {
                DoTask("autorefreshhome", autoCreaetIndexTime);  //根据基本信息设置的时间隔生成首页
            }
        }
        #endregion

        #region 智能JS自动生成
        int autoCreeatJSTime = Utils.StrToInt(MyCache.GetCacheConfig(79));

        if (autoCreeatJSTime > 0)
        {
            DoTask("autocreatejs", autoCreeatJSTime);  //根据基本信息设置的时间隔生成智能JS
        }

        #endregion

       

    }


    private void InitialDataPerDay(object source, ElapsedEventArgs e)
    {
        #region 每天凌晨0点执行任务
        Public.InitialDataPerDay(e);
        #endregion
    }

    /// <summary>
    /// 执行定时任务
    /// </summary>
    /// <param name="action">任务名称</param>
    /// <param name="_minute">间隔时间，单位分钟</param>
    private void DoTask(string action,int _minute)
    {
        #region 执行任务
        if (myContext.Application["taskTime"+action]==null)
        {
            // Utils.WriteLog("11==" + DateTime.Now);
            BeginDoTask(action);
        }
        else if (Utils.IsDateTime(myContext.Application["taskTime"+action].ToString()))
        {
            //Utils.WriteLog("2222==" + DateTime.Now+"=="+myContext.Application["taskTime"+action].ToString());
            DateTime LastModified = Convert.ToDateTime(myContext.Application["taskTime"+action].ToString());
            TimeSpan ts = DateTime.Now - LastModified;
            if (ts.TotalMinutes >= _minute)
            {
                BeginDoTask(action);
            }
        }
        #endregion

    }
    private void BeginDoTask(string action)
    {
        #region 开始执行任务
        string _url = ServerUrl() + "/plus/autotask.aspx?action="+action+"&password=" + System.Configuration.ConfigurationManager.AppSettings["AutoTaskPassword"];
        //Utils.WriteLog(DateTime.Now.ToString()+"=="+GetHttpPage(_url));
        myContext.Application.Lock();
        myContext.Application["taskTime"+action] = DateTime.Now;
        myContext.Application.UnLock();
        #endregion
    }

    private string ServerUrl()
    {
        if (myContext.Request.Url.Port == 80)
            return "http://" + myContext.Request.Url.Host;
        else
            return "http://" + myContext.Request.Url.Host + ":" + myContext.Request.Url.Port;
    }
    private string GetHttpPage(string url)
    {
        string strResult = string.Empty;
        try
        {
            System.Net.WebClient MyWebClient = new System.Net.WebClient();
            MyWebClient.Credentials = System.Net.CredentialCache.DefaultCredentials;
            MyWebClient.Encoding = System.Text.Encoding.UTF8;
            strResult = MyWebClient.DownloadString(url);
        }
        catch (Exception)
        {
            strResult = "页面获取失败";
        }
        return strResult;
    }



    void Application_Start(object sender, EventArgs e)
    {
        System.Timers.Timer aTimer = new System.Timers.Timer();
        aTimer.Elapsed += new ElapsedEventHandler(TimeEvent);
        aTimer.Interval = 30000;// 设置引发时间的时间间隔　此处设置为30秒
        aTimer.Enabled = true;
        aTimer.AutoReset = true;


        if (MyCache.GetCacheConfig(71) == "1")  //启用0点清零任务
        {
            System.Timers.Timer Timer1 = new System.Timers.Timer();
            Timer1.Elapsed += new ElapsedEventHandler(InitialDataPerDay);
            Timer1.Interval = 1000;// 设置引发时间的时间间隔　此处设置为1秒
            Timer1.Enabled = true;
            Timer1.AutoReset = true;
        }

    }


    void Session_Start(object sender, EventArgs e)
    {
        #region 获取推广人信息
        string agent = KSCMS.S("agent");
        int UID = Utils.StrToInt(KSCMS.S("Uid"));
        if (string.IsNullOrEmpty(agent) && UID>0)
        {
            System.Web.HttpContext.Current.Session["agentuid"] = UID.ToString();
            agent = DataFactoryUser.GetOnlyValue("select top 1 UserName From KS_User Where UserID=" + UID);
        }
        if (!string.IsNullOrEmpty(agent))
        {
            System.Web.HttpContext.Current.Session["agent"] = agent;
        }
        #endregion

    }

    void Application_End(object sender, EventArgs e)
    {

        //Utils.WriteLog(DateTime.Now.ToString() + "==end");
        //下面的代码是关键，可解决IIS应用程序池自动回收的问题  
        Thread.Sleep(1000);
        //这里设置你的web地址，可以随便指向你的任意一个aspx页面甚至不存在的页面，目的是要激发Application_Start  
        GetHttpPage(MyCache.GetCacheConfig(5));
    }



    void Application_Error(object sender, EventArgs e)
    {
    }

    void Session_End(object sender, EventArgs e)
    {
        // 在会话结束时运行的代码。 
        // 注意：只有在 Web.config 文件中的 sessionstate 模式设置为 InProc 时，才会引发 Session_End 事件。
        // 如果会话模式设置为 StateServer 或 SQLServer，则不会引发该事件。
    }

    void Application_BeginRequest(object sender, EventArgs e)
    {
        //在接收到一个应用程序请求时触发。对于一个请求来说，它是第一个被触发的事件，请求一般是用户输入的一个页面请求（URL）。
    }


    void Application_EndRequest(object sender, EventArgs e)
    {
        //针对应用程序请求的最后一个事件。
    }
</script>
