<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="weixin_Config" Codebehind="KS.WeixinConfig.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.BLL" %>
 
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <KS:TopNav ID="TopNav1" runat="server"  Text="微信基本设置" />
 <div class="content-area"> 
    <script>
    jQuery(document).ready(function () {
        showStatus();
    });
   
    function showStatus() {
        var checkrad = jQuery("#<%=this.web.ClientID %> :radio[checked]").val();
        if (checkrad == "1") {
           jQuery("#G3").show();
            jQuery("#G3").css("display", "");
            jQuery("#webstatus").hide();
            
        } else {

            jQuery("#webstatus").show();
            jQuery("#webstatus").css("display", "");
            jQuery("#G3").hide();

        }
    }
              
 </script>

  <div class="box" >
	<div class="tab-page" id="SystemWeixinPanel" >  
       <script type="text/javascript">
        var tabPane1 = new WebFXTabPane(document.getElementById("SystemWeixinPanel"), 1)
       </script>    
		  <div class="tab-page" id="tab0" style="background:#fff;">
		    <h2 class="tab">基本参数</h2>
			<script type="text/javascript">
			 tabPane1.addTabPage(document.getElementById("tab0"));
			</script>	
             <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
			<tr>
               
                 <td  height="30" align="right" class="lefttd" style="width: 198px"> <b>开启手机版功能：</b></td>
                   <td class="righttd">
                     <%--<input onclick="$('#webstatus').hide();" type="radio" name="Setting(187)" value="1" checked="">正常    
                     <input type="radio" onclick="$('#webstatus').show();" name="Setting(187)" value="0">关闭--%>

                      &nbsp;<asp:RadioButtonList ID="web" RepeatDirection="Horizontal" runat="server" onclick="showStatus();">
                      <asp:ListItem Value="1" Selected="True" >开启</asp:ListItem>
                      <asp:ListItem Value="0" >关闭</asp:ListItem>
                     </asp:RadioButtonList>
                    
                     <span class="tips">*网站关闭后，手机前台将不能访问</span>
                 
                    
               <div id="webstatus" style="display:none" ><span class="txt">网站关闭提示信息：</span>
               <div class="ipuc">
                <asp:TextBox ID="closestatus" runat="server" TextMode="MultiLine" Width="400px" Height="120px" CssClass="textbox"></asp:TextBox>
             
               <span class="tips">如：网站日常维护，请稍候访问。</span>
               </div>
               </div>
                </td>
			   </tr>
                 <tbody id="G3"  style="display:none" >
               <tr>
                     <td  height="30" align="right" class="lefttd" style="width: 198px"> <b>手机版安装目录：</b></td>
                     <td class="righttd">
                       &nbsp;<asp:TextBox CssClass="textbox" Width="350" ID="Txt3GInstallDir" runat="server" ></asp:TextBox>
                       <span class="tips">如：3G,WAP等</span>
                     </td>
                 </tr>
                  <tr>
                     <td  height="30" align="right" class="lefttd" style="width: 198px"> <b>手机版首页绑定二级域名：</b></td>
                     <td class="righttd">
                       &nbsp;<asp:TextBox CssClass="textbox" Width="350" ID="Txt3GDomain" runat="server" ></asp:TextBox>
                       <span class="tips">如：http://m.kesion.com等，后面不能加"/"，没有绑定二级域名请留空。 </span>
                     </td>
                 </tr>
                 <tr>
                     <td  height="30" align="right" class="lefttd" style="width: 198px"> <b>手机版站点名称：</b></td>
                     <td class="righttd">
                       &nbsp;<asp:TextBox CssClass="textbox" Width="350" ID="Txt3GSiteName" runat="server" ></asp:TextBox>
                     </td>
                 </tr>
                
                 <tr>
                     <td  height="30" align="right" class="lefttd" style="width: 198px"> <b>手机版站点Logo：</b></td>
                     <td class="righttd"><table cellspacing="0" cellpadding="0"><tr><td> &nbsp;<asp:TextBox CssClass="textbox" Width="350" ID="Txt3GLogo" runat="server" ></asp:TextBox>&nbsp;<input type="button" class="button" onclick="SelectFiles('<%=this.Txt3GLogo.ClientID %>',0);" value="选择Logo..."></td>
                                                          <%if (Kesion.BLL.KSSecurity.CheckCommonUploadPower()){ %>
                                                                <td style="padding-left:4px;padding-top:12px;"> <%=Kesion.APPCode.UploadAPI.EchoUpload("classpic",this.Txt3GLogo.ClientID,150) %></td>
                                                            <%} %>
                                                                <td><img id="show<%=Txt3GLogo.ClientID %>" src="<%=Txt3GLogo.Text%>"  height="30" style="border:1px solid #f1f1f1;" onerror="this.src='../../sysimg/nopic.gif'"/></td>
                                     </tr>
                            </table>
                     </td>
                 </tr>

                 <tr>
                     <td  height="30" align="right" class="lefttd" style="width: 198px"> <b>手机版底部版权：</b></td>
                     <td class="righttd">
                       &nbsp;<asp:TextBox CssClass="textbox textarea"  Height="100" Width="350" ID="Txt3GCopyRight" runat="server" TextMode="MultiLine" Columns="40" Rows="4" ></asp:TextBox> <a class="textarea_min" href="javascript:zoomtextarea(-5,'<%=this.Txt3GCopyRight.ClientID %>');"></a>
                         <a class="textarea_max" href="javascript:zoomtextarea(5,'<%=this.Txt3GCopyRight.ClientID %>');">
                                                                     </a>
                     </td>
                 </tr>
                 <tr>
                     <td  height="30" align="right" class="lefttd" style="width: 198px"> <b>手机版允许会员注册：</b></td>
                     <td class="righttd">
                       &nbsp;<asp:RadioButtonList ID="Rdb3GUserRegEnable" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                       <asp:ListItem Value="1" Selected="True">允许</asp:ListItem>
                       <asp:ListItem Value="0">不允许</asp:ListItem>
                       </asp:RadioButtonList>
                     </td>
                 </tr>
                  <tr>
                     <td  height="30" align="right" class="lefttd" style="width: 198px"> <b>手机访问主站域名自动切换到手机站点：</b></td>
                     <td class="righttd">
                       &nbsp;<asp:RadioButtonList ID="RdbAutoMobileSite" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                       <asp:ListItem Value="1" Selected="True">是</asp:ListItem>
                       <asp:ListItem Value="0">否</asp:ListItem>
                       </asp:RadioButtonList>
                     </td>
                 </tr>
                  <tr>
                     <td  height="30" align="right" class="lefttd" style="width: 198px"> <b>手机版在线留言：</b></td>
                     <td class="righttd">
                     <b>留言内容是否审核</b>
                       &nbsp;<asp:RadioButtonList ID="RbMessageVerify" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                       <asp:ListItem Value="0" >是</asp:ListItem>
                       <asp:ListItem Value="1" Selected="True">否</asp:ListItem>
                       </asp:RadioButtonList>
                         <div class="hr_line"></div>
                        <b>是否允许游客留言：</b>
                    <asp:RadioButtonList ID="RdbMessageVisitor" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                        <asp:ListItem Selected="True" Value="1">允许</asp:ListItem>
                        <asp:ListItem Value="0">不允许</asp:ListItem>
                    </asp:RadioButtonList>
                     </td>
                 </tr>
                 </tbody>
    </table>
  </div>
 

  <div class="tab-page" id="tabweixin" style="background:#fff">
	<h2 class="tab">微信版设置</h2>
	<script type="text/javascript">
	    tabPane1.addTabPage(document.getElementById("tabweixin"));
	</script>	
    <table width="100%"  border="0" cellpadding="1" cellspacing="1" class="CTable"> 
      <tr>
            <td  height="30" align="right" class="lefttd" style="width: 198px"> <b>微信授权码：</b></td>
            <td class="righttd"><asp:TextBox CssClass="textbox" ID="WeixinSiteKey" runat="server" Width="350"></asp:TextBox>
            <span class="tips">如果没有启用微信功能，无需填写。</span></td>
       </tr>
       <tr>
           <td  height="30" align="right" class="lefttd" style="width: 198px"> <b>开启首次关注公众号自动创建账号：</b></td>
            <td class="righttd">
                &nbsp;<asp:RadioButtonList ID="RdbWeixinAutoCreateUser" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                 <asp:ListItem Value="1" Selected="True">开启</asp:ListItem>
                  <asp:ListItem Value="0">不开启</asp:ListItem>
                 </asp:RadioButtonList>
             </td>
         </tr>
       <tr>
           <td  height="30" align="right" class="lefttd" style="width: 198px"> <b>开启通过公众号访问手机站时会员自动登录：</b></td>
            <td class="righttd">
                &nbsp;<asp:RadioButtonList ID="RdbWeixinAutoLogin" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                 <asp:ListItem Value="1" Selected="True">开启</asp:ListItem>
                  <asp:ListItem Value="0">不开启</asp:ListItem>
                 </asp:RadioButtonList>
             </td>
         </tr>
        <tr>
           <td  height="30" align="right" class="lefttd" style="width: 198px"> <b>首次通过微信自动登录的用户强制绑定用户：</b></td>
            <td class="righttd">
                &nbsp;<asp:RadioButtonList ID="RdbWeixinLoginBindUser" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                 <asp:ListItem Value="1" Selected="True">开启</asp:ListItem>
                  <asp:ListItem Value="0">不开启</asp:ListItem>
                 </asp:RadioButtonList>
             </td>
         </tr>
    </table>
</div>
 
    <div class="tab-page" id="tab4" style="background:#fff">
	<h2 class="tab">联系信息</h2>
	<script type="text/javascript">
	 tabPane1.addTabPage(document.getElementById("tab4"));
	</script>	
 <table width="100%"  border="0" cellpadding="1" cellspacing="1" class="CTable"> 
      <tr>   
      <td class="lefttd" height="30" align="right" style="width: 198px"><b>公司名称：</b></td>
	      <td class="righttd">
         &nbsp;<asp:TextBox   ID="CompanyName" CssClass="textbox" runat="server"></asp:TextBox>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="CompanyName"
          ErrorMessage="*请填写公司名称" ></asp:RequiredFieldValidator>
       </td>    
    </tr>
    <tr>
    <td class="lefttd" height="30" align="right" style="width: 198px"><b>公司地址：</b></td>
	     <td class="righttd">
          &nbsp;<asp:TextBox ID="ComapnyAddress" CssClass="textbox" runat="server"></asp:TextBox> 
          <asp:RequiredFieldValidator ID="RequiredFieldValidator4"  runat="server" ControlToValidate="ComapnyAddress"
           ErrorMessage="RequiredFieldValidator">*请填写公司地址</asp:RequiredFieldValidator>
     </td>   
    </tr>
    <tr>
    <td class="lefttd" height="30" align="right" style="width: 198px"><b>固定电话：</b></td>
	   <td class="righttd">
         &nbsp;<asp:TextBox ID="Phone" CssClass="textbox" runat="server" ></asp:TextBox>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator5"  runat="server" ControlToValidate="Phone"
          ErrorMessage="RequiredFieldValidator">*请填写固定电话</asp:RequiredFieldValidator>
    
        </td>   
    </tr>
    <tr>
     <td class="lefttd" height="30" align="right" style="width: 198px"><b>移动电话：</b></td>
	    <td class="righttd">
           &nbsp;<asp:TextBox ID="TelPhone" CssClass="textbox" runat="server" ></asp:TextBox>
      
          </td>   
     </tr>
     <tr>
       <td class="lefttd" height="30" align="right" style="width: 198px"><b>传真：</b></td>
	       <td class="righttd">
            &nbsp;<asp:TextBox  ID="fax" CssClass="textbox" runat="server"></asp:TextBox>
       </td>   
      </tr>                                                                                                                              
      <tr>
        <td class="lefttd" height="30" align="right" style="width: 198px"><b>E-Mail：</b></td>
	        <td class="righttd">
              &nbsp;<asp:TextBox  ID="Email" CssClass="textbox" runat="server" ></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator6"  runat="server" ControlToValidate="Email"
              ErrorMessage="RequiredFieldValidator" >*请填写Email</asp:RequiredFieldValidator>
             <asp:RegularExpressionValidator runat="server" ID="RequiredFieldValidator9" ControlToValidate="Email"
              ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">邮件地址格式错误
             </asp:RegularExpressionValidator>
         
             </td>   
      </tr>
      <tr>
        <td class="lefttd" height="30" align="right" style="width: 198px"><b>邮编：</b></td>
	       <td class="righttd">
           &nbsp;<asp:TextBox  ID="PostCode" CssClass="textbox" runat="server" ></asp:TextBox>
        
            </td>   
      </tr>
      <tr>
        <td class="lefttd" height="30" align="right" style="width: 198px"><b>QQ：</b></td>
	       <td class="righttd">
              &nbsp;<asp:TextBox  ID="QQ" CssClass="textbox" runat="server"></asp:TextBox>
              </td>   
      </tr>                                             
      <tr>
      <td class="lefttd" height="30" align="right" style="width: 198px"><b>联系人：</b></td>
	       <td class="righttd">
             &nbsp;<asp:TextBox  ID="Contact" runat="server" CssClass="textbox"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator7"  runat="server" ControlToValidate="Contact"
             ErrorMessage="RequiredFieldValidator">*请填写联系人</asp:RequiredFieldValidator>
       
            </td>   
       </tr>
       <tr>
         <td class="lefttd" height="30" align="right" style="width: 198px"><b>备案号：</b></td>
	        <td class="righttd">
               &nbsp;<asp:TextBox  ID="Beian" CssClass="textbox" runat="server"></asp:TextBox>&nbsp;
          
              </td>   
       </tr>       
       <tr>
        <td class="lefttd" height="30" align="right" style="width: 198px"><b>关键词：</b></td>
	           <td class="righttd">
               &nbsp;<asp:TextBox  ID="KeyWord" CssClass="textbox" runat="server" ></asp:TextBox>
        </td>   
       </tr>       
       <tr>
         <td class="lefttd" height="30" align="right" style="width: 198px"><b>公司简介：</b></td>
	         <td class="righttd">
                &nbsp;<asp:TextBox  ID="TxtCompanyIntro" runat="server" TextMode="MultiLine"  Width="70%" Rows="6" Height="150px" CssClass="textbox textarea"></asp:TextBox>
              <a class="textarea_min" href="javascript:zoomtextarea(-5,'<%=this.TxtCompanyIntro.ClientID %>');"></a>
              <a class="textarea_max" href="javascript:zoomtextarea(5,'<%=this.TxtCompanyIntro.ClientID %>');"></a>
         
              </td>   
        </tr>
          <tr>
           <td class="lefttd" height="30" align="right" style="width: 198px"><b>公司具体内容：</b></td>
	          <td class="righttd">
              &nbsp;<asp:TextBox ID="TxtCompanyContent" runat="server"  TextMode="MultiLine" style="width:90%;height:200px;"></asp:TextBox>
             <% Kesion.APPCode.EditorAPI.EchoEditor("editor", this.TxtCompanyContent.ClientID, "Common");%>
         
              </td>   
        </tr>
          <tr>
         <td class="lefttd" height="30" align="right" style="width: 198px"><b>描述：</b></td>
	        <td class="righttd">
               &nbsp;<asp:TextBox  ID="TxtDecript" runat="server" TextMode="MultiLine"  Width="70%" Rows="6" Height="150px" CssClass="textbox textarea"></asp:TextBox>
               <a class="textarea_min" href="javascript:zoomtextarea(-5,'<%=this.TxtDecript.ClientID %>');"></a>
              <a class="textarea_max" href="javascript:zoomtextarea(5,'<%=this.TxtDecript.ClientID %>');"></a>
         
             </td>
        </tr>
         <tr>
           <td class="lefttd" height="30" align="right" style="width: 198px"><b>百度密匙：</b></td>
	         <td class="righttd">
               &nbsp;<asp:TextBox  ID="TxtBaiduKey" CssClass="textbox" runat="server"></asp:TextBox>
       </td>
       </tr>  
        <tr>
       <td class="lefttd" height="30" align="right" style="width: 198px"><b>百度坐标：</b></td>
	         <td class="righttd">
             <script type="text/javascript">
                        function map() {
                            window.open("http://api.map.baidu.com/lbsapi/getpoint/index.html", "坐标获取","width=960px,height=700px;");
                        }
                    </script>
               &nbsp;<asp:TextBox  ID="TxtBaiduPoint" CssClass="textbox" runat="server"></asp:TextBox>
               <span class="tips">
               <a href="javascript:;" onclick="map()" class="link-color">
               	<img src="/admin/images/edit_add.gif" align="absmiddle" border="0">添加电子地图坐标</a>&nbsp;&nbsp;请选择贵公司所在的位置。
               </span>
      </td>
       </tr>            
   </table>
 </div>


  <KS:Tips ID="Tips1" runat="server" />
       <KS:Foot ID="CopyRight1" CancelButtonVisible="false" OnSubmit="SaveButton_Click"  runat="server" />
  </div>     
</asp:Content>


