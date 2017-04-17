<%@ Page Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_ApiBind" Title="Untitled Page" Codebehind="ApiBind.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.Components" %>
<%@ Import Namespace="Kesion.XML" %>
<%@ Import Namespace="Kesion.BLL" %>
<%@ Import Namespace="System.Xml" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Text" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
	<div class="r_tybox nomar">
         <div class="r_title"><h4>�˺�ͨ����</h4></div>

        <div class="tips">
        	�󶨵�������վ�˺ź󣬾Ϳ���ʹ��������վ���ʺŵ�¼��
        </div>

    <div class="r_padbox nopadtop">        
    <asp:Repeater ID="list" runat="server">
    <HeaderTemplate>
     <table id="tablist" width="100%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
      <tr class="title">
        	<td width="50" align="center">���</td>
        	<td width="150" align="center"> ��������վ</td>
            <td align="center"> ��״̬ </td>
        </tr>
    </HeaderTemplate>
    <ItemTemplate>
      <tr class="tdbg">
          <td height="70" class="splittd" align="center">
           <%# Container.ItemIndex + 1%>��
          </td>
          <td class="splittd" align="center"><img src="../../sysimg/default/<%# Eval("id") %>.png" /></td>
          <td class="zhttd">
         
          <%#GetBindStatus(Convert.ToString(Eval("id")))%>
          </td>

       
      </tr>  

     </ItemTemplate>
     <FooterTemplate>
     <tr class="tdbg" style="display:<%# bool.Parse((list.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="10" >
                  ��վû�п�ͨ�κ��˺�ͨ�ӿڣ�
                </td>
           </tr> 
    </table>
    
    </div>
     </div>
     </FooterTemplate>
    </asp:Repeater>
    
    
<script>    document.getElementById('locationid').innerHTML = '�˺�ͨ������';</script>
</asp:Content>

<script runat="server" type="text/C#">
    private string FieldsXML = string.Empty;
    public static UserInfo __info = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Page.Title = BaseFun.GetUserPageTitle("�˺�ͨ������");


        CheckUserLogin.Run();

        __info = UserManage.GetUserInfo();

        if (KSCMS.S("action").Equals("delbind"))
        {
            doDelBind();
        }
        if (!IsPostBack)
        {
            initialList();
        }
    }
    private void doDelBind()
    {
        string id = KSCMS.S("id");
        if (string.IsNullOrEmpty(id))
        {
            JS.Alert("������!", "ApiBind.aspx");
        }
        id = id.ToLower();
        switch (id)
        {
            case "qq":
                DataFactoryUser.ExecuteNonQuery("UPDATE KS_User Set QQOpenID='',QQToken='' Where UserName='" + (new TemporaryVar()).UserName + "'");
                break;
            case "weixin":
                DataFactoryUser.ExecuteNonQuery("UPDATE KS_User Set WeixinOpenID='' Where UserName='" + (new TemporaryVar()).UserName + "'");
                break;
            case "sina":
                DataFactoryUser.ExecuteNonQuery("UPDATE KS_User Set SinaID='',SinaToken='' Where UserName='" + (new TemporaryVar()).UserName + "'");
                break;
            case "alipay":
                DataFactoryUser.ExecuteNonQuery("UPDATE KS_User Set AlipayID='' Where UserName='" + (new TemporaryVar()).UserName + "'");
                break;

        }
        Session["userinfo"] = null;
        JS.Alert("��ϲ������󶨳ɹ�!", "Basic/ApiBind.aspx");

    }
    private void initialList()
    {

        XmlDocument xmldoc = new XmlDocument();
        xmldoc.Load(Server.MapPath(KSCMS.GetInstallDir() + "config/AccountAPI.config"));
        FieldsXML = XmlObject.XMLToString(ref xmldoc);



        DataSet ds = XmlObject.StringToDataSet(FieldsXML);
        DataTable dt = ds.Tables[0];
        DataView dv = dt.DefaultView;
        dv.RowFilter = "enable='true'"; //����û�����õĽӿ�
        dt = dv.ToTable();
        this.list.DataSource = dt;
        this.list.DataBind();

    }

    public static string GetBindStatus(string id)
    {
        StringBuilder sb = new StringBuilder();

        switch (id.ToLower())
        {
            case "qq":
                if (!string.IsNullOrEmpty(__info.QQOpenID))
                {
                    sb.AppendFormat(@"<span title='qq��¼�Ѱ�'><img src='../../sysimg/default/icon_qq.png' align='absmiddle' alt='qq��¼�Ѱ�'/>QQ��¼�Ѱ�</span>,<a href='?action=delbind&id=qq' style='color:#ff6600;text-decoration:underline'>�����</a>&nbsp;&nbsp;");
                }
                else
                {
                    sb.AppendFormat(@"<span title='qq��¼δ��'><img src='../../sysimg/default/icon_qq_no.png' align='absmiddle' alt='qq��¼δ��'/>QQ��¼δ��</span>,<a  href='{0}' target=""_blank"" style='color:green;font-weight:bold;text-decoration:underline'>������</a>&nbsp;&nbsp;", Kesion.BLL.BaseFun.GetRewriteUrl("qqlogin"));
                }
                break;
            case "weixin":
                if (!string.IsNullOrEmpty(__info.WeiXinOpenID))
                {
                    sb.AppendFormat(@"<span title='΢�ŵ�¼�Ѱ�'><img src='../../sysimg/default/icon_weixin.png' align='absmiddle' alt='΢�ŵ�¼�Ѱ�'/>΢�ŵ�¼�Ѱ�</span>,<a href='?action=delbind&id=weixin' style='color:#ff6600;text-decoration:underline'>�����</a>&nbsp;&nbsp;");
                }
                else
                {
                    sb.AppendFormat(@"<span title='΢�ŵ�¼δ��'><img src='../../sysimg/default/icon_weixin_no.png' align='absmiddle' alt='΢�ŵ�¼δ��'/>΢�ŵ�¼δ��</span>,<a  href='{0}' target=""_blank"" style='color:green;font-weight:bold;text-decoration:underline'>������</a>&nbsp;&nbsp;", Kesion.BLL.BaseFun.GetRewriteUrl("weixinlogin"));
                }
                break;
            case "sina":
                if (!string.IsNullOrEmpty(__info.SinaID))
                {
                    sb.AppendFormat(@"<span title='����΢����¼�Ѱ�'><img src='../../sysimg/default/icon_sina.png' align='absmiddle' alt='����΢����¼�Ѱ�'/>����΢����¼�Ѱ�</span>,<a href='?action=delbind&id=sina' style='color:#ff6600;text-decoration:underline'>�����</a>&nbsp;&nbsp;");
                }
                else
                {
                    sb.AppendFormat(@"<span title='����΢����¼δ��'><img src='../../sysimg/default/icon_sina_no.png' align='absmiddle' alt='����΢����¼δ��'/>����΢����¼δ��</span>,<a href='{0}' target=""_blank"" style='color:green;font-weight:bold;text-decoration:underline'>������</a>&nbsp;&nbsp;",Kesion.BLL.BaseFun.GetRewriteUrl("sinalogin"));
                }
                break;
            case "alipay":
                if (!string.IsNullOrEmpty(__info.AlipayID))
                {
                    sb.AppendFormat(@"<span title='֧������ݵ�¼�Ѱ�'><img src='../../sysimg/default/icon_alipay.png' align='absmiddle' alt='֧������ݵ�¼�Ѱ�'/>֧������ݵ�¼�Ѱ�</span>,<a href='?action=delbind&id=alipay' style='color:#ff6600;text-decoration:underline'>�����</a>&nbsp;&nbsp;");
                }
                else
                {
                    sb.AppendFormat(@"<span title='֧������ݵ�¼δ��'><img src='../../sysimg/default/icon_alipay_no.png' align='absmiddle' alt='֧������ݵ�¼δ��'/>֧������ݵ�¼δ��</span>,<a href='{0}' target=""_blank"" style='color:green;font-weight:bold;text-decoration:underline'>������</a>&nbsp;&nbsp;",Kesion.BLL.BaseFun.GetRewriteUrl("alipaylogin"));
                }
                break;
        }
        return sb.ToString();
    }
</script>