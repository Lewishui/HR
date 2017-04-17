<%@ Control Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Shop.OrderServiceControl" Codebehind="OrderServiceControl.ascx.cs" %>
<%@ Import Namespace="Kesion.Cache"%>
<%@ Import Namespace="Kesion.BLL"%>
<%@ Import Namespace="Kesion.Publics"%>
<style>
	 @media print {     
            .noprint{display: none; }     
    }    
</style>
<script>
    function checkForm() {
        if ($("#<%=this.TxtContent.ClientID%>").val() == '') {
            KesionJS.Alert("请输入服务内容!", '$("#<%=this.TxtContent.ClientID%>").focus()');
            return false;
        }
        if ($("#<%=this.TxtUserName.ClientID%>").val() == '') {
            KesionJS.Alert("请输入服务人员!", '$("#<%=this.TxtUserName.ClientID%>").focus()');
            return false;
        }
        if ($("#<%=this.TxtAddDate.ClientID%>").val() == '') {
            KesionJS.Alert("请选择服务时间!", '$("#<%=this.TxtAddDate.ClientID%>").focus()');
            return false;
        }
        if ($("#<%=this.TxtQSR.ClientID%>").val() == '') {
            KesionJS.Alert("请输入签收人!", '$("#<%=this.TxtQSR.ClientID%>").focus()');
            return false;
        }
    }
</script>
<table class="CTable noprint" style="margin-top:5px" height="100%" cellSpacing=1 cellPadding=2 width="99%"  border=0>
	<tr style="background:#f1f1f1;height:23px;text-align:center">
			      <td>次数</td>
				  <td>服务内容</td>
				  <td>服务员</td>
				  <td>时间</td>
				  <td>签收人</td>
				  <td>操作</td>
	 </tr>
     <tr>
         <td class="splittd">第<%=Utils.StrToInt(DataFactory.GetOnlyValue("select count(1) From KS_ProOrderService Where OrderID='"+orderId+"'"))+1 %>次</td>
         <td class="splittd"><asp:TextBox ID="TxtContent" TextMode="MultiLine" CssClass="textbox textarea" runat="server" Height="50" Width="350"></asp:TextBox></td>
         <td class="splittd"><asp:TextBox ID="TxtUserName" CssClass="textbox" runat="server" Width="100"></asp:TextBox></td>
         <td class="splittd"><asp:TextBox ID="TxtAddDate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" CssClass="textbox" runat="server" Width="100"></asp:TextBox></td>
         <td class="splittd"><asp:TextBox ID="TxtQSR" CssClass="textbox" runat="server" Width="100"></asp:TextBox></td>
         <td class="splittd" style='text-align:center'>
             <asp:Button ID="BtnSave" runat="server" OnClientClick="return(checkForm());" Text="保存" CssClass="button" OnClick="BtnSave_Click" />
         </td>
     </tr>
</table>



<table class="CTable" style="margin-top:5px" height="100%" cellSpacing=1 cellPadding=2 width="99%" border=0>
    <tr class="Title">
      <td colSpan=2 height=25><B>订单号[<%=orderId %>]的服务记录</B></td>
    </tr>
  </table>


 <KS:KSGV ID="List" CssClass="CTable" runat="server" DataKeyNames="id"  AutoGenerateColumns="False" EmptyDataText="该订单没有服务记录!"
        GridLines="None" OnRowCommand="list_RowCommand" OnRowDataBound="list_RowDataBound"
        PagerType="CustomNumeric" Width="100%" OnRowCreated="List_RowCreated" >
        <EmptyDataRowStyle CssClass="emptycss" />
        <Columns>
            <asp:TemplateField HeaderText="次数">
                <itemstyle horizontalalign="Center" width="35px" />
                <itemtemplate>
                 第<%#(CurrPage-1)*PageSize+Container.DataItemIndex+1%>次
               </itemtemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="服务内容">
                <itemtemplate>
                    <%# Convert.ToString(Eval("Content")).Replace("\n","<br/>") %>
                </itemtemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="服务员">
                <itemtemplate>
                    <%# Eval("username") %>
                </itemtemplate>
                 <itemstyle horizontalalign="Center" width="80px" />
            </asp:TemplateField>
            <asp:BoundField DataField="AddDate" DataFormatString="{0:d}" HeaderText="服务时间" HtmlEncode="False">
                <itemstyle horizontalalign="Center" width="80px" />
            </asp:BoundField>
            <asp:BoundField DataField="qsr" HeaderText="签收人">
                <itemstyle horizontalalign="Center" width="50px" />
            </asp:BoundField>

           <asp:TemplateField HeaderText="删除">
                 <itemstyle horizontalalign="Center" width="25"/>
                 <itemtemplate>
                           <asp:LinkButton CssClass="delete" ID="delete" runat="server" CommandArgument=<%#Eval("id") %>  CommandName="del"></asp:LinkButton>
                 </itemtemplate>
            </asp:TemplateField>


        </Columns>
          <EmptyDataRowStyle CssClass="emptycss" />
        <HeaderStyle CssClass="CTitle" />
    </KS:KSGV>
<div class="noprint">
  <KS:Page ID="Page1" runat="server" />
</div>
<div class="noprint" style="text-align:center;margin:50px">
  <input class=button onclick="window.print();" type=button value=打印 name=Submit>
  <input class=button onclick="parent.box.close();" type=button value=取消返回 name=Submit>
</div>
