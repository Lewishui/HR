<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Model" Title="ģ�͹���" Codebehind="KS.Model.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="System.Xml" %>
<%@ Import Namespace="System.Data" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
      <asp:Panel ID="ModelListArea" runat="server" Width="100%">
       <div id="manage_top" class="menu_top_fixed">
       <ul>
        <li id='p1'><asp:HyperLink NavigateUrl="ks.model.aspx?action=add"  ID="addbutton" runat="server" Text="���ģ��"><b></b>���ģ��</asp:HyperLink></li>
        <li id='p2'><asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click"><b></b>����ͳ��</asp:LinkButton></li>
        <li id='p18'><a href="KS.ModelExportOrImport.aspx?action=export"><b></b>ģ�͵���&����</a></li>
        <li id='p9'><asp:HyperLink ID="backbutton" NavigateUrl="KS.MODEL.ASPX"  Text="����һ��" runat="server" Enabled="False"><b></b>����һ��</asp:HyperLink></li>
        </ul>
        </div>     
       <div class="menu_top_fixed_height"></div> 

     <div class="content-area"> 
          <div class="tabs_header">
            <ul class="tabs">
            <li<%=KSCMS.S("showType")==""?" class='active'":string.Empty %>><a href="KS.Model.aspx?<%=UtilsQueryParam.Get("showtype") %>"><span>ϵͳģ��</span></a></li>
            <li<%=KSCMS.S("showType")=="1"?" class='active'":string.Empty %>><a href="KS.Model.aspx?showType=1&<%=UtilsQueryParam.Get("showtype") %>"><span>Ӧ�ù���</span></a></li>
            <li<%=KSCMS.S("showType")=="2"?" class='active'":string.Empty %>><a href="KS.Model.aspx?showType=2&<%=UtilsQueryParam.Get("showtype") %>"><span>���ܿ���</span></a></li>
            </ul>
        </div>

        <asp:Panel ID="PanelSys" runat="server">
          <KS:OrderJS ID="OrderJS1" runat="server" />   
           <asp:GridView cssclass="CTable" ID="GridView1" runat="server" ForeColor="Black" GridLines="None" Width="100%" AutoGenerateColumns="False" EmptyDataText="û�н��κ�ģ��" OnRowDataBound="GridView1_RowDataBound" OnRowCreated="GridView1_RowCreated" OnRowCommand="GridView1_RowCommand">
               <Columns>
                 <asp:TemplateField HeaderText="����">
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
                 <asp:TemplateField HeaderText="״̬">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                   <a href="?action=ModelStatus&channelid=<%#Eval("channelid")%>" <%# Convert.ToString(Eval("ModelStatus"))=="0"?"class='no' title='������'":"class='ok' title='����'" %>></a>
              </itemtemplate>
            </asp:TemplateField>

                <asp:BoundField HeaderText="ģ������" DataField="ModelName" FooterText="ModelName">
                    <ItemStyle HorizontalAlign="Center"  />
                </asp:BoundField>
                <asp:TemplateField HeaderText="���ݱ���" ShowHeader="False">
                    <itemstyle/>
                    <itemtemplate>
                    <span class="tips"><%# Eval("ModelTable") %></span>
                   </itemtemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="��Ŀ����" ShowHeader="False">
                    <itemstyle HorizontalAlign="Center"/>
                    <itemtemplate>
                    <span class="tips"><%# Eval("ModelItem")%></span>
                   </itemtemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="��Ŀ��λ" ShowHeader="False">
                    <itemstyle HorizontalAlign="Center"/>
                    <itemtemplate>
                    <span class="tips"><%# Eval("ModelItemUnit")%></span>
                   </itemtemplate>
                </asp:TemplateField>
                
                   <asp:TemplateField HeaderText="����">
                   <ItemStyle HorizontalAlign="Center" Width="50px" />
                   <ItemTemplate>
                    <%#GetModelType(Convert.ToInt16(Eval("ModelType","{0}"))) %>
                   </ItemTemplate>
                   </asp:TemplateField>


           <asp:TemplateField HeaderText="�༭">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                   <a  href="KS.Model.aspx?action=modify&channelid=<%#Eval("channelid") %>" class="edit"></a>
              </itemtemplate>
            </asp:TemplateField>

           <asp:TemplateField HeaderText="ɾ��">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                     <%# Convert.ToString(Eval("ModelType")).Equals("1")?"-":@"<a href=""javascript:;"" class=""delete"" onclick=""KesionJS.Confirm('ɾ��ģ�Ͳ����棬ȷ��ɾ����','location.href=\'"+KSCMS.GetInstallDir() + MyCache.GetCacheConfig(4) +@"/Model/KS.Model.aspx?action=del&channelid="+Eval("ChannelID","{0}")+@"\';','')"" title=""ɾ��ģ��""></a>" %>
              </itemtemplate>
            </asp:TemplateField>
           <asp:TemplateField HeaderText="��¡">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                        <asp:LinkButton ID="CloneTemplate" CssClass="copy" ToolTip="��¡ģ��" CommandArgument='<%#Eval("ChannelID","{0}")%>' CommandName="clone" runat="server"></asp:LinkButton>
              </itemtemplate>
            </asp:TemplateField>

               
                <asp:TemplateField HeaderText="�ֶι���" ShowHeader="False">
                    <itemstyle width="70px" HorizontalAlign="Center" />
                    <itemtemplate>
                        <a href="KS.Field.aspx?channelid=<%#Eval("ChannelID","{0}")%>" class="link-color" title="�ֶι���">�ֶι���</a>
                        <asp:LinkButton ID="ChangeStatus" Text="" CommandArgument='<%#Eval("ChannelID","{0}")%>' CommandName="status" runat="server"></asp:LinkButton>
                   </itemtemplate>
                </asp:TemplateField>
                   <asp:TemplateField HeaderText="Ԥ��">
                    <ItemStyle Width="30" HorizontalAlign="center" />
                    <ItemTemplate>
                        <asp:LinkButton ID="preview" Text="Ԥ��" CommandArgument='<%#Eval("ChannelID","{0}")%>' CommandName='preview' runat="server" CssClass="link-color"></asp:LinkButton>
                    </ItemTemplate>
                   </asp:TemplateField>
            </Columns>
               <HeaderStyle CssClass="CTitle" />
               <PagerSettings NextPageText="��һҳ" PreviousPageText="��һҳ" />
               <EmptyDataRowStyle CssClass="emptycss" />
           </asp:GridView>
          <div class="main-button">
          	  <asp:Button ID="BtnSaveOrder" Text="������������" runat="server" CssClass="button" OnClick="BtnSaveOrder_Click" />
          </div>   
</asp:Panel>
 
     <asp:Panel ID="PanelPlus" runat="server" Visible="false">
      <script type="text/javascript">
		 function delPluslapp(Pluslid){
		     top.$.dialog.confirm('�Ƿ�ر�Ӧ�ò��?',function(){location.href='<%=KSCMS.GetInstallDir()+MyCache.GetCacheConfig(4)%>/model/KS.Model.aspx?action=delPlus&showtype=<%=KSCMS.S("showtype")%>&Plusid='+Pluslid;},function(){});
		 }
		 function addPluslapp(Pluslid){
		     top.$.dialog.confirm('�Ƿ���Ӧ�ò��?',function(){location.href='<%=KSCMS.GetInstallDir()+MyCache.GetCacheConfig(4)%>/model/KS.Model.aspx?action=addPlus&showtype=<%=KSCMS.S("showtype")%>&Plusid='+Pluslid;},function(){});
		 }
		</script>

         <table class="CTable" cellspacing="0" border="0"  style="color:Black;width:100%;border-collapse:collapse;">
				<tr class="CTitle">
					<th scope="col" style="width:30px">���</th><th scope="col"  style="width:60px">״̬</th><th scope="col">Ӧ������</th><th scope="col" style="width:50px;">Ȩ��ֵ</th><th scope="col">�������</th>
                </tr>
              <%
                  XmlDocument doc = new XmlDocument();
                  doc.Load(Server.MapPath("~/config/managemenu.xml"));
                  XmlNode nodes = doc.SelectSingleNode("//managemenu/topitem[@role=\"sub\"]");
                  StringBuilder sb = new StringBuilder();
                  if (nodes == null)
                  {
                      sb.AppendLine(string.Format("<tr><td colspan='10' align='center' class=\"Ctd\">{0}</td></tr>", "�޿���Ӧ�ã�"));
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
                                ,isOpen?"�ر�":"����"
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
            <td class="righttd" style="text-align:center;height:28px"><b>���򹴵�ģ���ں�̨����˵��н��رղ���ʾ</b></td>
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

                foreach (XmlNode topnode in nodes.ChildNodes) //�����˵�
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
                    <td class="righttd" style="font-size:14px;font-family:����;font-weight:bold"><label><%=UtilsAutoID.CapitalFigures(i) %>����<%=topnode.SelectSingleNode("@name").InnerText %>��</label> </td>
                  </tr>
                   <tr id="top<%=i %>">
                       <td style="padding-left:50px;">
                          
                           <%
                               int li = 0;

                               foreach (XmlNode leftnode in topnode.SelectNodes("leftitem")) //���һ���˵�
                               {
                                   string leftEnable = leftnode.Attributes["enable"].InnerText.ToLower();

                            %>
                            <table width="100%" border="0" cellpadding="1" cellspacing="1"> 
                              <tr>
                                <td style="height:28px"><label><%=UtilsAutoID.ToNum1(li) %>��<input class="t<%=i %>_<%=li%>" onclick="LeftToggle(this,<%=i%>,<%=li %>);" type="checkbox" name="<%=leftnode.SelectSingleNode("@id").InnerText %>" value="1"<%if (leftEnable=="true") Response.Write(" checked"); %> />��<%=leftnode.SelectSingleNode("@name").InnerText %>��</label><span style="font-weight:normal;color:#999;">(<a href="javascript:;" style="color:#999;" onclick="DoCheck(<%=i %>,<%=li%>,true)">ȫѡ</a> <a href="javascript:;" style="color:#999;" onclick="DoCheck(<%=i %>,<%=li%>,false)">��ѡ</a>)</a></span></td>
                              </tr>
                              <tr id="left-<%=i %>-<%=li %>"<%=(leftEnable=="true")?string.Empty:" style='display:none';"%>>
                                  <td>
                                      <ul class="poweritem">
                                    <%
                                        int itemnum = 0;
                                        foreach (XmlNode item in leftnode.SelectNodes("itemlist/item")) //��߶����˵�
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
          <asp:Button ID="BtnModelSave" Text="��������ģ������" runat="server" CssClass="button" OnClick="BtnModelSave_Click"/>
      </div>
      </asp:Panel>


       </asp:Panel>
 </div>      
       <asp:Panel ID="ModelAddlist" runat="server" Visible="false" Width="100%">
           <KS:TopNav ID="TopNav1" runat="server" Text="�����ģ��" />
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
              KesionJS.Alert('������ģ������!',"$('#<%=this.ModelName.ClientID%>').focus()");
              return false;
          }
          if ($("#<%=this.ModelFolder.ClientID%>").val()==''){
              KesionJS.Alert('������ģ��Ӣ������!',"$('#<%=this.ModelFolder.ClientID%>').focus()");
              return false;
          }
          if ($("#<%=this.ModelTable.ClientID%>").val()==''){
              KesionJS.Alert('������ģ�����ݱ�!',"$('#<%=this.ModelTable.ClientID%>').focus()");
              return false;
          }
          if ($("#<%=this.ModelItem.ClientID%>").val()==''){
              KesionJS.Alert('������ģ����Ŀ����!',"$('#<%=this.ModelItem.ClientID%>').focus()");
              return false;
          }
          if ($("#<%=this.ModelItemUnit.ClientID%>").val()==''){
              KesionJS.Alert('������ģ����Ŀ��λ!',"$('#<%=this.ModelItemUnit.ClientID%>').focus()");
              return false;
          }
          if ($("#<%=this.ModelItem.ClientID%>").val()==''){
              KesionJS.Alert('������ģ����Ŀ����!',"$('#<%=this.ModelItem.ClientID%>').focus()");
              return false;
          }
          if ($("#<%=this.ModelItem.ClientID%>").val()==''){
              KesionJS.Alert('������ģ����Ŀ����!',"$('#<%=this.ModelItem.ClientID%>').focus()");
              return false;
          }
          if ($("#<%=this.ModelItem.ClientID%>").val()==''){
              KesionJS.Alert('������ģ����Ŀ����!',"$('#<%=this.ModelItem.ClientID%>').focus()");
              return false;
          }
          if ($("#<%=this.ModelItem.ClientID%>").val()==''){
              KesionJS.Alert('������ģ����Ŀ����!',"$('#<%=this.ModelItem.ClientID%>').focus()");
              return false;
          }
          if ($("#<%=this.ModelItem.ClientID%>").val()==''){
              KesionJS.Alert('������ģ����Ŀ����!',"$('#<%=this.ModelItem.ClientID%>').focus()");
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
		  <h2 class="tab">��������</h2>
			<script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab0" ) );
			</script>
			<table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable">
                   <tr>
                       <td align="right" class="lefttd">
                           <strong>ģ��״̬��</strong></td>
                       <td class="righttd">
                           <asp:RadioButtonList ID="ModelStatus" runat="server" RepeatDirection="Horizontal"
                               Width="150px">
                               <asp:ListItem Selected="True" Value="1">����</asp:ListItem>
                               <asp:ListItem Value="0">�ر�</asp:ListItem>
                           </asp:RadioButtonList>
                           
                           </td>
                   </tr>
                   <tr>
                       <td align="right" class="lefttd" >
                           <strong>ģ�����ƣ�</strong></td>
                       <td class="righttd">
                           <asp:TextBox CssClass="textbox" ID="ModelName" runat="server" Width="228px"></asp:TextBox><font color="#ff0000">*</font><span class="tips">�磺�˲�ϵͳ������ϵͳ�ȡ�</span></td>
                   </tr>
                   <tr id="Tr2" runat="server" style="display:none">
                       <td align="right" class="lefttd">
                           <strong>ģ��Ӣ�����ƣ�</strong></td>
                       <td  class="righttd">
                           <asp:TextBox CssClass="textbox" ID="ModelFolder" runat="server" onblur="CheckEnglishStr(this,'ģ��Ŀ¼����')" Width="101px"></asp:TextBox><span style="color: #ff0000">*</span>Ӣ�����ƣ�ֻ������ĸ�����ֵ����<asp:RequiredFieldValidator
                               ID="RequiredFieldValidator5" runat="server" ControlToValidate="ModelFolder" ErrorMessage="ģ��Ӣ�����Ʊ�������" Display="Dynamic"></asp:RequiredFieldValidator>
                           <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="ModelFolder"
                               Display="Dynamic" ErrorMessage="��������ĸ��ͷ����������ֻ���ĸ����ϣ�������3-10���ַ�֮��" ValidationExpression="[a-zA-Z]{1}[\d|(a-zA-Z)]{1,9}"></asp:RegularExpressionValidator></td>
                   </tr>
                   <tr>
                       <td align="right" class="lefttd">
                           <strong>���ݱ����ƣ�</strong></td>
                       <td class="righttd">
                           KS_U_<asp:TextBox CssClass="textbox" ID="ModelTable" runat="server" Width="109px"></asp:TextBox><span
                               style="color: #ff0000">*</span><asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                                   runat="server" ControlToValidate="ModelTable" ErrorMessage="���ݱ����Ʊ�������" Display="Dynamic"></asp:RequiredFieldValidator>
                           <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="ModelTable"
                               ErrorMessage="��������ĸ��ͷ����������ֻ���ĸ����ϣ�������2-10���ַ�֮��" ValidationExpression="[a-zA-Z]{1}[\d|(a-zA-Z)]{1,9}"></asp:RegularExpressionValidator><br />
                           <span class="tips">˵�����������ݱ���޷��޸ģ������û����������ݱ���"KS_U_"��ͷ��</span></td>
                   </tr>
                   <tr id="LArea" runat="server">
                       <td align="right" class="lefttd">
                           <strong>��Ŀ���ƣ�</strong></td>
                       <td class="righttd">
                           <asp:TextBox CssClass="textbox" ID="ModelItem" Text="����" runat="server" Width="154px"></asp:TextBox><span style="color: #ff0000">*</span><span class="tips">�磺���¡�ͼƬ������ȡ�</span></td>
                   </tr>
                   <tr runat="server" id="Tr1">
                       <td align="right" class="lefttd">
                           <strong>��Ŀ��λ��</strong></td>
                       <td  class="righttd">
                           <asp:TextBox CssClass="textbox" ID="ModelItemUnit" style="text-align:center" runat="server" Text="ƪ" Width="53px"></asp:TextBox><span style="color: #ff0000">*</span><span class="tips">�磺ƪ���������ȡ�</span></td>
                   </tr>
                   
                       <tr>
                           <td align="right" class="lefttd">
                               <strong>�� �� �ͣ�</strong></td>
                           <td class="righttd">
                               <asp:DropDownList ID="BasicType" runat="server">
                                   <asp:ListItem Value="1">������</asp:ListItem>
                                   <asp:ListItem Value="2">ͼƬ��</asp:ListItem>
                                   <asp:ListItem Value="3">������</asp:ListItem>
                                   <asp:ListItem Value="4">�̳���</asp:ListItem>
                               </asp:DropDownList></td>
                       </tr>

            <tr>
                       <td align="right" class="lefttd">
                           <strong>ģ��˵����</strong></td>
                       <td class="righttd">
                           <asp:TextBox CssClass="textbox" ID="Intro" runat="server" Rows="5" width="350px" height="60px" Columns="45" TextMode="MultiLine"></asp:TextBox>
                       <a class="textarea_min" href="javascript:zoomtextarea(-2,'<%=this.Intro.ClientID %>');"> </a>
                       <a class="textarea_max" href="javascript:zoomtextarea(2,'<%=this.Intro.ClientID %>');"></a>  
                           </td>
                   </tr>
                   </table>
			
         </div>
         
         
         <div class="tab-page" id="tab2">
		  <h2 class="tab">ģ��ѡ��</h2>
			<script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab2" ) );
			</script>
			<table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable">
                    <tr>
                           <td align="right" class="lefttd">
                               <strong>��ģ�����û���վ���ܣ�</strong></td>
                           <td class="righttd">
                               <asp:RadioButtonList ID="RdbRecycle" runat="server" RepeatDirection="Horizontal"
                               Width="150px">
                                   <asp:ListItem Value="1" Selected="True">����</asp:ListItem>
                                   <asp:ListItem Value="0">������</asp:ListItem>
                               </asp:RadioButtonList>
                             <span class="tips">���û���վ����ɾ���ĵ����������վ������ڻ���վ�л�ԭ��</span>  
                             </td>
                       </tr>
				     <tr>
                           <td align="right" class="lefttd">
                               <strong>�Ƿ�����SEOѡ�</strong></td>
                           <td class="righttd">
                               <asp:RadioButtonList ID="SeoOptions" runat="server" RepeatDirection="Horizontal"
                               Width="150px">
                                   <asp:ListItem Value="1" Selected="True">����</asp:ListItem>
                                   <asp:ListItem Value="0">������</asp:ListItem>
                               </asp:RadioButtonList></td>
                       </tr>
				      <tr>
                           <td align="right" class="lefttd">
                               <strong id="chargesInner" runat="server">�Ƿ������շ�ѡ�</strong></td>
                           <td class="righttd">
                               <asp:RadioButtonList ID="ChargesOptions" runat="server" RepeatDirection="Horizontal"
                               Width="150px">
                                   <asp:ListItem Value="1" Selected="True">����</asp:ListItem>
                                   <asp:ListItem Value="0">������</asp:ListItem>
                               </asp:RadioButtonList></td>
                       </tr>
                       <tbody id="showOptions" runat="server">
                       <tr>
                           <td align="right" class="lefttd">
                               <strong>�Ƿ���������ѡ�</strong></td>
                           <td class="righttd">
                               <asp:RadioButtonList ID="AttributeOptions" runat="server" RepeatDirection="Horizontal"
                               Width="150px">
                                   <asp:ListItem  Selected="True" Value="1">����</asp:ListItem>
                                   <asp:ListItem Value="0">������</asp:ListItem>
                               </asp:RadioButtonList></td>
                       </tr>
                       <tr>
                           <td align="right" class="lefttd">
                               <strong>�Ƿ�����ͶƱѡ�</strong></td>
                           <td class="righttd">
                               <asp:RadioButtonList ID="ReceiptOptions" runat="server" RepeatDirection="Horizontal" Width="150px">
                                   <asp:ListItem Value="1" Selected="True">����</asp:ListItem>
                                   <asp:ListItem  Value="0">������</asp:ListItem>
                               </asp:RadioButtonList></td>
                       </tr>
                       <tr>
                           <td align="right" class="lefttd">
                               <strong>�Ƿ�����PKѡ�</strong></td>
                           <td class="righttd">
                               <asp:RadioButtonList ID="PKOptions" runat="server" RepeatDirection="Horizontal" Width="150px">
                                   <asp:ListItem Value="1" Selected="True">����</asp:ListItem>
                                   <asp:ListItem  Value="0">������</asp:ListItem>
                               </asp:RadioButtonList></td>
                       </tr>
                       <tr>
                           <td align="right" class="lefttd">
                               <strong>��ģ�ͼƷѷ�ʽ��</strong></td>
                           <td class="righttd">
                               <asp:RadioButtonList ID="RdbChargeType" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                   <asp:ListItem Value="0" Selected="True">��ȯ</asp:ListItem>
                                   <asp:ListItem  Value="1">�ʽ�(�����)</asp:ListItem>
                                   <asp:ListItem  Value="2">����</asp:ListItem>
                               </asp:RadioButtonList>
                               <span class="tips">Tips:������/ͼƬ/���ص�������Ҫ���Ѳſ��Բ鿴,�����������õļƷѱ�׼�۷�,һ�����ý��鲻Ҫ�޸ġ�</span>
                           </td>
                       </tr>
                    </tbody> 
                       <tr>
                           <td align="right" class="lefttd">
                               <strong>��ģ�ͺ�̨���������Ŀѡ��ʽ��</strong></td>
                           <td class="righttd">
                               <asp:RadioButtonList ID="RdbClassSelectType" runat="server" RepeatDirection="Horizontal" Width="220px">
                                   <asp:ListItem Value="0" Selected="True">���޼�����(�Ƽ�)</asp:ListItem>
                                   <asp:ListItem  Value="1">�����б�</asp:ListItem>
                               </asp:RadioButtonList>
                           </td>
                       </tr>
                      <tr>
                            <td align="right" class="lefttd">
                                <strong>¼������ѡ�</strong></td>
                            <td class="righttd">
                                <asp:CheckBoxList ID="CBLShowOption" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                    <asp:ListItem Value="1">����ǰ׺</asp:ListItem>
                                    <asp:ListItem Value="2">������ɫ</asp:ListItem>
                                    <asp:ListItem Value="3">�������</asp:ListItem>
                                    <asp:ListItem Value="4" Selected="True">��������</asp:ListItem>
                                    <asp:ListItem Value="5" Selected="True">�ϴ�����</asp:ListItem>
                                    <asp:ListItem Value="6" Selected="True">�����շ�</asp:ListItem>
                                    <asp:ListItem Value="7">��ҳ����</asp:ListItem>
                                    <asp:ListItem Value="8" Selected="True">�Զ���ȡ���</asp:ListItem>
                                    <asp:ListItem Value="9" Selected="True">�Զ������������ͼƬ</asp:ListItem>
                                    <asp:ListItem Value="10" Selected="True">�Զ���ȡ�������һ��ͼƬ��Ϊ��ҳͼƬ</asp:ListItem>
                                    <asp:ListItem Value="11" Selected="True">Ĭ����������ͼ</asp:ListItem>
                                    <asp:ListItem Value="12" Selected="True">Ĭ�ϼ�ˮӡ</asp:ListItem>
                                </asp:CheckBoxList>

                            </td>
                        </tr>
                     <tr>
                            <td align="right" class="lefttd">
                                <strong>����Ĭ�Ϲ���ѡ�</strong></td>
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
                                    <asp:ListItem Value="FilterA">A����</asp:ListItem>
                                    <asp:ListItem Value="FilterHtml">Html</asp:ListItem>
                                    <asp:ListItem Value="FilterStyle">Style</asp:ListItem>
                                </asp:CheckBoxList>

                            </td>
                        </tr>
                     <tr>
                         <td align="right" class="lefttd">
                             <strong>����(DIGG)ѡ�</strong></td>
                         <td class="righttd">
                         	<div class="colmn">
                              <asp:CheckBox ID="CkbDiggByVisitor" runat="server" Text="�����ο�Digg" />
                              <asp:CheckBox ID="CkbDiggRepeat" runat="server" Text="�����ظ�Digg" />
                             </div>
                             <div class="hr_line"></div>
                         	<div class="colmn">
                             �û��㶥����<asp:TextBox CssClass="textbox" style="text-align:center" ID="DiggPerTimes" runat="server" Width="50px">1</asp:TextBox>��
                             �û��㶥����<asp:TextBox  style="text-align:center;width:50px" CssClass="textbox" ID="TxtDiggAddScore" runat="server" Text="0"></asp:TextBox>�ֻ��� Ͷ���ߵ��ĵ���������<asp:TextBox Text="0" style="text-align:center;width:50px" CssClass="textbox" ID="TxtDiggInputerScore" runat="server"></asp:TextBox>�ֻ���
                              <span class="tips">Tips:�����������롰0����</span>
                               </div>
                               <div class="hr_line"></div>
                                <div class="colmn">
                               �ڱ�ģ��Digg����ͬһ��ͬһ���û����ֻ������<asp:TextBox  style="text-align:center;width:50px" CssClass="textbox" ID="TxtDiggAddMaxScore" runat="server" Text="0"></asp:TextBox>�ֻ��֡�
                              <span class="tips">Tips:�����������롰0��������ÿ���û�ÿ�����͵Ļ��ֳ����������õĻ��ֺ��ٴε㶥���������͡�</span>
                              </div>
                         </td>
                     </tr>
                    <tr>
                         <td align="right" class="lefttd">
                             <strong>�ղ�ѡ�</strong></td>
                         <td class="righttd">
                         	<div class="colmn">
                             �û��ղ��ĵ�����<asp:TextBox  style="text-align:center;width:50px" CssClass="textbox" ID="TxtFavAddScore" runat="server" Text="0"></asp:TextBox>�ֻ���  Ͷ���ߵ��ĵ����ղ�����<asp:TextBox Text="0" style="text-align:center;width:50px" CssClass="textbox" ID="TxtFavInputerScore" runat="server"></asp:TextBox>�ֻ���
                             </div>
                             <div class="hr_line"></div>
                              <div class="colmn">
                             �û�<asp:TextBox Text="0" style="text-align:center;width:50px" CssClass="textbox" ID="TxtFavScoreLimitTime" runat="server"></asp:TextBox>Сʱ�ڽ��ղص��ĵ�ȡ���ղأ����۳�<asp:TextBox Text="0" style="text-align:center;width:50px" CssClass="textbox" ID="TxtFavDelScore" runat="server"></asp:TextBox>�ֻ���
                             <span class="tips">Tips:�����������롰0����</span>
                             </div>
                             <div class="hr_line"></div>
                              <div class="colmn">
                              �ڱ�ģ���ղز���ͬһ��ͬһ���û����ֻ������<asp:TextBox  style="text-align:center;width:50px" CssClass="textbox" ID="TxtFavAddMaxScore" runat="server" Text="0"></asp:TextBox>�ֻ��֡�
                              <span class="tips">Tips:�����������롰0��������ÿ���û�ÿ�����͵Ļ��ֳ����������õĻ��ֺ��ٴε㶥���������͡�</span>
								</div>
                         </td>
                    </tr>
                   
       
				 </table>

         </div>
         <div class="tab-page" id="tab3">
		  <h2 class="tab">�ϴ�ѡ��</h2>
			<script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab3" ) );
			</script>
			<table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable">
                    <tr class="ctr">
                       <td align="right" class="lefttd">
                           <strong>�Ƿ��������Ա�ϴ��ļ���</strong></td>
                       <td class="righttd">
                           <asp:RadioButtonList ID="AdminUpfilesTF" runat="server" RepeatDirection="Horizontal">
                               <asp:ListItem Selected="True" Value="1">����</asp:ListItem>
                               <asp:ListItem Value="0">������</asp:ListItem>
                           </asp:RadioButtonList></td>
                       </tr>
                     <tr class="ctr" style="display:none">
                         <td align="right" class="lefttd">
                             <strong>����Ա�ϴ��ļ�Ŀ¼��</strong></td>
                         <td class="righttd">
                             <asp:TextBox CssClass="textbox" ID="AdminUpfilesDir" runat="server">UploadFiles/</asp:TextBox>
                             <span style="color: #ff0033">������ "/"����</span></td>
                     </tr>
                     <tr class="ctr">
                         <td align="right" class="lefttd">
                             <strong>�Ƿ������Ա�ϴ��ļ���</strong></td>
                         <td class="righttd"><asp:RadioButtonList ID="UserUpfilesTF" runat="server" RepeatDirection="Horizontal">
                             <asp:ListItem Selected="True" Value="1">����</asp:ListItem>
                             <asp:ListItem Value="0">������</asp:ListItem>
                         </asp:RadioButtonList></td>
                     </tr>
                     <tr class="ctr">
                         <td align="right" class="lefttd">
                             <strong>ǰ̨��Ա�ϴ��ļ�Ŀ¼��</strong></td>
                         <td class="righttd">
                             <asp:TextBox CssClass="textbox" ID="UserUpFilesDir" runat="server">User/</asp:TextBox>
                             <span style="color: #ff0033">������ "/"����<br />
                                 <strong><span style="color: #000099">˵��:ģ���ڻ�Ա���ĵ�Ŀ¼���ɸ�ʽΪ<br />
                                 </span></strong><span style="color: blue">���ϴ�Ŀ¼+��Ա�����û�����ϴ�Ŀ¼+��Ա����+�������õ�Ŀ¼</span></span></td>
                     </tr>
                     <tr class="ctr">
                         <td align="right" class="lefttd">
                             <strong>�����ϴ�������ļ���</strong></td>
                         <td class="righttd">
                             <asp:TextBox CssClass="textbox" ID="AllowUpfilesSize" runat="server" Width="54px">1024</asp:TextBox>
                             KB&nbsp; <span style="color: #ff0000">��ʾ��1 KB = 1024 Byte��1 MB = 1024 KB
                                 <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="AllowUpfilesSize"
                                     ErrorMessage="����������" ValidationExpression="\d*"></asp:RegularExpressionValidator></span></td>
                     </tr>
                <tr class="ctr">
                         <td align="right" class="lefttd">
                             <strong>Ĭ������ͼ��С��</strong></td>
                         <td class="righttd">
                             ��ȣ�<asp:TextBox CssClass="textbox" ID="TxtThumbWidth" runat="server" Width="54px">250</asp:TextBox>
                            ���� <span class="tips">��Ϊ0ʱ�����Ը߶�Ϊ׼��������С��</span>
                             <div class="hr_line"></div>
                             �߶ȣ�<asp:TextBox CssClass="textbox" ID="TxtThumbHeight" runat="server" Width="54px">0</asp:TextBox>
                            ���� <span class="tips">��Ϊ0ʱ�����Կ��Ϊ׼��������С��</span>
                             
                            </td>
                     </tr>
                     <tr class="ctr">
                         <td align="right" class="lefttd">
                             <div align="right">
                                 <strong>�����ϴ����ļ����ͣ�</strong><br />
                                 <font color="#ff0000">�����ļ�����֮����"|"�ָ�</font></div>
                         </td>
                         <td class="righttd">
                           <table border="0" cellpadding="0" cellspacing="0" width="90%">
                            <tr>
                             <td align="right" style="width: 107px;height:25px">
                                 ͼƬ����:</td>
                             <td>
                                 <asp:TextBox CssClass="textbox" ID="AllowUpPhotoType" runat="server">jpg|gif|png|bmp</asp:TextBox></td>
                            </tr>
                               <tr>
                                   <td align="right" style="width: 107px;height:25px">
                                       Flash �ļ�:</td>
                                   <td>
                                       <asp:TextBox CssClass="textbox" ID="AllowUpFlashType" runat="server">swf|flv</asp:TextBox></td>
                               </tr>
                               <tr>
                                   <td align="right" style="width: 107px;height:25px">
                                       Windows ý��:</td>
                                   <td>
                                       <asp:TextBox CssClass="textbox" ID="AllowUpMediaType" runat="server">wma|wmv|mp3|mp4</asp:TextBox></td>
                               </tr>
                               <tr>
                                   <td align="right" style="width: 107px;height:25px">
                                       Real ý��:
                                   </td>
                                   <td>
                                       <asp:TextBox CssClass="textbox" ID="AllowUpRealType" runat="server">ram|rm|ra</asp:TextBox></td>
                               </tr>
                               <tr>
                                   <td align="right" style="width: 107px;height:25px">
                                       �����ļ�:</td>
                                   <td>
                                       <asp:TextBox CssClass="textbox" ID="AllowUpOtherType" runat="server">rar|doc|zip</asp:TextBox></td>
                               </tr>
                           </table>
                         </td>
                     </tr>
                    </table>
         </div>
         <div class="tab-page" id="tab4">
		  <h2 class="tab">Ͷ��ѡ��</h2>
			<script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab4" ) );
			</script>
			<table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable">
				      <tr>
                           <td align="right" class="lefttd">
                               <strong>ǰ̨�����ܿ��أ�</strong></td>
                           <td class="righttd">
                               <asp:RadioButtonList ID="AllowPublication" runat="server">
                                   <asp:ListItem Value="0">�������������ã�</asp:ListItem>
                                   <asp:ListItem Value="1">��ȫ���ţ������ƣ�</asp:ListItem>
                                   <asp:ListItem Value="2" Selected="True">��������������Ŀ���ö���</asp:ListItem>
                               </asp:RadioButtonList></td>
                       </tr>
                         <tr>
                             <td align="right" class="lefttd">
                                 <strong>ǰ̨�����Ƿ���Ҫ��ˣ�</strong></td>
                             <td class="righttd"><asp:RadioButtonList ID="PublicationVerify" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                 <asp:ListItem Selected="True" Value="0">��Ҫ��̨�˹����</asp:ListItem>
                                 <asp:ListItem Value="1">����Ҫ���</asp:ListItem>
                             </asp:RadioButtonList></td>
                         </tr>
                         <tr>
                             <td align="right" class="lefttd">
                                 <strong>Ͷ������ѡ�</strong>
                             </td>
                             <td class="righttd">
                             <asp:CheckBoxList ID="PublicationRefreshHtmlOption" runat="server" RepeatDirection="Horizontal" Width="439px">
                              <asp:ListItem Value="1">������ҳ</asp:ListItem>
                              <asp:ListItem Value="2">����һ����Ŀҳ</asp:ListItem>
                              <asp:ListItem Value="3">����������Ŀҳ</asp:ListItem>
                              <asp:ListItem Value="4">��������ҳ</asp:ListItem>
                              </asp:CheckBoxList>
                                 Tips:<span class="tips">1����ѡ���ʾ��ԱͶ�岻�Զ�����html����;
                                  <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2��ֻ��Ͷ�岻��Ҫ���ʱ,�˴����ò���Ч;</span>

                             </td>
                         </tr>
                         <tr>
                             <td align="right" class="lefttd">
                                 <strong>��˹��ĸ���Ƿ������޸ģ�</strong></td>
                             <td class="righttd"><asp:RadioButtonList ID="PublicationModifyVerify" runat="server"
                               Width="217px">
                                 <asp:ListItem Selected="True" Value="0">������</asp:ListItem>
                                 <asp:ListItem Value="1">�������޸ĺ��Զ�תΪδ��</asp:ListItem>
                                 <asp:ListItem Value="2">�������޸ĺ���Ϊ�����</asp:ListItem>
                             </asp:RadioButtonList></td>
                         </tr>
                         </table>
         </div>
         
<div class="tab-page" id="tab5">
		  <h2 class="tab">·��SEOѡ��</h2>
			<script type="text/javascript">
			    tabPane1.addTabPage( document.getElementById( "tab5" ) );
			</script>
			<table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable">
                  <tr>
                         <td align="right" class="lefttd">
                             <strong>���ɾ�̬���ã�</strong></td>
                         <td class="righttd">
                             <table width="100%">
                                 <tr>
                                     <td width="150" align="right">���ɾ�̬HTML��Ŀ¼��</td>
                                     <td><asp:TextBox CssClass="textbox" ID="ModelFsoFolder" runat="server" Width="101px" Text="html/"></asp:TextBox>*
                                      <br /><span class="tips">�������ɾ�̬html��ŵ�Ŀ¼����html/,html/article/��</span></td>
                                 </tr>
                                 <tr>
                                     <td width="150" align="right">�Զ�����HTML�б��ҳ����</td>
                                     <td> <asp:TextBox CssClass="textbox" ID="FsoListNum" runat="server" Width="50px" style="text-align:center">3</asp:TextBox>ҳ
                                     <br /><span class="tips">��������������Ŀ�б��ҳʱ�Զ����ɵķ�ҳ������������վ�������ϴ󣬽�������һ����С�����֣�С����������վ���Բ������ƣ�ֱ������Ϊ0��</span></td>
                                 </tr>
                             </table>
                             </td>
                     </tr>
                     <tr>
                         <td align="right" class="lefttd">
                             <div align="right">
                                 <strong>α��̬���ã�</strong></div>
                         </td>
                         <td class="righttd">
                                <table width="100%">
                                 <tr>
                                     <td width="150" align="right">�б�ҳʹ�ù���</td>
                                     <td>
                                        <asp:DropDownList ID="DrpRewriteListRule" runat="server"></asp:DropDownList>
                                     </td>
                                 </tr>
                                 <tr>
                                     <td width="150" align="right">�б�ҳ��ҳʹ�ù���</td>
                                     <td>
                                        <asp:DropDownList ID="DrpRewriteListPageRule" runat="server"></asp:DropDownList>
                                     </td>
                                 </tr>
                                 <tr>
                                     <td width="150" align="right">����ҳʹ�ù���</td>
                                     <td>
                                        <asp:DropDownList ID="DrpRewriteViewRule" runat="server"></asp:DropDownList>
                                     </td>
                                 </tr>
                                 <tr>
                                     <td width="150" align="right">����ҳ��ҳʹ�ù���</td>
                                     <td>
                                        <asp:DropDownList ID="DrpRewriteViewPageRule" runat="server"></asp:DropDownList>
                                     </td>
                                 </tr>
                                 <tr>
                                     <td width="150" align="right"></td>
                                     <td>
                                       <span class="tips">�������α��̬�����˽⣬��ʹ��Ĭ�ϡ�</span>
                                     </td>
                                 </tr>
                             </table>
                            
                         </td>
                     </tr>
            </table>
    </div>

         
       <div class="tab-page" id="tab6">
		  <h2 class="tab">����ѡ��</h2>
			<script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab6" ) );
			</script>
			<table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable">
                         <tr>
                             <td align="right" class="lefttd">
                                 <strong>��ģ���Ƿ��������ۣ�</strong></td>
                             <td class="righttd"><asp:RadioButtonList ID="CommentType" runat="server"
                               Width="377px">
                                 <asp:ListItem Value="0">��ģ�͹ر�����ϵͳ</asp:ListItem>
                                 <asp:ListItem Value="1">��ģ��ֻ�����Ա���ۣ�������������Ҫ��̨�����</asp:ListItem>
                                 <asp:ListItem Value="2">��ģ��ֻ�����Ա���ۣ����������ݲ���Ҫ��̨���</asp:ListItem>
                                 <asp:ListItem Value="3">��ģ�������Ա���ο����ۣ�������������Ҫ��̨���</asp:ListItem>
                                 <asp:ListItem Selected="True" Value="4">��ģ�������Ա���ο����ۣ����������ݲ���Ҫ��̨���</asp:ListItem>
                                 <asp:ListItem Value="5">����ֻ�����ο����ۣ�������������Ҫ��̨�����</asp:ListItem>
                                 <asp:ListItem Value="6">����ֻ�����ο����ۣ����������ݲ���Ҫ��̨�����</asp:ListItem>
                             </asp:RadioButtonList></td>
                         </tr>
                         <tr>
                             <td align="right" class="lefttd" style="height: 30px">
                                 <strong>�������ã�</strong></td>
                             <td class="righttd" style="height: 30px">
                             <div class="colmn">
                                 ������������<asp:TextBox CssClass="textbox" ID="CommentLen" style="text-align:center" runat="server" Width="71px">0</asp:TextBox><span class="tips">������������"0"��</span></div>
                              <div class="colmn">
                                 ÿҳ������������<asp:TextBox CssClass="textbox" ID="TxtCmtPageSize1" Text="5" style="text-align:center" runat="server" Width="71px">0</asp:TextBox>&nbsp;&nbsp; ��������ҳ��ҳ��ʾ��������<asp:TextBox CssClass="textbox" Text="10" ID="TxtCmtPageSize2" style="text-align:center" runat="server" Width="71px">0</asp:TextBox>������������"0"</div>
                              <div class="colmn">
                                  ����ҳģ�壺 <asp:TextBox CssClass="textbox" ID="CommentTemplate" runat="server" Width="350px"></asp:TextBox>
                                 <input type="button" class="button" onMouseOver="this.className='button_on';" onMouseOut="this.className='button';" value="ѡ��ģ��..." onClick="SelectTemplate('<%=this.CommentTemplate.ClientID%>');"/>
                              </div>
                             </td>
                         </tr>
                         <tr>
                             <td align="right" class="lefttd" style="height: 30px">
                                 <strong>������Ϣ���ã�</strong></td>
                             <td class="righttd" style="height: 30px">
                                 <asp:TextBox CssClass="textbox" ID="NewestDay" style="text-align:center" runat="server" Width="71px">3</asp:TextBox>���ڵ���Ϣ��־Ϊ����</td>
                         </tr>
                         <tr<%=BasicType.SelectedValue=="4"?" style='display:none;'":string.Empty %>>
                             <td align="right" class="lefttd" style="height: 30px">
                                 <strong>����Ա��˻��ƣ�</strong></td>
                             <td class="righttd" style="height: 30px">
                                <asp:RadioButtonList ID="RdbVerifyJB" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                    <asp:ListItem Value="0" Selected="True">һ�����</asp:ListItem>
                                    <asp:ListItem Value="1">�������</asp:ListItem>
                                </asp:RadioButtonList>
                                 </td>
                         </tr>
                         <tr>
                             <td align="right" class="lefttd" style="height: 30px">
                                 <strong>��ģ���Ƿ�����������</strong></td>
                             <td class="righttd" style="height: 30px">
                              <asp:RadioButtonList ID="RdbSearchTF" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                  <asp:ListItem Value="1" Selected="True">����</asp:ListItem>
                                  <asp:ListItem Value="0">������</asp:ListItem>
                              </asp:RadioButtonList>    
                            </td>
                         </tr>
                         <tr>
                            <td align="right" class="lefttd" style="height: 30px">
                                 <strong>����ģ��������</strong></td>
                             <td class="righttd" style="height: 30px">
                              <asp:RadioButtonList ID="RdbSearchType" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                  <asp:ListItem Value="1" Selected="True">����</asp:ListItem>
                                  <asp:ListItem Value="0">������</asp:ListItem>
                              </asp:RadioButtonList>  
                                 <br />
                              <span class="tips">
                                Tips: ����ģ������ʱ������������xp 2003��������xp��2003���߻���ֻ��������һ����������������,����Ӵ�ϵͳ��Դ�Ŀ�����
                              </span> 
                            </td>
                         </tr>
                          <tr>
                             <td align="right" class="lefttd" style="height: 30px">
                                 <strong>����ƥ���ֶΣ�</strong></td>
                             <td class="righttd" style="height: 30px">
                                 <asp:CheckBoxList ID="CkbSearchFiled" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                     <asp:ListItem Value="Title" Selected="True">����(Title)</asp:ListItem>
                                     <asp:ListItem Value="KeyTags">�ؼ���(KeyTags)</asp:ListItem>
                                    <asp:ListItem Value="Intro">��Ҫ����(Intro)</asp:ListItem>
                                 </asp:CheckBoxList> 
                                 </td>
                         </tr>
                         <tr>
                             <td align="right" class="lefttd" style="height: 30px">
                                 <strong>����ҳģ�壺</strong></td>
                             <td class="righttd" style="height: 30px">
                                 <asp:TextBox CssClass="textbox" ID="SearchTemplate" runat="server" Width="350px"></asp:TextBox>
                                 <input type="button" class="button" onMouseOver="this.className='button_on';" onMouseOut="this.className='button';" value="ѡ��ģ��..." onClick="SelectTemplate('<%=this.SearchTemplate.ClientID%>');"/>
                                 <span class="tips">�������գ�������ȫվ����ģ�塣</span>
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