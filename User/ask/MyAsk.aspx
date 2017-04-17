<%@ Page Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.MyAsk" Title="Untitled Page" Codebehind="MyAsk.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.HtmlTags" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<div class="r_tybox nomar">
	<div class="r_padbox nopadtop">
    <table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" class="border">
			<tr>
				<td colspan="10" height="35" align="center">用户名：<%=__info.UserName %>  问吧等级头衔：<%=MyCache.GetCacheAskRank(__info.AskRankID,"rankname")%></td>
			</tr>
		    <tr class="title" align="center">
			 <td height="25" >
			  <font color=#ff6600>总分</font></td>
			 <td>回答总数</td>
			 <td>回答被采纳</td>
			 <td>回答被采纳率</td>
			 <td width="50"></td>
			 <td>提问总数</td>
			 <td>已解决</td>
			 <td>解决中</td>
			 <td>被推荐</td>
			 <td>被关闭</td>
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
				<li<%=KSCMS.S("flag")==""?" class='puton'":string.Empty %>><a href="myAsk.aspx">我提问的问题</a></li>
				<li<%=KSCMS.S("flag")=="1"?" class='puton'":string.Empty %>><a href="myAsk.aspx?flag=1">我参与的回答</a></li>
				<li<%=KSCMS.S("flag")=="3"?" class='puton'":string.Empty %>><a href="myAsk.aspx?flag=3">谁向我提问</a></li>
				<li<%=KSCMS.S("flag")=="2"?" class='puton'":string.Empty %>><a href="myAsk.aspx?flag=2">申请问答专家</a></li>
			</ul>
	</div>      
<div class="r_padbox">
<asp:Panel ID="PanAsk" runat="server">
    <asp:Repeater ID="Repeater1" runat="server">
    <HeaderTemplate>
         <table id="tablist" width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
      <tr align="center" class="title">
        	<td width="50" align="center">选择</td>
        	<td align="center"> 问题</td>
        	<td align="center" nowrap>悬赏分</td>
            <td align="center">状态</td>
            <td align="center">操作</td>
        </tr>
    </HeaderTemplate>
    <ItemTemplate>
      <tr class="tdbg">
          <td class="splittd" align="center"><input type="checkbox" name="ids" value="<%#Eval("TopicID") %>" /></td>
          <td class="splittd"> 
           <a href="<%# BasicField.GetAskUrl(Convert.ToInt32(Eval("TopicID"))) %>" target="_blank"><%# Utils.CutStr(Utils.RemoveHtml(Convert.ToString(Eval("Title"))), 80)%></a>
           <div class="tips">提问时间：<%# Utils.FormatHumanizedTime(Convert.ToDateTime(Eval("AddDate")))%> 是否审核：<%#Convert.ToString(Eval("verify"))=="1"?"<span style='color:green'>已审核</span>":"<span style='color:red'>未审核</span>" %> 分类：<%# MyCache.GetCacheAskCategory(Convert.ToInt32(Eval("ClassID")),"classname") %></div>
           
          </td>
          <td class="splittd" style="text-align:center"><font color=red><%# Convert.ToSingle(Convert.ToString(Eval("reward"))).ToString()%>
</font> 分</td>
          <td class="splittd" style="text-align:center"><%#Convert.ToString(Eval("IsSolve")) == "1" ? "<span style='color:green'>已解决</span>" : Convert.ToInt32(Eval("IsSolve"))==2?"已关闭":"<span style='color:red'>未解决</span>"%></td>
          <td class="splittd" align="center">
                     <%# MyCache.GetAskCacheConfig(23).Equals("0") ? "---" : (MyCache.GetAskCacheConfig(23).Equals("2") || (MyCache.GetAskCacheConfig(23).Equals("1") && Convert.ToInt32(Eval("IsSolve")) == 0) ? " <div class=\"bt\"><a onclick=\"return(confirm('确定删除吗？'));\" href='?action=delete&ids=" + Eval("topicid") + "'>删除</a></div>" : string.Empty)%>
           </td>
      </tr>  
     </ItemTemplate>
     <FooterTemplate>
         <tr class="tdbg emptycss" style="display:<%# bool.Parse((Repeater1.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="10">
                  没有记录！
                </td>
           </tr> 
      </table>
     </FooterTemplate>
    </asp:Repeater>
    <div class="cz_btn">
    	<span><input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/>全选  </span>
        <span><asp:Button ID="ButtonRemove" CssClass="button" runat="server" Text="删 除" OnClick="ButtonRemove_Click"/></span>
    </div>
    
     <div class="fy_box"><KS:Page ID="Page1" runat="server" /></div>
</asp:Panel>


<asp:Panel ID="PanelAskToMe" runat="server" Visible="false">
    <asp:Repeater ID="Repeater3" runat="server">
    <HeaderTemplate>
         <table id="tablist" width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
      <tr align="center" class="title">
        	<td width="50" align="center">问题ID</td>
        	<td align="center"> 问题</td>
        	<td align="center" nowrap>悬赏分</td>
            <td align="center">状态</td>
            <td align="center">是否解答</td>
        </tr>
    </HeaderTemplate>
    <ItemTemplate>
      <tr class="tdbg">
          <td class="splittd" align="center"><%#Eval("TopicID") %></td>
          <td class="splittd"> 
           <a href="<%# BasicField.GetAskUrl(Convert.ToInt32(Eval("TopicID"))) %>" target="_blank"><%# Utils.CutStr(Utils.RemoveHtml(Convert.ToString(Eval("Title"))), 80)%></a>
           <div class="tips">提问者：<%# Eval("UserName") %> 提问时间：<%# Utils.FormatHumanizedTime(Convert.ToDateTime(Eval("AddDate")))%> 是否审核：<%#Convert.ToString(Eval("verify"))=="1"?"<span style='color:green'>已审核</span>":"<span style='color:red'>未审核</span>" %> 分类：<%# MyCache.GetCacheAskCategory(Convert.ToInt32(Eval("ClassID")),"classname") %></div>
           
          </td>
          <td class="splittd" style="text-align:center"><font color=red><%# Convert.ToSingle(Convert.ToString(Eval("reward"))).ToString()%>
</font> 分</td>
          <td class="splittd" style="text-align:center"><%#Convert.ToString(Eval("IsSolve")) == "1" ? "<span style='color:green'>已解决</span>" : Convert.ToInt32(Eval("IsSolve"))==2?"已关闭":"<span style='color:red'>未解决</span>"%></td>
          <td class="splittd" align="center">
              <%# isAnswer(Convert.ToInt32(Eval("topicid")),Convert.ToString(Eval("postTable"))) %>      
           </td>
      </tr>  
     </ItemTemplate>
     <FooterTemplate>
         <tr class="tdbg emptycss" style="display:<%# bool.Parse((Repeater3.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="10">
                  没有记录！
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
        	<td width="50" align="center">选择</td>
        	<td align="center">问题</td>
        	<td align="center">悬赏分</td>
            <td align="center">状态</td>
            <td align="center">操作</td>
        </tr>
    </HeaderTemplate>
    <ItemTemplate>
      <tr class="tdbg">
          <td class="splittd" align="center"><input type="checkbox" name="ids" value="<%#Eval("postID") %>" /></td>
          <td class="splittd"><a href="<%# BasicField.GetAskUrl(Convert.ToInt32(Eval("TopicID"))) %>" target="_blank"><%# Utils.CutStr(Utils.RemoveHtml(Convert.ToString(Eval("Title"))), 80)%></a>
           <div class="tips">我的回答：<%# Utils.CutStr(Utils.RemoveHtml(Convert.ToString(Eval("Content"))),80)%></div>
           <div class="tips">提问时间：<%# Utils.FormatHumanizedTime(Convert.ToDateTime(Eval("AddDate")))%> 提问者：<%#Eval("userName") %> 分类：<%# MyCache.GetCacheAskCategory(Convert.ToInt32(Eval("ClassID")),"classname") %></div>
           
          </td>
          <td class="splittd" style="text-align:center"><font color=red><%# Convert.ToSingle(Convert.ToString(Eval("reward"))).ToString()%>
</font> 分</td>
          <td class="splittd" style="text-align:center"><%#Convert.ToString(Eval("IsSolve")) == "1" ? "<span style='color:green'>已解决</span>" : Convert.ToInt32(Eval("IsSolve"))==2?"已关闭":"<span style='color:red'>未解决</span>"%></td>
          <td class="splittd" align="center">
                 <%# MyCache.GetAskCacheConfig(20).Equals("0") || MyCache.GetAskCacheConfig(20).Equals("1")  || Convert.ToString(Eval("IsSolve")) != "0" ? "---" :  " <div class=\"bt\"><a onclick=\"return(confirm('确定删除吗？'));\" href='?action=deleteanswer&ids=" + Eval("postid") + "'>删除</a></div>"%>
           </td>

      </tr>  

     </ItemTemplate>
     <FooterTemplate>
         <tr class="tdbg emptycss" style="display:<%# bool.Parse((Repeater2.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="10">
                  没有回答过问题！
                </td>
           </tr> 
      </table>
     </FooterTemplate>
    </asp:Repeater>
    <div class="cz_btn">
    	<span><input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/>全选</span>  
        <span><asp:Button ID="Button1" CssClass="button" runat="server" Text="删 除" OnClick="ButtonRemove2_Click"/></span>
    </div>
    
    <div class="fy_box"><KS:Page ID="Page2" runat="server" /></div>

</asp:Panel>

<asp:Panel ID="PanelZJ" runat="server" Visible="false">
    <% Kesion.APPCode.EditorAPI.EchoHead();%>

 <%if (zjdr!=null){ %>
 <div class="toptips">
    <%if (zjdr["verify"].ToString() == "0")
      {%>
     <span style='color:Red'> 您好,<%=(new TemporaryVar()).UserName %>！您已申请了问吧专家认证，请耐心等待本站管理员的审核！</span>
    <%}else{%>
     <span style='color:Green'> 您好,<%=(new TemporaryVar()).UserName %>！您已通过本站问吧专家认证！</span>
    <%} %>
 </div>
 <%} %>
  
<table  cellspacing="1" cellpadding="3" class="border" width="98%" align="center" border="0">
	<tr class="title">
         <td colspan="4"> 申请问答专家</td>
    </tr>
    <tr class="tdbg">
        <td class="lefttd" style="width:100px">专家分类：</td>
        <td>
        <asp:DropDownList ID="DrpTypeId" runat="server">
        </asp:DropDownList> <span class="tips">审核通过后不能修改。</span>
        </td>
        <td class="lefttd" style="width:100px">问吧分类：</td>
        <td>
         <asp:DropDownList ID="DrpClassId" runat="server">
        </asp:DropDownList> <span class="tips">审核通过后不能修改。</span>
        </td>
   </tr>

    <tr class="tdbg">
        <td class="lefttd" style="width:100px">真实姓名：</td>
        <td><asp:TextBox ID="TxtRealName" runat="server" CssClass="textbox" />
         <span class="tips">填写真实姓名，审核通过后不能修改。</span>
        </td>
        <td class="lefttd" style="width:100px">性别：</td>
        <td>
        <asp:RadioButtonList ID="RdbSex" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
         <asp:ListItem Value="男" Selected>男</asp:ListItem>
         <asp:ListItem Value="女">女</asp:ListItem>
        </asp:RadioButtonList>
        </td>
   </tr>
    <tr class="tdbg">
        <td class="lefttd" style="width:100px">出生年月：</td>
        <td><asp:TextBox ID="TxtBirthday" runat="server" CssClass="textbox" />
         <span class="tips">格式：YYYY-MM-DD。</span>
        </td>
        <td class="lefttd" style="width:100px">个人照片：</td>
        <td>
        <asp:TextBox ID="TxtUserFace" runat="server" CssClass="textbox" />
        <iframe src="../include/UpLoad.aspx?FieldID=<%=this.TxtUserFace.ClientID %>&ispic=1&ChannelID=1" frameborder="0" scrolling="no" style="overflow:hidden;width:320px;height:30px"></iframe>
        </td>
   </tr>
    <tr class="tdbg">
        <td class="lefttd" style="width:100px">联系电话：</td>
        <td><asp:TextBox ID="TxtTel" runat="server" CssClass="textbox" />
         <span class="tips">填写手机号或是固定电话号码。</span>
        </td>
        <td class="lefttd" style="width:100px">联系QQ：</td>
        <td>
        <asp:TextBox ID="TxtQQ" runat="server" CssClass="textbox" />
        </td>
   </tr>
    <tr class="tdbg">
        <td class="lefttd" style="width:100px">所在地区：</td>
        <td>
        <script src="../../plus/area.aspx?pid=<%=provinceId %>&cityId=<%=cityId %>&countyId=<%=countyId %>"></script>
        </td>
        <td class="lefttd" style="width:100px">联系地址：</td>
        <td>
        <asp:TextBox ID="TxtAddress" runat="server" CssClass="textbox" />
        </td>
   </tr>
    <tr class="tdbg">
        <td class="lefttd" style="width:100px">工作单位：</td>
        <td><asp:TextBox ID="TxtDanWei" runat="server" CssClass="textbox" />
         <span class="tips">填写您目前的工作单位。</span>
        </td>
        <td class="lefttd" style="width:100px">执业证书：</td>
        <td>
        <asp:TextBox ID="TxtZYZ" runat="server" CssClass="textbox" />
        </td>
   </tr>
    <tr class="tdbg">
        <td class="lefttd" style="width:100px">擅长分类：</td>
        <td><asp:TextBox ID="TxtSCFL" runat="server" CssClass="textbox" />
         <span class="tips">填写您擅长的专业名称。</span>
        </td>
        <td class="lefttd" style="width:100px">身份证号：</td>
        <td>
        <asp:TextBox ID="TxtIDCard" runat="server" CssClass="textbox" />
        <br /><span class="tips">审核后不能修改。</span>
        </td>
   </tr>
   <tr class="tdbg">
        <td class="lefttd" style="width:100px">个人介绍：</td>
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
          Text="OK,提交申请" onclick="Button2_Click"  /></span>
          <span><input type="reset" class="button" value="重新录入" /></span>
    	</div>
  </div>
  <script>
      function checkform() {
          if ($("#<%=this.TxtRealName.ClientID %>").val() == '') {
              KesionJS.Alert("请输入真实姓名！", "$('#<%=this.TxtRealName.ClientID %>').focus()");
              return false;
          }
      	var checkrad = jQuery("#<%=this.RdbSex.ClientID %> :radio[checked]").val();

      	if (!checkrad) {
      		KesionJS.Alert("请选择性别！", "$('#<%=this.RdbSex.ClientID %>').focus()");
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