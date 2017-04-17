namespace Kesion.NET.WebSite
{
    using System;
    using System.Data;
    using System.Web.UI;
    using System.Web.UI.WebControls;
    using System.Xml;
    using Kesion.BLL;
    using Kesion.Publics;
    using Kesion.Cache;
    using Kesion.XML;

    public partial class Admin_Label_PageStyle : System.Web.UI.Page
    {
        private XmlDocument xmldoc = null;
        private string FieldsXML = string.Empty;
        public  string templateName = string.Empty;
        public string TemplateDir = string.Empty;  //总模板目录
        public string _MainTemplatePath = string.Empty;
        public int templateId = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            KSSecurity.CheckPermissions();
            templateId = Utils.StrToInt(KSCMS.S("templateId"));
            if (templateId > 0)
            {
                Session["currTemplateId"] = templateId.ToString();
             
            }

            if (Session["currTemplateId"] != null)
            {
                int templateType = Utils.StrToInt(DataFactory.GetOnlyValue("select templateType From KS_Template Where TemplateID=" + Session["currTemplateId"].ToString()));
                switch (templateType)
                {
                    case 1:
                        TemplateDir = MyCache.GetCacheConfig(85); //手机模板总目录
                        break;
                    case 2:
                        TemplateDir = MyCache.GetCacheConfig(86); //机构模板总目录
                        break;
                    case 3:
                        TemplateDir = MyCache.GetCacheConfig(87); //个人空间模板
                        break;
                    default:
                        TemplateDir = MyCache.GetCacheConfig(84);  //所有模板的总目录
                        break;
                }
                if (string.IsNullOrEmpty(TemplateDir)) TemplateDir = "Template";

                using (DataTable dt = DataFactory.GetDataTable("select top 1 * From KS_Template Where TemplateId=" + Utils.StrToInt(Session["currTemplateId"].ToString())))
                {
                    if (dt.Rows.Count > 0)
                    {
                        _MainTemplatePath = KSCMS.GetInstallDir() + TemplateDir + "/" + dt.Rows[0]["templateEname"].ToString() + "/";
                        templateName = "当前风格：" + dt.Rows[0]["templateName"].ToString();

                    }
                }
            }
            else
            {
                JS.Alert("参数出错!");
            }


            xmldoc = new XmlDocument();
            xmldoc.Load(Server.MapPath(_MainTemplatePath + "config/pagestyle.config"));
            FieldsXML = XmlObject.XMLToString(ref xmldoc);

            if (KSCMS.S("action").Equals("Add"))
            {
                this.ListPannel.Visible = false;
                this.PanAdd.Visible = true;
            }
            else
            {

                if (!IsPostBack)
                {
                    initialList(1);

                }
            }
        }

        private void initialList(int PageIndex)
        {

            DataSet ds = XmlObject.StringToDataSet(FieldsXML);
            try
            {
                this.list.DataSource = ds.Tables[0];
            }
            catch { }
            this.list.DataKeyNames = new string[] { "name" };
            this.list.DataBind();
        }

        protected void List_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            GV.RowStyleSheet(ref e);
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                int isSys = Convert.ToInt16((e.Row.FindControl("HidIsSys") as HiddenField).Value);
                if (isSys == 1)
                {
                    e.Row.Cells[3].Text = "---";
   
                }

            }
        }

        protected void Foot1_Submit(object sender, EventArgs e)
        {
            for (int i = 0; i < this.list.Rows.Count; i++)
            {
                TextBox txtTitle = (TextBox)this.list.Rows[i].FindControl("TxtTitle");
                TextBox txtTp = (TextBox)this.list.Rows[i].FindControl("TxtTp");
                HiddenField hidName = (HiddenField)this.list.Rows[i].FindControl("HidName");

                XmlNode node = xmldoc.SelectSingleNode("//pagetemplate/item[@name='" + hidName.Value + "']");
                 if (node != null)
                 {
                     XmlElement xe = (XmlElement)node;
                     xe.SetAttribute("title", txtTitle.Text);
                     XmlNodeList xnl2 = xe.ChildNodes;//取出该子节点下面的所有元素
                     foreach (XmlNode xn2 in xnl2)
                     {
                         XmlElement xe2 = (XmlElement)xn2;//转换类型
                         if (xe2.Name == "tp")//判断是否是要查找的元素
                         {
                             xe2.InnerText = txtTp.Text;
                         }
                     }


                 }
               

            }
            xmldoc.Save(Server.MapPath(_MainTemplatePath + "config/pagestyle.config"));

           
            Page.ClientScript.RegisterStartupScript(this.GetType(), "", @"<script>jQuery(function(){KesionJS.Alert('恭喜，批量保存成功!',""location.href='"+KSCMS.GetComeUrl()+@"';"");});</script>");


        }

        protected void Foot2_Submit(object sender, EventArgs e)
        {
            string title = this.TxtTitle.Text;
            if (string.IsNullOrEmpty(title))
            {
                JS.AlertDoFun("请输入分页名称！", "history.back()");
            }
            else
            {
                //创建一个新节点
                XmlElement newElement = xmldoc.CreateElement("item");
               
                XmlNode root = xmldoc.SelectSingleNode("pagetemplate");
                XmlNodeList xnl = root.ChildNodes;
                int maxid = 0;
                foreach (XmlNode xnf in xnl)
                {
                    XmlElement xe = (XmlElement)xnf;
                    int id = Utils.StrToInt(xe.GetAttribute("name"));
                    if (id > maxid) maxid = id;
                }

                newElement.SetAttribute("name", (maxid + 1).ToString());
                newElement.SetAttribute("issys", "0");
                newElement.SetAttribute("title", title);

                //创建newElement下的节点
                XmlElement etp = xmldoc.CreateElement("tp");

                etp.InnerText = this.TxtTp.Text;

                //将newElement下的节点加到newElement上

                newElement.AppendChild(etp);


                //将newElement加入到xml文件中（加在最后一条记录上）
                xmldoc.DocumentElement.AppendChild(newElement);
                xmldoc.Save(Server.MapPath(_MainTemplatePath + "config/pagestyle.config"));


            }
            JS.Confirm("恭喜，分页样式添加成功，继续添加吗？", "location.href='"+KSCMS.GetInstallDir() + MyCache.GetCacheConfig(4) + "/label/KS.Label.PageStyle.aspx?action=Add&templateId="+templateId+"';", "location.href='" + KSCMS.GetInstallDir() + MyCache.GetCacheConfig(4) + "/label/KS.Label.PageStyle.Aspx?templateId=" + templateId + "';");

        }

        protected void list_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int id = Utils.StrToInt(e.CommandArgument.ToString());
            switch (e.CommandName.ToString())
            { 
                case "dodel":
                    doDelete(id.ToString());
                    break;
            }
        }


        private void doDelete(string Id)
        {

            XmlNode xmlNode = xmldoc.SelectSingleNode("//pagetemplate/item[@name=" + Id + "]");
            xmlNode.ParentNode.RemoveChild(xmlNode);



            xmldoc.Save(Server.MapPath(_MainTemplatePath + "config/pagestyle.config"));

            
            JS.AlertDoFun("恭喜，分页样式删除成功!", "location.href='" + KSCMS.GetComeUrl() + "';");
        }
        
        protected void list_RowCreated(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                ((LinkButton)(e.Row.FindControl("lkbDelete"))).Attributes["onclick"] = "return(confirm('确定删除该分页样式吗?'));";

            }

        }
}
}