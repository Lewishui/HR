<%@ Page Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_Form" Title="Untitled Page" Codebehind="Form.aspx.cs" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="Kesion.BLL" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.HtmlTags" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

    <div class="r_tybox nomar">
        <%
            int n = 0;
            StringBuilder sb = new StringBuilder();
            using(DataTable dt=DataFactory.GetDataTable("select * From KS_Form Where ShowOnUser=1 order by formid desc"))
            {
                if (dt.Rows.Count > 0)
                {

                    foreach (DataRow dr in dt.Rows)
                    {
                        if (formId == 0 && n==0)
                        {
                            Response.Redirect("form.aspx?formid="+ Utils.StrToInt(dr["formid"].ToString()));
                        }
                        sb.AppendLine(string.Format(@"<li{0}><a href=""?formid={1}"">{2}</a></li>",  (dr["formid"].ToString() == formId.ToString()) ? @" class=""puton""" : string.Empty, dr["formid"].ToString(), dr["subject"].ToString()));
                        n++;
                    }

                }
            }
          %>
        
    <%if (n == 0)
        { %>
         <table id="tablist" width="100%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
             <tr class="tdbg emptycss"><td>没有可供管理的表单数据哦！</td></tr>
         </table>
        <%
                Response.End();
       }
      else { %>
        <div class="tabs">	
              <ul>
                 <%=sb.ToString() %> 
              </ul>
        </div> 
    	<div class="clear"></div>
        <br />
    <%}
     %>

     <table id="tablist" width="100%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
     <%
         if (KSCMS.S("action") == "show")
         {
             using (DataTable dt = DataFactory.GetDataTable("select top 1 * From KS_FormRecord" + formId + " Where Username='" + new TemporaryVar().UserName + "' and recordid=" + Utils.StrToInt(KSCMS.S("recordid"))))
             {
                 if (dt.Rows.Count > 0)
                 {
                     DataRow drr = dt.Rows[0];
                     int IsPay = FormManage.GetFormSubjectInfo(formId).IsPay;
                     if (dtField != null)
                     {
                         foreach (DataRow dr in dtField.Rows)
                         {
                             string noShowColumn = "recordid,formid,replycontent,replyuser,replytime";
                             if (IsPay != 1)
                             {
                                 noShowColumn += ",ispay,paymoney,paytime";
                             }
                             if (isReply!=1)
                             {
                                 noShowColumn += ",isreply";
                             }
                             string colName = dr["COLUMN_NAME"].ToString();
                             if (Utils.InArray(colName.ToLower(),noShowColumn , ",") == false)
                             {
                                 #region  显示所有字段内容
                                 Response.Write(@"<tr class=""tdbg""><td style=""width:120px"" class=""lefttd"">" + getFieldTitle(dr["COLUMN_NAME"].ToString()) + "：</td>");
                                 Response.Write("<td>");
                                 string vv = drr[dr["COLUMN_NAME"].ToString()].ToString();
                                 switch (colName.ToLower())
                                 {

                                     case "ispay":
                                         if (vv == "1")
                                         {
                                             vv=("<div style='color:green'>已支付</div>");
                                         }
                                         else
                                         {
                                             vv=("<div style='color:red'>未支付</div>");
                                         }
                                         break;
                                     case "isreply":
                                         if (vv == "1")
                                         {
                                             vv=("<div style='color:green'>已回复</div>");
                                             vv += "回复人：" + drr["replyuser"].ToString();
                                             vv += "<br/>回复时间：" + drr["replytime"].ToString();
                                             vv += "<br/>回复内容：" + drr["replycontent"].ToString();
                                         }
                                         else
                                         {
                                             vv=("<div style='color:red'>未回复</div>");
                                         }
                                         break;
                                     case "paymoney":
                                         vv=("<div>" + Kesion.APPCode.Public.ReturnShopPrice(vv) + "</div>");
                                         break;
                                     case "status":
                                         if (vv == "0")
                                         {
                                             vv=("<div style='color:red'>待审核</div>");
                                         }
                                         else if (vv == "1")
                                         {
                                             vv=("<div style='color:green'>采纳</div>");
                                         }
                                         else
                                         {
                                             vv=("<div style='color:#999'>作废</div>");
                                         }
                                         break;
                                     case "paytime":
                                         if (string.IsNullOrEmpty(vv))
                                         {
                                             vv = "未支付";
                                         }
                                         break;
                                     default:
                                         break;
                                 }
                                 Response.Write(vv);
                                 Response.Write("</td>");
                                 Response.Write("</tr>");
                                 #endregion

                                 #region 支付平台接口
                                 if (IsPay==1 && dr["COLUMN_NAME"].ToString().ToLower()=="paymoney" && drr["ispay"].ToString()=="0")
                                 {
                                     Response.Write(@"<tr class=""tdbg""><td style=""width:120px"" class=""lefttd"">支付平台：</td>");
                                     Response.Write("<td>");
                                     Response.Write(@"<div class=""paylist"">");
                                     Response.Write(@" <ul>");
                                     StringBuilder sbp = new StringBuilder();
                                     using (DataTable dtp = CommonData.GetDataTable(4))
                                     {
                                         if (dtp.Rows.Count > 0)
                                         {
                                             foreach (DataRow drp in dtp.Rows)
                                             {
                                                 if (Utils.IsShowPayMentOnDevice(drp["showdevice"].ToString()))
                                                 {
                                                     sbp.AppendLine(string.Format(@"<li{2} payid=""{3}""><img src=""{0}"" title=""{1}"" alt=""{1}""/></li>", drp["logo"].ToString(), drp["platname"].ToString(), drp["isdefault"].ToString() == "1" ? @" class=""paycurr""" : string.Empty, drp["id"].ToString()));
                                                 }
                                             }
                                         }
                                     }
                                     Response.Write(sbp.ToString());
                                     Response.Write(@" </ul>");
                                     Response.Write(@"</div>");
                                     Response.Write("</td>");
                                     Response.Write("</tr>");

                                 }
                                 #endregion

                             }
                         }
                     }
                     %>
         <tr class="tdbg">
             <td></td>
         <td class="splittd" style="height:50px;border-bottom:0px;">
             <%if (IsPay == 1 && drr["ispay"].ToString()=="0")
                 { %>
             <input type="button" value="确认支付" class="button" onclick="return(doFormPay())" />
              <script>
                  $(document).ready(function(){
                      $(".paylist").find("li").click(function(){
                          $(".paylist").find("li").attr("style","");
                          $(".paylist").find("li").removeClass("paycurr");
                          $(this).addClass("paycurr");
                      });
                  });

                  function doFormPay() {
                      var pid = $(".paylist").find(".paycurr").attr("payid");
                      window.open('PayConfirm.aspx?from=form&formid=<%=formId%>&OrderId=<%=Utils.StrToInt(KSCMS.S("recordid"))%>&PlatID=' + pid);
                   }
               </script>
             <%} %>
             <input type="button" value=" 返 回 " class="button" onclick="history.back();" />
         </td>
     </tr>

            <%

                 }
             }
             
         }
         else {
     %>
      <tr class="title">
        	<td width="50" align="center">序号</td>
           <%
                  Response.Write(sbbTitle.ToString());
            %>
          <td align="center" width="70">操作</td>
        </tr>
         <%
                  Response.Write(sbb.ToString());
         %>
      <%} %>
    </table>
  

   <!--
   <div class="r_padbox nopadtop">
        <div class="clear"></div>
        <div class="cz_btn">
            <span><input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/>全选&nbsp;</span>
            <span><asp:Button ID="btnDelete" runat="server" CssClass="button" Text="取消选中的收藏" OnClick="btnDelete_Click" /></span>
         </div>
     	
        <div class="fy_box"><KS:Page ID="Page1" runat="server" /></div>

		</div>
	</div>
    -->

</asp:Content>