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
          �������� �����ţ�<%=dr["orderid"].ToString() %>
           <%
           if (dr["DeliverStatus"].ToString().Equals("1"))
             {
                 StringBuilder dsb = new StringBuilder();
                 dsb.Append(@"<br/><strong><font color=""#ff6600"">�ö����ѷ�����������Ϣ���£�</font></strong><br/>");
                 using (DataTable ddt = DataFactory.GetDataTable("Select Top 1 a.HandlerName,a.DeliverDate,ExpressNumber,b.CorpName From KS_ProLogDeliver A inner Join KS_ProDeliveryCorp b ON A.ExpressCorpId=B.CorpId Where a.DeliverType=1 And A.OrderID='" + dr["OrderID"].ToString() + "'"))
                 {
                     if (ddt.Rows.Count > 0)
                     {
                         DataRow dddr = ddt.Rows[0];
                         dsb.Append(@"�������ڣ�" + dddr["DeliverDate"].ToString() + "��������˾��" + dddr["CorpName"].ToString() + @"���������ţ�<span style=""color:red"">" + dddr["ExpressNumber"].ToString() + "</span>�������ˣ�" + dddr["HandlerName"].ToString());
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
                     <input type="button" class="button" value="�����ת�����100��վ��ѯ" onclick="window.open('http://www.kuaidi100.com/chaxun?com=<%=drr["CorpCode"].ToString()%>&nu=<%=drr["ExpressNumber"].ToString()%>');"/>
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
         <input type="button" class="button" id="backBtn" value="���ض�������" onclick="history.back(-1);" />
     </td>
    </tr>

</table>



    </div>


