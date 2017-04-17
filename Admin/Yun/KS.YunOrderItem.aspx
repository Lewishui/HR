<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin.Yun.KS_YunOrderItem" Codebehind="KS.YunOrderItem.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.BLL" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" runat="server">

<div id="manage_top" class="toptitle menu_top_fixed">
        <ul>
            
          <li id='p9'><a href="javascript:;" onclick="location.href='KS.YunOpenManage.aspx';"><strong><b></b>返回</strong></a></li> 
            <%-- <li id='p3'>
                    <asp:LinkButton ID="delclassbutton" runat="server" OnClientClick="return(GetIDS('del'));" OnClick="delclassbutton_Click" ><b></b>删除</asp:LinkButton></li>--%>
            
        </ul>
    </div>
    <div class="menu_top_fixed_height"></div> 
<div class="content-area">
  <div class="myTitle"><%=Yun.GetYunTypeName(Utils.StrToInt(YunType)) %></div>
 <asp:Panel ID="ListPannel" runat="server">
        <KS:KSGV ID="LogDeliveryView" cssclass="CTable" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="FieldID" GridLines="None"
            Width="99%" 
            EnableTheming="True"  EmptyDataText="没有找到任何下单记录!" 
           >
            <Columns>
                <%--<asp:TemplateField HeaderText="&lt;input type='checkbox' name='chkall' id='chkall' onClick='CheckAll(this.form);'/&gt;">
                    <ItemStyle HorizontalAlign="Center" Height="30px" Width="20px" />
                    <ItemTemplate>
                        <input type="checkbox" name="ids" id="ids" value="<%#Eval("itemid") %>"     <%# (Utils.StrToInt(Eval("status")))==0?" disabled":string.Empty %>  />
                    </ItemTemplate>
                </asp:TemplateField>--%>
                 <asp:TemplateField HeaderText="产品">
                  <itemstyle horizontalalign="Center" width="200px" />
                 <ItemTemplate>
                  <%#Eval("Title") %>
                    <%#Eval("yuntype").ToString ()!="2"||Eval("yuntype").ToString ()!="3"?"": Eval("status").ToString()=="2"?  DateTime.Now> Convert.ToDateTime(Eval("EffectiveDate").ToString())?"已过期":"" :"" %>


    
                 </ItemTemplate>  
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="下单时间">
                  <itemstyle horizontalalign="Center"  />
                 <ItemTemplate>
                 <%#Eval("adddate").ToString()%>
                 </ItemTemplate>  
                </asp:TemplateField>

                <asp:TemplateField HeaderText="订单价">
                  <itemstyle horizontalalign="Left"  />
                 <ItemTemplate>
              <%# Kesion.APPCode.Public.ReturnShopPrice(Convert.ToString(Eval("Price")))%>
                 </ItemTemplate>  
                </asp:TemplateField>
               
              
               <asp:TemplateField HeaderText="状态">
                  <itemstyle horizontalalign="Center"  />
                 <ItemTemplate>
              <%#Yun.YunOrderStatus(Utils.StrToInt(Eval("status").ToString()),Utils.StrToDateTime(Eval("OpenDate").ToString()),Utils.StrToDateTime(Eval("EffectiveDate").ToString()),Utils.StrToInt(Eval("YunType").ToString()))  %>



                 </ItemTemplate>  
                </asp:TemplateField>
                
                <asp:TemplateField HeaderText="操作">
                <itemstyle horizontalalign="Center" CssClass="link-operate" />
             <itemtemplate>

              <%#Eval("status").ToString()=="0"?"<a href=\""+Yun.GetServerUrl+"user/Shop/MyShowOrder.aspx?action=pay&id="+(Utils.StrToInt(Eval("ProOrderID")))+"&token="+Token+"&appid="+Appid+"\"  target=\"_blank\"><i class=\"iconfont icon\">&#xe645;</i>去支付</a>":"" %>

                <%#Eval("status").ToString()=="0"?"<a href=\"KS.YunOrderItem.aspx?action=del&VideoType="+Eval("VideoType").ToString()+"&yuntype="+Eval("yuntype").ToString()+"&ids="+Eval("itemid").ToString()+"\">删除</a>":"--"%>  
               </itemtemplate>
            </asp:TemplateField>
 
               
            </Columns>
            <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
        </KS:KSGV>
        <br />

        
          <KS:Page ID="Page1" runat="server" />
         <asp:Panel ID="Panel1" runat="server" Height="30px">
             

         <br />
        <script type="text/javascript">
            showtips('<span class="state"><strong>说明：</strong><br /></span>对未支付的订单，进行删除等操作!');
		</script>
		</asp:Panel>
		
     	</asp:Panel>
   </div>     
</asp:Content>
