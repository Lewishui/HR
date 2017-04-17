namespace Kesion.ICMS
{
    using System;
    using System.Web;
    using System.IO;
    using System.Data.SqlClient;
    using System.Text;

    using Kesion.Publics;
    using Kesion.BLL;
    using Kesion.Components;
    using Kesion.Config;
    using Kesion.Cache;

    public partial class InstallIndex : System.Web.UI.Page
    {

        private static string dbserver = string.Empty;
        private static string dbuser = string.Empty;
        private static string dbname = string.Empty;
        private static string dbpass = string.Empty;
        private static string connStr = string.Empty;
        public static string url = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            url = "http://" + Request.Url.Authority;
           
            if (FileExists(HttpContext.Current.Server.MapPath(KSCMS.GetInstallDir() + "install/install.lock")))
            {
                JS.AlertDoFun("安装程序已运行过了，如果要重新安装，请先删除install/install.lock文件！", "location.href='/';");
            }
            else
            {

                if (KSCMS.S("action") == "install")
                {
                    Response.Cache.SetCacheability(HttpCacheability.NoCache);  //禁止缓存
                    beginInstall();
                    KSCMS.Die();
                }
                else if (KSCMS.S("action") == "finish")
                {
                    BtnStep3Next_Click(null, null);

                }
            }
        }

        protected void BtnAgree_Click(object sender, EventArgs e)
        {
            this.Step1.Visible = false;
            this.Step2.Visible = true;
        }

        protected void BtnStep2Next_Click(object sender, EventArgs e)
        {
            this.Step1.Visible = false;
            this.Step2.Visible = false;
            this.Step3.Visible = true;

            #region 读conn.config的数据库配置信息
            this.TxtDBName.Text = GetConnParam("catalog=", ";");
            this.TxtDBService.Text = GetConnParam("source=", ";");
            this.TxtDBUser.Text = GetConnParam("user id=", ";");
            this.TxtDBPass.Text = GetConnParam("password=", ";");
            #endregion

        }
        private string GetConnParam(string start,string end)
        {
            string SqlConnStr = Kesion.Config.BaseConfigManage.GetConfig().SqlConnStr.ToLower();
            string str = Utils.CutHttpString(SqlConnStr, start, end, false);
            return str.Trim();
        }
        public static bool CheckFolderCanSave(string dir)
        {
            #region 检查文件夹可写
            string physicsPath = Utils.GetMapPath(dir);
            try {
				using (FileStream fs = new FileStream(physicsPath + "\\check.txt", FileMode.Create, FileAccess.ReadWrite, FileShare.ReadWrite)) {
				}

                System.IO.File.Delete(physicsPath + "\\check.txt");

				return true;
			}
			catch {
				return false;
			}


            #endregion

        }
        public static bool CheckFileCanSave(string file)
        {
            #region 检查文件可写
            string filename = file;
           try
            {
                string content = Kesion.HtmlTags.Function.ReadFile(file);
                StreamWriter sw = new StreamWriter(HttpContext.Current.Server.MapPath(filename), false, System.Text.Encoding.UTF8);
                sw.Write(content);
                sw.Close();
                return true;
            }
            catch
            {
              return false;
            }
            #endregion

        }

        /// <summary>
        /// 返回文件是否存在
        /// </summary>
        /// <param name="filename">文件名</param>
        /// <returns>是否存在</returns>
        public static bool FileExists(string filename)
        {
            return System.IO.File.Exists(filename);
        }


        /// <summary>
        /// 执行SQL语句
        /// </summary>
        /// <param name="connStr">数据库联接字符串</param>
        /// <param name="DatabaseName">数据库名称</param>
        /// <param name="Sql">Sql语句</param>
        public static void ExecuteSql(string connStr, string DatabaseName, string Sql)
        {
            #region 执行SQL语句
            if (!string.IsNullOrEmpty(Sql))
            {
                SqlConnection conn = new SqlConnection(connStr);
                SqlCommand cmd = new SqlCommand(Sql, conn);
                conn.Open();
                if (DatabaseName != "##")
                {
                    conn.ChangeDatabase(DatabaseName);
                }
                try
                {
                    cmd.ExecuteNonQuery();
                }
                finally
                {
                    conn.Close();
                }
            }
            #endregion
        }

        protected void BtnStep3Next_Click(object sender, EventArgs e)
        {
            this.Step1.Visible = false;
            this.Step2.Visible = false;
            this.Step3.Visible = false;
            this.Step4.Visible = true;
            this.TxtSiteUrl.Text = url;
            this.TxtInstallDir.Text = KSCMS.GetInstallDir();
           
        }

        private void beginInstall()
        {
            /*
            string dbname = this.TxtDBName.Text;
            string dbuser = this.TxtDBUser.Text;
            string dbpass = this.TxtDBPass.Text;
            string dbserver = this.TxtDBService.Text;
            */

            dbserver = KSCMS.S("dbserver");
            dbuser = KSCMS.S("dbuser");
            dbname = KSCMS.S("dbname");
            dbpass = KSCMS.S("dbpass");
            int fulldata = Utils.StrToInt(KSCMS.S("fulldata"));


            if (string.IsNullOrEmpty(dbname))
            {
                tips("请输入数据库名称！");
            }
            if (string.IsNullOrEmpty(dbserver))
            {
                tips("请输入服务器名称！");
            }

            string dbSqlPath = HttpContext.Current.Server.MapPath("~/install/DBStructure.sql");

            if (File.Exists(dbSqlPath))
            {
                connStr = string.Format("data source={0};user id={1};password={2};persist security info=false;", dbserver, dbuser, dbpass);

                try
                {
                    #region 创建数据库
                    ExecuteSql(connStr, "master", "IF Not EXISTS (select name from master.dbo.sysdatabases where name = N'" + dbname + "') CREATE DATABASE " + dbname + " COLLATE Chinese_PRC_CI_AS");
                    #endregion
                }
                catch (Exception ex)
                {
                    tips(ex.Message);
                }

                #region 运行创建表脚本

             doSql(connStr, dbname, dbSqlPath);  //创建结构

                if (fulldata == 1)   //完整体验包
                {
                    dbSqlPath = HttpContext.Current.Server.MapPath("~/install/fulldata.sql");  //导入初始数据
                }
                else
                {
                    dbSqlPath = HttpContext.Current.Server.MapPath("~/install/basedata.sql");  //导入初始数据

                }
               doSql(connStr, dbname, dbSqlPath);



                #endregion



               BaseConfigInfo __configinfo = BaseConfigManage.Deserialize(Server.MapPath(KSCMS.GetInstallDir()+"conn.config"));
               __configinfo.SqlConnStr = string.Format(@"Data Source={0};User ID={1};Password={2};Initial Catalog={3};Pooling=true;", dbserver, dbuser, dbpass, dbname);
               BaseConfigManage.Serialiaze(__configinfo, Server.MapPath(KSCMS.GetInstallDir() + "conn.config"));

              

                tips("success");

            }
            else
            {
                tips("数据库脚本文件不存在！");
            }
        }

        private void filterSQL(string dbSqlPath,string tempFile)
        {
            #region 运行SQL脚本
            using (StreamReader reader = new StreamReader(dbSqlPath, Encoding.UTF8))
            {
                StringBuilder builder = new StringBuilder();
               
                    while (!reader.EndOfStream)
                    {
                    //builder.Remove(0, builder.Length);

                    while (!reader.EndOfStream)
                    {
                        string str2 = reader.ReadLine();

                        if (!string.IsNullOrEmpty(str2) && (str2.ToUpper().Trim().Equals("GO") || str2.ToLower().Trim().IndexOf("total records") != -1))
                        {
                            //break;
                        }
                        else
                        {
                            builder.AppendLine(str2);
                        }
                    }
                        
                    }

                Kesion.HtmlTags.Function.SaveFile("/install/"+ tempFile, builder.ToString());



            }


            #endregion

        }

        /// <summary>
        /// 运行脚本
        /// </summary>
        /// <param name="connStr"></param>
        /// <param name="dbname"></param>
        /// <param name="dbSqlPath"></param>
        private void doSql(string connStr,string dbname,string dbSqlPath)
        {

            #region 运行SQL脚本
            string tempFile = "temp.sql";
            if (dbSqlPath.ToLower().IndexOf("dbstructure")== -1)   //不是SQL结构的话，过滤GO 等
            {
                filterSQL(dbSqlPath, tempFile);
                dbSqlPath = HttpContext.Current.Server.MapPath("~/install/" + tempFile);
            }

            using (StreamReader reader = new StreamReader(dbSqlPath, Encoding.UTF8))
            {
                StringBuilder builder = new StringBuilder();
                try
                {
                    while (!reader.EndOfStream)
                    {
                        builder.Remove(0, builder.Length);

                        while (!reader.EndOfStream)
                        {
                            string str2 = reader.ReadLine();

                            if (!string.IsNullOrEmpty(str2) && (str2.ToUpper().Trim().Equals("GO") || str2.ToLower().Trim().IndexOf("total records") !=-1))
                            {
                                break;
                            }
                            builder.AppendLine(str2);
                        }
                        if (!string.IsNullOrEmpty(builder.ToString()))
                        {
                            ExecuteSql(connStr, dbname, builder.ToString());
                        }

                    }
                }
                catch (Exception ex)
                {
                    tips(ex.Message);
                }

            }


                #endregion

        }

        private void tips(string str)
        {
           // JS.Alert(str.Replace("'","\'"));
            KSCMS.Die(str);
            KSCMS.Die();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string siteName = this.TxtSiteName.Text;
            string siteUrl = this.TxtSiteUrl.Text;
            string manageDir = this.TxtManageDir.Text;
            string manageCode = this.TxtManageCode.Text;
            string siteKey = this.TxtSiteKey.Text;
            string installDir = this.TxtInstallDir.Text;

            if (string.IsNullOrEmpty(siteName))
            {
                tips("请输入网站名称！");
            }
            if (string.IsNullOrEmpty(siteUrl))
            {
                tips("请输入网站网址！");
            }
            if (string.IsNullOrEmpty(installDir))
            {
                tips("请输入安装目录！");
            }
            if (this.RdbRZM.SelectedValue == "1")
            {
                if (string.IsNullOrEmpty(this.TxtManageCode.Text))
                {
                    tips("请输入后台管理认证码！");
                }
            }

            ConfigInfo __configinfo = ConfigManage.Deserialize(Server.MapPath(KSCMS.GetInstallDir() + "config/general.config"));
            __configinfo.SiteName = siteName;
            __configinfo.Domain = siteUrl;
            __configinfo.SiteKey = siteKey;
            __configinfo.AdminDir = manageDir;
            __configinfo.EnableSiteManageCode = Utils.StrToInt(this.RdbRZM.SelectedValue);
            __configinfo.SiteManageCode = manageCode;
            __configinfo.InstallDir = installDir;
            if (this.RdbYZM.SelectedValue == "1")
            {
                __configinfo.NeedVerifyCodePage = "login.aspx";
            }
            else
            {
                __configinfo.NeedVerifyCodePage = "";
            }
            ConfigManage.Serialiaze(__configinfo, Server.MapPath(KSCMS.GetInstallDir() + "config/general.config"));

            #region 更新缓存
            KSCache cache = KSCache.GetCacheService();
            cache.RemoveObject("/CMS/ConfigList");
            #endregion


            string sql = string.Empty;
            sql = "DELETE FROM KS_Admin";
            DataFactory.ExecuteNonQuery(sql);
            sql = "INSERT INTO KS_Admin(UserName,[password],[LoginTimes],[Locked],[SysAdmin],[UserType],[DocPower],[AddDate],[LastLoginTime],[LastLogoutTime]) values('" + this.TxtUserName.Text + "','" + Utils.MD5(this.TxtUserPass.Text, 16) + "',1,0,1,1,1,getdate(),getdate(),getdate())";
            DataFactory.ExecuteNonQuery(sql);


            this.Step4.Visible = false;
            this.Step5.Visible = true;
            Kesion.HtmlTags.Function.SaveFile(KSCMS.GetInstallDir() + "install/install.lock", "true");

        }

    }
}
