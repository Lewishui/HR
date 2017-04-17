<%@ Page Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_UserLogin" Codebehind="UserLogin.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.BLL" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>用户登录</title>
    <script src="../ks_inc/jquery.js"></script>
    <script src="../ks_inc/Kesion.Common.js"></script>
    <style type="text/css">
<!--
body{font-family: "\5FAE\8F6F\96C5\9ED1";}
.textbox
{
padding:9px 10px 9px 40px;
width: 268px;
line-height: 20px;
border: 1px solid #ddd;
border-radius: 3px;
outline: none;
margin-bottom:15px;
font-family: "\5FAE\8F6F\96C5\9ED1";
}
.textbox:focus{border:1px solid #ccc;color:#555; box-shadow:0 1px 3px #eee inset;}
TD
{
FONT-SIZE: 9pt;line-height: 130%;
}
a{text-decoration: none;} /* 链接无下划线,有为underline */
a:link {color: #000000;} /* 未访问的链接 */
a:visited {color: #333333;} /* 已访问的链接 */
a:hover{COLOR: #AE0927;} /* 鼠标在链接上 */
a:active {color: #0000ff;} /* 点击激活链接 */
#PopLogin{color:#555;}
#PopLogin td{font-size:14px;line-height:45px; }
#PopLogin td a{color: #3d94ce}
#PopLogin td span{}
input{ text-indent:5px; color:#666}
#PopLogin .txt{ font-size:14px;}
.btn{ color:#333;cursor:pointer; border:0; width:320px; height:42px; line-height:40px;background-color: #f9f9f9;
border:0px;font-size:16px;font-family: "\5FAE\8F6F\96C5\9ED1";display: inline-block;border:1px solid #ddd; outline:none;
border-radius: 4px; -webkit-transition:0.3s; transition:0.3s; }
.btn:hover{ background:#f6f6f6;color:#111;border:1px solid #ccc;}

.sanf {
text-align: center;
margin-top: 20px;
font-size: 14px;
line-height:34px;
border-top: 1px solid #e5e5e5;
color:#999;
padding-top: 10px; font-size:12px;}
.sanf img{ width:25px; margin-left:10px;}
 .login_bottom {
text-align: center;
margin-top: 30px;
font-weight: 500;
font-size: 14px;color:#555;}
 .login_bottom a{color: #3d94ce; margin-left:10px;}
 
 
.user_ico, .pass_ico, .yz_ico, .em_ico,#MobileCode {
background: url(/user/images/reg_ico.png) no-repeat;
}
 
 .user_ico {
background-position: 10px 9px;
}
.pass_ico {
background-position: 10px -21px;}
#MobileCode{
	background-position:10px -52px;
}

*{ padding:0; margin:0;}
.loginbody{ padding:15px 0;}
.mobileLogin{ padding:40px 30px 0;}
.defaultLogin{ padding:20px 30px 0;}

#login_container iframe{ width:100%; height:393px;}
table{ width:100%; border:0;}
.btn_yz{ font-size:15px; outline:0; background:none; border:0; margin-left:10px;font-family: "\5FAE\8F6F\96C5\9ED1"; color:#FF7800; cursor:pointer;}
 .loginpanel {
	height:43px;  border-bottom:#ddd solid 1px; margin-bottom:20px;
        }
 .loginpanel ul {
	 overflow:hidden;
 }
  .loginpanel ul li{
     float:left;list-style-type:none; cursor:pointer; width:33.33%;*width:33.2%; line-height:42px; font-size:16px; color:#555; text-align:center;
 }
.loginpanel ul li.curr{
	border-bottom:#111 solid 2px; height:42px; color:#111;
 }

/*会员信息*/
#LoginOKPanel #Label1 table{border: 1px solid #E7E7E7; border-radius: 10px;overflow: hidden;}
#LoginOKPanel #Label1 table tr td strong{ font-weight:normal; color:red;}
#LoginOKPanel #Label1 table tr td{ padding:10px 20px;}
#LoginOKPanel #Label1 table tr:nth-child(2n+1) {background: #f9f9f9;}

#Cookies{width:14px;height:14px; background-image:url(/user/images/checkbox.png);float:left;margin:16px 5px 0px 0px; outline:none; background-repeat:no-repeat; -webkit-appearance:none;}
#Cookies:checked{ background-position:0 -40px;}

-->
</style>
<script>


    function check() {
        if ($("#<%=this.UserName.ClientID %>").val() == '' || $("#<%=this.UserName.ClientID %>").val() == '<%=Tips%>') {
            KesionJS.Alert('请输入<%= Tips%>！', '$("#<%=this.UserName.ClientID %>").focus();');
            return false;
        }
        if ($("#<%=this.PassWord.ClientID %>").val() == '' || $("#<%=this.PassWord.ClientID %>").val() == '******') {
            KesionJS.Alert('请输入登录密码！', '$("#<%=this.PassWord.ClientID %>").focus();');
            return false;
        }
        <%if (MyCache.GetCacheConfig(3).IndexOf("user/login.aspx") !=-1)
        { %>
        if ($("#<%=this.VerifyCode.ClientID %>").val() == '') {
            KesionJS.Alert('请输入验证码！', '$("#<%=this.VerifyCode.ClientID %>").focus();');
            return false;
        }
        <%} %>
        $("#action").val("");
    }
    $(document).ready(function () {
        jQuery("#<%=UserName.ClientID%>").focus(function () {
            if (jQuery("#<%=UserName.ClientID%>").val() == '<%=Tips%>') jQuery("#<%=UserName.ClientID%>").val('');
        });
        jQuery("#<%=UserName.ClientID%>").blur(function () {
            if (jQuery("#<%=UserName.ClientID%>").val() == '') jQuery("#<%=UserName.ClientID%>").val('<%=Tips%>');
        });
        jQuery("#<%=PassWord.ClientID%>").focus(function () {
            if (jQuery("#<%=PassWord.ClientID%>").val() == '******') jQuery("#<%=PassWord.ClientID%>").val('');
        });
        jQuery("#<%=PassWord.ClientID%>").blur(function () {
           // if (jQuery("#<%=PassWord.ClientID%>").val() == '') jQuery("#<%=PassWord.ClientID%>").val('******');
        });


    });
    $(document).ready(function () {
        if ($(".loginpanel ul li").length > 1) {
            $(".loginpanel ul li").eq(0).addClass("curr");
            $(".logincontent").hide();
            $(".logincontent").eq(0).show();
            $(".loginpanel ul li").click(function () {
                $(".loginpanel ul li").removeClass("curr");
                $(this).addClass("curr");
                var n = $(".loginpanel ul li").index(this);
                $(".logincontent").hide();
                $(".logincontent").eq(n).show();
            })
        } else {
            $(".loginpanel").hide();
        }
    })
</script>
</head>
<body leftmargin=0 topmargin=0 bgcolor="transparent" class="loginbody">

    <div class="loginpanel">
        <ul>
 <% if (MyCache.GetAccountAPIConfig("weixin", "enable") == "true")
     { Response.Write("<li>微信登录</li>");
     }
     if (SMSAPI.GetModelInfo("userlogin").Enable == "true" && MyCache.GetCacheConfig(32) == "1" )
     {
         Response.Write("<li>手机登录</li>");
     } 
     %>
            <li>普通登录</li>
        </ul>
    </div>

    <form id="form1" runat="server">
        <asp:Panel ID="LoginPanel" runat="server" Width="100%">
     
 <% if (MyCache.GetAccountAPIConfig("weixin", "enable") == "true")
     { %>
   <!--微信扫码登录 begin-->
     <div class="logincontent">
         <div id="login_container"></div>
	     <script src="http://res.wx.qq.com/connect/zh_CN/htmledition/js/wxLogin.js"></script>
	     <script src="api/weixin/weixinjs.aspx"></script>
     </div>
     <!--微信扫码登录 end-->
<%} %>
   
<%if (SMSAPI.GetModelInfo("userlogin").Enable == "true" && MyCache.GetCacheConfig(32) == "1" ) { %>
 <!--手机短信登录 begin-->
<div class="logincontent">
     <script>
         function CheckMobileLogin() {
             if ($("#commonlogin").is(":hidden") == false) {
                 return(check());
             }
             if ($("#Mobile").val() == '' || $("#Mobile").val() == '请输入您的手机号码') {
                 jQuery.dialog.alert("请输入手机号码!", function () {
                     jQuery("#Mobile").focus();
                 });
                 return false;
             }
             if ($("#MobileCode").val() == '') {
                 jQuery.dialog.alert("请输入手机短信验证码!", function () {
                     jQuery("#MobileCode").focus();
                 });
                 return false;
             }
             $("#action").val("mobilecodelogin");
             return true;
         }
         var tOutTimes = "<%=Utils.StrToInt(MyCache.GetCacheConfig(38), 60)%>";
         function leavePage() {
             if (tOutTimes == 0) {
                 tOutTimes = OutTimes;
                 $("#SendMobileBtn").attr("disabled", false);
                 $("#SendMobileBtn").val("免费获取手机验证码")
             }
             else {
                 tOutTimes -= 1;
                 $("#SendMobileBtn").val("已发，" + tOutTimes + "秒后可重发!")
                 setTimeout("leavePage()", 1000);
             }
         }
         function getMobileCode() {
             var mobile = $("#Mobile").val();
             var fieldName = "Mobile";
             if (mobile == '' || mobile == '请输入您的手机号码') {
                 $.dialog.alert('请选输入手机号码！', function () { $("#" + fieldName).focus(); });
                 return false;
             }
             if (ismobile(mobile) == false) {
                 $.dialog.alert('手机号码格式不正确，请重新输入！', function () { $("#" + fieldName).focus(); });
                 return false;
             }

             $("#SendMobileBtn").attr("disabled", true);

             $.ajax({
                 type: "get", async: false, url: "regajax.ashx?istest=0&action=sendmobilecode&model=userlogin&mobile=" + mobile + "&anticache=" + Math.floor(Math.random() * 1000), cache: false, dataType: "html", success: function (d) {

                     if (d == 'true') {
                         leavePage();
                     } else {
                         $.dialog.alert(d, function () { $("#SendMobileBtn").attr("disabled", false); });
                     }
                 }
             });

             return false;

         }
     </script>
      <table  cellspacing="0" width="60%" align="center" class="mobileLogin">
           <tr>
               <td>
               <input type="text" onfocus="this.value=(this.value=='请输入您的手机号码')?'':this.value" onblur="this.value=(this.value=='')?'请输入您的手机号码':this.value" name="Mobile" value="请输入您的手机号码" id="Mobile" class="textbox user_ico" >
               </td>
           </tr>
            <tr>
                <td><input maxlength="6" name="MobileCode" style="width:125px" type="text" id="MobileCode" class="textbox" ><input type="button" id="SendMobileBtn" onclick="getMobileCode()" value="免费获取手机验证码" class="btn_yz"/>
                  </td>
            </tr>
           <tr>
            <td>
            <input type="hidden" value="mobilecodelogin" name="action" id="action"/>
            <input type="hidden" value="1" name="ispop" id="ispop"/>
            <input type="submit" class="btn" value="登录" onclick="return (CheckMobileLogin());" />
            </td>
        </tr>
    </table>
</div>
  <!--手机短信登录 begin-->
<%} %>


 <!--普通登录 begin-->
<div class="logincontent" id="commonlogin">
        <table id="PopLogin" cellspacing="0" width="60%" align="center" class="defaultLogin">
           <tr>
                    <td>
                        <asp:TextBox ID="UserName" CssClass="textbox user_ico" MaxLength="20" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UserName"
                            Display="None" ErrorMessage="请输入用户名"></asp:RequiredFieldValidator>
                    </td>
           </tr>
            <tr>
                <td>
                    <asp:TextBox ID="PassWord" TextMode="password" CssClass="textbox pass_ico" runat="server" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Password"
                        Display="None" ErrorMessage="请输入密码"></asp:RequiredFieldValidator></td>
            </tr>
        <tr id="vefify" runat="server">
            <td>
                <asp:TextBox ID="VerifyCode" placeholder="验证码" CssClass="textbox pass_ico" Width="48px" runat="server"></asp:TextBox>
                <img src="../Plus/ValidateCode.aspx" border="0" style="cursor:pointer" onClick="this.src='../Plus/ValidateCode.aspx?t='+Math.random();" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="VerifyCode"
                    Display="None" ErrorMessage="请输入验证码"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
           <td>
               <a href="<%=BaseFun.GetRewriteUrl("getpassword") %>" target="_blank" style=" float:right;color:#999;">忘记密码</a>
                 <label><asp:CheckBox ID="Cookies" CssClass="txt" runat="server" Checked="true" Text="永久登录" />
                     <label><asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
                    ShowSummary="False" /></label>
                 </label>  
            </td>
                    
        </tr>
        <tr>
            <td>
             <asp:Button ID="Button1" CssClass="btn" runat="server" OnClientClick="return(check());" Text="登录" OnClick="Button1_Click" />
            </td>
        </tr>
    </table>
                
                <div class="login_bottom">
                        没有账号？<a class="link-color" href="<%=BaseFun.GetRewriteUrl("reg") %>?backurl=<%=KSCMS.GetComeUrl() %>" target="_blank">现在注册</a>
                 </div>       
				
				<div class="sanf">
				<%
        
                    (new TemporaryVar()).ComeUrl = KSCMS.GetComeUrl();

                    StringBuilder sb = new StringBuilder();
                    if (MyCache.GetAccountAPIConfig("qq", "enable") == "true")
                    {
                        sb.AppendFormat(@"<a href=""{1}"" target=""_parent""><img border=""0"" src=""{{$GetSiteUrl}}sysimg/default/icon_qq.png"" align=""absmiddle"" title=""{0}""/></a>", MyCache.GetAccountAPIConfig("qq", "name"), BaseFun.GetRewriteUrl("qqlogin")+"?backurl="+KSCMS.GetComeUrl());
                    }
                    if (MyCache.GetAccountAPIConfig("weixin", "enable") == "true")
                    {
                        sb.AppendFormat(@" <a href=""{1}"" target=""_parent""><img border=""0"" src=""{{$GetSiteUrl}}sysimg/default/icon_weixin.png"" align=""absmiddle"" title=""{0}""/></a>", MyCache.GetAccountAPIConfig("weixin", "name"), BaseFun.GetRewriteUrl("weixinlogin") + "?backurl=" + KSCMS.GetComeUrl());
                    }
                    if (MyCache.GetAccountAPIConfig("sina", "enable") == "true")
                    {
                        sb.AppendFormat(@" <a href=""{1}"" target=""_parent""><img border=""0"" src=""{{$GetSiteUrl}}sysimg/default/icon_sina.png"" align=""absmiddle"" title=""{0}""/></a>", MyCache.GetAccountAPIConfig("sina", "name"), BaseFun.GetRewriteUrl("sinalogin") + "?backurl=" + KSCMS.GetComeUrl());
                    }
                    if (MyCache.GetAccountAPIConfig("alipay", "enable") == "true")
                    {
                        sb.AppendFormat(@" <a href=""{1}"" target=""_parent""><img border=""0"" src=""{{$GetSiteUrl}}sysimg/default/icon_alipay.png"" align=""absmiddle"" title=""{0}""/></a>", MyCache.GetAccountAPIConfig("alipay", "name"), BaseFun.GetRewriteUrl("alipaylogin") + "?backurl=" + KSCMS.GetComeUrl());
                    }
                    
                    string tp = sb.ToString().Replace("{$GetSiteUrl}", MyCache.GetCacheConfig(5) + KSCMS.GetInstallDir());
                    if (!string.IsNullOrEmpty(tp))
                    {
                        tp = "社交帐号登录：" + tp;
                    }		    
                    Response.Write(tp);
		%></div>
</div>
	 <!--普通登录 end-->
	
             
        </asp:Panel>
    
       <asp:Panel ID="LoginOKPanel" runat="server" Width="100%" Visible="false">
           <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></asp:Panel>
    </form>
   
</body>
</html>
