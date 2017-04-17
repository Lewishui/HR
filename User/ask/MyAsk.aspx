<%@ Page Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.MyAsk" Title="Untitled Page" Codebehind="MyAsk.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.HtmlTags" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<div class="r_tybox nomar">
	<div class="r_padbox nopadtop">
    <table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" class="border">
			<tr>
				<td colspan="10" height="35" align="center">�û�����<%=__info.UserName %>  �ʰɵȼ�ͷ�Σ�<%=MyCache.GetCacheAskRank(__info.AskRankID,"rankname")%></td>
			</tr>
		    <tr class="title" align="center">
			 <td height="25" >
			  <font color=#ff6600>�ܷ�</font></td>
			 <td>�ش�����</td>
			 <td>�ش𱻲���</td>
			 <td>�ش𱻲�����</td>
			 <td width="50"></td>
			 <td>��������</td>
			 <td>�ѽ��</td>
			 <td>�����</td>
			 <td>���Ƽ�</td>
			 <td>���ر�</td>
		    </tr>				
		    <tr align="center">
			 <td height="25" >
			  <font color=#ff6600>
			  <%=__info.Score %>
			  </font>
			 </td>
			 <td>
			 <%=getAnsNum(0)%>
			 </td>
			 <td>
			 <%=getAnsNum(1)%>
			 </td>
			 <td>
			<%=getCNL()%>
			 </td>
			 <td width="50"></td>
			 <td><%=getQueNum(-1)%></td>
			 <td><%=getQueNum(1)%></td>
			 <td><%=getQueNum(0)%></td>
			 <td><%=getQueNum(3)%></td>
			 <td><%=getQueNum(2)%></td>
		    </tr>				
</table>
</div>

	<div class="tabs">	
			<ul>
				<li<%=KSCMS.S("flag")==""?" class='puton'":string.Empty %>><a href="myAsk.aspx">�����ʵ�����</a></li>
				<li<%=KSCMS.S("flag")=="1"?" class='puton'":string.Empty %>><a href="myAsk.aspx?flag=1">�Ҳ���Ļش�</a></li>
				<li<%=KSCMS.S("flag")=="3"?" class='puton'":string.Empty %>><a href="myAsk.aspx?flag=3">˭��������</a></li>
				<li<%=KSCMS.S("flag")=="2"?" class='puton'":string.Empty %>><a href="myAsk.aspx?flag=2">�����ʴ�ר��</a></li>
			</ul>
	</div>      
<div class="r_padbox">
<asp:Panel ID="PanAsk" runat="server">
    <asp:Repeater ID="Repeater1" runat="server">
    <HeaderTemplate>
         <table id="tablist" width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
      <tr align="center" class="title">
        	<td width="50" align="center">ѡ��</td>
        	<td align="center"> ����</td>
        	<td align="center" nowrap>���ͷ�</td>
            <td align="center">״̬</td>
            <td align="center">����</td>
        </tr>
    </HeaderTemplate>
    <ItemTemplate>
      <tr class="tdbg">
          <td class="splittd" align="center"><input type="checkbox" name="ids" value="<%#Eval("TopicID") %>" /></td>
          <td class="splittd"> 
           <a href="<%# BasicField.GetAskUrl(Convert.ToInt32(Eval("TopicID"))) %>" target="_blank"><%# Utils.CutStr(Utils.RemoveHtml(Convert.ToString(Eval("Title"))), 80)%></a>
           <div class="tips">����ʱ�䣺<%# Utils.FormatHumanizedTime(Convert.ToDateTime(Eval("AddDate")))%> �Ƿ���ˣ�<%#Convert.ToString(Eval("verify"))=="1"?"<span style='color:green'>�����</span>":"<span style='color:red'>δ���</span>" %> ���ࣺ<%# MyCache.GetCacheAskCategory(Convert.ToInt32(Eval("ClassID")),"classname") %></div>
           
          </td>
          <td class="splittd" style="text-align:center"><font color=red><%# Convert.ToSingle(Convert.ToString(Eval("reward"))).ToString()%>
</font> ��</td>
          <td class="splittd" style="text-align:center"><%#Convert.ToString(Eval("IsSolve")) == "1" ? "<span style='color:green'>�ѽ��</span>" : Convert.ToInt32(Eval("IsSolve"))==2?"�ѹر�":"<span style='color:red'>δ���</span>"%></td>
          <td class="splittd" align="center">
                     <%# MyCache.GetAskCacheConfig(23).Equals("0") ? "---" : (MyCache.GetAskCacheConfig(23).Equals("2") || (MyCache.GetAskCacheConfig(23).Equals("1") && Convert.ToInt32(Eval("IsSolve")) == 0) ? " <div class=\"bt\"><a onclick=\"return(confirm('ȷ��ɾ����'));\" href='?action=delete&ids=" + Eval("topicid") + "'>ɾ��</a></div>" : string.Empty)%>
           </td>
      </tr>  
     </ItemTemplate>
     <FooterTemplate>
         <tr class="tdbg emptycss" style="display:<%# bool.Parse((Repeater1.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="10">
                  û�м�¼��
                </td>
           </tr> 
      </table>
     </FooterTemplate>
    </asp:Repeater>
    <div class="cz_btn">
    	<span><input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/>ȫѡ  </span>
        <span><asp:Button ID="ButtonRemove" CssClass="button" runat="server" Text="ɾ ��" OnClick="ButtonRemove_Click"/></span>
    </div>
    
     <div class="fy_box"><KS:Page ID="Page1" runat="server" /></div>
</asp:Panel>


<asp:Panel ID="PanelAskToMe" runat="server" Visible="false">
    <asp:Repeater ID="Repeater3" runat="server">
    <HeaderTemplate>
         <table id="tablist" width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
      <tr align="center" class="title">
        	<td width="50" align="center">����ID</td>
        	<td align="center"> ����</td>
        	<td align="center" nowrap>���ͷ�</td>
            <td align="center">״̬</td>
            <td align="center">�Ƿ���</td>
        </tr>
    </HeaderTemplate>
    <ItemTemplate>
      <tr class="tdbg">
          <td class="splittd" align="center"><%#Eval("TopicID") %></td>
          <td class="splittd"> 
           <a href="<%# BasicField.GetAskUrl(Convert.ToInt32(Eval("TopicID"))) %>" target="_blank"><%# Utils.CutStr(Utils.RemoveHtml(Convert.ToString(Eval("Title"))), 80)%></a>
           <div class="tips">�����ߣ�<%# Eval("UserName") %> ����ʱ�䣺<%# Utils.FormatHumanizedTime(Convert.ToDateTime(Eval("AddDate")))%> �Ƿ���ˣ�<%#Convert.ToString(Eval("verify"))=="1"?"<span style='color:green'>�����</span>":"<span style='color:red'>δ���</span>" %> ���ࣺ<%# MyCache.GetCacheAskCategory(Convert.ToInt32(Eval("ClassID")),"classname") %></div>
           
          </td>
          <td class="splittd" style="text-align:center"><font color=red><%# Convert.ToSingle(Convert.ToString(Eval("reward"))).ToString()%>
</font> ��</td>
          <td class="splittd" style="text-align:center"><%#Convert.ToString(Eval("IsSolve")) == "1" ? "<span style='color:green'>�ѽ��</span>" : Convert.ToInt32(Eval("IsSolve"))==2?"�ѹر�":"<span style='color:red'>δ���</span>"%></td>
          <td class="splittd" align="center">
              <%# isAnswer(Convert.ToInt32(Eval("topicid")),Convert.ToString(Eval("postTable"))) %>      
           </td>
      </tr>  
     </ItemTemplate>
     <FooterTemplate>
         <tr class="tdbg emptycss" style="display:<%# bool.Parse((Repeater3.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="10">
                  û�м�¼��
                </td>
           </tr> 
      </table>
     </FooterTemplate>
    </asp:Repeater>

    
     <div class="fy_box"><KS:Page ID="Page3" runat="server" /></div>
</asp:Panel>

<asp:Panel ID="PanAnswer" runat="server" Visible="false">
 <asp:Repeater ID="Repeater2" runat="server">
    <HeaderTemplate>
         <table id="tablist" width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
      <tr align="center" class="title">
        	<td width="50" align="center">ѡ��</td>
        	<td align="center">����</td>
        	<td align="center">���ͷ�</td>
            <td align="center">״̬</td>
            <td align="center">����</td>
        </tr>
    </HeaderTemplate>
    <ItemTemplate>
      <tr class="tdbg">
          <td class="splittd" align="center"><input type="checkbox" name="ids" value="<%#Eval("postID") %>" /></td>
          <td class="splittd"><a href="<%# BasicField.GetAskUrl(Convert.ToInt32(Eval("TopicID"))) %>" target="_blank"><%# Utils.CutStr(Utils.RemoveHtml(Convert.ToString(Eval("Title"))), 80)%></a>
           <div class="tips">�ҵĻش�<%# Utils.CutStr(Utils.RemoveHtml(Convert.ToString(Eval("Content"))),80)%></div>
           <div class="tips">����ʱ�䣺<%# Utils.FormatHumanizedTime(Convert.ToDateTime(Eval("AddDate")))%> �����ߣ�<%#Eval("userName") %> ���ࣺ<%# MyCache.GetCacheAskCategory(Convert.ToInt32(Eval("ClassID")),"classname") %></div>
           
          </td>
          <td class="splittd" style="text-align:center"><font color=red><%# Convert.ToSingle(Convert.ToString(Eval("reward"))).ToString()%>
</font> ��</td>
          <td class="splittd" style="text-align:center"><%#Convert.ToString(Eval("IsSolve")) == "1" ? "<span style='color:green'>�ѽ��</span>" : Convert.ToInt32(Eval("IsSolve"))==2?"�ѹر�":"<span style='color:red'>δ���</span>"%></td>
          <td class="splittd" align="center">
                 <%# MyCache.GetAskCacheConfig(20).Equals("0") || MyCache.GetAskCacheConfig(20).Equals("1")  || Convert.ToString(Eval("IsSolve")) != "0" ? "---" :  " <div class=\"bt\"><a onclick=\"return(confirm('ȷ��ɾ����'));\" href='?action=deleteanswer&ids=" + Eval("postid") + "'>ɾ��</a></div>"%>
           </td>

      </tr>  

     </ItemTemplate>
     <FooterTemplate>
         <tr class="tdbg emptycss" style="display:<%# bool.Parse((Repeater2.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="10">
                  û�лش�����⣡
                </td>
           </tr> 
      </table>
     </FooterTemplate>
    </asp:Repeater>
    <div class="cz_btn">
    	<span><input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/>ȫѡ</span>  
        <span><asp:Button ID="Button1" CssClass="button" runat="server" Text="ɾ ��" OnClick="ButtonRemove2_Click"/></span>
    </div>
    
    <div class="fy_box"><KS:Page ID="Page2" runat="server" /></div>

</asp:Panel>

<asp:Panel ID="PanelZJ" runat="server" Visible="false">
    <% Kesion.APPCode.EditorAPI.EchoHead();%>

 <%if (zjdr!=null){ %>
 <div class="toptips">
    <%if (zjdr["verify"].ToString() == "0")
      {%>
     <span style='color:Red'> ����,<%=(new TemporaryVar()).UserName %>�������������ʰ�ר����֤�������ĵȴ���վ����Ա����ˣ�</span>
    <%}else{%>
     <span style='color:Green'> ����,<%=(new TemporaryVar()).UserName %>������ͨ����վ�ʰ�ר����֤��</span>
    <%} %>
 </div>
 <%} %>
  
<table  cellspacing="1" cellpadding="3" class="border" width="98%" align="center" border="0">
	<tr class="title">
         <td colspan="4"> �����ʴ�ר��</td>
    </tr>
    <tr class="tdbg">
        <td class="lefttd" style="width:100px">ר�ҷ��ࣺ</td>
        <td>
        <asp:DropDownList ID="DrpTypeId" runat="server">
        </asp:DropDownList> <span class="tips">���ͨ�������޸ġ�</span>
        </td>
        <td class="lefttd" style="width:100px">�ʰɷ��ࣺ</td>
        <td>
         <asp:DropDownList ID="DrpClassId" runat="server">
        </asp:DropDownList> <span class="tips">���ͨ�������޸ġ�</span>
        </td>
   </tr>

    <tr class="tdbg">
        <td class="lefttd" style="width:100px">��ʵ������</td>
        <td><asp:TextBox ID="TxtRealName" runat="server" CssClass="textbox" />
         <span class="tips">��д��ʵ���������ͨ�������޸ġ�</span>
        </td>
        <td class="lefttd" style="width:100px">�Ա�</td>
        <td>
        <asp:RadioButtonList ID="RdbSex" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
         <asp:ListItem Value="��" Selected>��</asp:ListItem>
         <asp:ListItem Value="Ů">Ů</asp:ListItem>
        </asp:RadioButtonList>
        </td>
   </tr>
    <tr class="tdbg">
        <td class="lefttd" style="width:100px">�������£�</td>
        <td><asp:TextBox ID="TxtBirthday" runat="server" CssClass="textbox" />
         <span class="tips">��ʽ��YYYY-MM-DD��</span>
        </td>
        <td class="lefttd" style="width:100px">������Ƭ��</td>
        <td>
        <asp:TextBox ID="TxtUserFace" runat="server" CssClass="textbox" />
        <iframe src="../include/UpLoad.aspx?FieldID=<%=this.TxtUserFace.ClientID %>&ispic=1&ChannelID=1" frameborder="0" scrolling="no" style="overflow:hidden;width:320px;height:30px"></iframe>
        </td>
   </tr>
    <tr class="tdbg">
        <td class="lefttd" style="width:100px">��ϵ�绰��</td>
        <td><asp:TextBox ID="TxtTel" runat="server" CssClass="textbox" />
         <span class="tips">��д�ֻ��Ż��ǹ̶��绰���롣</span>
        </td>
        <td class="lefttd" style="width:100px">��ϵQQ��</td>
        <td>
        <asp:TextBox ID="TxtQQ" runat="server" CssClass="textbox" />
        </td>
   </tr>
    <tr class="tdbg">
        <td class="lefttd" style="width:100px">���ڵ�����</td>
        <td>
        <script src="../../plus/area.aspx?pid=<%=provinceId %>&cityId=<%=cityId %>&countyId=<%=countyId %>"></script>
        </td>
        <td class="lefttd" style="width:100px">��ϵ��ַ��</td>
        <td>
        <asp:TextBox ID="TxtAddress" runat="server" CssClass="textbox" />
        </td>
   </tr>
    <tr class="tdbg">
        <td class="lefttd" style="width:100px">������λ��</td>
        <td><asp:TextBox ID="TxtDanWei" runat="server" CssClass="textbox" />
         <span class="tips">��д��Ŀǰ�Ĺ�����λ��</span>
        </td>
        <td class="lefttd" style="width:100px">ִҵ֤�飺</td>
        <td>
        <asp:TextBox ID="TxtZYZ" runat="server" CssClass="textbox" />
        </td>
   </tr>
    <tr class="tdbg">
        <td class="lefttd" style="width:100px">�ó����ࣺ</td>
        <td><asp:TextBox ID="TxtSCFL" runat="server" CssClass="textbox" />
         <span class="tips">��д���ó���רҵ���ơ�</span>
        </td>
        <td class="lefttd" style="width:100px">���֤�ţ�</td>
        <td>
        <asp:TextBox ID="TxtIDCard" runat="server" CssClass="textbox" />
        <br /><span class="tips">��˺����޸ġ�</span>
        </td>
   </tr>
   <tr class="tdbg">
        <td class="lefttd" style="width:100px">���˽��ܣ�</td>
        <td colspan="3"><asp:TextBox ID="TxtIntro" TextMode="MultiLine" style="width:600px;height:200px" runat="server"  Text=""/>
         <%
             Kesion.APPCode.EditorAPI.EchoEditor("editor", TxtIntro.ClientID, "Basic", 0, false, true, true);    
             %>
        </td>
       
   </tr>
</table>

  <div style="margin-top:10px;text-align:center">
  		<div class="cz_btn">
            <span><asp:Button ID="BtnSubmit" OnClientClick="return(checkform())" CssClass="button" runat="server" 
          Text="OK,�ύ����" onclick="Button2_Click"  /></span>
          <span><input type="reset" class="button" value="����¼��" /></span>
    	</div>
  </div>
  <script>
      function checkform() {
          if ($("#<%=this.TxtRealName.ClientID %>").val() == '') {
              KesionJS.Alert("��������ʵ������", "$('#<%=this.TxtRealName.ClientID %>').focus()");
              return false;
          }
      	var checkrad = jQuery("#<%=this.RdbSex.ClientID %> :radio[checked]").val();

      	if (!checkrad) {
      		KesionJS.Alert("��ѡ���Ա�", "$('#<%=this.RdbSex.ClientID %>').focus()");
      		return false;
      	}
	  	return true;
          return true;
      }
  </script>

</asp:Panel>
	</div>
</div>
</asp:Content>