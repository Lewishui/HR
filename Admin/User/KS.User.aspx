<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_User" Title="�û�����" Codebehind="KS.User.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.BLL" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Xml" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<script>
     function delUser(userid,o){
                if (confirm('��ܰ��ʾ��Ϊ����ɾ���û�����ע���ɾ���û�ͬ���Ƶ��û����������������ͻ(���û���ֵ��¼��)��ǿ�ҽ���ִ�С���������Ҳ��ɾ������ԭ������ȷ��ɾ���û���?')){
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
                                alert("�Բ����û���չ�����ߣ�������ɾ����");
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
<div id="manage_top" class="toptitle menu_top_fixed">&nbsp;<strong>���ٲ����û���</strong>
     <%if (!string.IsNullOrEmpty(KSCMS.S("groupname"))){ %>
    �û���[<%=KSCMS.S("groupname") %>]
    <%}else if (!string.IsNullOrEmpty(KSCMS.S("depart"))){%>
    ����[<%=KSCMS.S("depart") %>]
   
    <%  }else{ %>
<a href="KS.User.aspx">�����û�</a> | <a href="KS.User.aspx?UserType=1">�������û�</a> | <a href="KS.User.aspx?UserType=2">���й���Ա</a> | <a href="KS.User.aspx?UserType=3">����֤</a> | <a href="KS.User.aspx?UserType=4">���ʼ�����</a>
        | <a href="KS.User.aspx?UserType=5">24Сʱ�ڵ�¼</a>
        | <a href="KS.User.aspx?UserType=6">24Сʱ��ע��</a>
        | <a href="KS.User.aspx?UserType=7">VIPδ����</a>
        | <a href="KS.User.aspx?UserType=8">VIP�ѹ���</a>

    <%} %>
   <span style="float:right;padding-right:20px">���û�<span style='color:red'><%=DataFactoryUser.GetOnlyValue("select count(1) From KS_User") %></span>λ��24Сʱ������<span style='color:red'><%=DataFactoryUser.GetOnlyValue("select count(1) From KS_User Where DateDiff(day,regdate,getdate())<1") %></span>λ��24Сʱ�ڵ�¼<span style='color:red'><%=DataFactoryUser.GetOnlyValue("select count(1) From KS_User Where DateDiff(day,lastlogintime,getdate())<1") %></span>λ</span>
</div>
 <div class="menu_top_fixed_height"></div>   
 <div class="content-area">
    <div class="myTitle">
        <%if (KSCMS.S("action") == "show")
            { %><strong>�鿴�û�[<%=drr["username"].ToString() %>]��Ϣ</strong>
        <%}else { %>
    	�����û�����
      <div class="quickSearch">
        <strong>����������</strong>
        <asp:DropDownList ID="DrpSearchType" runat="server">
          <asp:ListItem Value="0" Selected="True">�û���</asp:ListItem>
          <asp:ListItem Value="5">�Ƽ���</asp:ListItem>
          <asp:ListItem Value="1">����</asp:ListItem>
          <asp:ListItem Value="2">�û�ID</asp:ListItem>
          <asp:ListItem Value="3">�ֻ�����</asp:ListItem>
          <asp:ListItem Value="4">��������</asp:ListItem>
        </asp:DropDownList> <strong>�ؼ��֣�</strong><asp:TextBox runat="server" Width="150px" ID="TxtKeyWord" CssClass="textbox" /> 
           <b onclick="SetDate()" class="link-color">ע��ʱ�䣿</b>
                   <span id="showsearchdate"<%if (this.TxtSearchBeginDate.Text==""){ %> style="display:none"<%} %>>
                   <asp:TextBox ID="TxtSearchBeginDate" Width="100px" runat="server"  onclick="WdatePicker({dateFmt:&#39;yyyy-MM-dd&#39;});" CssClass="textbox Wdate"></asp:TextBox>��
                   <asp:TextBox ID="TxtSearchEndDate" Width="100px" runat="server" onclick="WdatePicker({dateFmt:&#39;yyyy-MM-dd&#39;});"  CssClass="textbox Wdate"></asp:TextBox>
                   </span>
            <asp:Button ID="BtnSearch" runat="server" CssClass="button" Text="�����û�"   onclick="BtnSearch_Click" />
        </div>
         <%} %>
     </div>   
   
          <% if (KSCMS.S("action")!="show"){%>
      <div class="tabs_header">
        <ul class="tabs">
        <li <%=string.IsNullOrEmpty(KSCMS.S("gid"))?" class='active'":"" %>><a href="KS.User.aspx"><span>�����û�</span></a></li>
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
                KesionJS.Alert("����ѡ��Ҫ��ֵ���û���");
           }else{
                parent.openWin("���û���ֵ","User/KS.AddMoney.aspx?userID="+sid,true,750,500);
            }
        }
        function doSendMail(){
            var sid = GetMyIds();
            if (sid==null){
                KesionJS.Alert("����ѡ��Ҫ�����ʼ����û���");
            }else{
                location.href='KS.UserMail.aspx?userid='+sid;
            }
        }
        function doSendSms(){
            var sid = GetMyIds();
            if (sid==null){
                KesionJS.Alert("����ѡ��Ҫ�����ֻ����ŵ��û���");
            }else{
                location.href='KS.LogSms.aspx?action=send&userid='+sid;
            }
        }
        function doSendMessage(){
            var sid = GetMyIds();
            if (sid==null){
                KesionJS.Alert("����ѡ��Ҫ����վ����Ϣ���û���");
            }else{
                location.href='KS.UserMessage.aspx?action=send&userid='+sid;
            }
        }
        function doSetVIP(userid){
            top.openWin('VIP��Ч������','User/KS.AddMoney.aspx?action=setVip&userID='+userid,true,750,400);
            }

    </script>



    <asp:Repeater ID="RptList" runat="server">
          <HeaderTemplate>
          <table width="99%" class="CTable"  border="0" cellpadding="1" cellspacing="1">
              <tr class="CTitle">
               <td align="center"><b>ѡ��</b></td>
               <td align="center"><b>UserID</b></td>
               <td align="center"><b>�û���</b></td>
               <td align="center"><b>�û���</b></td>
               <td align="center" style="display:none"><b>�Ʒѷ�ʽ</b></td>
               <td align="center"><b>�Ƹ�</b></td>
               <td align="center"><b>����¼IP</b></td>
               <td align="center"><b>����¼ʱ��</b></td>
               <td align="center"><b>״̬</b></td>
               <td align="center"><b>VIP��Чʱ��</b></td>
               <td align="center"><b>ҵ��Ա</b></td>
               <td align="center"><b>�޸�</b></td>
               <td align="center"><b>ɾ��</b></td>
               <td align="center"><b>��ֵ</b></td>
              </tr>
          </HeaderTemplate>
         <ItemTemplate>
           <tr onmouseover="this.className='CtrMouseOver'" onmouseout="this.className='CtrMouseOut'" onclick="chk(this);loadUserDetail(<%#Eval("UserID")%>,-1,1)">
                <td class="Ctd" style="text-align:center" onclick="doNone(event)"> <input type="checkbox"  name="ids" id="ids" value="<%#Eval("userid") %>" /></td>
                <td class="Ctd" style="text-align:center"><%# Eval("userid") %> </td>
                <td class="Ctd" style="text-align:left"><a  onclick="doNone(event);" href='KS.User.aspx?action=show&userid=<%#Eval("UserID") %>' title="�鿴�û�[<%# Eval("username") %>]����"><%# Eval("username") %></a> </td>
                <td class="Ctd" style="text-align:center"><%# Eval("groupname") %> </td>
                <td class="Ctd" style="text-align:center;display:none;"><%# GetChargeType(Utils.StrToInt(Convert.ToString(Eval("Chargetype")))) %> </td>
                <td class="Ctd" style="text-align:center">
                     <a  onclick="doNone(event);" href='KS.LogMoney.aspx?username=<%#Eval("UserName") %>'><span style="color:Green"><%# Math.Round(Convert.ToDouble(Eval("money")),2).ToString() %></span> <%=MyCache.GetCurrencyUnit %></a>/
                <%if (MyCache.GetShopCommonConfig(98) == "1")
                    { %> <a  onclick="doNone(event);" href='KS.Consumer.aspx?username=<%#Eval("UserName") %>'><%#GetPointOrEdays(Convert.ToInt32(Eval("chargetype")),Convert.ToInt32(Eval("point")),Convert.ToInt32(Eval("edays")),Convert.ToDateTime(Eval("begindate"))) %></a>/<%} %><a  onclick="doNone(event);" href='KS.LogScore.aspx?username=<%#Eval("UserName") %>' title="�ܻ���<%# Eval("Score") %>�֣�������<%# Eval("ScoreHasUse") %>�֣����û���<%# Convert.ToInt32(Eval("Score"))-Convert.ToInt32(Eval("ScoreHasUse")) %>��"><span style="color:blue"><%# Eval("score") %></span>��</a>
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
                <td class="Ctd" style="text-align:center">  <a href="javascript:;" onclick="delUser(<%#Eval("userid") %>,this);doNone(event);" class="delete" title="ɾ��" /></a></td>
                <td class="Ctd" style="text-align:center">  <a href="#" class="money" title="��ֵ" onclick='parent.openWin("���û���ֵ","User/KS.AddMoney.aspx?userID=<%#Eval("userID") %>",true,750,500);doNone(event);return false'>��</a>
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
              &nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">ȫ��ѡ��</label>
                 &nbsp;&nbsp;&nbsp;<strong>����:</strong> 
                   <input type="radio" name="optype" value="1" onClick="jQuery('#GroupID').attr('disabled',true)" id="del" checked /><label for="del">ɾ��</label>
                 &nbsp;<input type="radio" name="optype" value="2" onClick="jQuery('#GroupID').attr('disabled',true)" id="lock"/><label for="lock">����</label>
                &nbsp;<input type="radio" name="optype" value="3" onClick="jQuery('#GroupID').attr('disabled',true)" id="unlock"/><label for="unlock">����</label>
               &nbsp;<input type="radio" name="optype" value="4" onClick="jQuery('#GroupID').attr('disabled',false)" id="moveusergroup"/><label for="moveusergroup">�ƶ���</label>
               &nbsp;<select ID="GroupID" disabled="false" name="GroupID">
                  <%=MyCache.GetUserGroupCache() %>
              </select>
               <asp:Button ID="ExecuteButton" runat="server" Text="��ʼִ��" OnClick="ExecuteButton_Click" />
               <input type="button" value="�����ʼ�" class="button" onclick="doSendMail()" />
               <input type="button" value="�����ֻ�����" class="button" onclick="doSendSms()" />
               <input type="button" value="����վ����Ϣ" class="button" onclick="doSendMessage()" />
               <input type="button" value="������ֵ" class="button" onclick="doCZ()" />
               <input type="button" value="��ӡ" class="button" onclick="window.print()" />
</asp:Panel>
  <br />

</asp:Panel>

<asp:Panel ID="PanelShow" runat="server" Visible="false">
     <div class="tabs_header">
    <ul class="tabs">
        <li<%=KSCMS.S("showType")==""?" class='active'":string.Empty %>><a href="KS.User.aspx?<%=UtilsQueryParam.Get("showtype") %>"><span>������Ϣ</span></a></li>
        <%if (DataFactoryUser.Exists("KS_User", "agent='" + drr["username"].ToString() + "'"))
            { %>
        <li<%=KSCMS.S("showType")=="3"?" class='active'":string.Empty %>><a href="KS.User.aspx?showType=3&<%=UtilsQueryParam.Get("showtype") %>"><span>�ͻ��б�</span></a></li>
        <li<%=KSCMS.S("showType")=="4"?" class='active'":string.Empty %>><a href="KS.User.aspx?showType=4&<%=UtilsQueryParam.Get("showtype") %>"><span>�ͻ�������¼</span></a></li>
            <%} %>
        <li<%=KSCMS.S("showType")=="5"?" class='active'":string.Empty %>><a href="KS.User.aspx?showType=5&<%=UtilsQueryParam.Get("showtype") %>"><span>������¼</span></a></li>
        <li<%=KSCMS.S("showType")=="1"?" class='active'":string.Empty %>><a href="KS.User.aspx?showType=1&<%=UtilsQueryParam.Get("showtype") %>"><span>��¼��¼</span></a></li>
        <li<%=KSCMS.S("showType")=="2"?" class='active'":string.Empty %>><a href="KS.User.aspx?showType=2&<%=UtilsQueryParam.Get("showtype") %>"><span>�ֻ��󶨼�¼</span></a></li>
    </ul>
    </div>
    <%if (string.IsNullOrEmpty(KSCMS.S("showtype")))
    { %>
     <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
   <%} %>

    <asp:Panel ID="UserPanel" runat="server" Visible="false">
        ����=>ʱ��Σ���<asp:TextBox ID="TxtUserBeginDate" Width="120" runat="server" onclick="WdatePicker({dateFmt:&#39;yyyy-MM-dd&#39;});" CssClass="textbox Wdate"/>��<asp:TextBox Width="120" ID="TxtUserEndDate" runat="server" onclick="WdatePicker({dateFmt:&#39;yyyy-MM-dd&#39;});" CssClass="textbox Wdate"/>
        <asp:CheckBox ID="CkbSearchLike" runat="server" Text="ģ������" /> <asp:TextBox ID="TxtKeyWords" Width="150" runat="server" CssClass="textbox" /> <asp:Button ID="BtnSearchUser" runat="server" CssClass="button" Text="����" OnClick="BtnSearchUser_Click" />
        <input type="button" class="button" value="��ӡ��ҳ" onclick="PrintPage('PrintBox')" />
         <div style="height:10px;"></div>
        
         <div id="PrintBox">
          <asp:Repeater ID="RptUserList" runat="server" >
          <HeaderTemplate>
          <table width="99%" class="CTable nTable"  border="0" cellpadding="1" cellspacing="1">
              <tr class="CTitle">
               <td align="center"><b>ID</b></td>
               <td align="center"><b>�û���</b></td>
               <td align="center"><b>�û���</b></td>
               <td align="center"><b>�Ƹ�</b></td>
               <td align="center"><b>�ۼƶ�����</b></td>
               <td align="center"><b>�ۼƽ��(Ԫ)</b></td>
               <td align="center" nowrap><b>�����¼IP</b></td>
               <td align="center" nowrap><b>״̬</b></td>
               <td align="center" nowrap><b>�޸�</b></td>
               <td align="center" nowrap><b>ɾ��</b></td>
              </tr>
          </HeaderTemplate>
         <ItemTemplate>
           <tr onmouseover="this.className='CtrMouseOver'" onmouseout="this.className='CtrMouseOut'" onclick="loadUserDetail(<%#Eval("UserID")%>,-1,1)">
                <td class="Ctd" style="text-align:center"> <%# Eval("UserID") %> </td>
                <td class="Ctd"> <%# Eval("UserName") %> </td>
                <td class="Ctd" style="text-align:center"> <%# Eval("GroupName") %> </td>
                <td class="Ctd" style="text-align:center"><a href='KS.LogMoney.aspx?username=<%#Eval("UserName") %>'><span style="color:Green"><%# Math.Round(Convert.ToDouble(Eval("money")),2).ToString() %></span> <%=MyCache.GetCurrencyUnit %></a>/
                <%if (MyCache.GetShopCommonConfig(98) == "1")
                    { %> <a href='KS.Consumer.aspx?username=<%#Eval("UserName") %>'><%#GetPointOrEdays(Convert.ToInt32(Eval("chargetype")),Convert.ToInt32(Eval("point")),Convert.ToInt32(Eval("edays")),Convert.ToDateTime(Eval("begindate"))) %></a>/<%} %><a href='KS.LogScore.aspx?username=<%#Eval("UserName") %>' title="�ܻ���<%# Eval("Score") %>�֣�������<%# Eval("ScoreHasUse") %>�֣����û���<%# Convert.ToInt32(Eval("Score"))-Convert.ToInt32(Eval("ScoreHasUse")) %>��"><span style="color:blue"><%# Eval("score") %></span>��</a></td>
                <td class="Ctd" style="text-align:center"> <%# DataFactory.GetOnlyValue("select count(1) From KS_ProOrder Where MoneyReceipt>0 and username='"+Eval("UserName")+"'") %> </td>
                <td class="Ctd" style="text-align:center"> <%# Kesion.APPCode.Public.ReturnShopPrice(DataFactory.GetOnlyValue("select sum(NoUseCouponMoney) From KS_ProOrder Where MoneyReceipt>0 and username='"+Eval("UserName")+"'")) %> </td>
                <td class="Ctd" style="text-align:center"> <%# Eval("LastLoginIP") %> </td>
                <td class="Ctd" style="text-align:center"> <%# ShowUserStatus(Utils.StrToInt(Eval("locked"))) %> </td>
                <td class="Ctd" style="text-align:center" onclick="doNone(event)"> <input type="button" class="button" value="�޸�" onclick="location.href='KS.UserAdd.aspx?userid=<%# Eval("userid")%>&agentid=<%=drr["userid"].ToString()%>';" /> </td>
                <td class="Ctd" style="text-align:center" onclick="doNone(event)"> <input type="button" class="button" value="ɾ��" onclick="delUser(<%# Eval("UserID")%>,this)" /></td>             
              </tr>

             <tr id="s<%# Eval("userid") %>" style="display:none;">
                 <td colspan="20" id="ss<%# Eval("userid") %>" style="background:#F7FBFE"></td>
             </tr>
       </ItemTemplate>
             <FooterTemplate>
              <tr class="tdbg emptycss" style="display:<%# bool.Parse((RptUserList.Items.Count==0).ToString())?"":"none"%>">
                <td class="Ctd" style="text-align:center" colspan="12">
                  ��û���κε��û���
                </td>
               </tr> 
           </table>
          </FooterTemplate>
</asp:Repeater></div>
    </asp:Panel>

     <asp:Panel ID="ShopOrderPanel" runat="server" Visible="false">
         ����=>ʱ��Σ���<asp:TextBox ID="TxtOrderBeginDate" Width="120" runat="server" onclick="WdatePicker({dateFmt:&#39;yyyy-MM-dd&#39;});" CssClass="textbox Wdate"/>��<asp:TextBox Width="120" ID="TxtOrderEndDate" runat="server" onclick="WdatePicker({dateFmt:&#39;yyyy-MM-dd&#39;});" CssClass="textbox Wdate"/>
        <asp:CheckBox ID="CkbOrderLike" runat="server" Text="ģ������" /> <asp:TextBox ID="TxtOrderKeyWord" Width="150" runat="server" CssClass="textbox" /> <asp:Button ID="Button2" runat="server" CssClass="button" Text="����" OnClick="BtnSearchOrder_Click" />
        <input type="button" class="button" value="��ӡ��ҳ" onclick="PrintPage('PrintBox')" />
         <div style="height:10px;"></div>
         <div id="PrintBox">
          <asp:Repeater ID="RptShopOrder" runat="server" onitemdatabound="Repeater1_ItemDataBound">
          <HeaderTemplate>
          <table width="99%" class="CTable nTable"  border="0" cellpadding="1" cellspacing="1">
              <tr class="CTitle">
               <td align="center"><b>�ɹ�ʱ��</b></td>
               <td align="center"><b>�������</b></td>
               <td align="center"><b>�û���</b></td>
               <td align="center"><b>����</b></td>
               <td align="center"><b>���(Ԫ)</b></td>
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
                  ��û���κεĶ�����
                </td>
               </tr> 
              <tr class="tdbg" style="display:<%# bool.Parse((RptShopOrder.Items.Count>0).ToString())?"":"none"%>">
                <td class="Ctd" style="text-align:right" colspan="4">
                  ��ҳ�ϼƣ�
                </td>
                  <td class="Ctd price-color" style="text-align:center; font-size:18px">
                      <%=MyCache.GetCurrencySymbol %><%=Kesion.APPCode.Public.ReturnShopPrice(pageTotalMoney) %>
                  </td>
               </tr> 
                 <tr class="tdbg" style="display:<%# bool.Parse((RptShopOrder.Items.Count>0).ToString())?"":"none"%>">
                <td class="Ctd" style="text-align:right" colspan="4">
                  ���кϼƣ�
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
         ����=>ʱ��Σ���<asp:TextBox ID="TxtOrderRecordBeginDate" Width="120" runat="server" onclick="WdatePicker({dateFmt:&#39;yyyy-MM-dd&#39;});" CssClass="textbox Wdate"/>��<asp:TextBox Width="120" ID="TxtOrderRecordEndDate" runat="server" onclick="WdatePicker({dateFmt:&#39;yyyy-MM-dd&#39;});" CssClass="textbox Wdate"/>
        <asp:CheckBox ID="CkbOrderRecordLike" runat="server" Text="ģ������" /> <asp:TextBox ID="TxtOrderRecordKey" Width="150" runat="server" CssClass="textbox" /> <asp:Button ID="Button3" runat="server" CssClass="button" Text="����" OnClick="BtnSearchOrderRecord_Click" />
        <input type="button" class="button" value="��ӡ��ҳ" onclick="PrintPage('PrintBox')" />
         <div style="height:10px;"></div>
         <div id="PrintBox">
          <asp:Repeater ID="RptOrderList" runat="server" onitemdatabound="Repeater1_ItemDataBound">
          <HeaderTemplate>
          <table width="99%" class="CTable nTable"  border="0" cellpadding="1" cellspacing="1">
              <tr class="CTitle">
               <td align="center"><b>�ɹ�ʱ��</b></td>
               <td align="center"><b>�������</b></td>
               <td align="center"><b>�û���</b></td>
               <td align="center"><b>����</b></td>
               <td align="center"><b>���(Ԫ)</b></td>
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
                  ��û���κεĶ�����
                </td>
               </tr> 
              <tr class="tdbg" style="display:<%# bool.Parse((RptOrderList.Items.Count>0).ToString())?"":"none"%>">
                <td class="Ctd" style="text-align:right" colspan="4">
                  ��ҳ�ϼƣ�
                </td>
                  <td class="Ctd price-color" style="text-align:center; font-size:18px">
                      <%=MyCache.GetCurrencySymbol %><%=Kesion.APPCode.Public.ReturnShopPrice(pageTotalMoney) %>
                  </td>
               </tr> 
                 <tr class="tdbg" style="display:<%# bool.Parse((RptOrderList.Items.Count>0).ToString())?"":"none"%>">
                <td class="Ctd" style="text-align:right" colspan="4">
                  ���кϼƣ�
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
     <KS:KSGV ID="LoginLogView" runat="server" Width="99%" CssClass="CTable nTable" PagerType="CustomNumeric" OnRowDataBound="List_RowDataBoundLog" AutoGenerateColumns="False" EmptyDataText="û�õ�¼��¼��" GridLines="None">
        <Columns>
            <asp:TemplateField HeaderText="��¼�豸">
                <itemstyle width="45px" HorizontalAlign="Center" />
                <itemtemplate>
                     <span style="color:#999;"><%# Utils.OrderDeviceName(Utils.StrToInt(Eval("DeviceType"))) %></span>
             </itemtemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="username" HeaderText="�û���" />
            <asp:BoundField DataField="adddate" HeaderText="��¼ʱ��">
            <itemstyle width="120px" HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="UserIP" HeaderText="��¼IP">
            <itemstyle width="100px" HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="��ע˵��">
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
         <strong>�ر����ѣ�</strong> �����¼��¼̫�࣬Ӱ����ϵͳ���ܣ�����ɾ��һ��ʱ���ǰ�ļ�¼�Լӿ��ٶȡ� 
         <div>
         <strong>ɾ����Χ��</strong><asp:RadioButtonList ID="RdbDelType" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
          <asp:ListItem Value="1">10��ǰ</asp:ListItem>
          <asp:ListItem Value="2">1����ǰ</asp:ListItem>
          <asp:ListItem Value="3">2����ǰ</asp:ListItem>
          <asp:ListItem Value="4">3����ǰ</asp:ListItem>
          <asp:ListItem Value="5">6����ǰ</asp:ListItem>
          <asp:ListItem Value="6" Selected="True">1��ǰ</asp:ListItem>
             </asp:RadioButtonList>
             <asp:Button ID="BtnDel" runat="server" Text="ִ��ɾ��" OnClick="BtnDel_Click" CssClass="button" /></div>
         </div>
     </asp:Panel>

    <asp:Panel ID="LogMobilePanel" runat="server" Visible="false">
     <KS:KSGV ID="LogMobileView" runat="server" Width="99%" CssClass="CTable nlable" PagerType="CustomNumeric" OnRowDataBound="List_RowDataBoundMobileLog" AutoGenerateColumns="False" EmptyDataText="û���ֻ��󶨼�¼��" GridLines="None">
        <Columns>
            <asp:TemplateField HeaderText="���豸">
                <itemstyle width="45px" HorizontalAlign="Center" />
                <itemtemplate>
                     <span style="color:#999;"><%# Utils.OrderDeviceName(Utils.StrToInt(Eval("DeviceType"))) %></span>
             </itemtemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="username" HeaderText="�û���" />
            <asp:BoundField DataField="adddate" HeaderText="��ʱ��">
            <itemstyle width="120px" HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="UserIP" HeaderText="��ʱIP">
            <itemstyle width="100px" HorizontalAlign="Center" />
            </asp:BoundField>
            

            <asp:TemplateField HeaderText="���ֻ���">
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
         <strong>�ر����ѣ�</strong> ����ֻ��󶨼�¼̫�࣬Ӱ����ϵͳ���ܣ�����ɾ��һ��ʱ���ǰ�ļ�¼�Լӿ��ٶȡ� 
         <div>
         <strong>ɾ����Χ��</strong><asp:RadioButtonList ID="RdbMobileDelType" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
          <asp:ListItem Value="1">10��ǰ</asp:ListItem>
          <asp:ListItem Value="2">1����ǰ</asp:ListItem>
          <asp:ListItem Value="3">2����ǰ</asp:ListItem>
          <asp:ListItem Value="4">3����ǰ</asp:ListItem>
          <asp:ListItem Value="5">6����ǰ</asp:ListItem>
          <asp:ListItem Value="6" Selected="True">1��ǰ</asp:ListItem>
             </asp:RadioButtonList>
             <asp:Button ID="Button1" runat="server" Text="ִ��ɾ��" OnClick="BtnMobileDel_Click" CssClass="button" /></div>
         </div>
     </asp:Panel>

</asp:Panel>
     <%if (KSCMS.S("action") == "show" && string.IsNullOrEmpty(KSCMS.S("showtype"))){ } else {%>
 <KS:Page ID="Page1" runat="server" />
     <%} %>
</div>

</asp:Content>

