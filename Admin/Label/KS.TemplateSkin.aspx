<%@ Page Language="C#" ValidateRequest="false" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_TemplateSkin" Title="ģ�����" Codebehind="KS.TemplateSkin.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.BLL" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="mainlist" runat="server" Width="100%">
 <div id="manage_top" class="toptitle menu_top_fixed">
 <%if (TemplateType == -1)
        { %>
     ��������ģ����
    <%}
      else { %>
    <ul>
    
      <li id='p1'><a href="#" onclick="addtemplate(0);return false;" title="������վ���"><b></b>�½�<%=typeName %>ģ����</a></li>
      <li id='p5'><a href="#" onclick="uptemplate();return false;"><b></b>����ZIPģ����</a></li>
    <%} %>
   </ul>
 </div>
 <div class="menu_top_fixed_height"></div>  
 <div class="content-area">
<script>
    function uptemplate()
    {  
        parent.openWin("�ϴ�ģ����ZIP��������", "<%=KSCMS.GetInstallDir()+MyCache.GetCacheConfig(4)%>/Label/KS.TemplateSkin.aspx?action=upload&showType=<%=TemplateType%>", true,820, 370);
    }
    function labelclone(templateid) {
        parent.openWin("��¡<%=typeName%>ģ����", "<%=KSCMS.GetInstallDir()+MyCache.GetCacheConfig(4)%>/Label/KS.TemplateSkin.aspx?action=clone&showType=<%=TemplateType%>&templateid="+templateid, true, 620, 280);
    }
    function addtemplate(templateId)
    {
        if (templateId == 0) {
            parent.openWin("����<%=typeName%>��վ���", "<%=KSCMS.GetInstallDir()+MyCache.GetCacheConfig(4)%>/Label/KS.TemplateSkin.aspx?action=add&showType=<%=TemplateType%>", true, 820, 480);
        } else {
            parent.openWin("�༭<%=typeName%>��վ���", "<%=KSCMS.GetInstallDir()+MyCache.GetCacheConfig(4)%>/Label/KS.TemplateSkin.aspx?action=add&showType=<%=TemplateType%>&templateId="+templateId, true, 820, 480);
        }
    }

    function clonetemplate(file) {
        parent.openWin("��¡<%=typeName%>��վ���", "<%=KSCMS.GetInstallDir()+MyCache.GetCacheConfig(4)%>/Label/KS.TemplateClone.aspx?file=" + file, true, 620, 220);
    }
    function YunDownLoad(templateId,page) {
        parent.openWin("�����ƶ���վ���", "<%=KSCMS.GetInstallDir()+MyCache.GetCacheConfig(4)%>/Label/KS.TemplateSkin.aspx?action=yundown&showType=-1&page="+page+"&templateId=" + templateId, true, 820, 370);
    }
   </script>


     <div class="tabs_header">
    <ul class="tabs">
    <li<%=KSCMS.S("showType")==""?" class='active'":string.Empty %>><a href="KS.TemplateSkin.aspx?<%=UtilsQueryParam.Get("showtype") %>"><span>PCģ����</span></a></li>
    <li<%=KSCMS.S("showType")=="1"?" class='active'":string.Empty %>><a href="KS.TemplateSkin.aspx?showType=1&<%=UtilsQueryParam.Get("showtype") %>"><span>�ֻ�ģ����</span></a></li>
    <li<%=KSCMS.S("showType")=="3"?" class='active'":string.Empty %>><a href="KS.TemplateSkin.aspx?showType=3&<%=UtilsQueryParam.Get("showtype") %>"><span>���˿ռ�ģ����</span></a></li>
    <% if (System.IO.Directory.Exists(Utils.GetMapPath("/admin/course/")) == true)   
    {%>
    <li<%=KSCMS.S("showType") == "2" ? " class='active'" : string.Empty %>><a href="KS.TemplateSkin.aspx?showType=2&<%=UtilsQueryParam.Get("showtype") %>"><span>����ģ����</span></a></li>
    <%} %>
    <li<%=KSCMS.S("showType")=="-1"?" class='active'":string.Empty %>><a href="KS.TemplateSkin.aspx?showType=-1&<%=UtilsQueryParam.Get("showtype") %>"><span>�ٷ��ƶ�ģ������</span></a></li>
    </ul>
    </div>

         <asp:Repeater ID="TpList" runat="server">
             <HeaderTemplate>
                  <div class="stencil clearfix">
    	           <ul class="clearfix">
             </HeaderTemplate>
             <ItemTemplate>
                 <li title="ģ�����ߣ�<%# Eval("Author") %>" class="item<%# Convert.ToString(Eval("isdefault"))=="1"?" curr":"" %>">
            	<div class="border">
                    <div class="s_img"><i class="tag"></i><img onerror="this.src='/sysimg/nopic.gif'" src="<%# Eval("defaultpic") %>" /></div>
                    <div class="s_txt">
                    	<div class="s_name" title="�ļ�Ŀ¼��<%# Eval("TemplateEname") %>"><%# Eval("templateName") %>
                        	<div class="Tid"><em>ID��<%# Eval("templateId") %></em><em>���ߣ�<%# Eval("Author") %></em></div>
                        </div>
                        <a href="KS.Template.aspx?showType=<%=TemplateType %>&templateId=<%# Eval("TemplateID") %>"><i class="icon icon-Tfile"></i>ģ���ļ�</a>
                        <a href="KS.Label.aspx?showType=<%=TemplateType %>&LabelType=2&templateId=<%# Eval("TemplateID") %>"><i class="icon icon-Tlable"></i>��ǩ����</a>
                        <a href="KS.JSLabel.aspx?LabelType=5&templateId=<%# Eval("TemplateID") %>"><i class="icon icon-Tlable-js"></i>JS��ǩ</a>
                        
                        <a href="KS.TemplateSkin.aspx?action=export&templateId=<%# Eval("TemplateID") %>"><i class="icon icon-Texported"></i>����Zip</a>
                    </div>
                    <div class="s_rbox">
                    	<%if (TemplateType == 0)
                            {%>
                        <a href='../../index.aspx?skinid=<%# Eval("TemplateId") %>' title="Ԥ��" target="_blank">Ԥ��</a>
                         <%}
                         else if (TemplateType == 1)
                         { %>
                        <a href='../../<%=MyCache.GetCacheConfig(73) %>/index.aspx?skinid=<%# Eval("TemplateId") %>' title="Ԥ��" target="_blank">Ԥ��</a>
                          <% }
                         else if (TemplateType == 2)
                        { %>
                          <%}
                         else if (TemplateType == 3)
                        { %>
                          <%} %> 
                        <a href="javascript:;" onclick="addtemplate(<%# Eval("TemplateID")%>);return false;" title="�༭">�༭</a>
                        
                        <a href="KS.TemplateSkin.aspx?templateId=<%# Eval("TemplateID") %>&showtype=<%=TemplateType %>&action=setdefault">��ΪĬ��</a>    
                        <a href="javascript:" onclick="labelclone(<%# Eval("TemplateID") %>)"  title="��¡ģ����" >��¡</a>
                        <a href="?Action=del&templateId=<%#Eval("TemplateID") %>" title="ɾ��" onclick="return(confirm('�˷���µı�ǩ��ģ���ļ�Ҳ����Ӧɾ�����Ҵ˲��������棬ȷ��ɾ��������?'))">ɾ��</a>
                         
                    </div>
                </div>
                
            </li>
             </ItemTemplate>
              <FooterTemplate>
                   </ul>    
                </div>
               <div class="empty" style="display:<%# bool.Parse((TpList.Items.Count==0).ToString())?"":"none"%>">
                 û��ģ���ѡ�����<a href="#" onclick="addtemplate(0);return false;" title="����һ����ģ��">�½�ģ��</a>
                 </div> 
              </table>
              </FooterTemplate>
            </asp:Repeater>
    

         <script>
             function ViewPics(id){
                 top.initialPrettyPhotoPicStr($("#p"+id).html());
             }
         </script>

          <asp:Repeater ID="YunTemplateList" runat="server">
             <HeaderTemplate>
                  <div class="stencil clearfix">
    	            <ul>
             </HeaderTemplate>
             <ItemTemplate>
        	        <li title="Ӧ�ò�Ʒ��<%# Eval("classname") %> ���ߣ�<%# Eval("Author") %> �ϴ�ʱ�䣺<%# Eval("adddate") %>">
            	        <div class="border">
                        	 <div class="s_img"><img src="<%# GetYunTemplatePic(Convert.ToString(Eval("defaultPic"))) %>" onerror="this.src='/sysimg/nopic.gif';"/></div>
                             <div class="s_txt">
                	         <div class="s_name"><%# Eval("templateName") %>
                                 <%# Eval("isvip").ToString()=="1"?"<i class='vip normal'><i class='iconfont guan'>&#xe604;</i></class>":string.Empty %>
                             <div class="Tid break">
                             	<span>ID��<%# Eval("templateId") %></span>
                             	<span>Ӧ�ò�Ʒ��<%# Eval("classname") %> </span>
                                <span>�ϴ�ʱ�䣺<%# Eval("adddate") %></span>
                                <span class="price"><i class="bt">�۸�</i><em><%#Utils.StrToDecimal(Eval("prices"))>0?"��"+Kesion.APPCode.Public.ReturnShopPrice(Utils.StrToDecimal(Eval("prices"))):"<font color='#30b96a'>���</font>" %></em></span>
                                
                             </div></div>
                             </div>
                            
                            <div class="s_rbox">
                                <span id="p<%#Eval("TemplateID") %>" style="display:none"><%# Eval("pics") %></span>
                                 <a href='javascript:ViewPics("<%#Eval("TemplateID") %>")' title="Ԥ��"><i class="iconfont icon">&#xe647;</i>Ԥ��</a>

                                 <%#Utils.StrToDecimal(Eval("prices"))>0?isHasBuyYunTemplate(Utils.StrToInt(Eval("TemplateID").ToString()))?Utils.StrToInt(GetYunStatus(Utils.StrToInt(Eval("TemplateID").ToString())))==1?isHasDownYunTemplate(Utils.StrToInt(Eval("templateID")))?"<a href='#'><i class='iconfont icon suc'>&#xe603;</i>������</a>":@"<a href=""javascript:;"" onclick='YunDownLoad("+ Eval("templateId")+","+CurrPage+@")'><i class=""iconfont icon"">&#xe645;</i>���ز�����</a>":Utils.StrToInt(GetYunStatus(Utils.StrToInt(Eval("TemplateID").ToString())))==0?"<a href=\""+Yun.GetServerUrl+"/user/Shop/MyShowOrder.aspx?action=pay&id="+GetProOrderId(Utils.StrToInt(Eval("templateId").ToString()))+"&token="+Token+"&appid="+Appid+"\"  target=\"_blank\">ȥ֧��</a>":"":"<a href=\""+Yun.GetServerUrl+"/websys/orderinfo.aspx?id="+Eval("templateId").ToString()+"&token="+Token+"&appid="+Appid+"\"  target=\"_blank\">ȥ����</a>":@"<a href=""javascript:;"" onclick='YunDownLoad("+ Eval("templateId")+","+CurrPage+@")'><i class=""iconfont icon"">&#xe645;</i>���ز�����</a>" %>
                            </div>
                        </div>
                    </li>
              </ItemTemplate>
              <FooterTemplate>
                   </ul>    
                </div>
              </table>
              </FooterTemplate>
            </asp:Repeater>
         <div class="empty" style="text-align:center;" id="showEmpty" runat="server" visible="false">
                 �ƶ�û�з��ֿɹ����ص�ģ��!
          </div> 
         <KS:Page ID="Page1" runat="server" />

  </asp:Panel>
              
  <asp:Panel ID="addlist" Visible="false" runat="server" Width="100%">
        <br />
        <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable">
           <tr class="ctr">
           <td align="right" class="lefttd" style="width: 143px">
               <strong>ģ�������ƣ�</strong></td>
           <td>
               <asp:TextBox ID="TxtTemplateName" CssClass="textbox" runat="server" Width="320px"></asp:TextBox>
               <span  class="tips">�磺��ɫ����</span>
           </td>
           </tr>
           <tr>
            <td class="lefttd" height="30" align="right"><b>��ѡ��ģ��Ŀ¼��</b></td>
            <td class="righttd">
                    <asp:DropDownList runat="server" ID="dropTemplateDir">
                        <asp:ListItem Value="0" Text="-��ѡ����Ŀ¼-"></asp:ListItem>
                    </asp:DropDownList>
               <span  class="tips">Tips:����ģ����ǰ�����Ƚ���Ӧ��ģ��Ŀ¼�ϴ�����template���¡�</span>
                </td>
          </tr>
           <tr>
            <td class="lefttd" height="30" align="right"><b>ģ��Ԥ��ͼƬ��</b></td>
            <td class="righttd"><table cellspacing="0" cellpadding="0" width="100%">
                <tr><td width="220"><asp:TextBox ID="TxtDefaultPic" runat="server" Text="" CssClass="textbox" Width="220px" /></td>
                                                          <%if (Kesion.BLL.KSSecurity.CheckCommonUploadPower()){ %>
                                                                <td style="padding-left:4px;padding-top:12px;"> <%=Kesion.APPCode.UploadAPI.EchoUpload("classpic",this.TxtDefaultPic.ClientID,150) %></td>
                                                            <%} %>
                                             <td><img id="show<%=TxtDefaultPic.ClientID %>" src="<%=TxtDefaultPic.Text%>"  height="30" style="border:1px solid #f1f1f1;" onerror="this.src='../../sysimg/nopic.gif'"/></td>
                                     </tr>
                      </table>
                </td>
          </tr>
           <tr>
            <td class="lefttd" height="30" align="right"><b>ģ�����ߣ�</b></td>
            <td class="righttd">
                    <asp:TextBox ID="TxtAuthor" runat="server" Text="" CssClass="textbox" Width="320px" />
                </td>
          </tr>
           <tr>
            <td class="lefttd" height="30" align="right"><b>ģ���Ҫ���ܣ�</b></td>
            <td class="righttd">
                    <asp:TextBox ID="TxtIntro" runat="server" Text="" CssClass="textbox" TextMode="MultiLine" Height="80px" Width="320px" />
                </td>
          </tr>
          <tr<%=TemplateType==3?"":" style='display:none'" %>>
            <td class="lefttd" height="30" align="right"><b>����ʹ�ñ�ģ����û��飺</b></td>
            <td class="righttd">
                <div  runat="server" id="chkUserlevel"></div>
          </tr>
          <tr<%=TemplateType==2?"":" style='display:none'" %>>
            <td class="lefttd" height="30" align="right"><b>����ʹ�ñ�ģ�����ҵ������</b></td>
            <td class="righttd">
                <asp:CheckBoxList ID="CheckBoxList1" RepeatDirection="Horizontal" runat="server">          
                    <asp:ListItem Value="0">��ѻ���</asp:ListItem>         
                </asp:CheckBoxList>            
            </td>  
          </tr>

           </table><br />
           <div class="pop-button" align="center">
              <asp:HiddenField ID="HidTemplateId" Value="0" runat="server" />
              <asp:HiddenField ID="HidTemplateType" Value="0" runat="server" />
              <asp:Button ID="Button1" runat="server" AccessKey="A" CssClass="button" OnClientClick="return(checkForm());" Text="ȷ������(A)" OnClick="Button1_Click" />
            <input type="button" class="button" value="�ر�ȡ��(C)" accesskey="C" onclick="parent.isreload = false;parent.box.close();" />
        </div>
      <script>
          function checkForm() {
              if ($("#<%=TxtTemplateName.ClientID%>").val() == '') {
                  KesionJS.Alert('������ģ�������ƣ�', '$("#<%=TxtTemplateName.ClientID%>").focus();');
                  return false;
              }
              if ($("#<%=dropTemplateDir.ClientID%> option:selected").val() == '0') {
                  KesionJS.Alert('��ѡ��ģ����Ŀ¼��', '$("#<%=dropTemplateDir.ClientID%>").focus();');
                  return false;
              }
          }
      </script>
 </asp:Panel>
        
  <asp:Panel ID="uploadPanel" Visible="false" runat="server" Width="95%">
      <div class="message" style="display:none;">ZIPģ��������ϴ��У����Ժ�...</div>
      <div id="showUp"><br /><br />
        <table  border="0" cellpadding="1" cellspacing="1" class="CTable">
           <tr>
           <td align="right" class="lefttd" style="width: 250px">
               <strong>��ѡ�������ص�ZIPģ�������</strong></td>
           <td class="righttd"><asp:FileUpload runat="server" ID="File1" CssClass="textbox" />
           </td>
           </tr>
        </table>
          </div><br />
           <div class="pop-button" align="center">
              <asp:Button ID="Button2" runat="server" AccessKey="A" OnClientClick="$('#showUp').hide();$('.message').show()" CssClass="button" Text="��ʼ�ϴ�(A)" OnClick="Button2_Click" />
            <input type="button" class="button" value="�ر�ȡ��(C)" accesskey="C" onclick="parent.isreload = false;parent.box.close();" />
        </div>
      </div>
</asp:Panel>

  <asp:Panel ID="uploadPanelStep2" runat="server" Visible="false" Width="95%">
        <script>
            function checkEname() {
                if ($("#<%=TxtName.ClientID%>").val() == '') {
                    alert('������ģ������!');
                    $("#<%=TxtName.ClientID%>").focus();
                    return false;
                }
                if ($("#<%=TxtEname.ClientID%>").val() == '') {
                    alert('������Ҫ�����ģ��Ŀ¼!');
                    $("#<%=TxtEname.ClientID%>").focus();
                    return false;
                }
                return true;
            }
        </script>
      <br />
        <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable">
            <tr<%=KSCMS.S("templateID")=="0"?" style='display:none'":string.Empty %>>
             <td align="right" class="lefttd" style="width: 250px">
               <strong>ģ���ţ�</strong></td>
             <td class="righttd">
                 <%=KSCMS.S("templateID") %>
                 <asp:HiddenField ID="HidOriTemplateId" runat="server" Value="0" />
                </td>
           </tr>
           <tr>
           <td align="right" class="lefttd" style="width: 250px">
               <strong>ģ�����ƣ�</strong></td>
             <td class="righttd">
                 <asp:TextBox ID="TxtName" runat="server" CssClass="textbox" Width="200px" />
                </td>
           </tr>
           <tr>
            <td align="right" class="lefttd" style="width: 250px">
               <strong>ģ���ļ����Ŀ¼��</strong></td>
             <td class="righttd"><%=MyCache.GetCacheConfig(0) %><asp:Label ID="LabTemplateDir" runat="server"><%=TemplateDir %></asp:Label>/<asp:TextBox ID="TxtEname" runat="server" Width="60" CssClass="textbox" />/</td>
           </tr>
           <tr>
           <td align="right" class="lefttd" style="width: 250px">
               <strong>ģ����ܣ�</strong></td>
             <td class="righttd"><asp:Label ID="LabIntro" runat="server"></asp:Label></td>
           </tr>
           <tr>
           <td align="right" class="lefttd" style="width: 250px">
               <strong>ģ�����ߣ�</strong></td>
             <td class="righttd"><asp:Label ID="LabAuthor" runat="server"></asp:Label></td>
           </tr>
           <tr>
           <td align="right" class="lefttd" style="width: 250px">
               <strong>ģ�����ͣ�</strong></td>
             <td class="righttd"><%=typeName %></td>
           </tr>
        </table>

        <br />
           <div class="pop-button" align="center">
              <asp:Button ID="Button3" runat="server" AccessKey="A" CssClass="button" Text="ȷ�ϵ���(A)" OnClientClick="return(checkEname())" OnClick="Button3_Click" />
             <input type="button" class="button" value="�ر�ȡ��(C)" accesskey="C" onclick="parent.isreload = false;parent.box.close();" />
        </div>

    </asp:Panel>

  <asp:Panel ID="clonePanel" Visible="false" runat="server" Width="100%">
       <script>
            function checkEname() {
                if ($("#<%=TxtCloneTemplateName.ClientID%>").val() == '') {
                    alert('������ģ������!');
                    $("#<%=TxtCloneTemplateName.ClientID%>").focus();
                    return false;
                }
                if ($("#<%=TxtCloneTemplateEName.ClientID%>").val() == '') {
                    alert('������Ҫ�����ģ��Ŀ¼!');
                    $("#<%=TxtCloneTemplateEName.ClientID%>").focus();
                    return false;
                }
                return true;
            }
        </script>
      <br />
        <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable">
           <tr class="ctr">
           <td align="right" class="lefttd" style="width: 143px">
               <strong>ģ�������ƣ�</strong></td>
           <td>
               <asp:TextBox ID="TxtCloneTemplateName" CssClass="textbox" runat="server" Width="280px"></asp:TextBox>
               <span  class="tips">�磺��ɫ����</span>
           </td>
           </tr>
            <tr>
            <td align="right" class="lefttd">
               <strong>ģ���ļ����Ŀ¼��</strong></td>
             <td class="righttd"><%=MyCache.GetCacheConfig(0) %><%=TemplateDir %>/<asp:TextBox ID="TxtCloneTemplateEName" runat="server" Width="200" CssClass="textbox" />/</td>
           </tr>
        </table>
        <br />
           <div class="pop-button" align="center">
              <asp:HiddenField ID="HiddenTemplateId" Value="0" runat="server" />
              <asp:Button ID="Button4" runat="server" AccessKey="A" CssClass="button" Text="ȷ�Ͽ�¡(A)" OnClientClick="return(checkEname())" OnClick="Button4_Click" />
             <input type="button" class="button" value="�ر�ȡ��(C)" accesskey="C" onclick="parent.isreload = false;parent.box.close();" />
        </div>
 </asp:Panel>


    <asp:Panel ID="YunDownPanel" Visible="false" runat="server" Width="100%">
        <div id="downstep1" style="font-size:20px;margin:40px;text-align:center;padding-top:70px;font-weight:bold;color:green;">
          <img src="../../sysimg/default/loading.gif" /> ���ڳ��������ƶ˷���������ʼ���������ݣ����Ժ�......
       </div>
       <div id="downstep2" style="display:none;margin:40px;text-align:center;">
          <div style="font-size:16px;height:35px;line-height:35px;font-weight:bold" id="per">���ؽ��ȣ�0%</div> 
          <div style="margin:0 auto;width:600px;border:1px dashed #ccc;background:#fff;height:20px">
             <div id="bar" style="width:0px;height:20px;background:#0094ff"></div>
          </div>
           <div style="height:40px;font-size:16px;line-height:40px">
           ģ��ZIP����С��<span id="totalSize" style="color:brown;font-weight:bold">0</span> KB ��ǰ�����أ�<span id="currSize" style="color:brown;font-weight:bold">0</span> KB
           </div>
       </div> 
       
       <div class="pop-button" style="text-align:center;display:none" id="downstep3">
        <input type='button' onclick="location.href='KS.TemplateSkin.aspx?action=downbeginimport&showType=-1&templateId=<%=KSCMS.S("templateID")%>';" value=" ��������ģ��� " class="button"/>
        <input type="button" value=" �ݲ����� " class="button" onclick="top.box.close();"/>
       </div>

        <script>
            var intervalID;
            function DownLoadTask() {
                jQuery.ajax({
                    type: "POST",
                    url: "KS.TemplateSkin.aspx",
                    data: "action=dobegindown&showType=-1&page=<%=CurrPage%>&templateId=<%=KSCMS.S("TemplateID")%>",
                    beforeSend:function()
                    {
                        //�����ǿ�ʼִ�з�������ʾЧ����Ч���Լ�д
                        intervalID = setInterval(GetProcess,2000);
                    },
                    complete:function()
                    {     
                        //����ִ����ϣ�Ч���Լ����Թرգ���������Ч��
                    },

                    success: function (data) {
                        clearInterval(intervalID);
                        if (data == "success") {
                            $("#downstep3").show();
                        } else {
                            alert('����ʧ��!' + data);
                        }
                    }
                });
            }
            function GetProcess() {
               

                jQuery.ajax({
                    type: "POST",
                    url: "KS.TemplateSkin.aspx",
                    data: "action=getprocess&showType=-1&templateId=<%=KSCMS.S("TemplateID")%>&rnd="+Math.random(),
                    success: function (data) {
                        $("#downstep2").show();
                        $("#downstep1").hide();
                        var arr = data.split('|');
                        $("#totalSize").html((arr[0]/1024).toFixed(0));
                        $("#currSize").html((arr[1]/1024).toFixed(0));
                        var w = parseFloat(arr[1]) / parseFloat(arr[0]);
                        if (w < 1) {
                            $("#per").html("���ؽ��ȣ�" + (w * 100).toFixed(2) + " %");
                        } else {
                            $("#per").html("������ɣ�100 %");
                        }
                        $("#bar").html('').width(w *600);
                    }
                });
            }
            function Initialize() {
                DownLoadTask();
            }

            $(document).ready(function () {
               Initialize();
            });

        </script>
    </asp:Panel>
  </div>
</asp:content>