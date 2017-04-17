<%@ Page Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_MyCommentList" Title="��Ʒ���۹���" Codebehind="MyCommentList.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.BLL" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.HtmlTags" %>

<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<div class="r_tybox nomar">

<asp:Panel ID="ListPannel" runat="server">
	<div class="tabs">	
        <ul>
            <%if (KSCMS.S("fight") != "1")
                { %>
            <li><a href="myorder.aspx">ȫ������(<%=DataFactory.GetOnlyValue("select count(1) From KS_ProOrder Where ordertype!=2 and  UserName='" + (new TemporaryVar()).UserName + "'")  %>)</a></li>
            <li<%if (KSCMS.S("show") == "2") Response.Write(" class='puton'"); %>><a href="myorder.aspx?show=2">�������ڵĶ���(<%=DataFactory.GetOnlyValue("select count(1) From KS_ProOrder Where datediff(month,[InputTime],getdate())<=2 and ordertype!=2 and UserName='" + (new TemporaryVar()).UserName + "'")  %>)</a></li>
            <li<%if (KSCMS.S("show") == "-2") Response.Write(" class='puton'"); %>><a href="myorder.aspx?show=-2">�������(<%=DataFactory.GetOnlyValue("select count(1) From KS_ProOrder Where MoneyReceipt<=0 and ordertype!=2 and UserName='" + (new TemporaryVar()).UserName + "'")  %>)</a></li>
            <li<%if (KSCMS.S("show") == "-3") Response.Write(" class='puton'"); %>><a href="myorder.aspx?show=-3">���ջ�����(<%=DataFactory.GetOnlyValue("select count(1) From KS_ProOrder Where DeliverStatus=1 and ordertype!=2 and UserName='" + (new TemporaryVar()).UserName + "'")  %>)</a></li>
            <li><a href="mycomment.aspx">������(<%=DataFactory.GetOnlyValue("select count(1) From KS_ProOrder a inner Join KS_ProOrderItem b on a.OrderID=b.OrderID Where (a.DeliverStatus=2 or a.status=2) and b.IsCmt=0 and ordertype!=2 and a.UserName='" + (new TemporaryVar()).UserName + "'")  %>)</a></li>
			<li  class="puton"><a href="mycommentList.aspx">������(<%=DataFactory.GetOnlyValue("select count(1) From KS_ProOrder a inner Join KS_ProOrderItem b on a.OrderID=b.OrderID Where (a.DeliverStatus=2 or a.status=2) and b.IsCmt=1 and a.UserName='" + (new TemporaryVar()).UserName + "'")  %>)</a></li>
        <%}
            else if (KSCMS.S("fight") == "1")
            {%>
            <li><a href="MyFightGroupBuyOrder.aspx">����(<%=DataFactory.GetOnlyValue("select count(1) From KS_ProOrder Where ordertype=2 and UserName='"+(new TemporaryVar()).UserName+"'")  %>)</a></li>
			<li<%if (KSCMS.S("show")=="1") Response.Write (" class='puton'"); %>><a href="MyFightGroupBuyOrder.aspx?show=1">ƴ����(<%=DataFactory.GetOnlyValue("select count(1) From KS_ProOrder a inner join KS_ProOrderItem o on a.orderid=o.orderid inner join KS_ProFightGroup f on o.infoid=f.id  Where ordertype=2 and GoupNum<>-1 and isend=0  and datediff(hour,InputTime,getdate())<limittime and UserName='"+(new TemporaryVar()).UserName+"'")%>)</a></li>
            <li<%if (KSCMS.S("show")=="2") Response.Write (" class='puton'"); %>><a href="MyFightGroupBuyOrder.aspx?show=2">������(<%=DataFactory.GetOnlyValue("select count(1) From KS_ProOrder a inner join KS_ProOrderItem o on a.orderid=o.orderid inner join KS_ProFightGroup f on o.infoid=f.id  Where ordertype=2 and GoupNum=-1 and isend=-1  and UserName='"+(new TemporaryVar()).UserName+"'")%>)</a></li>
			<li<%if (KSCMS.S("show")=="3") Response.Write (" class='puton'"); %>><a href="MyFightGroupBuyOrder.aspx?show=3">�ѳ���(<%=DataFactory.GetOnlyValue("select count(1) From KS_ProOrder a inner join KS_ProOrderItem o on a.orderid=o.orderid inner join KS_ProFightGroup f on o.infoid=f.id  Where ordertype=2 and GoupNum<>-1 and isend=1  and UserName='"+(new TemporaryVar()).UserName+"'")%>)</a></li>
            <li<%if (KSCMS.S("show")=="4") Response.Write (" class='puton'"); %>><a href="MyFightGroupBuyOrder.aspx?show=4">������(<%=DataFactory.GetOnlyValue("select count(1) From KS_ProOrder a inner join KS_ProOrderItem o on a.orderid=o.orderid inner join KS_ProFightGroup f on o.infoid=f.id  Where ordertype=2 and GoupNum<>-1 and isend=2   and datediff(hour,InputTime,getdate())>=limittime and UserName='"+(new TemporaryVar()).UserName+"'")%>)</a></li>
            <li><a href="mycomment.aspx?fight=1">������(<%=DataFactory.GetOnlyValue("select count(1) From KS_ProOrder a inner Join KS_ProOrderItem b on a.OrderID=b.OrderID Where (a.DeliverStatus=2 or a.status=2) and b.IsCmt=0 and ordertype=2 and a.UserName='" + (new TemporaryVar()).UserName + "'")  %>)</a></li>
			<li class='puton'><a href="mycommentList.aspx?fight=1">������(<%=DataFactory.GetOnlyValue("select count(1) From KS_ProOrder a inner Join KS_ProOrderItem b on a.OrderID=b.OrderID Where (a.DeliverStatus=2 or a.status=2) and b.IsCmt=1 and ordertype=2 and a.UserName='" + (new TemporaryVar()).UserName + "'")  %>)</a></li>
        <%} %>
        </ul>
	</div>


  <asp:Repeater ID="Repeater1" runat="server">
          <HeaderTemplate>
<div class="r_padbox">	          
          <table width="98%" align="center" border="0" cellpadding="1" cellspacing="1" class="border">
              <tr class="title">
               <td height="25" ><b>���</b></td>
               <!--<td><b>������</b></td>-->
               <td><b>������Ʒ</b></td>
               <td style="text-align:center"><b>��������</b></td>
               <td style="text-align:center"><b>����ʱ��</b></td>
               <td style="text-align:center"><b>����</b></td>
               <td style="text-align:center"><b>����</b></td>
               <td style="text-align:center"><b>״̬</b></td>
              </tr>
          </HeaderTemplate>
         <ItemTemplate>
             <TR>
				 <td class="splittd" style="text-align:center">
				 <strong>
				<%# Container.ItemIndex + 1 + (CurrPage - 1) * PageSize%>��
				</strong>
				</td>
                <!--<td class="splittd" ></td>-->
                <td class="splittd" title="�����ţ�<%# Eval("OrderID")%>">
                <%# Kesion.NET.WebSite.Admin.Shop.Admin_ShopComment.GetProductTitle(Utils.StrToInt(Eval("ProID")),Utils.StrToInt(Eval("OrderType"))) %>
                </td>
                 <td class="splittd" > <%# Utils.CutStr(Convert.ToString(Eval("Content")),60) %></td>
                 <td class="splittd" style="text-align:center"> <%# Utils.FormatHumanizedTime(Convert.ToDateTime(Eval("AddDate"))) %></td>
                 <td class="splittd" style="text-align:center"> <%# Convert.ToString(Eval("CmtType"))=="0"?"����":(Convert.ToString(Eval("CmtType"))=="1"?"����":"����") %></td>
                 <td class="splittd" style="text-align:center"> <img src="../../SysImg/star/star-<%# Eval("StarNum") %>.jpg" title="<%# Eval("StarNum") %>����"/></td>
                 <td class="splittd" style="text-align:center">                 
                     <%# Convert.ToString(Eval("status"))=="1"?"<span style='color:green'>�����</span>":"<span style='color:red'>δ���</span>" %>
               </td>
			</TR>
			
             
         </ItemTemplate>
          <FooterTemplate>
           <tr class="tdbg emptycss" style="display:<%# bool.Parse((Repeater1.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="7">
                 ��û�����ۣ�
                </td>
               </tr> 
           </table>
          </FooterTemplate>
        </asp:Repeater>
       <br />
     <div class="fy_box"><KS:Page ID="Page1" runat="server" /></div>
</asp:Panel>


	</div>
</div>
</asp:Content>

