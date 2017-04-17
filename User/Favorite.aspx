<%@ Page Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_Favorite_1" Title="Untitled Page" Codebehind="Favorite.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.HtmlTags" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

    <div class="r_tybox nomar">

        <div class="tabs">	
              <ul>
                  <li<%=KSCMS.S("flag")==""?" class='puton'":string.Empty %>><a href="Favorite.Aspx">���ղص��ĵ�</a></li>
                 <%if (Utils.GetSysInfo("//sysinfo/model/mall").ToString().ToLower() == "true") { %>
                  <li<%=KSCMS.S("flag")=="2"?" class='puton'":string.Empty %>><a href="Favorite.Aspx?flag=2">���ղص���Ʒ</a></li>
                  <li<%=KSCMS.S("flag")=="3"?" class='puton'":string.Empty %>><a href="Favorite.Aspx?flag=3">���ղص�ƴ����Ʒ</a></li>
                 <%} %>
                  <li<%=KSCMS.S("flag")=="1"?" class='puton'":string.Empty %>><a href="Favorite.Aspx?flag=1">���ղص��ʰ�����</a></li>
              </ul>
        </div> 
    	<div class="clear"></div>
        <div class="tips">������ʾ����������Ȥ����Ϣ�����ղ��Ѿ�û�м�ֵ����Ϣ�����Խ���ȡ���ղز�����</div>
  
  <asp:Panel ID="PanDoc" runat="server">
    <asp:Repeater ID="Repeater1" runat="server">
    <HeaderTemplate>
	<div class="r_padbox nopadtop" style="padding-bottom:0px">
     <table id="tablist" width="100%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
      <tr class="title">
        	<td width="50" align="center">ѡ��</td>
        	<td width="110" align="center"> ͼƬ</td>
            <td align="center"> ���� </td>
            <td width="100" align="center">�ղ�ʱ�� </td>
	        <td align="center" width="70">����</td>
        </tr>
    </HeaderTemplate>
    <ItemTemplate>
      <tr class="tdbg">
          <td class="splittd" align="center"><input type="checkbox" name="ids" value="<%#Eval("ID") %>" /></td>
          <td class="splittd" align="center"><img width="102" height="79" onerror="this.src='/sysimg/nopic.gif'" src="<%# GetPhoto(Convert.ToString(Eval("DefaultPic"))) %>" /></td>
          <td class="splittd">
          <%# KSCMS.S("flag") == "3"?Eval("subject"):GetSubject(Convert.ToInt16(Eval("ChannelID")),Utils.StrToInt(Eval("ClassID")),Utils.StrToInt(Eval("InfoID")),Convert.ToString(Eval("FileName")), Convert.ToString(Eval("TurnUrl")), Convert.ToString(Eval("Title")))%>
          <div style="margin-top:10px;color:#999999;">
          ����:<%# MyCache.GetCacheClass(Convert.ToInt16(Eval("ClassID")),1) %>&nbsp;&nbsp;
          ����ʱ��:<%# GetAddTime(Convert.ToDateTime(Eval("PubDate")))%>&nbsp;&nbsp;
          <%#KSCMS.S("flag") == "3"?"":"�����:"+Eval("Hits")+"�˴�" %>
             <%#KSCMS.S("flag") == "3"?"����ۣ�<span style='text-decoration:line-through'>��"+ Utils.StrToFloat(Eval("singleprice")).ToString("F2")+"Ԫ</span> &nbsp;&nbsp;ƴ�żۣ�<span style='color:#ff3300;font-weight:bold'>��"+ Utils.StrToFloat(Eval("FightGroupPrice")).ToString("F2")+"Ԫ":KSCMS.S("flag") == "2"?"�г��ۣ�<span style='text-decoration:line-through'>��"+ Utils.StrToFloat(Eval("price")).ToString("F2")+"Ԫ</span> &nbsp;&nbsp;�̳Ǽۣ�<span style='color:#ff3300;font-weight:bold'>��"+ Utils.StrToFloat(Eval("price_member")).ToString("F2")+"Ԫ":""%></span>
          </div>
          </td>

          <td class="splittd" align="center">
          <span style="color:#ff6600;">
          <%# Utils.FormatHumanizedTime(Convert.ToDateTime(Eval("AddDate")))%>
          </span>
          </td>
          <td class="splittd" align="center">
               <%# KSCMS.S("flag") == "2"?@"<a href=""/?app=orderinfo&newwin=1&id="+ Eval("InfoID") +@""" class=""deletebtn"" target=""_blank"">����</a>":"" %>
               <a href="javascript:;" class="deletebtn" onclick="$.dialog.confirm('ȷ��ȡ�����ղ���?',function(){ location.href='Favorite.Aspx?flag=<%=KSCMS.S("flag") %>&action=Cancel&ids=<%#Eval("ID") %>';},function(){});">ȡ ��</a>
          
          </td>
       
      </tr>  

     </ItemTemplate>
     <FooterTemplate>
     <tr class="tdbg emptycss" style="display:<%# bool.Parse((Repeater1.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="10" >
                  ����û���ղ��κ���ϢŶ��
                </td>
           </tr> 
    </table>
     </FooterTemplate>
    </asp:Repeater>
 </asp:Panel>

  <asp:Panel ID="PanAsk" runat="server" Visible="false">
    <asp:Repeater ID="Repeater2" runat="server">
    <HeaderTemplate>
     <table id="tablist" width="100%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
      <tr class="title">
        	<td width="50" align="center">ѡ��</td>
            <td align="center">����</td>
            <td width="100" align="center">�ղ�ʱ�� </td>
            <td align="center">�Ƿ���</td>
            <td align="center" nowrap>���ͷ�</td>
	        <td align="center" width="70">����</td>
        </tr>
    </HeaderTemplate>
    <ItemTemplate>
      <tr class="tdbg">
          <td class="splittd" align="center"><input class="cleckbtn" type="checkbox" name="ids" value="<%#Eval("ID") %>" /></td>
          <td class="splittd" style="text-align:left">
            <a href="<%# BasicField.GetAskUrl(Convert.ToInt16(Eval("TopicID"))) %>" target="_blank"><%# Eval("Title") %></a>
           <div class="tips2">����ʱ�䣺<%# Utils.FormatHumanizedTime(Convert.ToDateTime(Eval("PubDate")))%> �Ƿ���ˣ�<%#Convert.ToString(Eval("verify"))=="1"?"<span style='color:green'>�����</span>":"<span style='color:red'>δ���</span>" %> ���ࣺ<%# MyCache.GetCacheAskCategory(Convert.ToInt16(Eval("ClassID")),"classname") %></div>
           
          </div>
          </td>
          <td class="splittd" align="center">
          <span style="color:#ff6600;">
          <%# Utils.FormatHumanizedTime(Convert.ToDateTime(Eval("AddDate")))%>
          </span>
          </td> 
          <td class="splittd" style="text-align:center"><%#Convert.ToString(Eval("IsSolve")) == "1" ? "<span style='color:green'>�ѽ��</span>" : Convert.ToInt16(Eval("IsSolve"))==2?"�ѹر�":"<span style='color:red'>δ���</span>"%></td>
          <td class="splittd" style="text-align:center"><font color=red><%# Convert.ToSingle(Convert.ToString(Eval("reward"))).ToString()%>
</font> ��</td>
          <td class="splittd" align="center">
          <a href="javascript:;" class="deletebtn" onclick="$.dialog.confirm('ȷ��ȡ�����ղ���?',function(){ location.href='Favorite.Aspx?flag=1&action=Cancel&ids=<%#Eval("ID") %>';},function(){});">ȡ ��</a>
          </td>
       
      </tr>  

     </ItemTemplate>
     <FooterTemplate>
     <tr class="tdbg emptycss" style="display:<%# bool.Parse((Repeater2.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="10" >
                  ����û���ղ��κ�����Ŷ��
                </td>
           </tr> 
    </table>
     </FooterTemplate>
    </asp:Repeater>
 </asp:Panel>

	
   <div class="r_padbox nopadtop">
        <div class="clear"></div>
        <div class="cz_btn">
            <span><input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/>ȫѡ&nbsp;</span>
            <span><asp:Button ID="btnDelete" runat="server" CssClass="button" Text="ȡ��ѡ�е��ղ�" OnClick="btnDelete_Click" /></span>
         </div>
     	
        <div class="fy_box"><KS:Page ID="Page1" runat="server" /></div>

		</div>
	</div>

</asp:Content>