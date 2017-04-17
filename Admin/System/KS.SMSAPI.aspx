<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_SMSAPI" Title="Untitled Page" Codebehind="KS.SMSAPI.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="Kesion.BLL" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="listPanel" runat="server" Width="100%">
       <KS:TopNav ID="TopNav2" runat="server" Text="短信接口API配置" />
<div class="content-area">
<div class="tab-page" id="SMSPanel">
         <script type="text/javascript">
             var tabPane1 = new WebFXTabPane(document.getElementById("SMSPanel"), 1)
         </script>
             
		 <div class="tab-page" id="tab0">
		  <h2 class="tab">基本参数</h2>
			<script type="text/javascript">
			    tabPane1.addTabPage(document.getElementById("tab0"));
			</script>


       <script>
           jQuery(window).load(function() {
           //setTimeout("getblance();", 1000)

           });
           function getblance() {
               jQuery("input[name=itemid]").each(function() {
                   var id = jQuery(this).val();
                   dogetbalance(id);
               });
           }
           function dogetbalance(id) {
               jQuery("#mybalance" + id).html("<img src='../../admin/images/loading.gif' />查询中...");
               jQuery.get("KS.SMSAPI.aspx", { action: "balance", itemid: id }, function(val) {
                   jQuery("#mybalance" + id).html("余额："+val);
               });
           }
       
       </script> 
        

             <%if (DataFactory.Exists("KS_YunManage", " YunType=2  and VideoType=11 and status=2")||Utils.IsBuyYunServer("yunsms") == "1")
               { %>
       <table width="99%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
            <tr>
               <td class="lefttd" align="right" style="width:98px"><b>短信接口总开关：</b></td>
               <td class="righttd">
                    <asp:RadioButtonList ID="RdbEnableSMS" runat="server"  RepeatLayout="Flow" 
                           RepeatDirection="Horizontal">
                       <asp:ListItem Value="0">关闭</asp:ListItem>
                       <asp:ListItem Value="1">开启</asp:ListItem>
                      </asp:RadioButtonList>
                  </td>
             </tr>


        </table>
     <%} %>
 
      <%if (Utils.IsBuyYunServer("yunsms") == "1")
         { %>
        <KS:KSGV ID="list" cssclass="CTable" runat="server" Width="100%" AutoGenerateColumns="False" EmptyDataText="暂无账号通API!" GridLines="None" OnRowDataBound="list_RowDataBound" PagerType="CustomNumeric">
            <Columns>
             <asp:BoundField HeaderText="ID" DataField="ID">
                    <ItemStyle HorizontalAlign="Center" Width="40px" />
                </asp:BoundField>
            <asp:TemplateField HeaderText="默认">
                <ItemStyle HorizontalAlign="Center" />
                <ItemTemplate>
              <asp:HiddenField ID="HidDefault" Value='<%# Eval("default") %>' runat="server" />
                 
                 <asp:RadioButton ID="RdbDefault" oncheckedchanged="RadioButton1_CheckedChanged" AutoPostBack="true" runat="server" />
                 </ItemTemplate>
            </asp:TemplateField>  
                
                
            <asp:TemplateField HeaderText="接口名称">
                <ItemStyle HorizontalAlign="Left" />
                <ItemTemplate>
                  <%#Eval("name") %>
                  <input type="hidden" name="itemid" value="<%# Eval("id") %>" />
                  <div style='color:#999'>
                      <input type="button" class="button" value="余额" onclick="dogetbalance(<%# Eval("id") %>);"/>
                      <span id="mybalance<%# Eval("id") %>"></span></div>
                 </ItemTemplate>
            </asp:TemplateField>  
            <asp:TemplateField HeaderText="用户名">
                <ItemStyle HorizontalAlign="Center" />
                <ItemTemplate>
                  <asp:TextBox CssClass="textbox" Width="60px" ID="TxtApiID" Text='<%#Eval("ApiID") %>' runat="server"></asp:TextBox>
                 </ItemTemplate>
            </asp:TemplateField>  
            <asp:TemplateField HeaderText="密码（KEY）">
                <ItemStyle HorizontalAlign="Center" />
                <ItemTemplate>
                  <asp:TextBox CssClass="textbox"  Width="100px" TextMode="SingleLine"  ID="TxtApiKey" Value='<%#Eval("ApiKey") %>' runat="server"></asp:TextBox>
                 </ItemTemplate>
            </asp:TemplateField>  
            <asp:TemplateField HeaderText="发送接口URL">
                <ItemStyle HorizontalAlign="Center" />
                <ItemTemplate>
                  <asp:TextBox CssClass="textbox" Width="130px" ID="TxtApiPostUrl" Text='<%#Eval("apiposturl") %>' runat="server"></asp:TextBox>
                 </ItemTemplate>
            </asp:TemplateField>  
            <asp:TemplateField HeaderText="发送参数">
                <ItemStyle HorizontalAlign="Center" />
                <ItemTemplate>
                  <asp:TextBox CssClass="textbox" Width="140px" ID="TxtApiPostParam" Text='<%#Eval("apipostparam") %>' runat="server"></asp:TextBox>
                 </ItemTemplate>
            </asp:TemplateField>  
            <asp:TemplateField HeaderText="成功标志">
                <ItemStyle HorizontalAlign="Center" />
                <ItemTemplate>
                  <asp:TextBox CssClass="textbox" Width="120px" ID="TxtSuccessTag" Text='<%#Eval("successtag") %>' runat="server"></asp:TextBox>
                 </ItemTemplate>
            </asp:TemplateField>  
                
           <asp:TemplateField HeaderText="申请">
                       <itemstyle horizontalalign="Center" width="25"/>
                        <itemtemplate>
                           <a class="apply" href="<%# Eval("ApplyUrl") %>" title="申请" target="_blank"></a>
                        </itemtemplate>
             </asp:TemplateField>
       


            </Columns>
           
            <PagerStyle CssClass="Page" HorizontalAlign="Right" />
            <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
            
      </KS:KSGV>
  <%}
         else if (Utils.IsBuyYunServer("yunsms") == "2")
         {%>

           
             <%  
          StringBuilder sb = new StringBuilder();
          using (DataTable dt = DataFactory.GetDataTable("select top 1 * from KS_YunManage where YunType=2  "))
         {
             if (dt.Rows.Count > 0)
             {
                 DataRow dr = dt.Rows[0];
                 string id = "1";
                 string orderid = dr["OrderID"].ToString();
                 int yunId = Utils.StrToInt(dr["YunID"].ToString());
                 int status = Utils.StrToInt(dr["status"].ToString());
                 string title = dr["title"].ToString();
                 string classname = dr["ClassName"].ToString();
                 int videoType = Utils.StrToInt(dr["VideoType"].ToString());
                 if (videoType == 11)
                 {
                     id = "1";//掌翼信使
                 }
                 else if (videoType == 12)
                 {
                     id = "2";//企信通
                 }
                 int yunsms = Utils.StrToInt(dr["CapacityNum"].ToString()) - Utils.StrToInt(dr["AlreadyMsg"].ToString());
                 if (status == 0)
                 {
                     sb.Append("订单详情：系列：" + classname + ",云短信：" + title + ",状态：未支付,<a href=\"../yun/KS.YunOpenManage.aspx?action=delete&yunid=" + yunId + "&orderid=" + orderid + "\">删除订单</a>。");


                 }
                 else if (status == 1)//已付
                 {
                     sb.Append("订单详情：系列：" + classname + ",云短信：" + title + "，状态：已付款，未开通。</font>");

                 }
                 else
                 {
                     //已过期

                     sb.Append("我的套餐情况：系列：" + classname + ",云短信：" + title + "。用户名：" + dr["UserName"].ToString() + ",密码：" + dr["PassWord"].ToString() + "，短信余额：" + SMSAPI.GetBalance(id));

                 }
                 
             }
             else
             {
                 sb.AppendLine("您目前还没购买云短信呢，我要去 <a href=\"" + Yun.GetServerUrl + "/mall/classid-1325.aspx\" target=\"blank\" class=\"button\">购买</a>");

             }
             
         }
        
        
           %>     
<%=sb.ToString() %>
            <%} %>
  
    
             
             <%if (DataFactory.Exists("KS_YunManage", " YunType=2  and VideoType=11 and status=2")||Utils.IsBuyYunServer("yunsms") == "1")
               { %>
     <asp:Panel ID="Panel1" runat="server" Height="30px" CssClass="main-button">
            &nbsp;&nbsp;<asp:Button ID="Button1" CssClass="button" runat="server" Text="批量保存短信接口API配置" 
                onclick="Button1_Click" />&nbsp;</asp:Panel>
        <%} %>
     
        <br />
             
        <script type="text/javascript">
              <%if (Utils.IsBuyYunServer("yunsms") == "1")
         { %>
            showtips('<span class="state"><strong>说明：</strong><br /></span>1、上面接口的用户名及密码(Key)需要到第三方网站申请后填入方可使用。<br/>2、发送参数的标签说明：{$user}用户名 {$pass}密码Key {$mobile}接收的手机号 {$content}发送的内容');
            <%}else 
              {%>
            showtips('<span class="state"><strong>说明：</strong><br /></span>如果这边还是没有数据的话，请在<a href=../Yun/KS.YunOpenManage.aspx>点此</a>进入申请成为开发者，并购买KESION云短信包。云服务的菜单的我的云服务的从KesionYun同步到本地订单的按钮');
                    
                    
                    
                    
                    
                    
                    
              
  
            <%}  %>
        </script>
	
	  </div>
    </div>
         
		 <div class="tab-page" id="tab1">
		  <h2 class="tab">启用模块配置</h2>
			<script type="text/javascript">
			    tabPane1.addTabPage(document.getElementById("tab1"));
			</script>
             
             
       <table width="99%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
            <tr>
               <td class="lefttd" align="right" style="width:120px"><b>发送验证间隔时间：</b></td>
               <td class="righttd">
                  <asp:TextBox ID="TxtSendSMSInterval" runat="server" CssClass="textbox" style="width:40px;text-align:center"/>秒
                      <span class="tips">一般设置60秒为宜。</span>
                      <strong>短信签名：<asp:TextBox ID="TxtSendSmsSign" Width="100" runat="server" CssClass="textbox"></asp:TextBox></strong> 
                      <span class="tips">短信接口商如果要求签名，请在些输入，如：【KESION】</span>
                  </td>
             </tr>


        </table>
       
             
             
           <KS:KSGV ID="modellist" OnRowDataBound="modellist_RowDataBound" runat="server" Width="99%" CssClass="CTable" AutoGenerateColumns="False" EmptyDataText="暂无账号通API!" GridLines="None" PagerType="CustomNumeric">
            <Columns>
             <asp:BoundField HeaderText="ID" DataField="ID">
                    <ItemStyle HorizontalAlign="Center" Width="40px" />
                </asp:BoundField>
            <asp:TemplateField HeaderText="是否启用">
                <ItemStyle HorizontalAlign="Center" Width="60px"  />
                <ItemTemplate>
                 <asp:HiddenField ID="HidEnable" Value='<%# Eval("enable") %>' runat="server" />
                 <asp:CheckBox ID="CkbEnable" runat="server" />
                 </ItemTemplate>
            </asp:TemplateField>  
                
                
            <asp:TemplateField HeaderText="模块名称">
                <ItemStyle HorizontalAlign="Left" Width="250px"/>
                <ItemTemplate>
               <strong><%#Eval("name") %></strong>
               <div style="color:#888"><strong>标签：</strong><%# Eval("tag") %>
               </div>
                 </ItemTemplate>
            </asp:TemplateField>  
 
            <asp:TemplateField HeaderText="短信内容">
                <ItemStyle HorizontalAlign="Center" />
                <ItemTemplate>
                  <asp:TextBox CssClass="textbox" TextMode="MultiLine" Width="420px" height="40px" ID="TxtContent" Text='<%#Eval("content") %>' runat="server"></asp:TextBox>
                 </ItemTemplate>
            </asp:TemplateField>  
                <asp:TemplateField HeaderText="每天最多发送数量">
                <ItemStyle HorizontalAlign="Center" Width="60px"  />
                <ItemTemplate>
                  <asp:TextBox CssClass="textbox" style="text-align:center" Width="50px" ID="TxtDayPostMax" Text='<%#Eval("daypostmax") %>' runat="server"></asp:TextBox>
                 条
                 </ItemTemplate>
            </asp:TemplateField>   
            
            </Columns>
           
            <PagerStyle CssClass="Page" HorizontalAlign="Right" />
            <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
      </KS:KSGV>
             
             <asp:Panel ID="Panel2" runat="server" Height="30px" CssClass="main-button">
            &nbsp;&nbsp;<asp:Button ID="Button2" CssClass="button" runat="server" Text="批量保存配置" 
                onclick="Button2_Click" />&nbsp;</asp:Panel>
                  
        
        <div class="message">
         <span class="state"><strong>说明：</strong><br /></span>
         1、大部分接口要求内容加签名才能发送成功。签名格式如：【KESION】 <br />2、短信字数都有严格限制，一般不能超过70个字符。

        </div>
        
     </div>	
    </asp:Panel>
    
 </div>  
 
</asp:Content>

