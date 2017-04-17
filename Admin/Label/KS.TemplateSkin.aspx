<%@ Page Language="C#" ValidateRequest="false" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_TemplateSkin" Title="模板管理" Codebehind="KS.TemplateSkin.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.BLL" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="mainlist" runat="server" Width="100%">
 <div id="manage_top" class="toptitle menu_top_fixed">
 <%if (TemplateType == -1)
        { %>
     在线下载模板风格
    <%}
      else { %>
    <ul>
    
      <li id='p1'><a href="#" onclick="addtemplate(0);return false;" title="创建网站风格"><b></b>新建<%=typeName %>模板风格</a></li>
      <li id='p5'><a href="#" onclick="uptemplate();return false;"><b></b>导入ZIP模板风格</a></li>
    <%} %>
   </ul>
 </div>
 <div class="menu_top_fixed_height"></div>  
 <div class="content-area">
<script>
    function uptemplate()
    {  
        parent.openWin("上传模板风格ZIP包并导入", "<%=KSCMS.GetInstallDir()+MyCache.GetCacheConfig(4)%>/Label/KS.TemplateSkin.aspx?action=upload&showType=<%=TemplateType%>", true,820, 370);
    }
    function labelclone(templateid) {
        parent.openWin("克隆<%=typeName%>模板风格", "<%=KSCMS.GetInstallDir()+MyCache.GetCacheConfig(4)%>/Label/KS.TemplateSkin.aspx?action=clone&showType=<%=TemplateType%>&templateid="+templateid, true, 620, 280);
    }
    function addtemplate(templateId)
    {
        if (templateId == 0) {
            parent.openWin("创建<%=typeName%>网站风格", "<%=KSCMS.GetInstallDir()+MyCache.GetCacheConfig(4)%>/Label/KS.TemplateSkin.aspx?action=add&showType=<%=TemplateType%>", true, 820, 480);
        } else {
            parent.openWin("编辑<%=typeName%>网站风格", "<%=KSCMS.GetInstallDir()+MyCache.GetCacheConfig(4)%>/Label/KS.TemplateSkin.aspx?action=add&showType=<%=TemplateType%>&templateId="+templateId, true, 820, 480);
        }
    }

    function clonetemplate(file) {
        parent.openWin("克隆<%=typeName%>网站风格", "<%=KSCMS.GetInstallDir()+MyCache.GetCacheConfig(4)%>/Label/KS.TemplateClone.aspx?file=" + file, true, 620, 220);
    }
    function YunDownLoad(templateId,page) {
        parent.openWin("下载云端网站风格", "<%=KSCMS.GetInstallDir()+MyCache.GetCacheConfig(4)%>/Label/KS.TemplateSkin.aspx?action=yundown&showType=-1&page="+page+"&templateId=" + templateId, true, 820, 370);
    }
   </script>


     <div class="tabs_header">
    <ul class="tabs">
    <li<%=KSCMS.S("showType")==""?" class='active'":string.Empty %>><a href="KS.TemplateSkin.aspx?<%=UtilsQueryParam.Get("showtype") %>"><span>PC模板风格</span></a></li>
    <li<%=KSCMS.S("showType")=="1"?" class='active'":string.Empty %>><a href="KS.TemplateSkin.aspx?showType=1&<%=UtilsQueryParam.Get("showtype") %>"><span>手机模板风格</span></a></li>
    <li<%=KSCMS.S("showType")=="3"?" class='active'":string.Empty %>><a href="KS.TemplateSkin.aspx?showType=3&<%=UtilsQueryParam.Get("showtype") %>"><span>个人空间模板风格</span></a></li>
    <% if (System.IO.Directory.Exists(Utils.GetMapPath("/admin/course/")) == true)   
    {%>
    <li<%=KSCMS.S("showType") == "2" ? " class='active'" : string.Empty %>><a href="KS.TemplateSkin.aspx?showType=2&<%=UtilsQueryParam.Get("showtype") %>"><span>机构模板风格</span></a></li>
    <%} %>
    <li<%=KSCMS.S("showType")=="-1"?" class='active'":string.Empty %>><a href="KS.TemplateSkin.aspx?showType=-1&<%=UtilsQueryParam.Get("showtype") %>"><span>官方云端模板下载</span></a></li>
    </ul>
    </div>

         <asp:Repeater ID="TpList" runat="server">
             <HeaderTemplate>
                  <div class="stencil clearfix">
    	           <ul class="clearfix">
             </HeaderTemplate>
             <ItemTemplate>
                 <li title="模板作者：<%# Eval("Author") %>" class="item<%# Convert.ToString(Eval("isdefault"))=="1"?" curr":"" %>">
            	<div class="border">
                    <div class="s_img"><i class="tag"></i><img onerror="this.src='/sysimg/nopic.gif'" src="<%# Eval("defaultpic") %>" /></div>
                    <div class="s_txt">
                    	<div class="s_name" title="文件目录：<%# Eval("TemplateEname") %>"><%# Eval("templateName") %>
                        	<div class="Tid"><em>ID：<%# Eval("templateId") %></em><em>作者：<%# Eval("Author") %></em></div>
                        </div>
                        <a href="KS.Template.aspx?showType=<%=TemplateType %>&templateId=<%# Eval("TemplateID") %>"><i class="icon icon-Tfile"></i>模板文件</a>
                        <a href="KS.Label.aspx?showType=<%=TemplateType %>&LabelType=2&templateId=<%# Eval("TemplateID") %>"><i class="icon icon-Tlable"></i>标签管理</a>
                        <a href="KS.JSLabel.aspx?LabelType=5&templateId=<%# Eval("TemplateID") %>"><i class="icon icon-Tlable-js"></i>JS标签</a>
                        
                        <a href="KS.TemplateSkin.aspx?action=export&templateId=<%# Eval("TemplateID") %>"><i class="icon icon-Texported"></i>导出Zip</a>
                    </div>
                    <div class="s_rbox">
                    	<%if (TemplateType == 0)
                            {%>
                        <a href='../../index.aspx?skinid=<%# Eval("TemplateId") %>' title="预览" target="_blank">预览</a>
                         <%}
                         else if (TemplateType == 1)
                         { %>
                        <a href='../../<%=MyCache.GetCacheConfig(73) %>/index.aspx?skinid=<%# Eval("TemplateId") %>' title="预览" target="_blank">预览</a>
                          <% }
                         else if (TemplateType == 2)
                        { %>
                          <%}
                         else if (TemplateType == 3)
                        { %>
                          <%} %> 
                        <a href="javascript:;" onclick="addtemplate(<%# Eval("TemplateID")%>);return false;" title="编辑">编辑</a>
                        
                        <a href="KS.TemplateSkin.aspx?templateId=<%# Eval("TemplateID") %>&showtype=<%=TemplateType %>&action=setdefault">设为默认</a>    
                        <a href="javascript:" onclick="labelclone(<%# Eval("TemplateID") %>)"  title="克隆模板风格" >克隆</a>
                        <a href="?Action=del&templateId=<%#Eval("TemplateID") %>" title="删除" onclick="return(confirm('此风格下的标签及模板文件也将相应删除，且此操作不可逆，确定删除操作吗?'))">删除</a>
                         
                    </div>
                </div>
                
            </li>
             </ItemTemplate>
              <FooterTemplate>
                   </ul>    
                </div>
               <div class="empty" style="display:<%# bool.Parse((TpList.Items.Count==0).ToString())?"":"none"%>">
                 没有模板可选，点此<a href="#" onclick="addtemplate(0);return false;" title="创建一个空模板">新建模板</a>
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
        	        <li title="应用产品：<%# Eval("classname") %> 作者：<%# Eval("Author") %> 上传时间：<%# Eval("adddate") %>">
            	        <div class="border">
                        	 <div class="s_img"><img src="<%# GetYunTemplatePic(Convert.ToString(Eval("defaultPic"))) %>" onerror="this.src='/sysimg/nopic.gif';"/></div>
                             <div class="s_txt">
                	         <div class="s_name"><%# Eval("templateName") %>
                                 <%# Eval("isvip").ToString()=="1"?"<i class='vip normal'><i class='iconfont guan'>&#xe604;</i></class>":string.Empty %>
                             <div class="Tid break">
                             	<span>ID：<%# Eval("templateId") %></span>
                             	<span>应用产品：<%# Eval("classname") %> </span>
                                <span>上传时间：<%# Eval("adddate") %></span>
                                <span class="price"><i class="bt">价格：</i><em><%#Utils.StrToDecimal(Eval("prices"))>0?"￥"+Kesion.APPCode.Public.ReturnShopPrice(Utils.StrToDecimal(Eval("prices"))):"<font color='#30b96a'>免费</font>" %></em></span>
                                
                             </div></div>
                             </div>
                            
                            <div class="s_rbox">
                                <span id="p<%#Eval("TemplateID") %>" style="display:none"><%# Eval("pics") %></span>
                                 <a href='javascript:ViewPics("<%#Eval("TemplateID") %>")' title="预览"><i class="iconfont icon">&#xe647;</i>预览</a>

                                 <%#Utils.StrToDecimal(Eval("prices"))>0?isHasBuyYunTemplate(Utils.StrToInt(Eval("TemplateID").ToString()))?Utils.StrToInt(GetYunStatus(Utils.StrToInt(Eval("TemplateID").ToString())))==1?isHasDownYunTemplate(Utils.StrToInt(Eval("templateID")))?"<a href='#'><i class='iconfont icon suc'>&#xe603;</i>已下载</a>":@"<a href=""javascript:;"" onclick='YunDownLoad("+ Eval("templateId")+","+CurrPage+@")'><i class=""iconfont icon"">&#xe645;</i>下载并导入</a>":Utils.StrToInt(GetYunStatus(Utils.StrToInt(Eval("TemplateID").ToString())))==0?"<a href=\""+Yun.GetServerUrl+"/user/Shop/MyShowOrder.aspx?action=pay&id="+GetProOrderId(Utils.StrToInt(Eval("templateId").ToString()))+"&token="+Token+"&appid="+Appid+"\"  target=\"_blank\">去支付</a>":"":"<a href=\""+Yun.GetServerUrl+"/websys/orderinfo.aspx?id="+Eval("templateId").ToString()+"&token="+Token+"&appid="+Appid+"\"  target=\"_blank\">去购买</a>":@"<a href=""javascript:;"" onclick='YunDownLoad("+ Eval("templateId")+","+CurrPage+@")'><i class=""iconfont icon"">&#xe645;</i>下载并导入</a>" %>
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
                 云端没有发现可供下载的模板!
          </div> 
         <KS:Page ID="Page1" runat="server" />

  </asp:Panel>
              
  <asp:Panel ID="addlist" Visible="false" runat="server" Width="100%">
        <br />
        <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable">
           <tr class="ctr">
           <td align="right" class="lefttd" style="width: 143px">
               <strong>模板风格名称：</strong></td>
           <td>
               <asp:TextBox ID="TxtTemplateName" CssClass="textbox" runat="server" Width="320px"></asp:TextBox>
               <span  class="tips">如：红色典风格。</span>
           </td>
           </tr>
           <tr>
            <td class="lefttd" height="30" align="right"><b>请选择模板目录：</b></td>
            <td class="righttd">
                    <asp:DropDownList runat="server" ID="dropTemplateDir">
                        <asp:ListItem Value="0" Text="-请选择存放目录-"></asp:ListItem>
                    </asp:DropDownList>
               <span  class="tips">Tips:创建模板风格前，请先将对应的模板目录上传至“template”下。</span>
                </td>
          </tr>
           <tr>
            <td class="lefttd" height="30" align="right"><b>模板预览图片：</b></td>
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
            <td class="lefttd" height="30" align="right"><b>模板作者：</b></td>
            <td class="righttd">
                    <asp:TextBox ID="TxtAuthor" runat="server" Text="" CssClass="textbox" Width="320px" />
                </td>
          </tr>
           <tr>
            <td class="lefttd" height="30" align="right"><b>模板简要介绍：</b></td>
            <td class="righttd">
                    <asp:TextBox ID="TxtIntro" runat="server" Text="" CssClass="textbox" TextMode="MultiLine" Height="80px" Width="320px" />
                </td>
          </tr>
          <tr<%=TemplateType==3?"":" style='display:none'" %>>
            <td class="lefttd" height="30" align="right"><b>允许使用本模板的用户组：</b></td>
            <td class="righttd">
                <div  runat="server" id="chkUserlevel"></div>
          </tr>
          <tr<%=TemplateType==2?"":" style='display:none'" %>>
            <td class="lefttd" height="30" align="right"><b>允许使用本模板的企业机构：</b></td>
            <td class="righttd">
                <asp:CheckBoxList ID="CheckBoxList1" RepeatDirection="Horizontal" runat="server">          
                    <asp:ListItem Value="0">免费机构</asp:ListItem>         
                </asp:CheckBoxList>            
            </td>  
          </tr>

           </table><br />
           <div class="pop-button" align="center">
              <asp:HiddenField ID="HidTemplateId" Value="0" runat="server" />
              <asp:HiddenField ID="HidTemplateType" Value="0" runat="server" />
              <asp:Button ID="Button1" runat="server" AccessKey="A" CssClass="button" OnClientClick="return(checkForm());" Text="确定创建(A)" OnClick="Button1_Click" />
            <input type="button" class="button" value="关闭取消(C)" accesskey="C" onclick="parent.isreload = false;parent.box.close();" />
        </div>
      <script>
          function checkForm() {
              if ($("#<%=TxtTemplateName.ClientID%>").val() == '') {
                  KesionJS.Alert('请输入模板风格名称！', '$("#<%=TxtTemplateName.ClientID%>").focus();');
                  return false;
              }
              if ($("#<%=dropTemplateDir.ClientID%> option:selected").val() == '0') {
                  KesionJS.Alert('请选择模板风格目录！', '$("#<%=dropTemplateDir.ClientID%>").focus();');
                  return false;
              }
          }
      </script>
 </asp:Panel>
        
  <asp:Panel ID="uploadPanel" Visible="false" runat="server" Width="95%">
      <div class="message" style="display:none;">ZIP模板包正在上传中，请稍候...</div>
      <div id="showUp"><br /><br />
        <table  border="0" cellpadding="1" cellspacing="1" class="CTable">
           <tr>
           <td align="right" class="lefttd" style="width: 250px">
               <strong>请选择已下载的ZIP模板风格包：</strong></td>
           <td class="righttd"><asp:FileUpload runat="server" ID="File1" CssClass="textbox" />
           </td>
           </tr>
        </table>
          </div><br />
           <div class="pop-button" align="center">
              <asp:Button ID="Button2" runat="server" AccessKey="A" OnClientClick="$('#showUp').hide();$('.message').show()" CssClass="button" Text="开始上传(A)" OnClick="Button2_Click" />
            <input type="button" class="button" value="关闭取消(C)" accesskey="C" onclick="parent.isreload = false;parent.box.close();" />
        </div>
      </div>
</asp:Panel>

  <asp:Panel ID="uploadPanelStep2" runat="server" Visible="false" Width="95%">
        <script>
            function checkEname() {
                if ($("#<%=TxtName.ClientID%>").val() == '') {
                    alert('请输入模板名称!');
                    $("#<%=TxtName.ClientID%>").focus();
                    return false;
                }
                if ($("#<%=TxtEname.ClientID%>").val() == '') {
                    alert('请输入要导入的模板目录!');
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
               <strong>模板编号：</strong></td>
             <td class="righttd">
                 <%=KSCMS.S("templateID") %>
                 <asp:HiddenField ID="HidOriTemplateId" runat="server" Value="0" />
                </td>
           </tr>
           <tr>
           <td align="right" class="lefttd" style="width: 250px">
               <strong>模板名称：</strong></td>
             <td class="righttd">
                 <asp:TextBox ID="TxtName" runat="server" CssClass="textbox" Width="200px" />
                </td>
           </tr>
           <tr>
            <td align="right" class="lefttd" style="width: 250px">
               <strong>模板文件存放目录：</strong></td>
             <td class="righttd"><%=MyCache.GetCacheConfig(0) %><asp:Label ID="LabTemplateDir" runat="server"><%=TemplateDir %></asp:Label>/<asp:TextBox ID="TxtEname" runat="server" Width="60" CssClass="textbox" />/</td>
           </tr>
           <tr>
           <td align="right" class="lefttd" style="width: 250px">
               <strong>模板介绍：</strong></td>
             <td class="righttd"><asp:Label ID="LabIntro" runat="server"></asp:Label></td>
           </tr>
           <tr>
           <td align="right" class="lefttd" style="width: 250px">
               <strong>模板作者：</strong></td>
             <td class="righttd"><asp:Label ID="LabAuthor" runat="server"></asp:Label></td>
           </tr>
           <tr>
           <td align="right" class="lefttd" style="width: 250px">
               <strong>模板类型：</strong></td>
             <td class="righttd"><%=typeName %></td>
           </tr>
        </table>

        <br />
           <div class="pop-button" align="center">
              <asp:Button ID="Button3" runat="server" AccessKey="A" CssClass="button" Text="确认导入(A)" OnClientClick="return(checkEname())" OnClick="Button3_Click" />
             <input type="button" class="button" value="关闭取消(C)" accesskey="C" onclick="parent.isreload = false;parent.box.close();" />
        </div>

    </asp:Panel>

  <asp:Panel ID="clonePanel" Visible="false" runat="server" Width="100%">
       <script>
            function checkEname() {
                if ($("#<%=TxtCloneTemplateName.ClientID%>").val() == '') {
                    alert('请输入模板名称!');
                    $("#<%=TxtCloneTemplateName.ClientID%>").focus();
                    return false;
                }
                if ($("#<%=TxtCloneTemplateEName.ClientID%>").val() == '') {
                    alert('请输入要导入的模板目录!');
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
               <strong>模板风格名称：</strong></td>
           <td>
               <asp:TextBox ID="TxtCloneTemplateName" CssClass="textbox" runat="server" Width="280px"></asp:TextBox>
               <span  class="tips">如：红色典风格。</span>
           </td>
           </tr>
            <tr>
            <td align="right" class="lefttd">
               <strong>模板文件存放目录：</strong></td>
             <td class="righttd"><%=MyCache.GetCacheConfig(0) %><%=TemplateDir %>/<asp:TextBox ID="TxtCloneTemplateEName" runat="server" Width="200" CssClass="textbox" />/</td>
           </tr>
        </table>
        <br />
           <div class="pop-button" align="center">
              <asp:HiddenField ID="HiddenTemplateId" Value="0" runat="server" />
              <asp:Button ID="Button4" runat="server" AccessKey="A" CssClass="button" Text="确认克隆(A)" OnClientClick="return(checkEname())" OnClick="Button4_Click" />
             <input type="button" class="button" value="关闭取消(C)" accesskey="C" onclick="parent.isreload = false;parent.box.close();" />
        </div>
 </asp:Panel>


    <asp:Panel ID="YunDownPanel" Visible="false" runat="server" Width="100%">
        <div id="downstep1" style="font-size:20px;margin:40px;text-align:center;padding-top:70px;font-weight:bold;color:green;">
          <img src="../../sysimg/default/loading.gif" /> 正在尝试连接云端服务器并初始化下载数据，请稍候......
       </div>
       <div id="downstep2" style="display:none;margin:40px;text-align:center;">
          <div style="font-size:16px;height:35px;line-height:35px;font-weight:bold" id="per">下载进度：0%</div> 
          <div style="margin:0 auto;width:600px;border:1px dashed #ccc;background:#fff;height:20px">
             <div id="bar" style="width:0px;height:20px;background:#0094ff"></div>
          </div>
           <div style="height:40px;font-size:16px;line-height:40px">
           模板ZIP包大小：<span id="totalSize" style="color:brown;font-weight:bold">0</span> KB 当前已下载：<span id="currSize" style="color:brown;font-weight:bold">0</span> KB
           </div>
       </div> 
       
       <div class="pop-button" style="text-align:center;display:none" id="downstep3">
        <input type='button' onclick="location.href='KS.TemplateSkin.aspx?action=downbeginimport&showType=-1&templateId=<%=KSCMS.S("templateID")%>';" value=" 立即导入模板库 " class="button"/>
        <input type="button" value=" 暂不导入 " class="button" onclick="top.box.close();"/>
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
                        //这里是开始执行方法，显示效果，效果自己写
                        intervalID = setInterval(GetProcess,2000);
                    },
                    complete:function()
                    {     
                        //方法执行完毕，效果自己可以关闭，或者隐藏效果
                    },

                    success: function (data) {
                        clearInterval(intervalID);
                        if (data == "success") {
                            $("#downstep3").show();
                        } else {
                            alert('下载失败!' + data);
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
                            $("#per").html("下载进度：" + (w * 100).toFixed(2) + " %");
                        } else {
                            $("#per").html("任务完成：100 %");
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