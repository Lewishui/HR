<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin.Content.ShowBoxBill" Codebehind="ShowBoxBill.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.BLL" %>
<%@ Import Namespace="System.Data" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" runat="server">
 <%
     string action = KSCMS.S("action");
     switch (action)
     {
         case "collectbox":  
 %>
<div style='padding:3px'>带http://开头的远程图片地址,每行一张图片地址:<br/>
<textarea id='collecthttp' style='width:95%;height:150px' class='textbox'></textarea>
</div>
 <%
     break;
         case "selecttp":
            %>
            <br />
           <script>
               dialogType=1;
           </script>
            <div style='padding:3px'><strong>小图地址:</strong><input type='text' size='30' class='textbox' name='x1' id='x1'> <input type='button' onclick="SelectFiles('x1',<%=Utils.StrToInt(KSCMS.S("channelID"),0) %>);" value='选择小图' class='button'/>
            <br/><strong>大图地址:</strong><input type='text' class='textbox'  size='30' name='x2' id='x2'> <input type='button' onclick="SelectFiles('x2',<%=Utils.StrToInt(KSCMS.S("channelID"),0) %>);" value='选择大图' class='button'/>
            <br/><strong>简要介绍:</strong><input type='text' class='textbox'  size='30' name='x3' id='x3'></div>
            <%break; 
              case "order":
             %>
                 <div style="padding:2px;font-size:14px;line-height:25px;">
               <%
                  
                   int statusCode = Utils.StrToInt(KSCMS.S("statuscode"));
                   StringBuilder dsb = new StringBuilder();
                   //switch (statusCode)
                   //{
                   //case 3: //发货信息

                   //if (dr["DeliverStatus"].ToString().Equals("1")||dr["DeliverStatus"].ToString().Equals("2"))
                   {
                       dsb.Append(@"<strong><font color=""#ff6600"">该订单已发货，发货信息如下：</font></strong><br/>");
                       using (DataTable ddt = DataFactory.GetDataTable("Select Top 1 a.HandlerName,a.DeliverDate,ExpressNumber,b.CorpName From KS_ProLogDeliver A inner Join KS_ProDeliveryCorp b ON A.ExpressCorpId=B.CorpId Where a.DeliverType=1 And A.OrderID='" + dr["OrderID"].ToString() + "'"))
                       {
                           if (ddt.Rows.Count > 0)
                           {
                               DataRow dddr = ddt.Rows[0];
                               dsb.Append(@"发货日期：" + dddr["DeliverDate"].ToString() + "，物流公司：" + dddr["CorpName"].ToString() + @"，物流单号：<span style=""color:red"">" + dddr["ExpressNumber"].ToString() + "</span>，经手人：" + dddr["HandlerName"].ToString());
                           }

                       }

                       KSCMS.W(dsb.ToString());
                                    %>
                                  <div>
                                   <strong>快递查询: </strong><br />
                                  <%
                                      string detail = Kesion.APPCode.ExpressAPI.GetLogByOrderID(dr["orderid"].ToString());
                                      Response.Write(detail);
                                     %>
                                  </div>
                                    <%
                                        }
                                        break;

                                        //          }

                                        //break;
            %></div>
<%
     } %>
</asp:Content>