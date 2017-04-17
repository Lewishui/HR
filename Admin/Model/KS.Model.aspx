<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Model" Title="模型管理" Codebehind="KS.Model.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="System.Xml" %>
<%@ Import Namespace="System.Data" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
      <asp:Panel ID="ModelListArea" runat="server" Width="100%">
       <div id="manage_top" class="menu_top_fixed">
       <ul>
        <li id='p1'><asp:HyperLink NavigateUrl="ks.model.aspx?action=add"  ID="addbutton" runat="server" Text="添加模型"><b></b>添加模型</asp:HyperLink></li>
        <li id='p2'><asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click"><b></b>数据统计</asp:LinkButton></li>
        <li id='p18'><a href="KS.ModelExportOrImport.aspx?action=export"><b></b>模型导入&导出</a></li>
        <li id='p9'><asp:HyperLink ID="backbutton" NavigateUrl="KS.MODEL.ASPX"  Text="回上一级" runat="server" Enabled="False"><b></b>回上一级</asp:HyperLink></li>
        </ul>
        </div>     
       <div class="menu_top_fixed_height"></div> 

     <div class="content-area"> 
          <div class="tabs_header">
            <ul class="tabs">
            <li<%=KSCMS.S("showType")==""?" class='active'":string.Empty %>><a href="KS.Model.aspx?<%=UtilsQueryParam.Get("showtype") %>"><span>系统模型</span></a></li>
            <li<%=KSCMS.S("showType")=="1"?" class='active'":string.Empty %>><a href="KS.Model.aspx?showType=1&<%=UtilsQueryParam.Get("showtype") %>"><span>应用管理</span></a></li>
            <li<%=KSCMS.S("showType")=="2"?" class='active'":string.Empty %>><a href="KS.Model.aspx?showType=2&<%=UtilsQueryParam.Get("showtype") %>"><span>功能开关</span></a></li>
            </ul>
        </div>

        <asp:Panel ID="PanelSys" runat="server">
          <KS:OrderJS ID="OrderJS1" runat="server" />   
           <asp:GridView cssclass="CTable" ID="GridView1" runat="server" ForeColor="Black" GridLines="None" Width="100%" AutoGenerateColumns="False" EmptyDataText="没有建任何模型" OnRowDataBound="GridView1_RowDataBound" OnRowCreated="GridView1_RowCreated" OnRowCommand="GridView1_RowCommand">
               <Columns>
                 <asp:TemplateField HeaderText="排序">
                    <itemstyle width="60px" horizontalalign="Center"  />
                    <headerstyle height="18px"/>
                    <itemtemplate>
                     <asp:DropDownList id="orderid" datasource="<%#bindorder() %>" runat="server"></asp:DropDownList>
                    </itemtemplate>
                </asp:TemplateField>

                <asp:BoundField DataField="channelid" HeaderText="ID" DataFormatString="{0}">
                    <itemstyle width="50px" HorizontalAlign="Center" />
                    <headerstyle width="50px"/>
                </asp:BoundField>
                 <asp:TemplateField HeaderText="状态">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                   <a href="?action=ModelStatus&channelid=<%#Eval("channelid")%>" <%# Convert.ToString(Eval("ModelStatus"))=="0"?"class='no' title='不启用'":"class='ok' title='启用'" %>></a>
              </itemtemplate>
            </asp:TemplateField>

                <asp:BoundField HeaderText="模型名称" DataField="ModelName" FooterText="ModelName">
                    <ItemStyle HorizontalAlign="Center"  />
                </asp:BoundField>
                <asp:TemplateField HeaderText="数据表名" ShowHeader="False">
                    <itemstyle/>
                    <itemtemplate>
                    <span class="tips"><%# Eval("ModelTable") %></span>
                   </itemtemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="项目名称" ShowHeader="False">
                    <itemstyle HorizontalAlign="Center"/>
                    <itemtemplate>
                    <span class="tips"><%# Eval("ModelItem")%></span>
                   </itemtemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="项目单位" ShowHeader="False">
                    <itemstyle HorizontalAlign="Center"/>
                    <itemtemplate>
                    <span class="tips"><%# Eval("ModelItemUnit")%></span>
                   </itemtemplate>
                </asp:TemplateField>
                
                   <asp:TemplateField HeaderText="类型">
                   <ItemStyle HorizontalAlign="Center" Width="50px" />
                   <ItemTemplate>
                    <%#GetModelType(Convert.ToInt16(Eval("ModelType","{0}"))) %>
                   </ItemTemplate>
                   </asp:TemplateField>


           <asp:TemplateField HeaderText="编辑">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                   <a  href="KS.Model.aspx?action=modify&channelid=<%#Eval("channelid") %>" class="edit"></a>
              </itemtemplate>
            </asp:TemplateField>

           <asp:TemplateField HeaderText="删除">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                     <%# Convert.ToString(Eval("ModelType")).Equals("1")?"-":@"<a href=""javascript:;"" class=""delete"" onclick=""KesionJS.Confirm('删除模型不可逆，确认删除吗？','location.href=\'"+KSCMS.GetInstallDir() + MyCache.GetCacheConfig(4) +@"/Model/KS.Model.aspx?action=del&channelid="+Eval("ChannelID","{0}")+@"\';','')"" title=""删除模型""></a>" %>
              </itemtemplate>
            </asp:TemplateField>
           <asp:TemplateField HeaderText="克隆">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                        <asp:LinkButton ID="CloneTemplate" CssClass="copy" ToolTip="克隆模型" CommandArgument='<%#Eval("ChannelID","{0}")%>' CommandName="clone" runat="server"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>

               
                <asp:TemplateField HeaderText="字段管理" ShowHeader="False">
                    <itemstyle width="70px" HorizontalAlign="Center" />
                    <itemtemplate>
                        <a href="KS.Field.aspx?channelid=<%#Eval("ChannelID","{0}")%>" class="link-color" title="字段管理">字段管理</a>
                        <asp:LinkButton ID="ChangeStatus" Text="" CommandArgument='<%#Eval("ChannelID","{0}")%>' CommandName="status" runat="server"></asp:LinkButton>
                   </itemtemplate>
                </asp:TemplateField>
                   <asp:TemplateField HeaderText="预览">
                    <ItemStyle Width="30" HorizontalAlign="center" />
                    <ItemTemplate>
                        <asp:LinkButton ID="preview" Text="预览" CommandArgument='<%#Eval("ChannelID","{0}")%>' CommandName='preview' runat="server" CssClass="link-color"></asp:LinkButton>
                    </ItemTemplate>
                   </asp:TemplateField>
            </Columns>
               <HeaderStyle CssClass="CTitle" />
               <PagerSettings NextPageText="下一页" PreviousPageText="上一页" />
               <EmptyDataRowStyle CssClass="emptycss" />
           </asp:GridView>
          <div class="main-button">
          	  <asp:Button ID="BtnSaveOrder" Text="批量保存排序" runat="server" CssClass="button" OnClick="BtnSaveOrder_Click" />
          </div>   
</asp:Panel>
 
     <asp:Panel ID="PanelPlus" runat="server" Visible="false">
      <script type="text/javascript">
		 function delPluslapp(Pluslid){
		     top.$.dialog.confirm('是否关闭应用插件?',function(){location.href='<%=KSCMS.GetInstallDir()+MyCache.GetCacheConfig(4)%>/model/KS.Model.aspx?action=delPlus&showtype=<%=KSCMS.S("showtype")%>&Plusid='+Pluslid;},function(){});
		 }
		 function addPluslapp(Pluslid){
		     top.$.dialog.confirm('是否开启应用插件?',function(){location.href='<%=KSCMS.GetInstallDir()+MyCache.GetCacheConfig(4)%>/model/KS.Model.aspx?action=addPlus&showtype=<%=KSCMS.S("showtype")%>&Plusid='+Pluslid;},function(){});
		 }
		</script>

         <table class="CTable" cellspacing="0" border="0"  style="color:Black;width:100%;border-collapse:collapse;">
				<tr class="CTitle">
					<th scope="col" style="width:30px">序号</th><th scope="col"  style="width:60px">状态</th><th scope="col">应用名称</th><th scope="col" style="width:50px;">权限值</th><th scope="col">管理操作</th>
                </tr>
              <%
                  XmlDocument doc = new XmlDocument();
                  doc.Load(Server.MapPath("~/config/managemenu.xml"));
                  XmlNode nodes = doc.SelectSingleNode("//managemenu/topitem[@role=\"sub\"]");
                  StringBuilder sb = new StringBuilder();
                  if (nodes == null)
                  {
                      sb.AppendLine(string.Format("<tr><td colspan='10' align='center' class=\"Ctd\">{0}</td></tr>", "无可用应用！"));
                  }
                  else
                  {
                      int num = 0;
                      foreach (XmlNode node in nodes.ChildNodes)
                      {
                          num++;
                          bool isOpen = true;
                          if (node.SelectSingleNode("@enable") != null)
                          {
                              isOpen = node.SelectSingleNode("@enable").InnerText.ToString().ToLower().Equals("true");
                          }

                          sb.AppendLine(string.Format(@"<tr onmouseover=""this.className=&#39;CtrMouseOver&#39;"" onmouseout=""this.className=&#39;CtrMouseOut&#39;"" onclick=""chk(this)"">
                                 <td class=""Ctd"" align=""center"">{0}</td>
                                 <td class=""Ctd"" align=""center""><a class=""{1}"" href=""javascript:void(0)"" onclick=""{5}Pluslapp('{3}')""></a></td>
                                 <td class=""Ctd"">{2}</td>
                                 <td class=""Ctd"">{3}</td>
                                 <td class=""Ctd link-operate""  align=""center""><a href=""javascript:void(0)"" onclick=""{5}Pluslapp('{3}')"">{4}</a></td>
					                      </tr>"
                                ,num.ToString()
                                 ,isOpen?"ok":"no"
                                 ,node.SelectSingleNode("@name").InnerText
                                 , node.SelectSingleNode("@role").InnerText
                                ,isOpen?"关闭":"开启"
                                 ,isOpen?"del":"add"));

                      }
                  }
                  Response.Write(sb.ToString());
               %>
        </table>


          </asp:Panel>

   <asp:Panel ID="PanelModel" runat="server" Width="100%" Visible="false">
      <table width="99%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="righttd" style="text-align:center;height:28px"><b>不打勾的模块在后台管理菜单中将关闭不显示</b></td>
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
                function DoCheck(i,li,flag){
                    if (!flag){
                        $(".t"+i+"_"+li).attr("checked",false);
                        $("#left-"+i+"-"+li).hide().find("input[type=checkbox]").attr("checked",false);
                    }else{
                        $(".t"+i+"_"+li).attr("checked",true);
                        $("#left-"+i+"-"+li).show().find("input[type=checkbox]").attr("checked",true);
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
                <table width="99%" id="ctable<%=i %>" border="0" cellpadding="1" cellspacing="1" class="CTable" style="margin-bottom:5px;"> 
                  <tr>
                    <td class="righttd" style="font-size:14px;font-family:黑体;font-weight:bold"><label><%=UtilsAutoID.CapitalFigures(i) %>、【<%=topnode.SelectSingleNode("@name").InnerText %>】</label> </td>
                  </tr>
                   <tr id="top<%=i %>">
                       <td style="padding-left:50px;">
                          
                           <%
                               int li = 0;

                               foreach (XmlNode leftnode in topnode.SelectNodes("leftitem")) //左边一级菜单
                               {
                                   string leftEnable = leftnode.Attributes["enable"].InnerText.ToLower();

                            %>
                            <table width="100%" border="0" cellpadding="1" cellspacing="1"> 
                              <tr>
                                <td style="height:28px"><label><%=UtilsAutoID.ToNum1(li) %>、<input class="t<%=i %>_<%=li%>" onclick="LeftToggle(this,<%=i%>,<%=li %>);" type="checkbox" name="<%=leftnode.SelectSingleNode("@id").InnerText %>" value="1"<%if (leftEnable=="true") Response.Write(" checked"); %> />【<%=leftnode.SelectSingleNode("@name").InnerText %>】</label><span style="font-weight:normal;color:#999;">(<a href="javascript:;" style="color:#999;" onclick="DoCheck(<%=i %>,<%=li%>,true)">全选</a> <a href="javascript:;" style="color:#999;" onclick="DoCheck(<%=i %>,<%=li%>,false)">不选</a>)</a></span></td>
                              </tr>
                              <tr id="left-<%=i %>-<%=li %>"<%=(leftEnable=="true")?string.Empty:" style='display:none';"%>>
                                  <td>
                                      <ul class="poweritem">
                                    <%
                                        int itemnum = 0;
                                        foreach (XmlNode item in leftnode.SelectNodes("itemlist/item")) //左边二级菜单
                                        {
                                            string itemEnable = item.Attributes["enable"].InnerText.ToLower();

                                            string url = item.SelectSingleNode("url").InnerText;
                                            if (url.IndexOf("/") != -1) url = url.Split('/')[1];
                                            Response.Write("<li>");
                                            if (Utils.InArray(url.ToLower(),mustCheck.ToLower(),",")==true)
                                            {
                                                Response.Write(string.Format(@"<label><input type='checkbox' name='{1}'  checked='checked' value='1' disabled='true'> {0}</label>", item.SelectSingleNode("name").InnerText, item.SelectSingleNode("@id").InnerText));

                                            }
                                            else
                                            {
                                                Response.Write(string.Format(@"<label><input type='checkbox' name='{1}' onclick=""ItemToggle(this,{3},{4},{5})"" value='1'{2}> {0}</label>", item.SelectSingleNode("name").InnerText, item.SelectSingleNode("@id").InnerText, itemEnable == "true" ? " checked" : string.Empty, i, li, itemnum));
                                            }
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

      <div class="main-button">
          <asp:Button ID="BtnModelSave" Text="批量保存模块设置" runat="server" CssClass="button" OnClick="BtnModelSave_Click"/>
      </div>
      </asp:Panel>


       </asp:Panel>
 </div>      
       <asp:Panel ID="ModelAddlist" runat="server" Visible="false" Width="100%">
           <KS:TopNav ID="TopNav1" runat="server" Text="添加新模型" />
<div class="content-area">
  <script type="text/javascript">
	  function ConvertPinYin(){
              var className=jQuery('#<%=this.ModelName.ClientID %>').val();
              jQuery.get("../../plus/ajaxs.ashx",{a:"convertclassname",classname:className},function(v){
                 jQuery('#<%=this.ModelTable.ClientID %>').val(unescape(v));
                  jQuery('#<%=this.ModelFolder.ClientID %>').val(unescape(v));
                  if (v==''){
                      jQuery('#<%=this.ModelFolder.ClientID %>').val("e"+className);
                  }
              });
       }

      function CheckForm(){
          if ($("#<%=this.ModelName.ClientID%>").val()==''){
              KesionJS.Alert('请输入模型名称!',"$('#<%=this.ModelName.ClientID%>').focus()");
              return false;
          }
          if ($("#<%=this.ModelFolder.ClientID%>").val()==''){
              KesionJS.Alert('请输入模型英文名称!',"$('#<%=this.ModelFolder.ClientID%>').focus()");
              return false;
          }
          if ($("#<%=this.ModelTable.ClientID%>").val()==''){
              KesionJS.Alert('请输入模型数据表!',"$('#<%=this.ModelTable.ClientID%>').focus()");
              return false;
          }
          if ($("#<%=this.ModelItem.ClientID%>").val()==''){
              KesionJS.Alert('请输入模型项目名称!',"$('#<%=this.ModelItem.ClientID%>').focus()");
              return false;
          }
          if ($("#<%=this.ModelItemUnit.ClientID%>").val()==''){
              KesionJS.Alert('请输入模型项目单位!',"$('#<%=this.ModelItemUnit.ClientID%>').focus()");
              return false;
          }
          if ($("#<%=this.ModelItem.ClientID%>").val()==''){
              KesionJS.Alert('请输入模型项目名称!',"$('#<%=this.ModelItem.ClientID%>').focus()");
              return false;
          }
          if ($("#<%=this.ModelItem.ClientID%>").val()==''){
              KesionJS.Alert('请输入模型项目名称!',"$('#<%=this.ModelItem.ClientID%>').focus()");
              return false;
          }
          if ($("#<%=this.ModelItem.ClientID%>").val()==''){
              KesionJS.Alert('请输入模型项目名称!',"$('#<%=this.ModelItem.ClientID%>').focus()");
              return false;
          }
          if ($("#<%=this.ModelItem.ClientID%>").val()==''){
              KesionJS.Alert('请输入模型项目名称!',"$('#<%=this.ModelItem.ClientID%>').focus()");
              return false;
          }
          if ($("#<%=this.ModelItem.ClientID%>").val()==''){
              KesionJS.Alert('请输入模型项目名称!',"$('#<%=this.ModelItem.ClientID%>').focus()");
              return false;
          }
          return true;
      }
	</script>
	
	
	 <div class="tab-page" id="ModelSetPanel">
         <script type="text/javascript">
           var tabPane1 = new WebFXTabPane( document.getElementById( "ModelSetPanel" ), 1 )
         </script>
             
		 <div class="tab-page" id="tab0">
		  <h2 class="tab">基本参数</h2>
			<script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab0" ) );
			</script>
			<table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable">
                   <tr>
                       <td align="right" class="lefttd">
                           <strong>模型状态：</strong></td>
                       <td class="righttd">
                           <asp:RadioButtonList ID="ModelStatus" runat="server" RepeatDirection="Horizontal"
                               Width="150px">
                               <asp:ListItem Selected="True" Value="1">正常</asp:ListItem>
                               <asp:ListItem Value="0">关闭</asp:ListItem>
                           </asp:RadioButtonList>
                           
                           </td>
                   </tr>
                   <tr>
                       <td align="right" class="lefttd" >
                           <strong>模型名称：</strong></td>
                       <td class="righttd">
                           <asp:TextBox CssClass="textbox" ID="ModelName" runat="server" Width="228px"></asp:TextBox><font color="#ff0000">*</font><span class="tips">如：人才系统，新闻系统等。</span></td>
                   </tr>
                   <tr id="Tr2" runat="server" style="display:none">
                       <td align="right" class="lefttd">
                           <strong>模型英文名称：</strong></td>
                       <td  class="righttd">
                           <asp:TextBox CssClass="textbox" ID="ModelFolder" runat="server" onblur="CheckEnglishStr(this,'模型目录名称')" Width="101px"></asp:TextBox><span style="color: #ff0000">*</span>英文名称，只能以字母和数字的组合<asp:RequiredFieldValidator
                               ID="RequiredFieldValidator5" runat="server" ControlToValidate="ModelFolder" ErrorMessage="模型英文名称必须输入" Display="Dynamic"></asp:RequiredFieldValidator>
                           <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="ModelFolder"
                               Display="Dynamic" ErrorMessage="必须以字母开头，后面跟数字或字母的组合，长度在3-10个字符之间" ValidationExpression="[a-zA-Z]{1}[\d|(a-zA-Z)]{1,9}"></asp:RegularExpressionValidator></td>
                   </tr>
                   <tr>
                       <td align="right" class="lefttd">
                           <strong>数据表名称：</strong></td>
                       <td class="righttd">
                           KS_U_<asp:TextBox CssClass="textbox" ID="ModelTable" runat="server" Width="109px"></asp:TextBox><span
                               style="color: #ff0000">*</span><asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                                   runat="server" ControlToValidate="ModelTable" ErrorMessage="数据表名称必须输入" Display="Dynamic"></asp:RequiredFieldValidator>
                           <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="ModelTable"
                               ErrorMessage="必须以字母开头，后面跟数字或字母的组合，长度在2-10个字符之间" ValidationExpression="[a-zA-Z]{1}[\d|(a-zA-Z)]{1,9}"></asp:RegularExpressionValidator><br />
                           <span class="tips">说明：创建数据表后无法修改，并且用户创建的数据表以"KS_U_"开头。</span></td>
                   </tr>
                   <tr id="LArea" runat="server">
                       <td align="right" class="lefttd">
                           <strong>项目名称：</strong></td>
                       <td class="righttd">
                           <asp:TextBox CssClass="textbox" ID="ModelItem" Text="文章" runat="server" Width="154px"></asp:TextBox><span style="color: #ff0000">*</span><span class="tips">如：文章、图片、软件等。</span></td>
                   </tr>
                   <tr runat="server" id="Tr1">
                       <td align="right" class="lefttd">
                           <strong>项目单位：</strong></td>
                       <td  class="righttd">
                           <asp:TextBox CssClass="textbox" ID="ModelItemUnit" style="text-align:center" runat="server" Text="篇" Width="53px"></asp:TextBox><span style="color: #ff0000">*</span><span class="tips">如：篇、个、本等。</span></td>
                   </tr>
                   
                       <tr>
                           <td align="right" class="lefttd">
                               <strong>基 类 型：</strong></td>
                           <td class="righttd">
                               <asp:DropDownList ID="BasicType" runat="server">
                                   <asp:ListItem Value="1">文章类</asp:ListItem>
                                   <asp:ListItem Value="2">图片类</asp:ListItem>
                                   <asp:ListItem Value="3">下载类</asp:ListItem>
                                   <asp:ListItem Value="4">商城类</asp:ListItem>
                               </asp:DropDownList></td>
                       </tr>

            <tr>
                       <td align="right" class="lefttd">
                           <strong>模型说明：</strong></td>
                       <td class="righttd">
                           <asp:TextBox CssClass="textbox" ID="Intro" runat="server" Rows="5" width="350px" height="60px" Columns="45" TextMode="MultiLine"></asp:TextBox>
                       <a class="textarea_min" href="javascript:zoomtextarea(-2,'<%=this.Intro.ClientID %>');"> </a>
                       <a class="textarea_max" href="javascript:zoomtextarea(2,'<%=this.Intro.ClientID %>');"></a>  
                           </td>
                   </tr>
                   </table>
			
         </div>
         
         
         <div class="tab-page" id="tab2">
		  <h2 class="tab">模型选项</h2>
			<script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab2" ) );
			</script>
			<table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable">
                    <tr>
                           <td align="right" class="lefttd">
                               <strong>本模型启用回收站功能：</strong></td>
                           <td class="righttd">
                               <asp:RadioButtonList ID="RdbRecycle" runat="server" RepeatDirection="Horizontal"
                               Width="150px">
                                   <asp:ListItem Value="1" Selected="True">启用</asp:ListItem>
                                   <asp:ListItem Value="0">不启用</asp:ListItem>
                               </asp:RadioButtonList>
                             <span class="tips">启用回收站后，则删除文档将放入回收站里，可以在回收站中还原。</span>  
                             </td>
                       </tr>
				     <tr>
                           <td align="right" class="lefttd">
                               <strong>是否启用SEO选项：</strong></td>
                           <td class="righttd">
                               <asp:RadioButtonList ID="SeoOptions" runat="server" RepeatDirection="Horizontal"
                               Width="150px">
                                   <asp:ListItem Value="1" Selected="True">启用</asp:ListItem>
                                   <asp:ListItem Value="0">不启用</asp:ListItem>
                               </asp:RadioButtonList></td>
                       </tr>
				      <tr>
                           <td align="right" class="lefttd">
                               <strong id="chargesInner" runat="server">是否启用收费选项：</strong></td>
                           <td class="righttd">
                               <asp:RadioButtonList ID="ChargesOptions" runat="server" RepeatDirection="Horizontal"
                               Width="150px">
                                   <asp:ListItem Value="1" Selected="True">启用</asp:ListItem>
                                   <asp:ListItem Value="0">不启用</asp:ListItem>
                               </asp:RadioButtonList></td>
                       </tr>
                       <tbody id="showOptions" runat="server">
                       <tr>
                           <td align="right" class="lefttd">
                               <strong>是否启用属性选项：</strong></td>
                           <td class="righttd">
                               <asp:RadioButtonList ID="AttributeOptions" runat="server" RepeatDirection="Horizontal"
                               Width="150px">
                                   <asp:ListItem  Selected="True" Value="1">启用</asp:ListItem>
                                   <asp:ListItem Value="0">不启用</asp:ListItem>
                               </asp:RadioButtonList></td>
                       </tr>
                       <tr>
                           <td align="right" class="lefttd">
                               <strong>是否启用投票选项：</strong></td>
                           <td class="righttd">
                               <asp:RadioButtonList ID="ReceiptOptions" runat="server" RepeatDirection="Horizontal" Width="150px">
                                   <asp:ListItem Value="1" Selected="True">启用</asp:ListItem>
                                   <asp:ListItem  Value="0">不启用</asp:ListItem>
                               </asp:RadioButtonList></td>
                       </tr>
                       <tr>
                           <td align="right" class="lefttd">
                               <strong>是否启用PK选项：</strong></td>
                           <td class="righttd">
                               <asp:RadioButtonList ID="PKOptions" runat="server" RepeatDirection="Horizontal" Width="150px">
                                   <asp:ListItem Value="1" Selected="True">启用</asp:ListItem>
                                   <asp:ListItem  Value="0">不启用</asp:ListItem>
                               </asp:RadioButtonList></td>
                       </tr>
                       <tr>
                           <td align="right" class="lefttd">
                               <strong>本模型计费方式：</strong></td>
                           <td class="righttd">
                               <asp:RadioButtonList ID="RdbChargeType" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                   <asp:ListItem Value="0" Selected="True">点券</asp:ListItem>
                                   <asp:ListItem  Value="1">资金(人民币)</asp:ListItem>
                                   <asp:ListItem  Value="2">积分</asp:ListItem>
                               </asp:RadioButtonList>
                               <span class="tips">Tips:如文章/图片/下载等设置需要消费才可以查看,将以这里设置的计费标准扣费,一旦设置建议不要修改。</span>
                           </td>
                       </tr>
                    </tbody> 
                       <tr>
                           <td align="right" class="lefttd">
                               <strong>本模型后台添加数据栏目选择方式：</strong></td>
                           <td class="righttd">
                               <asp:RadioButtonList ID="RdbClassSelectType" runat="server" RepeatDirection="Horizontal" Width="220px">
                                   <asp:ListItem Value="0" Selected="True">无限级联动(推荐)</asp:ListItem>
                                   <asp:ListItem  Value="1">下拉列表</asp:ListItem>
                               </asp:RadioButtonList>
                           </td>
                       </tr>
                      <tr>
                            <td align="right" class="lefttd">
                                <strong>录入启用选项：</strong></td>
                            <td class="righttd">
                                <asp:CheckBoxList ID="CBLShowOption" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                    <asp:ListItem Value="1">标题前缀</asp:ListItem>
                                    <asp:ListItem Value="2">标题颜色</asp:ListItem>
                                    <asp:ListItem Value="3">重名检测</asp:ListItem>
                                    <asp:ListItem Value="4" Selected="True">立即发布</asp:ListItem>
                                    <asp:ListItem Value="5" Selected="True">上传附件</asp:ListItem>
                                    <asp:ListItem Value="6" Selected="True">附件收费</asp:ListItem>
                                    <asp:ListItem Value="7">分页标题</asp:ListItem>
                                    <asp:ListItem Value="8" Selected="True">自动截取简介</asp:ListItem>
                                    <asp:ListItem Value="9" Selected="True">自动下载内容里的图片</asp:ListItem>
                                    <asp:ListItem Value="10" Selected="True">自动提取内容里的一张图片做为首页图片</asp:ListItem>
                                    <asp:ListItem Value="11" Selected="True">默认生成缩略图</asp:ListItem>
                                    <asp:ListItem Value="12" Selected="True">默认加水印</asp:ListItem>
                                </asp:CheckBoxList>

                            </td>
                        </tr>
                     <tr>
                            <td align="right" class="lefttd">
                                <strong>内容默认过滤选项：</strong></td>
                            <td class="righttd">
                                <asp:CheckBoxList ID="CbkFilterOption" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                    <asp:ListItem Value="FilterIframe">Iframe</asp:ListItem>
                                    <asp:ListItem Value="FilterObject">Object</asp:ListItem>
                                    <asp:ListItem Value="FilterScript">Script</asp:ListItem>
                                    <asp:ListItem Value="FilterDiv">Div</asp:ListItem>
                                    <asp:ListItem Value="FilterTable">Table</asp:ListItem>
                                    <asp:ListItem Value="FilterSpan">Span</asp:ListItem>
                                    <asp:ListItem Value="FilterImg">IMG</asp:ListItem>
                                    <asp:ListItem Value="FilterFont">Font</asp:ListItem>
                                    <asp:ListItem Value="FilterA">A链接</asp:ListItem>
                                    <asp:ListItem Value="FilterHtml">Html</asp:ListItem>
                                    <asp:ListItem Value="FilterStyle">Style</asp:ListItem>
                                </asp:CheckBoxList>

                            </td>
                        </tr>
                     <tr>
                         <td align="right" class="lefttd">
                             <strong>顶客(DIGG)选项：</strong></td>
                         <td class="righttd">
                         	<div class="colmn">
                              <asp:CheckBox ID="CkbDiggByVisitor" runat="server" Text="允许游客Digg" />
                              <asp:CheckBox ID="CkbDiggRepeat" runat="server" Text="允许重复Digg" />
                             </div>
                             <div class="hr_line"></div>
                         	<div class="colmn">
                             用户点顶增加<asp:TextBox CssClass="textbox" style="text-align:center" ID="DiggPerTimes" runat="server" Width="50px">1</asp:TextBox>次
                             用户点顶赠送<asp:TextBox  style="text-align:center;width:50px" CssClass="textbox" ID="TxtDiggAddScore" runat="server" Text="0"></asp:TextBox>分积分 投稿者的文档被顶赠送<asp:TextBox Text="0" style="text-align:center;width:50px" CssClass="textbox" ID="TxtDiggInputerScore" runat="server"></asp:TextBox>分积分
                              <span class="tips">Tips:不赠送请输入“0”。</span>
                               </div>
                               <div class="hr_line"></div>
                                <div class="colmn">
                               在本模型Digg操作同一天同一个用户最多只能增加<asp:TextBox  style="text-align:center;width:50px" CssClass="textbox" ID="TxtDiggAddMaxScore" runat="server" Text="0"></asp:TextBox>分积分。
                              <span class="tips">Tips:不限制请输入“0”，否则每个用户每天赠送的积分超过这里设置的积分后，再次点顶将不再赠送。</span>
                              </div>
                         </td>
                     </tr>
                    <tr>
                         <td align="right" class="lefttd">
                             <strong>收藏选项：</strong></td>
                         <td class="righttd">
                         	<div class="colmn">
                             用户收藏文档赠送<asp:TextBox  style="text-align:center;width:50px" CssClass="textbox" ID="TxtFavAddScore" runat="server" Text="0"></asp:TextBox>分积分  投稿者的文档被收藏赠送<asp:TextBox Text="0" style="text-align:center;width:50px" CssClass="textbox" ID="TxtFavInputerScore" runat="server"></asp:TextBox>分积分
                             </div>
                             <div class="hr_line"></div>
                              <div class="colmn">
                             用户<asp:TextBox Text="0" style="text-align:center;width:50px" CssClass="textbox" ID="TxtFavScoreLimitTime" runat="server"></asp:TextBox>小时内将收藏的文档取消收藏，将扣除<asp:TextBox Text="0" style="text-align:center;width:50px" CssClass="textbox" ID="TxtFavDelScore" runat="server"></asp:TextBox>分积分
                             <span class="tips">Tips:不赠送请输入“0”。</span>
                             </div>
                             <div class="hr_line"></div>
                              <div class="colmn">
                              在本模型收藏操作同一天同一个用户最多只能增加<asp:TextBox  style="text-align:center;width:50px" CssClass="textbox" ID="TxtFavAddMaxScore" runat="server" Text="0"></asp:TextBox>分积分。
                              <span class="tips">Tips:不限制请输入“0”，否则每个用户每天赠送的积分超过这里设置的积分后，再次点顶将不再赠送。</span>
								</div>
                         </td>
                    </tr>
                   
       
				 </table>

         </div>
         <div class="tab-page" id="tab3">
		  <h2 class="tab">上传选项</h2>
			<script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab3" ) );
			</script>
			<table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable">
                    <tr class="ctr">
                       <td align="right" class="lefttd">
                           <strong>是否允许管理员上传文件：</strong></td>
                       <td class="righttd">
                           <asp:RadioButtonList ID="AdminUpfilesTF" runat="server" RepeatDirection="Horizontal">
                               <asp:ListItem Selected="True" Value="1">允许</asp:ListItem>
                               <asp:ListItem Value="0">不允评</asp:ListItem>
                           </asp:RadioButtonList></td>
                       </tr>
                     <tr class="ctr" style="display:none">
                         <td align="right" class="lefttd">
                             <strong>管理员上传文件目录：</strong></td>
                         <td class="righttd">
                             <asp:TextBox CssClass="textbox" ID="AdminUpfilesDir" runat="server">UploadFiles/</asp:TextBox>
                             <span style="color: #ff0033">必须以 "/"结束</span></td>
                     </tr>
                     <tr class="ctr">
                         <td align="right" class="lefttd">
                             <strong>是否允许会员上传文件：</strong></td>
                         <td class="righttd"><asp:RadioButtonList ID="UserUpfilesTF" runat="server" RepeatDirection="Horizontal">
                             <asp:ListItem Selected="True" Value="1">允许</asp:ListItem>
                             <asp:ListItem Value="0">不允评</asp:ListItem>
                         </asp:RadioButtonList></td>
                     </tr>
                     <tr class="ctr">
                         <td align="right" class="lefttd">
                             <strong>前台会员上传文件目录：</strong></td>
                         <td class="righttd">
                             <asp:TextBox CssClass="textbox" ID="UserUpFilesDir" runat="server">User/</asp:TextBox>
                             <span style="color: #ff0033">必须以 "/"结束<br />
                                 <strong><span style="color: #000099">说明:模型在会员中心的目录构成格式为<br />
                                 </span></strong><span style="color: blue">总上传目录+会员所在用户组的上传目录+会员名称+这里设置的目录</span></span></td>
                     </tr>
                     <tr class="ctr">
                         <td align="right" class="lefttd">
                             <strong>允许上传的最大文件：</strong></td>
                         <td class="righttd">
                             <asp:TextBox CssClass="textbox" ID="AllowUpfilesSize" runat="server" Width="54px">1024</asp:TextBox>
                             KB&nbsp; <span style="color: #ff0000">提示：1 KB = 1024 Byte，1 MB = 1024 KB
                                 <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="AllowUpfilesSize"
                                     ErrorMessage="请输入数字" ValidationExpression="\d*"></asp:RegularExpressionValidator></span></td>
                     </tr>
                <tr class="ctr">
                         <td align="right" class="lefttd">
                             <strong>默认缩略图大小：</strong></td>
                         <td class="righttd">
                             宽度：<asp:TextBox CssClass="textbox" ID="TxtThumbWidth" runat="server" Width="54px">250</asp:TextBox>
                            像素 <span class="tips">设为0时，将以高度为准按比例缩小。</span>
                             <div class="hr_line"></div>
                             高度：<asp:TextBox CssClass="textbox" ID="TxtThumbHeight" runat="server" Width="54px">0</asp:TextBox>
                            像素 <span class="tips">设为0时，将以宽度为准按比例缩小。</span>
                             
                            </td>
                     </tr>
                     <tr class="ctr">
                         <td align="right" class="lefttd">
                             <div align="right">
                                 <strong>允许上传的文件类型：</strong><br />
                                 <font color="#ff0000">多种文件类型之间以"|"分隔</font></div>
                         </td>
                         <td class="righttd">
                           <table border="0" cellpadding="0" cellspacing="0" width="90%">
                            <tr>
                             <td align="right" style="width: 107px;height:25px">
                                 图片类型:</td>
                             <td>
                                 <asp:TextBox CssClass="textbox" ID="AllowUpPhotoType" runat="server">jpg|gif|png|bmp</asp:TextBox></td>
                            </tr>
                               <tr>
                                   <td align="right" style="width: 107px;height:25px">
                                       Flash 文件:</td>
                                   <td>
                                       <asp:TextBox CssClass="textbox" ID="AllowUpFlashType" runat="server">swf|flv</asp:TextBox></td>
                               </tr>
                               <tr>
                                   <td align="right" style="width: 107px;height:25px">
                                       Windows 媒体:</td>
                                   <td>
                                       <asp:TextBox CssClass="textbox" ID="AllowUpMediaType" runat="server">wma|wmv|mp3|mp4</asp:TextBox></td>
                               </tr>
                               <tr>
                                   <td align="right" style="width: 107px;height:25px">
                                       Real 媒体:
                                   </td>
                                   <td>
                                       <asp:TextBox CssClass="textbox" ID="AllowUpRealType" runat="server">ram|rm|ra</asp:TextBox></td>
                               </tr>
                               <tr>
                                   <td align="right" style="width: 107px;height:25px">
                                       其它文件:</td>
                                   <td>
                                       <asp:TextBox CssClass="textbox" ID="AllowUpOtherType" runat="server">rar|doc|zip</asp:TextBox></td>
                               </tr>
                           </table>
                         </td>
                     </tr>
                    </table>
         </div>
         <div class="tab-page" id="tab4">
		  <h2 class="tab">投稿选项</h2>
			<script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab4" ) );
			</script>
			<table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable">
				      <tr>
                           <td align="right" class="lefttd">
                               <strong>前台发表总开关：</strong></td>
                           <td class="righttd">
                               <asp:RadioButtonList ID="AllowPublication" runat="server">
                                   <asp:ListItem Value="0">不允许发布（禁用）</asp:ListItem>
                                   <asp:ListItem Value="1">完全开放（不限制）</asp:ListItem>
                                   <asp:ListItem Value="2" Selected="True">允许发表，具体依栏目设置而定</asp:ListItem>
                               </asp:RadioButtonList></td>
                       </tr>
                         <tr>
                             <td align="right" class="lefttd">
                                 <strong>前台发布是否需要审核：</strong></td>
                             <td class="righttd"><asp:RadioButtonList ID="PublicationVerify" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                 <asp:ListItem Selected="True" Value="0">需要后台人工审核</asp:ListItem>
                                 <asp:ListItem Value="1">不需要审核</asp:ListItem>
                             </asp:RadioButtonList></td>
                         </tr>
                         <tr>
                             <td align="right" class="lefttd">
                                 <strong>投稿生成选项：</strong>
                             </td>
                             <td class="righttd">
                             <asp:CheckBoxList ID="PublicationRefreshHtmlOption" runat="server" RepeatDirection="Horizontal" Width="439px">
                              <asp:ListItem Value="1">生成首页</asp:ListItem>
                              <asp:ListItem Value="2">生成一级栏目页</asp:ListItem>
                              <asp:ListItem Value="3">生成所有栏目页</asp:ListItem>
                              <asp:ListItem Value="4">生成内容页</asp:ListItem>
                              </asp:CheckBoxList>
                                 Tips:<span class="tips">1、不选择表示会员投稿不自动生成html操作;
                                  <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2、只有投稿不需要审核时,此处设置才有效;</span>

                             </td>
                         </tr>
                         <tr>
                             <td align="right" class="lefttd">
                                 <strong>审核过的稿件是否允许修改：</strong></td>
                             <td class="righttd"><asp:RadioButtonList ID="PublicationModifyVerify" runat="server"
                               Width="217px">
                                 <asp:ListItem Selected="True" Value="0">不允许</asp:ListItem>
                                 <asp:ListItem Value="1">允许，但修改后自动转为未审</asp:ListItem>
                                 <asp:ListItem Value="2">允许，且修改后仍为已审核</asp:ListItem>
                             </asp:RadioButtonList></td>
                         </tr>
                         </table>
         </div>
         
<div class="tab-page" id="tab5">
		  <h2 class="tab">路径SEO选项</h2>
			<script type="text/javascript">
			    tabPane1.addTabPage( document.getElementById( "tab5" ) );
			</script>
			<table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable">
                  <tr>
                         <td align="right" class="lefttd">
                             <strong>生成静态配置：</strong></td>
                         <td class="righttd">
                             <table width="100%">
                                 <tr>
                                     <td width="150" align="right">生成静态HTML总目录：</td>
                                     <td><asp:TextBox CssClass="textbox" ID="ModelFsoFolder" runat="server" Width="101px" Text="html/"></asp:TextBox>*
                                      <br /><span class="tips">用于生成静态html存放的目录，如html/,html/article/。</span></td>
                                 </tr>
                                 <tr>
                                     <td width="150" align="right">自动生成HTML列表分页数：</td>
                                     <td> <asp:TextBox CssClass="textbox" ID="FsoListNum" runat="server" Width="50px" style="text-align:center">3</asp:TextBox>页
                                     <br /><span class="tips">这里设置生成栏目列表分页时自动生成的分页数，如果你的网站数据量较大，建议输入一个较小的数字，小数据量的网站可以不用限制，直接设置为0。</span></td>
                                 </tr>
                             </table>
                             </td>
                     </tr>
                     <tr>
                         <td align="right" class="lefttd">
                             <div align="right">
                                 <strong>伪静态配置：</strong></div>
                         </td>
                         <td class="righttd">
                                <table width="100%">
                                 <tr>
                                     <td width="150" align="right">列表页使用规则：</td>
                                     <td>
                                        <asp:DropDownList ID="DrpRewriteListRule" runat="server"></asp:DropDownList>
                                     </td>
                                 </tr>
                                 <tr>
                                     <td width="150" align="right">列表页分页使用规则：</td>
                                     <td>
                                        <asp:DropDownList ID="DrpRewriteListPageRule" runat="server"></asp:DropDownList>
                                     </td>
                                 </tr>
                                 <tr>
                                     <td width="150" align="right">内容页使用规则：</td>
                                     <td>
                                        <asp:DropDownList ID="DrpRewriteViewRule" runat="server"></asp:DropDownList>
                                     </td>
                                 </tr>
                                 <tr>
                                     <td width="150" align="right">内容页分页使用规则：</td>
                                     <td>
                                        <asp:DropDownList ID="DrpRewriteViewPageRule" runat="server"></asp:DropDownList>
                                     </td>
                                 </tr>
                                 <tr>
                                     <td width="150" align="right"></td>
                                     <td>
                                       <span class="tips">如果您对伪静态规则不了解，请使用默认。</span>
                                     </td>
                                 </tr>
                             </table>
                            
                         </td>
                     </tr>
            </table>
    </div>

         
       <div class="tab-page" id="tab6">
		  <h2 class="tab">其它选项</h2>
			<script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab6" ) );
			</script>
			<table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable">
                         <tr>
                             <td align="right" class="lefttd">
                                 <strong>本模型是否允许评论：</strong></td>
                             <td class="righttd"><asp:RadioButtonList ID="CommentType" runat="server"
                               Width="377px">
                                 <asp:ListItem Value="0">本模型关闭评论系统</asp:ListItem>
                                 <asp:ListItem Value="1">本模型只允许会员评论，且评论内容需要后台的审核</asp:ListItem>
                                 <asp:ListItem Value="2">本模型只允许会员评论，且评论内容不需要后台审核</asp:ListItem>
                                 <asp:ListItem Value="3">本模型允许会员，游客评论，且评论内容需要后台审核</asp:ListItem>
                                 <asp:ListItem Selected="True" Value="4">本模型允许会员，游客评论，且评论内容不需要后台审核</asp:ListItem>
                                 <asp:ListItem Value="5">本型只允许游客评论，且评论内容需要后台的审核</asp:ListItem>
                                 <asp:ListItem Value="6">本型只允许游客评论，且评论内容不需要后台的审核</asp:ListItem>
                             </asp:RadioButtonList></td>
                         </tr>
                         <tr>
                             <td align="right" class="lefttd" style="height: 30px">
                                 <strong>评论设置：</strong></td>
                             <td class="righttd" style="height: 30px">
                             <div class="colmn">
                                 评论字数控制<asp:TextBox CssClass="textbox" ID="CommentLen" style="text-align:center" runat="server" Width="71px">0</asp:TextBox><span class="tips">不限制请输入"0"。</span></div>
                              <div class="colmn">
                                 每页加载评论条数<asp:TextBox CssClass="textbox" ID="TxtCmtPageSize1" Text="5" style="text-align:center" runat="server" Width="71px">0</asp:TextBox>&nbsp;&nbsp; 更多评论页首页显示评论条数<asp:TextBox CssClass="textbox" Text="10" ID="TxtCmtPageSize2" style="text-align:center" runat="server" Width="71px">0</asp:TextBox>不限制请输入"0"</div>
                              <div class="colmn">
                                  评论页模板： <asp:TextBox CssClass="textbox" ID="CommentTemplate" runat="server" Width="350px"></asp:TextBox>
                                 <input type="button" class="button" onMouseOver="this.className='button_on';" onMouseOut="this.className='button';" value="选择模板..." onClick="SelectTemplate('<%=this.CommentTemplate.ClientID%>');"/>
                              </div>
                             </td>
                         </tr>
                         <tr>
                             <td align="right" class="lefttd" style="height: 30px">
                                 <strong>最新信息设置：</strong></td>
                             <td class="righttd" style="height: 30px">
                                 <asp:TextBox CssClass="textbox" ID="NewestDay" style="text-align:center" runat="server" Width="71px">3</asp:TextBox>天内的信息标志为最新</td>
                         </tr>
                         <tr<%=BasicType.SelectedValue=="4"?" style='display:none;'":string.Empty %>>
                             <td align="right" class="lefttd" style="height: 30px">
                                 <strong>管理员审核机制：</strong></td>
                             <td class="righttd" style="height: 30px">
                                <asp:RadioButtonList ID="RdbVerifyJB" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                    <asp:ListItem Value="0" Selected="True">一级审核</asp:ListItem>
                                    <asp:ListItem Value="1">二级审核</asp:ListItem>
                                </asp:RadioButtonList>
                                 </td>
                         </tr>
                         <tr>
                             <td align="right" class="lefttd" style="height: 30px">
                                 <strong>本模型是否允许搜索：</strong></td>
                             <td class="righttd" style="height: 30px">
                              <asp:RadioButtonList ID="RdbSearchTF" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                  <asp:ListItem Value="1" Selected="True">允许</asp:ListItem>
                                  <asp:ListItem Value="0">不允许</asp:ListItem>
                              </asp:RadioButtonList>    
                            </td>
                         </tr>
                         <tr>
                            <td align="right" class="lefttd" style="height: 30px">
                                 <strong>启用模糊搜索：</strong></td>
                             <td class="righttd" style="height: 30px">
                              <asp:RadioButtonList ID="RdbSearchType" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                  <asp:ListItem Value="1" Selected="True">启用</asp:ListItem>
                                  <asp:ListItem Value="0">不启用</asp:ListItem>
                              </asp:RadioButtonList>  
                                 <br />
                              <span class="tips">
                                Tips: 启用模糊搜索时，比如搜索“xp 2003”，包含xp和2003两者或是只包含其中一个，都能搜索出来,但会加大系统资源的开销。
                              </span> 
                            </td>
                         </tr>
                          <tr>
                             <td align="right" class="lefttd" style="height: 30px">
                                 <strong>搜索匹配字段：</strong></td>
                             <td class="righttd" style="height: 30px">
                                 <asp:CheckBoxList ID="CkbSearchFiled" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                     <asp:ListItem Value="Title" Selected="True">标题(Title)</asp:ListItem>
                                     <asp:ListItem Value="KeyTags">关键字(KeyTags)</asp:ListItem>
                                    <asp:ListItem Value="Intro">简要介绍(Intro)</asp:ListItem>
                                 </asp:CheckBoxList> 
                                 </td>
                         </tr>
                         <tr>
                             <td align="right" class="lefttd" style="height: 30px">
                                 <strong>搜索页模板：</strong></td>
                             <td class="righttd" style="height: 30px">
                                 <asp:TextBox CssClass="textbox" ID="SearchTemplate" runat="server" Width="350px"></asp:TextBox>
                                 <input type="button" class="button" onMouseOver="this.className='button_on';" onMouseOut="this.className='button';" value="选择模板..." onClick="SelectTemplate('<%=this.SearchTemplate.ClientID%>');"/>
                                 <span class="tips">可以留空，将调用全站搜索模板。</span>
                                 </td>
                         </tr>
                       </table>
         </div>

    </div>
	
                     
                       

        <div class="main-button">
          
            <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" />
        </div>
        
       </asp:Panel>
</div>

</asp:Content>