<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Administrator" Title="Untitled Page" Codebehind="KS.Admin.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="System.Xml" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="Kesion.BLL" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="ListPanel" runat="server" Height="50px" Width="100%">
        <div id="manage_top" class="menu_top_fixed">
             <ul>
            <li><strong>管理操作：</strong></li>
            <li class="curr"><a href="KS.Admin.aspx">管理员管理</a></li>
            <li><a href="KS.AdminRole.aspx">管理员类型</a></li>
        </ul>
    </div>
    <div class="menu_top_fixed_height"></div>
 <div class="content-area">
 	<div class="myTitle">管理员管理<span style="float:right"><asp:Button ID="Button2" runat="server" Text="新增管理员" CssClass="button" OnClick="addclassbutton_Click" /></span></div>        
        <KS:KSGV ID="List" cssclass="CTable" runat="server" GridLines="None" AutoGenerateColumns="False" EmptyDataText="没有添加任何管理员" Width="99%" OnRowDataBound="List_RowDataBound" OnRowCreated="List_RowCreated" OnRowCommand="List_RowCommand">
            <HeaderStyle CssClass="CTitle" />
            <Columns>
               <asp:TemplateField HeaderText="选择">
                <itemtemplate>
                <input type="checkbox"  name="ids" id="ids" value="<%#Eval("id") %>" <%# Convert.ToString(Eval("sysAdmin"))=="1"?" disabled":"" %>/>
                </itemtemplate>
                <itemstyle horizontalalign="Center" Height="30px" width="50px" />
              </asp:TemplateField>
               <asp:TemplateField HeaderText="状态">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                   <a href="?action=locked&id=<%#Eval("ID")%>" <%# Convert.ToString(Eval("locked"))=="1"?"class='no' title='锁定状态'":"class='ok' title='正常状态'" %>></a>
              </itemtemplate>
            </asp:TemplateField>
                <asp:BoundField DataField="id" HeaderText="ID" Visible="false">
                    <itemstyle horizontalalign="Center" width="25px" />
                </asp:BoundField>
                <asp:BoundField DataField="username" HeaderText="管理员名称">
                    <itemstyle horizontalalign="Left"/>
                </asp:BoundField>
                 <asp:TemplateField HeaderText="绑定会员账号">
              <itemstyle  horizontalalign="Center"/>
              <itemtemplate>
                <span class="tips"><%# string.IsNullOrEmpty(Convert.ToString(Eval("PrUserName")))?"未绑定":"<a href='KS.User.aspx?action=show&userid="+UserManage.GetUserInfo(Convert.ToString(Eval("PrUserName"))).UserID+"' class='tips' title='查看业务员["+Eval("PrUserName")+"]信息'>"+Eval("PrUserName")+"</a>" %></span>
              </itemtemplate>
            </asp:TemplateField>
                <asp:BoundField DataField="realname" HeaderText="真实姓名">
                <itemstyle width="80px" horizontalalign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="usertype" HeaderText="类型" >
                    <itemstyle horizontalalign="Center" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="最后登录时间">
              <itemstyle  horizontalalign="Center"/>
              <itemtemplate>
                <span class="tips"><%# Eval("lastlogintime") %></span>
              </itemtemplate>
            </asp:TemplateField>
                <asp:BoundField DataField="logintimes" HeaderText="登录次数" >
                    <itemstyle horizontalalign="Center"/>
                </asp:BoundField>
               

            <asp:TemplateField HeaderText="修改">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                     <asp:LinkButton CssClass="edit" OnClientClick="doNone(event)" ID="LinkButton1" runat="server" commandargument=<%#Eval("id") %> commandname="modify" ToolTip="修改"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="删除">
               <itemstyle width="30px" horizontalalign="Center"/>
                    <itemtemplate>
                     <asp:HiddenField runat="server" Value='<%#Eval("sysadmin") %>' ID="HidSysAdmin"></asp:HiddenField>
                     <asp:LinkButton runat="server" id="delete" commandargument=<%#Eval("id") %> commandname="del" ToolTip="删除" CssClass="delete"></asp:LinkButton>
                       </itemtemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle CssClass="emptycss" />
        </KS:KSGV>

     <div style="margin-top:2px;overflow:hidden;"></div>
            &nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">全部选中</label>
        <asp:Button ID="BtnDel" runat="server" Text="批量删除"  OnClientClick="return(confirm(&#39;确定要执行删除操作吗?&#39;));" CssClass="button" OnClick="delclassbutton_Click" onmousedown="return(GetIDS(&#39;&#39;));" />
     </div>

         <KS:Page ID="Page1" runat="server" />
    </asp:Panel>
</div>    
    <asp:Panel ID="AddPanel" runat="server" Width="100%" Visible="false">
      <KS:TopNav ID="TopNav1" runat="server"  />
 <div class="content-area">         
      <asp:HiddenField ID="HidFSysAdmin" runat="server" />
      <table width="99%"  border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 198px"><b>管理员名称：</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="UserName" runat="server" Width="144px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UserName"
                    ErrorMessage="请填写管理员名称!" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:Label ID="UserMessage" runat="server"></asp:Label>
                <span class="tips">如：用于登录后台的账号。</span>
            </td>
          </tr>
          <tr>
              <td align="right" class="lefttd" height="30" style="width: 198px">
                  <strong>登录密码：</strong></td>
              <td class="righttd">
                  &nbsp;<asp:TextBox CssClass="textbox" ID="PassWord" runat="server" Width="143px"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="PassWord"
                      Display="Dynamic" ErrorMessage="请输入密码!"></asp:RequiredFieldValidator>
                  <asp:Label ID="PassMessage" runat="server"></asp:Label>
                   <span class="tips">如：用于登录后台的密码。</span>
              </td>
          </tr>
           <tr>
              <td align="right" class="lefttd" height="30" style="width: 198px">
                  <strong>绑定会员账号：</strong></td>
              <td class="righttd">
                  &nbsp;<asp:TextBox CssClass="textbox" ID="TxtPreUserName" runat="server"></asp:TextBox>
                  <span class="tips">绑定后该管理员登录后可以查询管理自己发展的客户资料，商城订单等。</span>
              </td>
          </tr>
          <tr>
              <td align="right" class="lefttd" height="30" style="width: 198px">
                  <strong>真实姓名：</strong></td>
              <td class="righttd">
                  &nbsp;<asp:TextBox CssClass="textbox" ID="RealName" runat="server"></asp:TextBox>
                  <span class="tips">如：张三、李四等。</span>
              </td>
          </tr>
          <tr>
              <td align="right" class="lefttd" height="30" style="width: 198px">
                  <strong>联系电话：</strong></td>
              <td class="righttd">
                  &nbsp;<asp:TextBox CssClass="textbox" ID="Tel" runat="server"></asp:TextBox>
                   <span class="tips">如：可填写手机号或是固定电话。</span>
              </td>
          </tr>
          <tr>
                    <td  height="30" class="lefttd" align="right" ><strong>管理员头像：</strong></td>
                    <td class="righttd">
                        <table cellspacing="0" cellpadding="0"><tr><td>&nbsp;<asp:TextBox CssClass="textbox" ID="TxtUserFace" runat="server"></asp:TextBox>&nbsp;<input type="button" class="button" onclick="SelectFiles('<%=this.TxtUserFace.ClientID %>',0);" value="选择图片"></td>
                            <%if (Kesion.BLL.KSSecurity.CheckCommonUploadPower()){ %>
                            <td style="padding-left:4px;padding-top:12px;"> <%=Kesion.APPCode.UploadAPI.EchoUpload("classpic",this.TxtUserFace.ClientID,150) %></td>
                            <%} %>
                            <td><img id="show<%=TxtUserFace.ClientID %>" src="<%=TxtUserFace.Text %>" width="60" height="60" style="border:1px solid #f1f1f1;" onerror="this.src='../../sysimg/nopic.gif'"/></td>
                          </tr></table>
                    </td>
              </tr>

          <tr<%=this.HidFSysAdmin.Value=="1"?" style='display:none'":string.Empty %>>
              <td align="right" class="lefttd" height="30" style="width: 198px">
                  <strong>管理员类型：</strong></td>
              <td class="righttd">
                  <asp:RadioButtonList ID="UserType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="UserType_SelectedIndexChanged" RepeatDirection="Horizontal">
                      <asp:ListItem Value="1">超级管理员</asp:ListItem>
                      <asp:ListItem Selected="True" Value="0">普通管理员</asp:ListItem>
                  </asp:RadioButtonList></td>
          </tr>
          <tr id="docPowerPanel" runat="server">
              <td align="right" class="lefttd" height="30" style="width: 198px"><strong>管理权限：</strong></td>
              <td class="righttd"><strong>所属角色：</strong>
                  <asp:RadioButtonList ID="RdbRole" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                      <asp:ListItem Value="1">发稿员</asp:ListItem>
                      <asp:ListItem Value="2">初审员</asp:ListItem>
                      <asp:ListItem Selected="True" Value="3">终审员</asp:ListItem>
                  </asp:RadioButtonList>
                 
                  <br/>
                  <strong>通用上传权限：</strong>
                  <asp:RadioButtonList ID="RdbCommonUploadPower" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                      <asp:ListItem Value="1">允许</asp:ListItem>
                      <asp:ListItem Selected="True" Value="0">不允许</asp:ListItem>
                  </asp:RadioButtonList>
              </td>
          </tr>
          <tr>
              <td align="right" class="lefttd" height="30" style="width: 198px"><strong>状 态：</strong></td>
              <td class="righttd">
                  <asp:RadioButtonList ID="Locked" runat="server" RepeatDirection="Horizontal">
                      <asp:ListItem Selected="True" Value="0">正常</asp:ListItem>
                      <asp:ListItem Value="1">锁定</asp:ListItem>
                  </asp:RadioButtonList>
              </td>
          </tr>
          <tr>
              <td align="right" class="lefttd" height="30" style="width: 198px"><strong>简要说明：</strong></td>
              <td class="righttd">&nbsp;<asp:TextBox ID="Descript" runat="server" CssClass="textbox" Height="89px" TextMode="MultiLine" Width="325px"></asp:TextBox>
              </td>
          </tr>
       </table>
        <br />
        
        <asp:Panel ID="PowerPanel" runat="server" Width="100%">
      <table width="99%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="righttd" style="text-align:center;height:28px"><b>管理员权限分配设置</b></td>
          </tr>
      </table>
      <br />

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

           
                 //ajax保存栏目权限
                 function classpurview(obj, username) {
                     jQuery.post("KS.Admin.Aspx", { action: "classpurview", check:obj.checked,username:username,classid:obj.value }, function(v) {
                        // alert(v);
                         //jQuery('#showresult').html(unescape(v));
                     });
                 }

                 function setAll(i,ii,flag){
                     $('#left-'+i+'-'+ii).find('input[name=classid]').attr('checked', flag);
                     var classid='';
                     $('#left-'+i+'-'+ii).find('input[name=classid]').each(function(){
                         classid+=","+$(this).val();
                     });
                     
                     jQuery.post("KS.Admin.Aspx", { action: "classpurview", check:flag,username:"<%=this.UserName.Text%>",classid:classid }, function(v) {
                         //jQuery('#showresult').html(unescape(v));
                     });
                     

                 }
                function DoCheck(i){
                    if ($(".top"+i).attr("checked")=="checked"){
                        $(".top"+i).attr("checked",false);
                        $("#top"+i).hide();
                        $("#ctable"+i).find("input[type=checkbox][name!='classid']").attr("checked",false);
                    }else{
                        $(".top"+i).attr("checked",true);
                        $("#top"+i).show();
                        $(".t"+i).attr("checked",true).click();
                        $("#ctable"+i).find("input[type=checkbox][name!='classid']").attr("checked",true);
                    }
                }
            </script>

            <%
            XmlDocument doc = new XmlDocument();
            doc.Load(Server.MapPath("~/config/managemenu.xml"));
            XmlNode nodes = doc.SelectSingleNode("managemenu");
            int i = 0;
            foreach (XmlNode topnode in nodes.ChildNodes) //顶级菜单
            {
                bool isShow = true;
                if (topnode.SelectSingleNode("@type") != null)
                {
                    if ((topnode.SelectSingleNode("@role").InnerText == "order" ||topnode.SelectSingleNode("@type").InnerText == "shop") && Utils.GetSysInfo("//sysinfo/model/mall").ToString().ToLower() != "true")
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
                <table width="99%" id="ctable<%=i %>" border="0" cellpadding="1" cellspacing="1" class="CTable" style="margin-bottom:5px;"> 
                  <tr>
                    <td class="righttd" style="font-size:14px;font-family:黑体;font-weight:bold"><label><%=UtilsAutoID.CapitalFigures(i) %>、<input class="top<%=i %>" onclick="TopToggle(this,<%=i %>);" type="checkbox" name="powerlist" value="<%=topnode.SelectSingleNode("@role").InnerText %>"<%if (Utils.InArray(topnode.SelectSingleNode("@role").InnerText, powerList, ",")) Response.Write(" checked"); %> />此管理员在【<%=topnode.SelectSingleNode("@name").InnerText %>】模块权限</label> <span style="font-weight:normal;color:#999;">(<a href="javascript:;" style="color:#999;" onclick="DoCheck(<%=i %>);">全选</a>)</a></td>
                  </tr>
                   <tr id="top<%=i %>"<%=(Utils.InArray(topnode.SelectSingleNode("@role").InnerText, powerList, ","))?string.Empty:" style='display:none';"%>>
                       <td style="padding-left:50px;">
                          
                           <%
                               
                int li = 0;

               #region 内容及网店选项
                if (topnode.SelectSingleNode("@type") != null) 
                {
                    if (topnode.SelectSingleNode("@type").InnerText == "content")
                    {
      %>
                 <div class="message"><strong>内容管理权限：</strong>
                  <asp:RadioButtonList ID="RdbDocPower" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                      <asp:ListItem Value="1">只能管理自己添加的文档</asp:ListItem>
                      <asp:ListItem Selected="True" Value="0">有权限栏目的文档都可以管理(<span style="color:Red">包括非自己添加的文档,一般审核员需要拥有此权限</span>)</asp:ListItem>
                  </asp:RadioButtonList>  </div> 
                            <%
                               #region 文章，图片，下载模型
                               using (DataTable dt=MyCache.GetCacheModelTable()){
                                   if (dt.Rows.Count > 0)
                                   {
                                       foreach (DataRow dr in dt.Rows)
                                       {
                                           if (dr["basictype"].ToString()!="4")
                                           {
                                 %>
                               <table width="100%" border="0" cellpadding="1" cellspacing="1"> 
                                  <tr>
                                    <td style="height:28px"><label><%=UtilsAutoID.ToNum1(li) %>、<input class="t<%=i %>" onclick="LeftToggle(this,<%=i%>,<%=li %>);" type="checkbox" name="powerlist" value="<%=dr["modelfolder"].ToString().ToLower() %>" <%if (Utils.InArray(dr["modelfolder"].ToString().ToLower(), powerList, ",")) Response.Write(" checked"); %>/>【<%=dr["modelname"].ToString() %>】</label></td>
                                  </tr>
                                  <tr  id="left-<%=i %>-<%=li %>"<%=(Utils.InArray(dr["modelfolder"].ToString().ToLower(), powerList, ","))?string.Empty:" style='display:none';"%>>
                                      <td>
                                          <ul class="poweritem">
                                              <label><input type="checkbox" name="powerlist" value="<%=dr["modelfolder"].ToString().ToLower() %>0" <%if (Utils.InArray(dr["modelfolder"].ToString().ToLower()+"0", powerList, ",")) Response.Write(" checked"); %>/>添加</label>
                                              <label><input type="checkbox" name="powerlist" value="<%=dr["modelfolder"].ToString().ToLower() %>1" <%if (Utils.InArray(dr["modelfolder"].ToString().ToLower()+"1", powerList, ",")) Response.Write(" checked"); %>/>编辑</label>
                                              <label><input type="checkbox" name="powerlist" value="<%=dr["modelfolder"].ToString().ToLower() %>2" <%if (Utils.InArray(dr["modelfolder"].ToString().ToLower()+"2", powerList, ",")) Response.Write(" checked"); %>/>删除</label>
                                              <label><input type="checkbox" name="powerlist" value="<%=dr["modelfolder"].ToString().ToLower() %>3" <%if (Utils.InArray(dr["modelfolder"].ToString().ToLower()+"3", powerList, ",")) Response.Write(" checked"); %>/>审核</label>
                                              <label><input type="checkbox" name="powerlist" value="<%=dr["modelfolder"].ToString().ToLower() %>4" <%if (Utils.InArray(dr["modelfolder"].ToString().ToLower()+"4", powerList, ",")) Response.Write(" checked"); %>/>克隆</label>
                                              <label><input type="checkbox" name="powerlist" value="<%=dr["modelfolder"].ToString().ToLower() %>5" <%if (Utils.InArray(dr["modelfolder"].ToString().ToLower()+"5", powerList, ",")) Response.Write(" checked"); %>/>加入专题</label>
                                              <label><input type="checkbox" name="powerlist" value="<%=dr["modelfolder"].ToString().ToLower() %>6" <%if (Utils.InArray(dr["modelfolder"].ToString().ToLower()+"6", powerList, ",")) Response.Write(" checked"); %>/>附件上传</label>
                                              <br />

                                              <strong>详细指定栏目权限</strong>
                                                <input type="button" value="全选" class="button" onclick="setAll(<%=i %>,<%=li%>,true)"/>
                                                <input type="button" value="不选" class="button" onclick="setAll(<%=i %>,<%=li%>,false)"/>

                                                  <div style="border: 5px solid #E7E7E7;height:250px; overflow: auto; width:90%;"> 
                                                        <%= GetClassList(Utils.StrToInt(dr["channelid"].ToString())) %>
                                                 </div>
                                          </ul>
                                      </td>
                                  </tr>
                               </table>

                                 <% 
                                  li++;
                                  }
                              }
                          }
                        }
                        #endregion
                    }
                    else if (topnode.SelectSingleNode("@role").InnerText == "order" || topnode.SelectSingleNode("@type").InnerText == "shop")
                    {
                       #region 商城模型
                        using (DataTable dt=MyCache.GetCacheModelTable()){
                          if (dt.Rows.Count > 0)
                          {
                              foreach (DataRow dr in dt.Rows)
                              {
                                  if (dr["basictype"].ToString()=="4")
                                  {
                                 %>
                                <table width="100%" border="0" cellpadding="1" cellspacing="1"> 
                                  <tr>
                                    <td style="height:28px"><label><%=UtilsAutoID.ToNum1(li) %>、<input class="t<%=i %>" onclick="LeftToggle(this,<%=i%>,<%=li %>);" type="checkbox" name="powerlist" value="<%=dr["modelfolder"].ToString().ToLower() %>" <%if (Utils.InArray(dr["modelfolder"].ToString().ToLower(), powerList, ",")) Response.Write(" checked"); %>/>【<%=dr["modelname"].ToString() %>】</label></td>
                                  </tr>
                                  <tr  id="left-<%=i %>-<%=li %>"<%=(Utils.InArray(dr["modelfolder"].ToString().ToLower(), powerList, ","))?string.Empty:" style='display:none';"%>>
                                      <td>
                                          <ul class="poweritem">
                                              <label><input type="checkbox" name="powerlist" value="<%=dr["modelfolder"].ToString().ToLower() %>0" <%if (Utils.InArray(dr["modelfolder"].ToString().ToLower()+"0", powerList, ",")) Response.Write(" checked"); %>/>添加</label>
                                              <label><input type="checkbox" name="powerlist" value="<%=dr["modelfolder"].ToString().ToLower() %>1" <%if (Utils.InArray(dr["modelfolder"].ToString().ToLower()+"1", powerList, ",")) Response.Write(" checked"); %>/>编辑</label>
                                              <label><input type="checkbox" name="powerlist" value="<%=dr["modelfolder"].ToString().ToLower() %>2" <%if (Utils.InArray(dr["modelfolder"].ToString().ToLower()+"2", powerList, ",")) Response.Write(" checked"); %>/>删除</label>
                                              <label><input type="checkbox" name="powerlist" value="<%=dr["modelfolder"].ToString().ToLower() %>3" <%if (Utils.InArray(dr["modelfolder"].ToString().ToLower()+"3", powerList, ",")) Response.Write(" checked"); %>/>审核</label>
                                              <label><input type="checkbox" name="powerlist" value="<%=dr["modelfolder"].ToString().ToLower() %>4" <%if (Utils.InArray(dr["modelfolder"].ToString().ToLower()+"4", powerList, ",")) Response.Write(" checked"); %>/>克隆</label>
                                              <label><input type="checkbox" name="powerlist" value="<%=dr["modelfolder"].ToString().ToLower() %>5" <%if (Utils.InArray(dr["modelfolder"].ToString().ToLower()+"5", powerList, ",")) Response.Write(" checked"); %>/>导出Excel</label>
                                              <label><input type="checkbox" name="powerlist" value="<%=dr["modelfolder"].ToString().ToLower() %>6" <%if (Utils.InArray(dr["modelfolder"].ToString().ToLower()+"6", powerList, ",")) Response.Write(" checked"); %>/>附件上传</label>

                                               <br />

                                              <strong>详细指定栏目权限</strong>
                                                <input type="button" value="全选" class="button" onclick="setAll(<%=i %>,<%=li%>,true)"/>
                                                <input type="button" value="不选" class="button" onclick="setAll(<%=i %>,<%=li%>,false)"/>

                                                  <div style="border: 5px solid #E7E7E7;height:250px; overflow: auto; width:90%;"> 
                                                        <%= GetClassList(Utils.StrToInt(dr["channelid"].ToString())) %>
                                                  </div>
                                          </ul>
                                      </td>
                                  </tr>
                               </table>

                                 <% 
                                                             li++;
                                                         }
                                                     }
                                                 }
                                             }
                                             #endregion


                                         }
                                     }
             #endregion

                             if (topnode.SelectSingleNode("@role").InnerText == "order")
                                     { %>
                           
                              <div class="message"<%=MyCache.GetShopCommonConfig(103)=="1"?"":" style='display:none'" %>><strong>允许管理的仓库：</strong>
                                  <asp:CheckBoxList ID="CblStoreId" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow"></asp:CheckBoxList>
                              </div>
                           
                           <%
                               }else if (topnode.SelectSingleNode("@role").InnerText == "user")
                               {
                                %>
                           
                              <div class="message"><strong>只允许管理自己发展的会员：</strong>
                                  <asp:RadioButtonList ID="RdbAllowUser" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                    <asp:ListItem Value="1">是</asp:ListItem>
                               <asp:ListItem Selected="True" Value="0">不是</asp:ListItem>
                                  </asp:RadioButtonList>
                              </div>
                           
                           <%
                               }
                               foreach (XmlNode leftnode in topnode.SelectNodes("leftitem")) //左边一级菜单
                               {
                            %>
                            <table width="100%" border="0" cellpadding="1" cellspacing="1"> 
                              <tr>
                                <td style="height:28px"><label><%=UtilsAutoID.ToNum1(li) %>、<input class="t<%=i %>" onclick="LeftToggle(this,<%=i%>,<%=li %>);" type="checkbox" name="powerlist" value="<%=leftnode.SelectSingleNode("@role").InnerText %>"<%if (Utils.InArray(leftnode.SelectSingleNode("@role").InnerText, powerList, ",")) Response.Write(" checked"); %> />【<%=leftnode.SelectSingleNode("@name").InnerText %>】</label></td>
                              </tr>
                              <tr id="left-<%=i %>-<%=li %>"<%=(Utils.InArray(leftnode.SelectSingleNode("@role").InnerText, powerList, ","))?string.Empty:" style='display:none';"%>>
                                  <td>
                                      <ul class="poweritem">
                                    <%
                                   int itemnum = 0;
                                   foreach (XmlNode item in leftnode.SelectNodes("itemlist/item")) //左边二级菜单
                                    {
                                       string power = Kesion.BLL.KSSecurity.RemovePowerBadChar(item.SelectSingleNode("url").InnerText);
                                        if (item.SelectSingleNode("url").InnerText.ToLower().IndexOf("ks.shoporder.aspx") == -1)
                                       {
                                           Response.Write("<li>");
                                       }
                                       else
                                       {
                                           Response.Write("<div>");
                                       }
                                       Response.Write(string.Format(@"<label><input type='checkbox' name='powerlist' onclick=""ItemToggle(this,{3},{4},{5})"" value='{1}'{2}> {0}</label>", item.SelectSingleNode("name").InnerText, power, Utils.InArray(power, powerList, ",",true) ? " checked" : string.Empty, i, li, itemnum));
                                       if (item.SelectSingleNode("role") != null)
                                       {
                                           int itemno = 0;
                                           string role = item.SelectSingleNode("role").InnerText;
                                           Response.Write("<div class='tips' id='item-"+i+"-"+li+"-"+itemnum+"'"+(Utils.InArray(power, powerList, ",")?string.Empty:" style='display:none'")+">");
                                           foreach(string s in role.Split('|'))
                                           {
                                               Response.Write(string.Format(@"<label><input type='checkbox' name='powerlist' value='{1}'{2}/>{0}</label>", s, string.Concat(power, itemno), Utils.InArray(string.Concat(power, itemno), powerList, ",",true) ? " checked" : string.Empty));
                                               itemno++;
                                           }
                                           Response.Write("</div>");
                                       }
                                       if (item.SelectSingleNode("url").InnerText.ToLower().IndexOf("ks.shoporder.aspx") == -1)
                                       {
                                           Response.Write("</li>");
                                       }
                                       else
                                       {
                                           Response.Write("</div><div style='clear:both'></div>");
                                       }
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

      </asp:Panel>
        <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" />
    </asp:Panel>
    
  </div>  
</asp:Content>

