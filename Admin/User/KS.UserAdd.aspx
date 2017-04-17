<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_UserAdd" Title="Untitled Page" CodeBehind="KS.UserAdd.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="System.Xml" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="AddPanel" runat="server" Width="100%">

      <div id="manage_top" class="toptitle menu_top_fixed">
      	  <ul class="titleTab">
      		<li>操作导航：</li>
            <li class="curr"><a href="KS.UserAdd.Aspx">新增用户</a></li>
            <li><a href="KS.UserImport.Aspx">外部数据源批量导入</a></li>
          </ul>  
       </div>
        <div class="menu_top_fixed_height"></div> 
        <div class="content-area">
        	<div class="tab-page" id="AddUserPanel">
         <script type="text/javascript">
             var tabPane1 = new WebFXTabPane(document.getElementById("AddUserPanel"), 1)
         </script>
             <style>
			.reg_box_l{ width:100%;}
			.reg_box_l li{ overflow:hidden; clear:both; border-bottom:#EBF0F3 solid 1px; position:relative}
			.reg_box_l li .title{padding: 5px; float:left; width:84px; position:absolute; left:0; top:50%; margin-top:-17px; text-align:right;line-height: 24px;font-size: 12px;color: #555; }
			.reg_box_l li .rdiv{ float:left; padding:10px; padding-left:123px; text-align:left}
			.reg_box_l li .rdiv td{ padding:0 10px !important;}
			.reg_box_l li .d_default{ color:#b0b9bf; padding:10px; margin-top:5px; float:left;}
			.reg_box_l li .rdiv .textbox{ float:left;}
			.reg_box_l li .rdiv span{ float:left !important}
			</style>
            <script>
                $(document).ready(function(){
                    showAgent();
                });
                function showAgent(){
                    var groupid=$("#GroupID").val();
                    if (groupid!=-1&&groupid!=1){
                        $("#tjr").show();
                    }else{
                        $("#tjr").hide();
                    }
                <%if (MyCache.GetShopCommonConfig(59).Equals("0")){%>
                    $("#GroupID option").each(function(){
                        if (parseInt($(this).val())<0){
                            $(this).remove();
                        }
                    });
                    <%}else if (userid==0){%>
                    $("#GroupID option").each(function(){
                        if (parseInt($(this).val())<-1 && parseInt($(this).val())!=-4){
                            $(this).remove();
                        }
                    });
                    <%}%>
                }
                function CheckForm(){
                    if ($("#<%=UserName.ClientID%>").val()==''){
                        KesionJS.Alert('请输入用户名称!','$("#<%=UserName.ClientID%>").focus();');
                        return false;
                    }
                    if ($("#<%=PassWord.ClientID%>").val()==''){
                       // KesionJS.Alert('请输入登录密码!','$("#<%=PassWord.ClientID%>").focus();');
                       // return false;
                    }
                    if ($("#<%=TxtMobile.ClientID%>").val()!=''){
                        if (ismobile($("#<%=TxtMobile.ClientID%>").val())==false){
                            KesionJS.Alert('手机号码格式不正确!','$("#<%=TxtMobile.ClientID%>").focus();');
                            return false;
                        }
                    }
                    <%=sb.ToString()%>
                }
            </script>
		 <div class="tab-page" id="tab0">
		  <h2 class="tab">基本信息</h2>
			<script type="text/javascript">
				 tabPane1.addTabPage( document.getElementById( "tab0" ) );
			</script>
			
             <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable">
          <tr>
              <td align="right" class="lefttd" height="30" style="width: 84px">
                  <strong>用户类型：</strong></td>
              <td class="righttd">
              <span id="groupidarea" runat="server"></span>
              </td>
          </tr>
          <tr id="tjr">
            <td class="lefttd" height="30" align="right" style="width: 84px"><b>推 荐 人：</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="TxtAgent" runat="server" Width="268px"></asp:TextBox>
                <span class="tips">如果有推荐人，请填写推荐人的用户名。</span>
               </td>
          </tr>

          <tr>
             <td align="right" class="lefttd" height="30" style="width: 84px"><strong>所属部门：</strong></td>
             <td class="righttd">
                &nbsp;<asp:DropDownList ID="DrpDepartID" runat="server">
                 <asp:ListItem Value="0">--不属于任何部门--</asp:ListItem>
                </asp:DropDownList>
             </td>
          </tr>
          <tr id="AskRank" runat="server">
             <td align="right" class="lefttd" height="30" style="width: 84px"><strong>问吧等级：</strong></td>
             <td class="righttd">
                &nbsp;<asp:DropDownList ID="DrpAskRankId" runat="server">
                 <asp:ListItem Value="0">--不设置问吧等级--</asp:ListItem>
                </asp:DropDownList>
             </td>
          </tr>
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 84px"><b>会员名称：</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="UserName" runat="server" Width="268px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UserName"
                    ErrorMessage="请填写用户登录名称!" Display="Dynamic"></asp:RequiredFieldValidator>
                   <span class="tips">建议使用英文名称。</span> 
                    </td>
          </tr>
          <tr>
              <td align="right" class="lefttd" height="30" style="width: 84px">
                  <strong>登录密码：</strong></td>
              <td class="righttd">
                  &nbsp;<asp:TextBox CssClass="textbox" ID="PassWord" runat="server" TextMode="password" Width="268px"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="ValidatorPass" runat="server" ControlToValidate="PassWord"
                      ErrorMessage="请输入登录密码!" Display="Dynamic"></asp:RequiredFieldValidator>
                      <asp:Label ID="passtips" CssClass="tips" runat="server"></asp:Label>
                     <span class="tips">建议设置不少于6位。</span>  </td>
          </tr>
          <tr>
              <td align="right" class="lefttd" height="30" style="width: 84px">
                  <strong>电子邮箱：</strong></td>
              <td class="righttd">
                  &nbsp;<asp:TextBox CssClass="textbox" ID="Email" runat="server" Width="268px"></asp:TextBox>
                 
                  <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Email"
                      Display="Dynamic" ErrorMessage="电子邮箱格式不正确!" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                      <span class="tips">如：kesioncms@hotmail.com</span>
                      </td>
          </tr>
          <tr>
              <td align="right" class="lefttd" height="30" style="width: 84px">
                  <strong>手机号码：</strong></td>
              <td class="righttd">
                  &nbsp;<asp:TextBox CssClass="textbox" ID="TxtMobile" runat="server" Width="168px"></asp:TextBox>
                <strong>设置手机号码已认证：</strong><asp:RadioButtonList ID="RdbIsMobileRZ" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                   <asp:ListItem Value="0" Selected>否</asp:ListItem>
                   <asp:ListItem Value="1">是</asp:ListItem>
                  </asp:RadioButtonList> </td>
          </tr>
         
          <tr>
              <td align="right" class="lefttd" height="30" style="width: 84px">
                  <strong>提示问题：</strong></td>
              <td class="righttd">
              &nbsp;<asp:DropDownList ID="Question" runat="server">
                    <asp:ListItem>我的宠物名字？</asp:ListItem>
                    <asp:ListItem>我最好的朋友是谁？</asp:ListItem>
                    <asp:ListItem>我最喜爱的颜色？</asp:ListItem>
                    <asp:ListItem>我最喜爱的电影？</asp:ListItem>
                    <asp:ListItem>我最喜爱的影星？</asp:ListItem>
                    <asp:ListItem>我最喜爱的歌曲？</asp:ListItem>
                    <asp:ListItem>我最喜爱的食物？</asp:ListItem>
                    <asp:ListItem>我最大的爱好？</asp:ListItem>
                    <asp:ListItem>我中学校名全称是什么？</asp:ListItem>
                    <asp:ListItem>我的座右铭是？</asp:ListItem>
                    <asp:ListItem>我最喜欢的小说的名字？</asp:ListItem>
                    <asp:ListItem>我最喜欢的卡通人物名字？</asp:ListItem>
                    <asp:ListItem>我母亲/父亲的生日？</asp:ListItem>
                    <asp:ListItem>我最欣赏的一位名人的名字？</asp:ListItem>
                    <asp:ListItem>我最喜欢的运动队全称？</asp:ListItem>
                    <asp:ListItem>我最喜欢的一句影视台词？</asp:ListItem>
              </asp:DropDownList>
              </td>
          </tr>
          <tr>
              <td align="right" class="lefttd" height="30" style="width: 84px">
                  <strong>问题答案：</strong></td>
              <td class="righttd">
                  &nbsp;<asp:TextBox CssClass="textbox" ID="Answer" runat="server" Width="268px"></asp:TextBox>
                  </td>
          </tr>
          <tr>
              <td align="right" class="lefttd" height="30" style="width: 84px">
                  <strong>所在地区：</strong></td>
              <td class="righttd">
                  &nbsp;<asp:Label ID="LabArea" runat="server"></asp:Label></td>
          </tr>
          <tr style="display:none">
              <td align="right" class="lefttd" height="30" style="width: 84px">
                  <strong>会员头像：</strong></td>
              <td class="righttd">
                  &nbsp;<asp:TextBox CssClass="textbox" ID="TxtUserFace" runat="server" Width="268px"></asp:TextBox>
                <input type="button" class="button" onclick="SelectFiles('<%=this.TxtUserFace.ClientID %>',0);" value="选择图片">  </td>
          </tr>
          <tr style="display:none">
              <td align="right" class="lefttd" style="width: 84px; height: 37px;">
                  <strong>计费方式：</strong></td>
              <td class="righttd" style="height: 37px">
              <asp:RadioButtonList ID="ChargeType" runat="server" RepeatDirection="Horizontal">
                      <asp:ListItem Selected="True" Value="1">计点数</asp:ListItem>
                      <asp:ListItem Value="2">有效期</asp:ListItem>
                      <asp:ListItem Value="3">无限期</asp:ListItem>
                  </asp:RadioButtonList>
              </td>
          </tr>
          <tr>
              <td align="right" class="lefttd" height="30" style="width: 84px">
                  <strong>会员状态：</strong></td>
              <td class="righttd">
                  <asp:RadioButtonList ID="Status" runat="server" RepeatDirection="Horizontal">
                      <asp:ListItem Selected="true" Value="0">正常</asp:ListItem>
                      <asp:ListItem Value="1">锁定</asp:ListItem>
                      <asp:ListItem Value="2">待审核</asp:ListItem>
                      <asp:ListItem Value="3">待邮件激活</asp:ListItem>
                  </asp:RadioButtonList></td>
          </tr>
          </table>
          </div>



    <%
    if (userid > 0)
    {
        string thumbarr = string.Empty;
        XmlDocument doc = new XmlDocument();
        doc.Load(Server.MapPath("~/config/uploadsetting.config"));
        XmlNode xn = doc.SelectSingleNode("//uploadsetting/item[@module='userface']");
        if (xn != null)
        {
            thumbarr = xn.SelectSingleNode("@thumbarr").InnerText;
        }
        string[] arr = null;
        if (!string.IsNullOrEmpty(thumbarr))
        {
            arr = thumbarr.Split(',');
        }
        Session["adminUserFaceID"] = userid.ToString();
   %>

 <div class="tab-page" id="tab2">
		  <h2 class="tab" id="H1" runat="server">用户头像</h2>
			<script type="text/javascript">
				 tabPane1.addTabPage( document.getElementById( "tab2" ) );
			</script>
       <table width="100%" border="0"  cellpadding="1" cellspacing="1" class="CTable">
         <tr>
              <td class="righttd" colspan="2"><%=Kesion.APPCode.UploadAPI.EchoUpload("adminuserface", this.TxtUserFace.ClientID) %>
              </td>
        </tr>
         <tr>
              <td align="right" class="lefttd" height="30" style="width: 84px"><strong>自动生成头像：</strong></td>
              <td class="righttd">
                    <table width="100%">
                        <tr>
                            <%
    if (arr != null)
    {
        foreach (string a in arr)
        {
            if (a.IndexOf("x") != -1)
            {
                               %>
                                <td style="height:<%=Utils.StrToInt(a.Split('x')[1])+80 %>px" valign="top">
                                 <div class="ar_r_t"><div class="ar_l_t"><div class="ar_r_b"><div class="ar_l_b">
                                 <img userface="<%=a %>" onerror="this.src='../../sysimg/face/boy.jpg';" src="../../UploadFiles/avatar/<%=userid %>_<%=a %>.jpg" oldsrc="../../UploadFiles/avatar/<%=userid %>_<%=a %>.jpg"  width="<%=a.Split('x')[0] %>"  height="<%=a.Split('x')[1] %>"/>
                                </div></div></div></div>
                                    <div style="clear:both;line-height:22px; font-size:12px" class="tips">尺寸：<%=a %>
                                        <br />文件名：<%=userid.ToString() + "_" + a + ".jpg" %>
                                    </div>
                               </td>
                                <% 
            }
        }
    }%>     
                           
                        </tr>
                    </table>
              </td>
          </tr>
         <tr>
              <td align="right" class="lefttd" height="30" style="width: 84px"><strong>原图：</strong></td>
              <td class="righttd">
                 <img userface="<%=userid %>" onerror="this.src='../../sysimg/face/boy.jpg';" src="../../UploadFiles/avatar/<%=userid %>.jpg" oldsrc="../../UploadFiles/avatar/<%=userid %>.jpg" style="cursor:pointer;max-height:280px;max-width:280px" title="点击查看原图" onclick="window.open($(this).attr('src'));"/>
                   <div class="tips">
                    <br />文件名：<%=userid.ToString() + ".jpg" %>
                </div>
              </td>
        </tr>

 </table>
</div>
       <%} %>   
          <div class="tab-page" id="tab1">
		  <h2 class="tab" id="diyoption" runat="server">自定义选项</h2>
			<script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab1" ) );
			</script>
			
			
 <table width="100%" border="0"  cellpadding="1" cellspacing="1" class="CTable">
          <tr>
           <td colspan="2">
               <div class="reg_box_l">
			     <ul id="useroptionsarea" runat="server"></ul>
                </div>
           </td>
          </tr>
       </table>
       </div>
       </div>

           <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" />
      </div>
        
        <asp:TextBox ID="ComeUrl" Visible="false" runat="server"></asp:TextBox>
       
    </asp:Panel>
    
  </div>  
</asp:Content>

