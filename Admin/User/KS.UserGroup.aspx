<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_UserGroup" Title="Untitled Page" Codebehind="KS.UserGroup.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="System.Xml" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="Kesion.BLL" %>

<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

<script>
    function showUser(id, groupname) {
        location.href = 'KS.User.Aspx?type=1&groupname='+groupname+'&gid=' + id;
       // parent.openWin('查看用户组[' + groupname + ']下的用户', 'user/KS.User.Aspx?type=1&groupid=' + id, false, 900, 520);
    }
</script>
    <asp:Panel ID="ListPanel" runat="server" Width="100%">

    <div id="manage_top" class="menu_top_fixed">
             <ul>
            <li><strong>管理操作：</strong></li>
            <li class="curr"><a href="KS.UserGroup.aspx">用户组管理</a></li>
            <li><a href="KS.UserDepartMent.aspx">用户部门管理</a></li>
        </ul>
    </div>

    <div class="menu_top_fixed_height"></div>
    <div class="content-area">   
    	<div class="myTitle">用户组管理<span style="float:right"><asp:Button ID="Button2" runat="server" Text="添加用户组" CssClass="button" OnClick="addclassbutton_Click" /></span></div>
        <KS:KSGV ID="List" cssclass="CTable" runat="server" GridLines="None" AutoGenerateColumns="False" EmptyDataText="没有添加任何用户组" PagerType="CustomNumeric" Width="99%" OnRowDataBound="List_RowDataBound" OnRowCreated="List_RowCreated" OnRowCommand="List_RowCommand">
            <HeaderStyle CssClass="CTitle" />
            <Columns>
                 <asp:TemplateField HeaderText="选择">
                <itemtemplate>
                <input type="checkbox"  name="ids" id="ids" value="<%#Eval("groupid") %>" />
                </itemtemplate>
                <itemstyle horizontalalign="Center" Height="30px" width="50px" />
            </asp:TemplateField>
                <asp:BoundField DataField="groupid" HeaderText="ID">
                    <itemstyle horizontalalign="Center" width="25px" />
                </asp:BoundField>
                <asp:BoundField DataField="groupname" HtmlEncode="false" HeaderText="用户组名称">
                    <itemstyle horizontalalign="Center" width="120px" />
                </asp:BoundField>

                 <asp:TemplateField HeaderText="简要说明">
                    <itemtemplate>
                    <span class="tips"><%# Eval("descript") %></span>
                    </itemtemplate>
                </asp:TemplateField>

                <asp:BoundField DataField="type" HeaderText="类型" >
                    <itemstyle horizontalalign="Center" width="60px" />
                </asp:BoundField>


                 <asp:TemplateField HeaderText="启用注册">
                    <itemtemplate>
                   <a href="?action=isreg&groupid=<%#Eval("groupID")%>" <%# Convert.ToString(Eval("isreg"))=="0"?"class='no' title='不启用'":"class='ok' title='启用'" %>></a>
                    
                    </itemtemplate>
                    <itemstyle horizontalalign="Center" width="60px" />
                </asp:TemplateField>

                
                <asp:TemplateField HeaderText="会员数量">
                    <itemtemplate>
                    <a href="javascript:" title="查看会员" onclick="showUser(<%# Eval("groupId") %>,'<%# Eval("groupName") %>')"> <%# GetUserNum(Convert.ToInt32(Eval("GroupID"))) %> 位</a>
                    
                    </itemtemplate>
                    <itemstyle horizontalalign="Center" width="60px" />
                </asp:TemplateField>

             <asp:TemplateField HeaderText="修改">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                     <asp:LinkButton CssClass="edit" ID="LinkButton1" runat="server" commandargument=<%#Eval("groupid") %> commandname="modify" ToolTip="修改"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>

                <asp:TemplateField HeaderText="删除">
                    <itemtemplate>
                      <asp:LinkButton  runat="server" id="delete" commandargument=<%#Eval("groupid") %> commandname="del">删除</asp:LinkButton>
                   </itemtemplate>
                    <itemstyle horizontalalign="Center" width="30px" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="充值">
              <itemstyle width="35px" horizontalalign="Center"/>
              <itemtemplate>
               <a href="#" class="money" title="充值" onclick='parent.openWin("按用户组给用户充值","User/KS.AddMoney.aspx?GroupID=<%#Eval("GroupID") %>",true,750,350);return false'>充</a>
              </itemtemplate>
            </asp:TemplateField>
            </Columns>
            <EditRowStyle CssClass="emptycss" />
        </KS:KSGV>

           <div style="margin-top:2px;overflow:hidden;"></div>
            &nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">全部选中</label>
        <asp:Button ID="BtnDel" runat="server" Text="批量删除"  OnClientClick="return(confirm(&#39;确定要执行删除操作吗?&#39;));" CssClass="button" OnClick="delclassbutton_Click" onmousedown="return(GetIDS(&#39;&#39;));" />
     </div>

    </asp:Panel>
  </div>  
    <asp:Panel ID="AddPanel" runat="server" Width="100%" Visible="false">
        <KS:TopNav ID="TopNav1" runat="server" Text="新增用户组" />
  <div class="content-area">      
        <script type="text/javascript">
 	  function showmailarea()
       {
           var checkrad = jQuery("#<%=this.UserAuthentication.ClientID %> :radio[checked]").val();
           if (checkrad=="1"){
             jQuery("#<%=this.mailarea.ClientID%>").css("display","");
           }else{
            jQuery("#<%=this.mailarea.ClientID%>").css("display","none");
           }
 	  }
     function showCharge() {
                if (jQuery("#<%=RdbViewChargeDoc.ClientID%> :radio[checked]").val() == "2") {
                    jQuery("#modelCharge").show();
                } else {
                    jQuery("#modelCharge").hide();
                }
     }
            $(document).ready(function(){
                showCharge();
            })

       </script>
 <div class="tab-page" id="UserGroupPanel">
         <script type="text/javascript">
             var tabPane1 = new WebFXTabPane(document.getElementById("UserGroupPanel"), 1)
         </script>
             
		 <div class="tab-page" id="tab0">
		  <h2 class="tab">基本参数</h2>
			<script type="text/javascript">
			    tabPane1.addTabPage(document.getElementById("tab0"));
			</script>

      <table width="100%"  border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right"><b>用户组名称：</b></td>
            <td class="righttd"><asp:TextBox CssClass="textbox" ID="GroupName" runat="server" Width="325px"></asp:TextBox>
               <span class="tips">如：个人会员，企业会员等。</span> <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="GroupName"
                    ErrorMessage="请填写用户组名称!" Display="Dynamic"></asp:RequiredFieldValidator></td>
          </tr>
          <tr>
              <td align="right" class="lefttd" height="30">
                  <strong>简要说明：</strong></td>
              <td class="righttd"><asp:TextBox CssClass="textbox textarea" ID="Descript" runat="server" Height="89px" TextMode="MultiLine" Width="425px"></asp:TextBox>
			  </td>
          </tr>
          <tr style="display:none">
              <td align="right" class="lefttd" height="30">
                  <strong>收费方式：</strong></td>
              <td class="righttd">
               <input type="radio" name="chargetype" id="ChargeType1" runat="server" checked />扣点方式<br />
                  默认点数：<asp:TextBox CssClass="textbox" ID="GroupPoint" Text="0" runat="server" Width="38px"></asp:TextBox>点<br />
               <input type="radio" name="chargetype" id="ChargeType2" runat="server" />有效期方式<br />
                  默认天数：<asp:TextBox CssClass="textbox" ID="ValidDays" Text="0" runat="server" Width="33px"></asp:TextBox>天<br />
               <input type="radio" name="chargetype" id="ChargeType3" runat="server" />
                  无限期（永不过期）</td>
          </tr>
          <tr>
              <td align="right" class="lefttd" height="30">
                  <strong>绑定会员表单：</strong></td>
              <td class="righttd">
                  <asp:DropDownList ID="FormID" runat="server">
                  </asp:DropDownList> <a href="KS.UserForm.aspx">管理会员表单</a></td>
          </tr>

          <tr>
              <td align="right" class="lefttd" height="30">
                  <strong>会员中心首页模板：</strong></td>
              <td class="righttd">
                  <asp:TextBox ID="TxtTempateDir" runat="server" Text="{$TemplateDir}/个人中心/index.html" CssClass="textbox" Width="350px" />
                   <input class="button" onClick="SelectTemplate('<%=this.TxtTempateDir.ClientID %>');"  onmouseout="this.className='button';" onmouseover="this.className='button_on';" type="button" value="选择模板..." />
              </td>
          </tr>


          <tr<%=Utils.StrToInt(this.Foot1.HiddenIDText)<=1?" style='display:none'":"" %>>
              <td align="right" class="lefttd" height="30">
                  <strong>启用前台注册：</strong></td>
              <td class="righttd">
                  <asp:RadioButtonList ID="IsReg" runat="server" RepeatDirection="Horizontal">
                      <asp:ListItem Selected="True" Value="1">启用</asp:ListItem>
                      <asp:ListItem Value="0">不启用</asp:ListItem>
                  </asp:RadioButtonList></td>
          </tr>

           <tr>
              <td align="right" class="lefttd" height="30">
                  <strong>允许推荐会员：</strong></td>
              <td class="righttd">
                  <asp:RadioButtonList ID="RdbRecommendUser" runat="server" RepeatDirection="Horizontal">
                      <asp:ListItem Selected="True" Value="1">允许</asp:ListItem>
                      <asp:ListItem Value="0">不允许</asp:ListItem>
                  </asp:RadioButtonList></td>
          </tr>

          <tr>
                  <td align="right" class="lefttd" style="width: 198px; height: 30px">
                      <strong>新会员注册认证方式：</strong></td>
                  <td class="righttd" style="height: 30px">
                      <asp:RadioButtonList ID="UserAuthentication" runat="server">
                       <asp:ListItem Value="0" Selected="True">无（直接放入注册会员组）</asp:ListItem>
                       <asp:ListItem Value="1">邮箱认证</asp:ListItem>
                       <asp:ListItem Value="2">人工后台认证</asp:ListItem>
                   </asp:RadioButtonList></td>
              </tr>

               <tr style="display:none" id="mailarea" runat="server">
                   <td align="right" class="lefttd" height="30">
                       <div>
                           <strong>会员注册时发送的验证邮件内容：</strong> &nbsp; &nbsp; &nbsp;
                       </div>
                       <div align="center">
                           标签说明：<br />
                           {$GetSiteName}：网站名称<br />
                           {$CheckNum}：验证码<br />
                           {$CheckUrl}：会员注册验证地址
                           <div>
                           </div>
                       </div>
                   </td>
                   <td class="righttd">
                       <asp:TextBox CssClass="textbox textarea" Height="150px" Width="450px" ID="MailContent" runat="server" Columns="60" Rows="5" TextMode="MultiLine"></asp:TextBox>
                      <a class="textarea_min" href="javascript:zoomtextarea(-5,'<%=this.MailContent.ClientID %>');"></a>
                   <a class="textarea_max" href="javascript:zoomtextarea(5,'<%=this.MailContent.ClientID %>');"></a>
                          
                   </td>
               </tr>

          <tr>
              <td align="right" class="lefttd" height="30">
                  <strong>上传文件设置：</strong></td>
              <td class="righttd">
                  <strong>存放目录：</strong><asp:TextBox CssClass="textbox" ID="UpFilesDir" runat="server" Width="148px"></asp:TextBox>
                  <span style="color: #ff0066">
                  必须以 / 结束</span>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="UpFilesDir"
                      Display="Dynamic" ErrorMessage="请填写上传目录名称!"></asp:RequiredFieldValidator><br />
                  <span style="color: #006600">上传目录由总上传目录+这里设置的目录生成+用户ID组成</span><br />
                  <strong>可用空间：<asp:TextBox CssClass="textbox" style="text-align:center" ID="SpaceSize" runat="server" Width="58px"></asp:TextBox>
                      KB</strong>&nbsp; <span style="color: #ff0066">提示:1MB=1024KB ，不限制请输入“-1”。</span>
              </td>
          </tr>
          
          <tr>
              <td align="right" class="lefttd" height="30">
                  <strong>序号：</strong></td>
              <td class="righttd">
                <asp:TextBox ID="TxtOrderID" runat="server" Text="0" CssClass="textbox" style="text-align:center" Width="50px" />
                  <span class="tips">TIPS:序号越小排在越前面。</span>
              </td>
          </tr>
         
               
       </table>

</div>
      <div class="tab-page" id="tab1">
		  <h2 class="tab">权限设置</h2>
			<script type="text/javascript">
			    tabPane1.addTabPage(document.getElementById("tab1"));
			</script>
          <table width="100%"  border="0" cellpadding="1" cellspacing="1" class="CTable"> 
                <tr>
                  <td align="right" class="lefttd" height="30"><strong>特殊功能权限：</strong></td>
                  <td class="righttd">
                      <strong>发表权限：</strong><br />
                      <div class="message">
                          每天只能在同一个模型投稿
                          <asp:TextBox ID="TxtMaxModelInput" runat="server" style="text-align:center" CssClass="textbox"  Width="50" Text="-1"/>
                          篇 <span class="tips">不限制请输入"-1"</span><br />
                          每天所有模型的总投稿不超过
                          <asp:TextBox ID="TxtMaxInput" runat="server" style="text-align:center" CssClass="textbox"  Width="50" Text="-1"/>
                          篇 <span class="tips">不限制请输入"-1"</span><br />
                          发布文档时获得积分为栏目设置的<asp:TextBox ID="TxtScoreBS"   runat="server" style="text-align:center" CssClass="textbox"  Width="50" Text="1"></asp:TextBox>倍 
                          <span class="tips">输入"0" 表示此会员组不得分，如果相应的栏目设置投稿是消费的，这里设置倍数说明消费额增加；</span><br />
                       发布文档时获得<%=MyCache.GetCacheConfig(49) %>为栏目设置的<asp:TextBox ID="TxtPointBS"   runat="server" style="text-align:center" CssClass="textbox"  Width="50" Text="1"></asp:TextBox>倍 
                          <span class="tips">输入"0" 表示此会员组不得<%=MyCache.GetCacheConfig(49) %>，如果相应的栏目设置投稿是消费的，这里设置倍数说明消费额增加；</span><br />
                           <asp:CheckBox ID="CkbDocVerifyTF" runat="server" Text="在发布文档需要审核的模型，此会员组发布信息不需要审核" /><br />
                           <asp:CheckBox ID="CkbModifyVerifyDoc" runat="server" Text="可以修改和删除已审核的（自己的）文档" />
                   	 </div>
                      <strong>阅读权限：</strong><br />
                       <div class="message">
                           收费的文档，该用户组免费浏览：
                           <asp:RadioButtonList ID="RdbViewChargeDoc" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                               <asp:ListItem Value="0" Selected="True">不启用</asp:ListItem>
                               <asp:ListItem Value="1">完全免费</asp:ListItem>
                               <asp:ListItem Value="2">按模型设置</asp:ListItem>
                           </asp:RadioButtonList>
                           <div id="modelCharge">
                           <%=getModelPower() %>
                               <strong>提示：</strong>
                               <br />1、如果用户有购买套餐包，则套餐包的级别最高；
                               <br />2、 “①限制仅VIP会员，②限制需要扣费”为并列条件，如果两个都勾选，则说明要同时满足两个条件才能查阅对应模型的收费文档;都不打勾表示不限制条件；
                           </div>
                      </div>
                     
                  </td>
                </tr>
              <tr <%if (Kesion.BLL.KSSecurity.CheckPower("mall","mall1")==false){ %> style="display:none"<%} %>>
                  <td align="right" class="lefttd" height="30"><strong>商城权限：</strong></td>
                  <td class="righttd">
                      <table width="100%"  border="0" cellpadding="1" cellspacing="1" class="CTable"> 
                          <tr>
                              <td align="right" class="lefttd" height="30">
                                  <strong>商城优惠措施：</strong></td>
                              <td class="righttd">
                                 享受正价产品<asp:TextBox CssClass="textbox" ID="TxtShopPriceDiscount" style="text-align:center" runat="server" Width="58px" Text="0"></asp:TextBox>折优惠 
                                 <span class="tips">该用户组没有任何优惠请输入“0”</span>
                                 <br />
                                  享受正价产品<asp:TextBox CssClass="textbox" ID="TxtShopScoreDiscount" style="text-align:center" runat="server" Width="58px" Text="0"></asp:TextBox>倍积分
                                 <span class="tips">该用户组购物不奖积分请输入“0”</span>
                                  <span class="tips">TIPS:建议只有加盟商家用户组才允许发布团购商品。</span>
                              </td>
                          </tr>
                              <tr>
                              <td align="right" class="lefttd" height="30">
                                  <strong>每件商品允许单独设置价格：</strong></td>
                              <td class="righttd">
                                  <asp:RadioButtonList ID="RdbIsGroupPrice" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                      <asp:ListItem Value="1">允许</asp:ListItem>
                                      <asp:ListItem Value="0" Selected="True">不允许</asp:ListItem>
                                  </asp:RadioButtonList>
                                  <span class="tips">TIPS:启用该功能每件商品都可以单独设置销售价格。</span>
                              </td>
                          </tr>
                          <tr>
                              <td align="right" class="lefttd" height="30">
                                  <strong>是否允许发布团购商品：</strong></td>
                              <td class="righttd">
                                  <asp:RadioButtonList ID="RdbPubProduct" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                      <asp:ListItem Value="1">允许</asp:ListItem>
                                      <asp:ListItem Value="0" Selected="True">不允许</asp:ListItem>
                                  </asp:RadioButtonList>
                                  <span class="tips">TIPS:建议只有加盟商家用户组才允许发布团购商品。</span>
                              </td>
                          </tr>
                           <tr>
                              <td align="right" class="lefttd" height="30">
                                  <strong>是否允许处理团购订单：</strong></td>
                              <td class="righttd">
                                  <asp:RadioButtonList ID="RdbProcessOrder" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                      <asp:ListItem Value="1">允许</asp:ListItem>
                                      <asp:ListItem Value="0" Selected="True">不允许</asp:ListItem>
                                  </asp:RadioButtonList>
                                  <span class="tips">TIPS:建议只有加盟商家用户组才允许处理团购订单。</span>
                              </td>
                          </tr>
                           <tr>
                              <td align="right" class="lefttd" height="30">
                                  <strong>新订单允许接收短消息：</strong></td>
                              <td class="righttd">
                                  <asp:RadioButtonList ID="RdbNewOrderReceiveSMS" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                      <asp:ListItem Value="1">允许</asp:ListItem>
                                      <asp:ListItem Value="0" Selected="True">不允许</asp:ListItem>
                                  </asp:RadioButtonList>
                                  <span class="tips">TIPS:建议只有VIP用户组才开启允许接收短消息。</span>
                              </td>
                          </tr>

                      </table>
                  </td>
              </tr>

           <tr>
              <td align="right" class="lefttd" height="30">
                  <strong>短消息设置：</strong></td>
              <td class="righttd">
                 群发限制人数：<asp:TextBox CssClass="textbox" ID="TxtMsgSendNum" style="text-align:center" runat="server" Width="58px" Text="10"></asp:TextBox>
                     人 短信标题字数：<asp:TextBox CssClass="textbox" style="text-align:center" ID="TxtMsgTitleLen" text="50" runat="server" Width="58px"></asp:TextBox>个字符  短信内容最多字符数：<asp:TextBox CssClass="textbox" style="text-align:center" ID="TxtMsgLen" Text="1000" runat="server" Width="58px"></asp:TextBox>个字符
              </td>
          </tr>
              
               <tr>
              <td align="right" class="lefttd" height="30">
                  <strong>在线充值送积分设置：</strong></td>
              <td class="righttd">
                 该用户组在本站每充值一元人民币将赠送：<asp:TextBox CssClass="textbox" ID="TxtCZAddScore" style="text-align:center" runat="server" Width="58px" Text="1"></asp:TextBox>
                     分的积分。<span class="tips">不赠送请输入“0”。</span>
              </td>
          </tr>
          </table>

    </div>

      <div class="tab-page" id="tab3">
		  <h2 class="tab">会员菜单</h2>
			<script type="text/javascript">
			    tabPane1.addTabPage(document.getElementById("tab3"));
			</script>


            <style>
                .poweritem {
                    padding-left:25px;
                }
               .poweritem li {
                        width:20%;
                        float:left;
                        height:40px;
                    }
            </style>
            <script>
                function TopToggle(obj,i) {
                    if (obj.checked) { $('#top'+i).show(); } else { $('#top'+i).hide(); }
                }
                function LeftToggle(obj,i,li) {
                    if (obj.checked) { $('#left-'+i+'-'+li).show(); } else { $('#left-'+i+'-'+li).hide(); }
                }
                function ItemToggle(obj,i,li,itemno) {
                    if (obj.checked) { $('#item-'+i+'-'+li+'-'+itemno).show(); } else { $('#item-'+i+'-'+li+'-'+itemno).hide(); }
                }
                function checkALL(flag){
                    $(".CTable").find("tr").show();
                    $(".CTable").find("input[type=checkbox]").attr("checked",flag);
                }

            </script>

     
            <%
            XmlDocument doc = new XmlDocument();
            doc.Load(Server.MapPath("~/config/usermenu.xml"));
            XmlNode nodes = doc.SelectSingleNode("usermenu");
            int i = 0;
            foreach (XmlNode topnode in nodes.ChildNodes) //顶级菜单
            {
                bool isShow = true;
                if (topnode.SelectSingleNode("@type") != null)
                {
                    if (topnode.SelectSingleNode("@type").InnerText == "shop" && Utils.GetSysInfo("//sysinfo/model/mall").ToString().ToLower() != "true")
                    {
                        isShow = false;
                    }
                    else if (topnode.SelectSingleNode("@type").InnerText == "exam" && Utils.GetSysInfo("//sysinfo/model/exam").ToString().ToLower() != "true")
                    {
                        isShow = false;
                    }
                }
                if (isShow){
                %>

                <table width="99%"  border="0" cellpadding="1" cellspacing="1" class="CTable" style="margin-bottom:5px;"> 
                
                  <tr>
                    <td class="righttd" style="font-size:14px;font-family:黑体;font-weight:bold"><label><%=UtilsAutoID.CapitalFigures(i) %>、<input onclick="TopToggle(this,<%=i %>);" type="checkbox" name="powerlist" value="<%=topnode.SelectSingleNode("@role").InnerText %>"<%if (Utils.InArray(topnode.SelectSingleNode("@role").InnerText, powerList, ",")) Response.Write(" checked"); %> />【<%=topnode.SelectSingleNode("@name").InnerText %>】</label></td>
                  </tr>
                   <tr  id="top<%=i %>"<%=(Utils.InArray(topnode.SelectSingleNode("@role").InnerText, powerList, ","))?string.Empty:" style='display:none';"%>>
                       <td style="padding-left:50px;">
                          
                           <%
                int li = 0;

                          foreach (XmlNode leftnode in topnode.SelectNodes("leftitem")) //左边一级菜单
                          {
                            %>
                            <table width="100%" border="0" cellpadding="1" cellspacing="1"> 
                              <tr>
                                <td style="height:28px"><label><%=UtilsAutoID.ToNum1(li) %>、<input onclick="LeftToggle(this,<%=i%>,<%=li %>);" type="checkbox" name="powerlist" value="<%=leftnode.SelectSingleNode("@role").InnerText %>"<%if (Utils.InArray(leftnode.SelectSingleNode("@role").InnerText, powerList, ",")) Response.Write(" checked"); %> />【<%=leftnode.SelectSingleNode("@name").InnerText %>】</label></td>
                              </tr>
                              <tr  id="left-<%=i %>-<%=li %>"<%=(Utils.InArray(leftnode.SelectSingleNode("@role").InnerText, powerList, ","))?string.Empty:" style='display:none';"%>>
                                  <td>
                                      <ul class="poweritem">
                                    <%
                                   int itemnum = 0;
                                   foreach (XmlNode item in leftnode.SelectNodes("itemlist/item")) //左边二级菜单
                                    {
                                       string power = Kesion.BLL.KSSecurity.RemovePowerBadChar(item.SelectSingleNode("url").InnerText);
                               
                                           Response.Write("<li>");
                                           Response.Write(string.Format(@"<label><input type='checkbox' name='powerlist' onclick=""ItemToggle(this,{3},{4},{5})"" value='{1}'{2}> {0}</label>", item.SelectSingleNode("name").InnerText.Replace("{=GetCacheConfig(49)}",MyCache.GetCacheConfig(49)), power, Utils.InArray(power, powerList, ",") ? " checked" : string.Empty, i, li, itemnum));
                                           Response.Write("</li>");
                                  
                                       itemnum++;
                                    }     
                                    %>
                                      </ul>
                                  </td>
                              </tr>
                           </table>
                           <%   
                              li++;
                          }     
                           %>
                             
                       </td>
                   </tr>
                </table>
                <%
                i++;
                }
            }
           %>


           <div class="message">
            提示：不需要控制会员中心左栏菜单的显示，以下请直接留空不要设置。
              <input type="button" value="全选" class="button" onclick="checkALL(true)" />
              <input type="button" value="取消全选" class="button" onclick="checkALL(false)" />
           </div>


    </div>



     </div>
        <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" />
    </asp:Panel>
    
   </div> 
</asp:Content>

