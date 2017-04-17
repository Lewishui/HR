<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserDetailControl.ascx.cs" Inherits="Kesion.NET.WebSite.User.UserDetail" %>
 <%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.BLL" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Xml" %>



<%
    if (KSCMS.S("from") == "listuserdetail")
    { %>
<div class="content-area">    
 <div class="tabs_header">
    <ul class="tabs">
        <li class='active'><a href="javascript:;" onclick="loadUserDetail(<%=Utils.StrToInt(KSCMS.S("userid")) %>,0)"><span>基本信息</span></a></li>
        <li><a href="javascript:;" onclick="loadUserDetail(<%=Utils.StrToInt(KSCMS.S("userid")) %>,3,1)"><span>订单记录</span></a></li>
        <li><a href="javascript:;" onclick="loadUserDetail(<%=Utils.StrToInt(KSCMS.S("userid")) %>,1,1)"><span>登录记录</span></a></li>
        <li><a href="javascript:;" onclick="loadUserDetail(<%=Utils.StrToInt(KSCMS.S("userid")) %>,2,1)"><span>手机绑定记录</span></a></li>
    </ul>
 </div>
<%} %>
<table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable nTable">
          <tr>
              <td align="right" class="lefttd" height="30" style="width: 84px"> <strong>用户名：</strong></td>
              <td class="righttd">   <%=drr["username"].ToString() %>
                  <%if (!string.IsNullOrEmpty(drr["agent"].ToString()))
                      { %>
                  &nbsp;&nbsp;推荐人：<%=drr["agent"].ToString() %><%} %><%if (BaseFun.CheckFieldExists("KS_User","unionid")) { %><%=!string.IsNullOrEmpty(drr["UnionID"].ToString())?"&nbsp;&nbsp;<strong>微信UnionID:</strong>"+drr["UnionID"].ToString():string.Empty %><%} %><%=!string.IsNullOrEmpty(drr["weixinopenID"].ToString())?"&nbsp;&nbsp;<strong>微信OpenID:</strong>"+drr["weixinopenID"].ToString():string.Empty %><%=!string.IsNullOrEmpty(drr["AppID"].ToString())?"&nbsp;&nbsp;<strong>微信AppID:</strong>"+drr["AppID"].ToString():string.Empty %></td>
          </tr>
          <tr>
              <td align="right" class="lefttd" height="30" style="width: 84px"> <strong>财务信息：</strong></td>
              <td class="righttd">  
                  <%if (KSCMS.S("from") == "listuserdetail")
                      { %>
                                    资金：<%=Kesion.APPCode.Public.ReturnShopPrice(Utils.StrToDecimal(drr["money"].ToString())) %></a> 元
                   <%if (MyCache.GetShopCommonConfig(98) == "1")
    { %> 
                      <%=MyCache.GetCacheConfig(49) %>：<%=Kesion.APPCode.Public.ReturnShopPrice(Utils.StrToDecimal(drr["point"].ToString())) %><%=MyCache.GetCacheConfig(50) %>
                  <%} %>
                  积分： <%=drr["score"].ToString() %> 分

                  <%}
    else
    { %>
                  资金：<a href='KS.LogMoney.aspx?username=<%=drr["UserName"].ToString() %>'><%=Kesion.APPCode.Public.ReturnShopPrice(Utils.StrToDecimal(drr["money"].ToString())) %></a></span>元
                   <%if (MyCache.GetShopCommonConfig(98) == "1")
    { %> 
                      <%=MyCache.GetCacheConfig(49) %>：<a href='KS.Consumer.aspx?username=<%=drr["username"].ToString() %>'><%=Kesion.APPCode.Public.ReturnShopPrice(Utils.StrToDecimal(drr["point"].ToString())) %></a><%=MyCache.GetCacheConfig(50) %>
                  <%} %>
                  积分： <a href='KS.LogScore.aspx?username=<%=drr["UserName"].ToString() %>' title="总积分<%=drr["Score"].ToString() %>分，已消费<%=drr["ScoreHasUse"].ToString() %>分，可用积分<%=Convert.ToInt32(drr["Score"].ToString()) - Convert.ToInt32(drr["ScoreHasUse"].ToString()) %>分"><span style="color:blue"><%=drr["score"].ToString() %></span> 分</a>
                  <%} %>
              </td>
          </tr>
          <tr style="display:none">
              <td align="right" class="lefttd" height="30" style="width: 84px"> <strong>真实姓名：</strong></td>
              <td class="righttd">   <%=drr["realname"].ToString() %> </td>
          </tr>
          <tr>
              <td align="right" class="lefttd" height="30" style="width: 84px"> <strong>电子邮件：</strong></td>
              <td class="righttd">  <%=drr["email"].ToString() %> </td>
          </tr>
          <tr>
              <td align="right" class="lefttd" height="30" style="width: 84px"> <strong>手机号码：</strong></td>
              <td class="righttd">  <%=drr["mobile"].ToString() %> </td>
          </tr>
         <%
             string FieldsXML = string.Empty;
             using (DataTable dt = DataFactoryUser.GetDataTable("select top 1 * From KS_UserConfig"))
             {
                 if (dt.Rows.Count > 0)
                 {
                     DataRow dr = dt.Rows[0];
                     FieldsXML = dr["userfield"].ToString();
                 }
                 else
                 {
                     JS.Alert("找不到会员配置表，请检查！");
                 }
             }

             XmlDocument xmldoc = new XmlDocument();
             xmldoc.LoadXml(FieldsXML);
             XmlNode xn = xmldoc.SelectSingleNode("UserField");
             string template = UserFormManage.GetFormTemplateByGroupID(Utils.StrToInt(drr["groupid"].ToString()));
             foreach (XmlNode xnf in xn.ChildNodes)
             {
                 XmlElement xe = (XmlElement)xnf;
                 string FieldID = xe.GetAttribute("Name");
                 if (template.IndexOf("[@" + FieldID + "]") != -1)
                 { %>
             <tr>
                  <td align="right" class="lefttd" height="30" style="width: 84px"> <strong><%=xe.GetElementsByTagName("FieldAlias").Item(0).InnerText %>：</strong></td>
                  <td class="righttd">  <%=drr[FieldID].ToString() %> </td>
              </tr>
             <%
                                                            }
                                                        }
           %>

     </table>
    <div class="main-button" style="text-align:center;">
         <%if (KSCMS.S("from") == "listuserdetail")
             { %>
        <input type="button" class="button" value=" 修 改 " onclick="location.href='KS.UserAdd.aspx?userid=<%=drr["userid"].ToString()%>&agentid=<%=DataFactoryUser.GetOnlyValue("select top 1 userid from KS_User Where username='"+drr["agent"].ToString()+"'")%>';" />
        <%}else { %>
         <input type="button" class="button" value=" 返 回 " onclick="history.back()" />
        <input type="button" class="button" value=" 打 印 " onclick="window.print()" />
        <input type="button" class="button" value=" 修 改 " onclick="location.href='KS.UserAdd.aspx?userid=<%=drr["userid"].ToString()%>';" />
        <%} %>
    </div>
 </div>   