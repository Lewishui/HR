<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_User" Title="用户管理" Codebehind="KS.User.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.BLL" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Xml" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<script>
     function delUser(userid,o){
                if (confirm('温馨提示：为避免删除用户后，新注册和删除用户同名称的用户，导致数据冗余冲突(如用户充值记录等)，强烈建议执行“宁可锁定也不删除”的原则，您还确定删除用户吗?')){
                    jQuery('#ajaxmsg',window.parent.document).toggle();
                    jQuery.ajax({
                        type: "POST",
                        url: "KS.User.aspx",
                        data: "userid="+userid+"&action=del",
                        success: function (data) {
                            jQuery('#ajaxmsg',window.parent.document).toggle();
                            if (data=="success"){
                                $(o).parent().parent().remove();
                            }else if (data=="failchild"){
                                alert("对不起，用户发展了下线，不可以删除！");
                            }else{
                                alert(data);
                            }
                        }
                    });
                }
            }

            function loadUserDetail(id,showtype,page){
                if (showtype==-1) { 
                    $("#s"+id).toggle();
                }
                if(!$("#s"+id).is(":hidden")){
                    jQuery('#ajaxmsg',window.parent.document).toggle();
                    jQuery.ajax({
                        type: "POST",
                        url: "KS.UserDetail.aspx",
                        data: "userid="+id+"&from=listuserdetail&showtype="+showtype+"&page="+page,
                        success: function (data) {
                            jQuery('#ajaxmsg',window.parent.document).toggle();
                            $("#ss"+id).html(data);
                        }
                    });
                }
            }
     function SetDate() {
        var today = new Date();
        if ($("#showsearchdate").is(":hidden")) {
            $("#showsearchdate").show();
            $('#<%=TxtSearchBeginDate.ClientID%>').val(today.getFullYear() + '-' + (today.getMonth() + 1) + '-01');
        $('#<%=TxtSearchEndDate.ClientID%>').val(today.getFullYear() + '-' + (today.getMonth() + 1) + '-' + today.getDate());
    }
    else {
        $("#showsearchdate").hide();
        $('#<%=TxtSearchBeginDate.ClientID%>').val('');
        $('#<%=TxtSearchEndDate.ClientID%>').val('');
    }
}
        </script>
<div id="manage_top" class="toptitle menu_top_fixed">&nbsp;<strong>快速查找用户：</strong>
     <%if (!string.IsNullOrEmpty(KSCMS.S("groupname"))){ %>
    用户组[<%=KSCMS.S("groupname") %>]
    <%}else if (!string.IsNullOrEmpty(KSCMS.S("depart"))){%>
    部门[<%=KSCMS.S("depart") %>]
   
    <%  }else{ %>
<a href="KS.User.aspx">所有用户</a> | <a href="KS.User.aspx?UserType=1">锁定的用户</a> | <a href="KS.User.aspx?UserType=2">所有管理员</a> | <a href="KS.User.aspx?UserType=3">待认证</a> | <a href="KS.User.aspx?UserType=4">待邮件激活</a>
        | <a href="KS.User.aspx?UserType=5">24小时内登录</a>
        | <a href="KS.User.aspx?UserType=6">24小时内注册</a>
        | <a href="KS.User.aspx?UserType=7">VIP未到期</a>
        | <a href="KS.User.aspx?UserType=8">VIP已过期</a>

    <%} %>
   <span style="float:right;padding-right:20px">总用户<span style='color:red'><%=DataFactoryUser.GetOnlyValue("select count(1) From KS_User") %></span>位，24小时内新增<span style='color:red'><%=DataFactoryUser.GetOnlyValue("select count(1) From KS_User Where DateDiff(day,regdate,getdate())<1") %></span>位，24小时内登录<span style='color:red'><%=DataFactoryUser.GetOnlyValue("select count(1) From KS_User Where DateDiff(day,lastlogintime,getdate())<1") %></span>位</span>
</div>
 <div class="menu_top_fixed_height"></div>   
 <div class="content-area">
    <div class="myTitle">
        <%if (KSCMS.S("action") == "show")
            { %><strong>查看用户[<%=drr["username"].ToString() %>]信息</strong>
        <%}else { %>
    	所有用户管理
      <div class="quickSearch">
        <strong>搜索条件：</strong>
        <asp:DropDownList ID="DrpSearchType" runat="server">
          <asp:ListItem Value="0" Selected="True">用户名</asp:ListItem>
          <asp:ListItem Value="5">推荐人</asp:ListItem>
          <asp:ListItem Value="1">姓名</asp:ListItem>
          <asp:ListItem Value="2">用户ID</asp:ListItem>
          <asp:ListItem Value="3">手机号码</asp:ListItem>
          <asp:ListItem Value="4">电子邮箱</asp:ListItem>
        </asp:DropDownList> <strong>关键字：</strong><asp:TextBox runat="server" Width="150px" ID="TxtKeyWord" CssClass="textbox" /> 
           <b onclick="SetDate()" class="link-color">注册时间？</b>
                   <span id="showsearchdate"<%if (this.TxtSearchBeginDate.Text==""){ %> style="display:none"<%} %>>
                   <asp:TextBox ID="TxtSearchBeginDate" Width="100px" runat="server"  onclick="WdatePicker({dateFmt:&#39;yyyy-MM-dd&#39;});" CssClass="textbox Wdate"></asp:TextBox>至
                   <asp:TextBox ID="TxtSearchEndDate" Width="100px" runat="server" onclick="WdatePicker({dateFmt:&#39;yyyy-MM-dd&#39;});"  CssClass="textbox Wdate"></asp:TextBox>
                   </span>
            <asp:Button ID="BtnSearch" runat="server" CssClass="button" Text="搜索用户"   onclick="BtnSearch_Click" />
        </div>
         <%} %>
     </div>   
   
          <% if (KSCMS.S("action")!="show"){%>
      <div class="tabs_header">
        <ul class="tabs">
        <li <%=string.IsNullOrEmpty(KSCMS.S("gid"))?" class='active'":"" %>><a href="KS.User.aspx"><span>所有用户</span></a></li>
        <%
            using (DataTable dt = MyCache.GetUserGroupTable())
            {
                foreach (DataRow dr in dt.Rows)
                {
                    if (Utils.StrToInt(dr["groupid"].ToString()) > 0 || (MyCache.GetShopCommonConfig(59).Equals("1") && Utils.StrToInt(dr["groupid"].ToString()) < 0))
                    {
                        KSCMS.W(string.Format(@"<li{2}><a href=""KS.User.aspx?gid={0}""><span>{1}</span></a></li>", dr["groupid"].ToString(), dr["groupname"].ToString(), KSCMS.S("gid") == dr["groupid"].ToString() ? " class='active'" : string.Empty));
                    }
                        
                }
            } 
         %>   </ul>
   </div>  
           <% } %>
        
      


<asp:Panel ID="ListPanel" runat="server" Width="100%">
    <script>
        function GetMyIds() {
            var sid = null;
            for (var i = 0; i < document.getElementsByName("ids").length; i++) {
                var KS = document.getElementsByName("ids")[i];
                if (KS.checked == true) {
                    if (sid == null)
                        sid = KS.value;
                    else
                        sid += "," + KS.value;
                }
            }
            return sid;
        }
        function doCZ(){
           var sid = GetMyIds();
           if (sid==null){
                KesionJS.Alert("请先选择要充值的用户！");
           }else{
                parent.openWin("给用户充值","User/KS.AddMoney.aspx?userID="+sid,true,750,500);
            }
        }
        function doSendMail(){
            var sid = GetMyIds();
            if (sid==null){
                KesionJS.Alert("请先选择要发送邮件的用户！");
            }else{
                location.href='KS.UserMail.aspx?userid='+sid;
            }
        }
        function doSendSms(){
            var sid = GetMyIds();
            if (sid==null){
                KesionJS.Alert("请先选择要发送手机短信的用户！");
            }else{
                location.href='KS.LogSms.aspx?action=send&userid='+sid;
            }
        }
        function doSendMessage(){
            var sid = GetMyIds();
            if (sid==null){
                KesionJS.Alert("请先选择要发送站内消息的用户！");
            }else{
                location.href='KS.UserMessage.aspx?action=send&userid='+sid;
            }
        }
        function doSetVIP(userid){
            top.openWin('VIP有效期设置','User/KS.AddMoney.aspx?action=setVip&userID='+userid,true,750,400);
            }

    </script>



    <asp:Repeater ID="RptList" runat="server">
          <HeaderTemplate>
          <table width="99%" class="CTable"  border="0" cellpadding="1" cellspacing="1">
              <tr class="CTitle">
               <td align="center"><b>选择</b></td>
               <td align="center"><b>UserID</b></td>
               <td align="center"><b>用户名</b></td>
               <td align="center"><b>用户组</b></td>
               <td align="center" style="display:none"><b>计费方式</b></td>
               <td align="center"><b>财富</b></td>
               <td align="center"><b>最后登录IP</b></td>
               <td align="center"><b>最后登录时间</b></td>
               <td align="center"><b>状态</b></td>
               <td align="center"><b>VIP有效时间</b></td>
               <td align="center"><b>业务员</b></td>
               <td align="center"><b>修改</b></td>
               <td align="center"><b>删除</b></td>
               <td align="center"><b>充值</b></td>
              </tr>
          </HeaderTemplate>
         <ItemTemplate>
           <tr onmouseover="this.className='CtrMouseOver'" onmouseout="this.className='CtrMouseOut'" onclick="chk(this);loadUserDetail(<%#Eval("UserID")%>,-1,1)">
                <td class="Ctd" style="text-align:center" onclick="doNone(event)"> <input type="checkbox"  name="ids" id="ids" value="<%#Eval("userid") %>" /></td>
                <td class="Ctd" style="text-align:center"><%# Eval("userid") %> </td>
                <td class="Ctd" style="text-align:left"><a  onclick="doNone(event);" href='KS.User.aspx?action=show&userid=<%#Eval("UserID") %>' title="查看用户[<%# Eval("username") %>]资料"><%# Eval("username") %></a> </td>
                <td class="Ctd" style="text-align:center"><%# Eval("groupname") %> </td>
                <td class="Ctd" style="text-align:center;display:none;"><%# GetChargeType(Utils.StrToInt(Convert.ToString(Eval("Chargetype")))) %> </td>
                <td class="Ctd" style="text-align:center">
                     <a  onclick="doNone(event);" href='KS.LogMoney.aspx?username=<%#Eval("UserName") %>'><span style="color:Green"><%# Math.Round(Convert.ToDouble(Eval("money")),2).ToString() %></span> <%=MyCache.GetCurrencyUnit %></a>/
                <%if (MyCache.GetShopCommonConfig(98) == "1")
                    { %> <a  onclick="doNone(event);" href='KS.Consumer.aspx?username=<%#Eval("UserName") %>'><%#GetPointOrEdays(Convert.ToInt32(Eval("chargetype")),Convert.ToInt32(Eval("point")),Convert.ToInt32(Eval("edays")),Convert.ToDateTime(Eval("begindate"))) %></a>/<%} %><a  onclick="doNone(event);" href='KS.LogScore.aspx?username=<%#Eval("UserName") %>' title="总积分<%# Eval("Score") %>分，已消费<%# Eval("ScoreHasUse") %>分，可用积分<%# Convert.ToInt32(Eval("Score"))-Convert.ToInt32(Eval("ScoreHasUse")) %>分"><span style="color:blue"><%# Eval("score") %></span>分</a>
                </td>
                <td class="Ctd" style="text-align:center"><span class="tips"><%# Eval("lastloginip")%></span></td>
                <td class="Ctd" style="text-align:center"><span class="tips"><%# Eval("lastlogintime") %></span></td>
                <td class="Ctd" style="text-align:center"><%# ShowUserStatus(Convert.ToInt32(Eval("locked"))) %>  </td>
                <td class="Ctd" style="text-align:center"> 
                    <span class="tips"><a  href="javascript:;" class="link-color" onClick="doSetVIP(<%#Eval("UserID") %>);doNone(event);" > <%# GetVipTips(Eval("LoadType").ToString(),Eval("EndDate").ToString())  %> </a></span>
 </td>
                <td class="Ctd" style="text-align:center">  <%# string.IsNullOrEmpty(Convert.ToString(Eval("agent")))?"-":Eval("agent") %></td>
                <td class="Ctd" style="text-align:center">  
                    
                    <a onclick="doNone(event);" href="KS.UserAdd.aspx?page=<%=CurrPage %>&userid=<%#Eval("userid") %>" class="edit"></a>
</td>
                <td class="Ctd" style="text-align:center">  <a href="javascript:;" onclick="delUser(<%#Eval("userid") %>,this);doNone(event);" class="delete" title="删除" /></a></td>
                <td class="Ctd" style="text-align:center">  <a href="#" class="money" title="充值" onclick='parent.openWin("给用户充值","User/KS.AddMoney.aspx?userID=<%#Eval("userID") %>",true,750,500);doNone(event);return false'>充</a>
</td>
              </tr>
              <tr id="s<%# Eval("userid") %>" style="display:none;">
                 <td colspan="20" id="ss<%# Eval("userid") %>" style="background:#F7FBFE"></td>
             </tr>
       </ItemTemplate>
             <FooterTemplate>
              <tr class="tdbg emptycss" style="display:<%# bool.Parse((RptList.Items.Count==0).ToString())?"":"none"%>">
                <td class="Ctd" style="text-align:center" colspan="12">
                    <%=emptyTips %>
                </td>
               </tr> 
             
           </table>
          </FooterTemplate>
</asp:Repeater>



    
<asp:Panel ID="Panel1" runat="server" Height="30px">
              <div style="margin-top:2px;overflow:hidden;"></div>
              &nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">全部选中</label>
                 &nbsp;&nbsp;&nbsp;<strong>操作:</strong> 
                   <input type="radio" name="optype" value="1" onClick="jQuery('#GroupID').attr('disabled',true)" id="del" checked /><label for="del">删除</label>
                 &nbsp;<input type="radio" name="optype" value="2" onClick="jQuery('#GroupID').attr('disabled',true)" id="lock"/><label for="lock">锁定</label>
                &nbsp;<input type="radio" name="optype" value="3" onClick="jQuery('#GroupID').attr('disabled',true)" id="unlock"/><label for="unlock">解锁</label>
               &nbsp;<input type="radio" name="optype" value="4" onClick="jQuery('#GroupID').attr('disabled',false)" id="moveusergroup"/><label for="moveusergroup">移动到</label>
               &nbsp;<select ID="GroupID" disabled="false" name="GroupID">
                  <%=MyCache.GetUserGroupCache() %>
              </select>
               <asp:Button ID="ExecuteButton" runat="server" Text="开始执行" OnClick="ExecuteButton_Click" />
               <input type="button" value="发送邮件" class="button" onclick="doSendMail()" />
               <input type="button" value="发送手机短信" class="button" onclick="doSendSms()" />
               <input type="button" value="发送站内消息" class="button" onclick="doSendMessage()" />
               <input type="button" value="批量充值" class="button" onclick="doCZ()" />
               <input type="button" value="打印" class="button" onclick="window.print()" />
</asp:Panel>
  <br />

</asp:Panel>

<asp:Panel ID="PanelShow" runat="server" Visible="false">
     <div class="tabs_header">
    <ul class="tabs">
        <li<%=KSCMS.S("showType")==""?" class='active'":string.Empty %>><a href="KS.User.aspx?<%=UtilsQueryParam.Get("showtype") %>"><span>基本信息</span></a></li>
        <%if (DataFactoryUser.Exists("KS_User", "agent='" + drr["username"].ToString() + "'"))
            { %>
        <li<%=KSCMS.S("showType")=="3"?" class='active'":string.Empty %>><a href="KS.User.aspx?showType=3&<%=UtilsQueryParam.Get("showtype") %>"><span>客户列表</span></a></li>
        <li<%=KSCMS.S("showType")=="4"?" class='active'":string.Empty %>><a href="KS.User.aspx?showType=4&<%=UtilsQueryParam.Get("showtype") %>"><span>客户订单记录</span></a></li>
            <%} %>
        <li<%=KSCMS.S("showType")=="5"?" class='active'":string.Empty %>><a href="KS.User.aspx?showType=5&<%=UtilsQueryParam.Get("showtype") %>"><span>订单记录</span></a></li>
        <li<%=KSCMS.S("showType")=="1"?" class='active'":string.Empty %>><a href="KS.User.aspx?showType=1&<%=UtilsQueryParam.Get("showtype") %>"><span>登录记录</span></a></li>
        <li<%=KSCMS.S("showType")=="2"?" class='active'":string.Empty %>><a href="KS.User.aspx?showType=2&<%=UtilsQueryParam.Get("showtype") %>"><span>手机绑定记录</span></a></li>
    </ul>
    </div>
    <%if (string.IsNullOrEmpty(KSCMS.S("showtype")))
    { %>
     <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
   <%} %>

    <asp:Panel ID="UserPanel" runat="server" Visible="false">
        查找=>时间段：从<asp:TextBox ID="TxtUserBeginDate" Width="120" runat="server" onclick="WdatePicker({dateFmt:&#39;yyyy-MM-dd&#39;});" CssClass="textbox Wdate"/>至<asp:TextBox Width="120" ID="TxtUserEndDate" runat="server" onclick="WdatePicker({dateFmt:&#39;yyyy-MM-dd&#39;});" CssClass="textbox Wdate"/>
        <asp:CheckBox ID="CkbSearchLike" runat="server" Text="模糊搜索" /> <asp:TextBox ID="TxtKeyWords" Width="150" runat="server" CssClass="textbox" /> <asp:Button ID="BtnSearchUser" runat="server" CssClass="button" Text="搜索" OnClick="BtnSearchUser_Click" />
        <input type="button" class="button" value="打印本页" onclick="PrintPage('PrintBox')" />
         <div style="height:10px;"></div>
        
         <div id="PrintBox">
          <asp:Repeater ID="RptUserList" runat="server" >
          <HeaderTemplate>
          <table width="99%" class="CTable nTable"  border="0" cellpadding="1" cellspacing="1">
              <tr class="CTitle">
               <td align="center"><b>ID</b></td>
               <td align="center"><b>用户名</b></td>
               <td align="center"><b>用户组</b></td>
               <td align="center"><b>财富</b></td>
               <td align="center"><b>累计订单量</b></td>
               <td align="center"><b>累计金额(元)</b></td>
               <td align="center" nowrap><b>最近登录IP</b></td>
               <td align="center" nowrap><b>状态</b></td>
               <td align="center" nowrap><b>修改</b></td>
               <td align="center" nowrap><b>删除</b></td>
              </tr>
          </HeaderTemplate>
         <ItemTemplate>
           <tr onmouseover="this.className='CtrMouseOver'" onmouseout="this.className='CtrMouseOut'" onclick="loadUserDetail(<%#Eval("UserID")%>,-1,1)">
                <td class="Ctd" style="text-align:center"> <%# Eval("UserID") %> </td>
                <td class="Ctd"> <%# Eval("UserName") %> </td>
                <td class="Ctd" style="text-align:center"> <%# Eval("GroupName") %> </td>
                <td class="Ctd" style="text-align:center"><a href='KS.LogMoney.aspx?username=<%#Eval("UserName") %>'><span style="color:Green"><%# Math.Round(Convert.ToDouble(Eval("money")),2).ToString() %></span> <%=MyCache.GetCurrencyUnit %></a>/
                <%if (MyCache.GetShopCommonConfig(98) == "1")
                    { %> <a href='KS.Consumer.aspx?username=<%#Eval("UserName") %>'><%#GetPointOrEdays(Convert.ToInt32(Eval("chargetype")),Convert.ToInt32(Eval("point")),Convert.ToInt32(Eval("edays")),Convert.ToDateTime(Eval("begindate"))) %></a>/<%} %><a href='KS.LogScore.aspx?username=<%#Eval("UserName") %>' title="总积分<%# Eval("Score") %>分，已消费<%# Eval("ScoreHasUse") %>分，可用积分<%# Convert.ToInt32(Eval("Score"))-Convert.ToInt32(Eval("ScoreHasUse")) %>分"><span style="color:blue"><%# Eval("score") %></span>分</a></td>
                <td class="Ctd" style="text-align:center"> <%# DataFactory.GetOnlyValue("select count(1) From KS_ProOrder Where MoneyReceipt>0 and username='"+Eval("UserName")+"'") %> </td>
                <td class="Ctd" style="text-align:center"> <%# Kesion.APPCode.Public.ReturnShopPrice(DataFactory.GetOnlyValue("select sum(NoUseCouponMoney) From KS_ProOrder Where MoneyReceipt>0 and username='"+Eval("UserName")+"'")) %> </td>
                <td class="Ctd" style="text-align:center"> <%# Eval("LastLoginIP") %> </td>
                <td class="Ctd" style="text-align:center"> <%# ShowUserStatus(Utils.StrToInt(Eval("locked"))) %> </td>
                <td class="Ctd" style="text-align:center" onclick="doNone(event)"> <input type="button" class="button" value="修改" onclick="location.href='KS.UserAdd.aspx?userid=<%# Eval("userid")%>&agentid=<%=drr["userid"].ToString()%>';" /> </td>
                <td class="Ctd" style="text-align:center" onclick="doNone(event)"> <input type="button" class="button" value="删除" onclick="delUser(<%# Eval("UserID")%>,this)" /></td>             
              </tr>

             <tr id="s<%# Eval("userid") %>" style="display:none;">
                 <td colspan="20" id="ss<%# Eval("userid") %>" style="background:#F7FBFE"></td>
             </tr>
       </ItemTemplate>
             <FooterTemplate>
              <tr class="tdbg emptycss" style="display:<%# bool.Parse((RptUserList.Items.Count==0).ToString())?"":"none"%>">
                <td class="Ctd" style="text-align:center" colspan="12">
                  还没有任何的用户！
                </td>
               </tr> 
           </table>
          </FooterTemplate>
</asp:Repeater></div>
    </asp:Panel>

     <asp:Panel ID="ShopOrderPanel" runat="server" Visible="false">
         查找=>时间段：从<asp:TextBox ID="TxtOrderBeginDate" Width="120" runat="server" onclick="WdatePicker({dateFmt:&#39;yyyy-MM-dd&#39;});" CssClass="textbox Wdate"/>至<asp:TextBox Width="120" ID="TxtOrderEndDate" runat="server" onclick="WdatePicker({dateFmt:&#39;yyyy-MM-dd&#39;});" CssClass="textbox Wdate"/>
        <asp:CheckBox ID="CkbOrderLike" runat="server" Text="模糊搜索" /> <asp:TextBox ID="TxtOrderKeyWord" Width="150" runat="server" CssClass="textbox" /> <asp:Button ID="Button2" runat="server" CssClass="button" Text="搜索" OnClick="BtnSearchOrder_Click" />
        <input type="button" class="button" value="打印本页" onclick="PrintPage('PrintBox')" />
         <div style="height:10px;"></div>
         <div id="PrintBox">
          <asp:Repeater ID="RptShopOrder" runat="server" onitemdatabound="Repeater1_ItemDataBound">
          <HeaderTemplate>
          <table width="99%" class="CTable nTable"  border="0" cellpadding="1" cellspacing="1">
              <tr class="CTitle">
               <td align="center"><b>采购时间</b></td>
               <td align="center"><b>订单编号</b></td>
               <td align="center"><b>用户名</b></td>
               <td align="center"><b>数量</b></td>
               <td align="center"><b>金额(元)</b></td>
              </tr>
          </HeaderTemplate>
         <ItemTemplate>
           <tr onmouseover="this.className='CtrMouseOver'" onmouseout="this.className='CtrMouseOut'">
                <td class="Ctd" style="text-align:center"> <%# Eval("Inputtime") %> </td>
                <td class="Ctd" style="text-align:center"> <%# Eval("orderid") %> </td>
                <td class="Ctd" style="text-align:center"> <%# Eval("username") %> </td>
                <td class="Ctd" style="text-align:center"> <%# DataFactory.GetOnlyValue("select sum(num) From KS_ProOrderItem Where orderid='"+Eval("OrderID")+"'") %> </td>
                <td class="Ctd" style="text-align:center"> <%# Kesion.APPCode.Public.ReturnShopPrice(Convert.ToString(Eval("NoUseCouponMoney"))) %> </td>
              </tr>
       </ItemTemplate>
             <FooterTemplate>
              <tr class="tdbg emptycss" style="display:<%# bool.Parse((RptShopOrder.Items.Count==0).ToString())?"":"none"%>">
                <td class="Ctd" style="text-align:center" colspan="12">
                  还没有任何的订单！
                </td>
               </tr> 
              <tr class="tdbg" style="display:<%# bool.Parse((RptShopOrder.Items.Count>0).ToString())?"":"none"%>">
                <td class="Ctd" style="text-align:right" colspan="4">
                  本页合计：
                </td>
                  <td class="Ctd price-color" style="text-align:center; font-size:18px">
                      <%=MyCache.GetCurrencySymbol %><%=Kesion.APPCode.Public.ReturnShopPrice(pageTotalMoney) %>
                  </td>
               </tr> 
                 <tr class="tdbg" style="display:<%# bool.Parse((RptShopOrder.Items.Count>0).ToString())?"":"none"%>">
                <td class="Ctd" style="text-align:right" colspan="4">
                  所有合计：
                </td>
                  <td class="Ctd price-color" style="text-align:center; font-size:18px">
                      <%=MyCache.GetCurrencySymbol %><%=Kesion.APPCode.Public.ReturnShopPrice(DataFactory.GetOnlyValue("Select Sum(NoUseCouponMoney) From KS_ProOrder o  inner JOIN  KS_User u on U.username=o.username"+param)) %>
                  </td>
               </tr> 
           </table>
          </FooterTemplate>
</asp:Repeater>
        </div>
     </asp:Panel>


     <asp:Panel ID="OrderPanel" runat="server" Visible="false">
         查找=>时间段：从<asp:TextBox ID="TxtOrderRecordBeginDate" Width="120" runat="server" onclick="WdatePicker({dateFmt:&#39;yyyy-MM-dd&#39;});" CssClass="textbox Wdate"/>至<asp:TextBox Width="120" ID="TxtOrderRecordEndDate" runat="server" onclick="WdatePicker({dateFmt:&#39;yyyy-MM-dd&#39;});" CssClass="textbox Wdate"/>
        <asp:CheckBox ID="CkbOrderRecordLike" runat="server" Text="模糊搜索" /> <asp:TextBox ID="TxtOrderRecordKey" Width="150" runat="server" CssClass="textbox" /> <asp:Button ID="Button3" runat="server" CssClass="button" Text="搜索" OnClick="BtnSearchOrderRecord_Click" />
        <input type="button" class="button" value="打印本页" onclick="PrintPage('PrintBox')" />
         <div style="height:10px;"></div>
         <div id="PrintBox">
          <asp:Repeater ID="RptOrderList" runat="server" onitemdatabound="Repeater1_ItemDataBound">
          <HeaderTemplate>
          <table width="99%" class="CTable nTable"  border="0" cellpadding="1" cellspacing="1">
              <tr class="CTitle">
               <td align="center"><b>采购时间</b></td>
               <td align="center"><b>订单编号</b></td>
               <td align="center"><b>用户名</b></td>
               <td align="center"><b>数量</b></td>
               <td align="center"><b>金额(元)</b></td>
              </tr>
          </HeaderTemplate>
         <ItemTemplate>
           <tr onmouseover="this.className='CtrMouseOver'" onmouseout="this.className='CtrMouseOut'">
                <td class="Ctd" style="text-align:center"> <%# Eval("Inputtime") %> </td>
                <td class="Ctd" style="text-align:center"> <%# Eval("orderid") %> </td>
                <td class="Ctd" style="text-align:center"> <%# Eval("username") %> </td>
                <td class="Ctd" style="text-align:center"> <%# DataFactory.GetOnlyValue("select sum(num) From KS_ProOrderItem Where orderid='"+Eval("OrderID")+"'") %> </td>
                <td class="Ctd" style="text-align:center"> <%# Kesion.APPCode.Public.ReturnShopPrice(Convert.ToString(Eval("NoUseCouponMoney"))) %> </td>
              </tr>
       </ItemTemplate>
             <FooterTemplate>
              <tr class="tdbg emptycss" style="display:<%# bool.Parse((RptOrderList.Items.Count==0).ToString())?"":"none"%>">
                <td class="Ctd" style="text-align:center" colspan="12">
                  还没有任何的订单！
                </td>
               </tr> 
              <tr class="tdbg" style="display:<%# bool.Parse((RptOrderList.Items.Count>0).ToString())?"":"none"%>">
                <td class="Ctd" style="text-align:right" colspan="4">
                  本页合计：
                </td>
                  <td class="Ctd price-color" style="text-align:center; font-size:18px">
                      <%=MyCache.GetCurrencySymbol %><%=Kesion.APPCode.Public.ReturnShopPrice(pageTotalMoney) %>
                  </td>
               </tr> 
                 <tr class="tdbg" style="display:<%# bool.Parse((RptOrderList.Items.Count>0).ToString())?"":"none"%>">
                <td class="Ctd" style="text-align:right" colspan="4">
                  所有合计：
                </td>
                  <td class="Ctd price-color" style="text-align:center; font-size:18px">
                      <%=MyCache.GetCurrencySymbol %><%=Kesion.APPCode.Public.ReturnShopPrice(DataFactory.GetOnlyValue("Select Sum(NoUseCouponMoney) From KS_ProOrder "+param)) %>
                  </td>
               </tr> 
           </table>
          </FooterTemplate>
</asp:Repeater>
        </div>
     </asp:Panel>



    <asp:Panel ID="LogPanel" runat="server" Visible="false">
     <KS:KSGV ID="LoginLogView" runat="server" Width="99%" CssClass="CTable nTable" PagerType="CustomNumeric" OnRowDataBound="List_RowDataBoundLog" AutoGenerateColumns="False" EmptyDataText="没用登录记录！" GridLines="None">
        <Columns>
            <asp:TemplateField HeaderText="登录设备">
                <itemstyle width="45px" HorizontalAlign="Center" />
                <itemtemplate>
                     <span style="color:#999;"><%# Utils.OrderDeviceName(Utils.StrToInt(Eval("DeviceType"))) %></span>
             </itemtemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="username" HeaderText="用户名" />
            <asp:BoundField DataField="adddate" HeaderText="登录时间">
            <itemstyle width="120px" HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="UserIP" HeaderText="登录IP">
            <itemstyle width="100px" HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="备注说明">
            <itemstyle HorizontalAlign="center" />
            <itemtemplate>
                <%# Eval("Remark") %>
            </itemtemplate>
            </asp:TemplateField>
        </Columns>
        <EmptyDataRowStyle CssClass="emptycss" />
        <HeaderStyle CssClass="CTitle" />
    </KS:KSGV>
         <div style="border:1px dashed #cccccc; background-color:#f0f9fe; margin-top:30px;padding:10px; text-align: left; font-size: 12px;">
         <strong>特别提醒：</strong> 如果登录记录太多，影响了系统性能，可以删除一定时间段前的记录以加快速度。 
         <div>
         <strong>删除范围：</strong><asp:RadioButtonList ID="RdbDelType" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
          <asp:ListItem Value="1">10天前</asp:ListItem>
          <asp:ListItem Value="2">1个月前</asp:ListItem>
          <asp:ListItem Value="3">2个月前</asp:ListItem>
          <asp:ListItem Value="4">3个月前</asp:ListItem>
          <asp:ListItem Value="5">6个月前</asp:ListItem>
          <asp:ListItem Value="6" Selected="True">1年前</asp:ListItem>
             </asp:RadioButtonList>
             <asp:Button ID="BtnDel" runat="server" Text="执行删除" OnClick="BtnDel_Click" CssClass="button" /></div>
         </div>
     </asp:Panel>

    <asp:Panel ID="LogMobilePanel" runat="server" Visible="false">
     <KS:KSGV ID="LogMobileView" runat="server" Width="99%" CssClass="CTable nlable" PagerType="CustomNumeric" OnRowDataBound="List_RowDataBoundMobileLog" AutoGenerateColumns="False" EmptyDataText="没有手机绑定记录！" GridLines="None">
        <Columns>
            <asp:TemplateField HeaderText="绑定设备">
                <itemstyle width="45px" HorizontalAlign="Center" />
                <itemtemplate>
                     <span style="color:#999;"><%# Utils.OrderDeviceName(Utils.StrToInt(Eval("DeviceType"))) %></span>
             </itemtemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="username" HeaderText="用户名" />
            <asp:BoundField DataField="adddate" HeaderText="绑定时间">
            <itemstyle width="120px" HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="UserIP" HeaderText="绑定时IP">
            <itemstyle width="100px" HorizontalAlign="Center" />
            </asp:BoundField>
            

            <asp:TemplateField HeaderText="绑定手机号">
            <itemstyle HorizontalAlign="center" />
            <itemtemplate>
                <%# Eval("mobile") %>
            </itemtemplate>
            </asp:TemplateField>
        </Columns>
        <EmptyDataRowStyle CssClass="emptycss" />
        <HeaderStyle CssClass="CTitle" />
    </KS:KSGV>
         <div style="border:1px dashed #cccccc; background-color:#f0f9fe; margin-top:30px;padding:10px; text-align: left; font-size: 12px;">
         <strong>特别提醒：</strong> 如果手机绑定记录太多，影响了系统性能，可以删除一定时间段前的记录以加快速度。 
         <div>
         <strong>删除范围：</strong><asp:RadioButtonList ID="RdbMobileDelType" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
          <asp:ListItem Value="1">10天前</asp:ListItem>
          <asp:ListItem Value="2">1个月前</asp:ListItem>
          <asp:ListItem Value="3">2个月前</asp:ListItem>
          <asp:ListItem Value="4">3个月前</asp:ListItem>
          <asp:ListItem Value="5">6个月前</asp:ListItem>
          <asp:ListItem Value="6" Selected="True">1年前</asp:ListItem>
             </asp:RadioButtonList>
             <asp:Button ID="Button1" runat="server" Text="执行删除" OnClick="BtnMobileDel_Click" CssClass="button" /></div>
         </div>
     </asp:Panel>

</asp:Panel>
     <%if (KSCMS.S("action") == "show" && string.IsNullOrEmpty(KSCMS.S("showtype"))){ } else {%>
 <KS:Page ID="Page1" runat="server" />
     <%} %>
</div>

</asp:Content>

