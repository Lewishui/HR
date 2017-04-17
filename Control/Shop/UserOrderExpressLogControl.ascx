<%@ Control Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Shop.UserOrderExpressLogControl" Codebehind="UserOrderExpressLogControl.ascx.cs" %>
<%@ Import Namespace="Kesion.Cache"%>
<%@ Import Namespace="Kesion.Publics"%>
<%@ Import Namespace="Kesion.APPCode"%>
<%@ Import Namespace="System.Data"%>
<%@ Import Namespace="Kesion.BLL"%>

<div class="r_tybox nomar">
<table border="0" cellpadding="2" cellspacing="1" class="border" width="98%" align="center">
    <tr class="title1">
        <td>
          跟踪物流 订单号：<%=dr["orderid"].ToString() %>
           <%
           if (dr["DeliverStatus"].ToString().Equals("1"))
             {
                 StringBuilder dsb = new StringBuilder();
                 dsb.Append(@"<br/><strong><font color=""#ff6600"">该订单已发货，发货信息如下：</font></strong><br/>");
                 using (DataTable ddt = DataFactory.GetDataTable("Select Top 1 a.HandlerName,a.DeliverDate,ExpressNumber,b.CorpName From KS_ProLogDeliver A inner Join KS_ProDeliveryCorp b ON A.ExpressCorpId=B.CorpId Where a.DeliverType=1 And A.OrderID='" + dr["OrderID"].ToString() + "'"))
                 {
                     if (ddt.Rows.Count > 0)
                     {
                         DataRow dddr = ddt.Rows[0];
                         dsb.Append(@"发货日期：" + dddr["DeliverDate"].ToString() + "，物流公司：" + dddr["CorpName"].ToString() + @"，物流单号：<span style=""color:red"">" + dddr["ExpressNumber"].ToString() + "</span>，经手人：" + dddr["HandlerName"].ToString());
                     }

                 }

                 KSCMS.W(dsb.ToString());
             }     
           %>
        </td>
    </tr>
    
   
    <tr>
     <td class="splittd" style="padding-top:6px;">


         <%
            
             using (DataTable dt = DataFactory.GetDataTable("select top 1 CorpCode,ExpressNumber From KS_ProLogDeliver a inner join KS_ProDeliveryCorp  b on a.ExpressCorpId=b.CorpID Where a.orderid='" + dr["orderid"].ToString() + "' order by id desc"))
             {
                 if (dt.Rows.Count > 0)
                 {
                     DataRow drr = dt.Rows[0];
                     %>
                     <div style="padding-left:60px;height:40px;line-height:40px">
                     <input type="button" class="button" value="点此跳转到快递100网站查询" onclick="window.open('http://www.kuaidi100.com/chaxun?com=<%=drr["CorpCode"].ToString()%>&nu=<%=drr["ExpressNumber"].ToString()%>');"/>
                     </div>
                    <%
                 }
             }     
         %>

       <%=Kesion.APPCode.ExpressAPI.GetLogByOrderID(dr["orderid"].ToString()) %>

     </td>
    
    </tr>
        <tr>
     <td class="splittd" style="text-align:center;margin:20px;">
         <input type="button" class="button" id="backBtn" value="返回订单管理" onclick="history.back(-1);" />
     </td>
    </tr>

</table>



    </div>


