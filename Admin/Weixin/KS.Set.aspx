<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true"
Inherits="Kesion.Weixin.WebSite.weixin_set" CodeBehind="KS.Set.aspx.cs"
%>
    <asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    
        <link href="/admin/weixin/images/style.css" rel="stylesheet" />
        <KS:TopNav ID="TopNav1" runat="server" />
        <div class="content-area">
        <script>
            jQuery(document).ready(function () {
                showStatus();
            });

            function showStatus() {
                var checkrad = jQuery("#<%=this.RdbStatus.ClientID %> :radio[checked]").val();
                if (checkrad == "1") {
                    jQuery("#weixinstatus").show();
                    jQuery("#visiblebutton").hide();
                    // jQuery("#weixinstatus").css("display", "");
                } else {

                    jQuery("#weixinstatus").hide();
                    jQuery("#visiblebutton").show();

                }
            }
        </script>
        <asp:Panel ID="Panel1" runat="server">
            <div class="console_body">
                <div class="ct-box">
                    <div class="ct-row">
                        <div class="col s4 selected">
                            <a href="javascript:;">
                                1
                            </a>
                        </div>
                        <div class="col s4">
                            <a href="javascript:;">
                                2
                            </a>
                        </div>
                        <div class="col s4">
                            <a href="javascript:;">
                                3
                            </a>
                        </div>
                    </div>
                    <div class="body">
                        <div class="console-sns ct-form">
                            <div class="row ct-h4 ct-center">
                                第一步： 填写微信公众号类型与基本信息
                            </div>
                            <div class="openKey">
                                <span class="txt" style="float:left;">
                                    开启微信公众号的配置：
                                </span>
                                <asp:RadioButtonList ID="RdbStatus" RepeatDirection="Horizontal" runat="server"
                                onclick="showStatus();">
                                    <asp:ListItem Value="1">
                                        开启
                                    </asp:ListItem>
                                    <asp:ListItem Value="0" Selected="True">
                                        关闭
                                    </asp:ListItem>
                                </asp:RadioButtonList>
                                <div class="clear">
                                </div>
                            </div>
                            <div id="weixinstatus" style="display:none">
                                <div class="row">
                                    <label class="label">
                                        公众号类型
                                    </label>
                                    <div class="ct-select ct-fl">
                                        <asp:DropDownList ID="WeiXinType" runat="server">
                                            <asp:ListItem Value="0">
                                                订阅号
                                            </asp:ListItem>
                                            <asp:ListItem Value="1" Selected="True">
                                                服务号
                                            </asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="img-tips ct-p-lg clearfix">
                                        <div class="left">
                                            注：请确认您的公众账号类型
                                        </div>
                                        <div class="right">
                                            <img src="/admin/weixin/images/account1.png">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <label class="label">
                                        公众号名称
                                    </label>
                                    <asp:TextBox ID="TxtOpenName" runat="server" class="text">
                                    </asp:TextBox>
                                    <span class="xmark">
                                        *
                                    </span>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                    ErrorMessage="请输入公众号名称" ControlToValidate="TxtOpenName">
                                    </asp:RequiredFieldValidator>
                                </div>
                                <div class="row">
                                    <label class="label">
                                        公众号原始id
                                    </label>
                                    <div class="ct-select ct-fl">
                                        <asp:TextBox ID="TxtWeiXinOpenID" runat="server" class="text">
                                        </asp:TextBox>
                                        <span class="xmark">
                                            *
                                        </span>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                        ErrorMessage="请输入公众号原始id" ControlToValidate="TxtWeiXinOpenID">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <%--<div class="row">
                                    <label class="label">
                                        微信号
                                    </label>
                                    <div class="ct-select ct-fl">
                                        <asp:TextBox ID="TxtWeiXinName" runat="server" class="text">
                                        </asp:TextBox>
                                    </div>
                            </div>
                            <div class="row">
                                <label class="label">
                                    二维码图片
                                </label>
                                <div class="ct-fl">
                                    <div class="ct-clearfix">
                                        <div class="ct-fl">
                                            <input id="ErCodeimg" name="ErCodeimg" Class="textbox" type="text" value="<%=ErCodeimg%>"
                                            />
                                            <%=Kesion.APPCode.UploadAPI.EchoUpload( "VPic", "ErCodeimg")%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            --%>
                            <div class="row">
                                <label class="label">
                                    认证状态
                                </label>
                                <asp:Label ID="status" runat="server" Text="未认证">
                                </asp:Label>
                            </div>
                            <div class="row">
                                <label class="label">
                                    权限说明
                                </label>
                                <asp:Label ID="Label1" runat="server" Text="您只可以使用基本功能，需要认证后才可以使用【自定义菜单】功能;<br>只有服务号才可以使用【粉丝管理】，【回复粉丝】等高级功能">
                                </asp:Label>
                            </div>
                            <div class="row">
                                <div class="img-tips ct-p-lg clearfix">
                                    <div class="left">
                                        <img src="/admin/weixin/images/3.png" class="img01" />
                                    </div>
                                    <div class="right">
                                        <span>
                                            <img src="/admin/weixin/images/5.png" class="img01" />
                                        </span>
                                        <span>
                                            <img src="/admin/weixin/images/4.png" class="img02" />
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="row ct-center main-button" style="margin:0">
                                <asp:Button ID="Button1" runat="server" Text="下一步" class="ct-btn green large"
                                onclick="Button1_Click" />
                            </div>
                        </div>
                        <div id="visiblebutton" style="display:none">
                            <asp:Button ID="Button4" runat="server" Text="保存" OnClick="Button4_Click"
                            class="ct-btn blue" style="float:left;margin-left:0;" />
							<div class="clear"></div>
                        </div>
                    </div>
                </div>
            </div>
            </div>
        </asp:Panel>
        <asp:Panel ID="Panel2" runat="server">
            <div class="console_body">
                <div class="ct-box">
                    <div class="ct-row">
                        <div class="col s4">
                            <a href="javascript:;">
                                1
                            </a>
                        </div>
                        <div class="col s4 selected">
                            <a href="javascript:;">
                                2
                            </a>
                        </div>
                        <div class="col s4">
                            <a href="javascript:;">
                                3
                            </a>
                        </div>
                    </div>
                    <div class="body">
                        <div class="console-sns ct-form">
                            <div class="row ct-h4 ct-center">
                                第二步： 配置微信开发者凭据
                            </div>
                            <div class="row">
                                <label class="label-lg">
                                    AppID(应用ID)
                                </label>
                                <asp:TextBox ID="TxtAppid" runat="server" class="text" Width="40%">
                                </asp:TextBox>
                                <span class="xmark">
                                    *
                                </span>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                ErrorMessage="请输入AppID(应用ID)" ControlToValidate="TxtAppid">
                                </asp:RequiredFieldValidator>
                            </div>
                            <div class="row">
                                <label class="label-lg">
                                    AppSecret(应用密钥)
                                </label>
                                <asp:TextBox ID="TxtAppSecret" runat="server" class="text" Width="40%">
                                </asp:TextBox>
                                <span class="xmark">
                                    *
                                </span>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                ErrorMessage="请输入AppSecret(应用密钥)" ControlToValidate="TxtAppSecret">
                                </asp:RequiredFieldValidator>
                            </div>
                            <div class="row">
                                <div class="ct-p-lg img-tips three clearfix">
                                    <div class="left">
                                        注：返回开发者中心，将AppID(应用ID)以及AppSecret(应用密钥)拷贝到上表中
                                    </div>
                                    <div class="right">
                                        <img src="/admin/weixin/images/account3.jpg">
                                    </div>
                                </div>
                            </div>
                            <div class="row ct-center main-button" style="margin:0">
                                <asp:Button ID="Button2" runat="server" Text="下一步" class="ct-btn green large"
                                onclick="Button2_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </asp:Panel>
        <asp:Panel ID="Panel3" runat="server">
            <div class="console_body">
                <div class="ct-box">
                    <div class="ct-row">
                        <div class="col s4">
                            <a href="javascript:;">
                                1
                            </a>
                        </div>
                        <div class="col s4">
                            <a href="javascript:;">
                                2
                            </a>
                        </div>
                        <div class="col s4 selected">
                            <a href="javascript:;">
                                3
                            </a>
                        </div>
                    </div>
                    <div class="body">
                        <div class="console-sns ct-form">
                            <div class="row ct-h4 ct-center">
                                第三步：进入微信公众平台并设置接口
                            </div>
                            <div class="row">
                                <div class="ct-m steps">
                                    <div class="ct-mb1 step first">
                                        <div class="number">
                                            1
                                        </div>
                                        <div class="ct-m clearfix">
                                            <div class="left ct-mtb">
                                                <span>
                                                    进入微信公共平台
                                                </span>
                                                <a class="ct-color blue" href="http://mp.weixin.qq.com" target="_blank">
                                                    http://mp.weixin.qq.com
                                                </a>
                                                <br />
                                                <span>
                                                    登录微信公众平台，点击进入【开发者中心】
                                                </span>
                                            </div>
                                            <div class="right">
                                                <img src="/admin/weixin/images/account21.jpg">
                                            </div>
                                        </div>
                                        <img src="/admin/weixin/images/bzjt01.png" class="bzjt" />
                                    </div>
                                    <div class="ct-mb1 step second">
                                        <div class="number">
                                            2
                                        </div>
                                        <div class="ct-m clearfix">
                                            <div class="left ct-mtb">
                                                <span>
                                                    修改服务器配置
                                                </span>
                                                <br />
                                                <span>
                                                    在服务器配置处，点击【修改配置】
                                                </span>
                                            </div>
                                            <div class="right">
                                                <img src="/admin/weixin/images/account22.jpg">
                                            </div>
                                        </div>
                                        <img src="/admin/weixin/images/bzjt02.png" class="bzjt" />
                                    </div>
                                    <div class="ct-mb1 step thrid">
                                        <div class="number">
                                            3
                                        </div>
                                        <div class="ct-m clearfix">
                                            <div class="left" style="float:left;margin-bottom:10px;">
                                                <div class="ct-mt">
                                                    <span>
                                                        配置微信接口
                                                    </span>
                                                    <br>
                                                    <span>
                                                        分别将下方的信息复制到【接口配置信息】的输入框
                                                    </span>
                                                </div>
                                                <div class="ct-mt urlbox">
                                                    <div class="ct-clearfix ct-mb-sm">
                                                        <span class="url">
                                                            URL
                                                        </span>
                                                    </div>
                                                    <div class="ct-p-sm ct-mr-sm ct-bg grey kk" style="word-wrap:break-word;">
                                                        <asp:Label ID="url" runat="server" Text="Label">
                                                        </asp:Label>
                                                    </div>
                                                </div>
                                                <div class="ct-mt tokenbox">
                                                    <div class="ct-clearfix ct-mb-sm">
                                                        <span class="token">
                                                            Token
                                                        </span>
                                                    </div>
                                                    <div class="ct-p-sm ct-mr-sm ct-bg grey kk" style="word-wrap:break-word;">
                                                        <asp:Label ID="Token" runat="server" Text="Label">
                                                        </asp:Label>
                                                    </div>
                                                </div>
                                                <div class="ct-mt tokenbox">
                                                    <div class="ct-clearfix ct-mb-sm">
                                                        <span class="token">
                                                            EncodingAESKey
                                                        </span>
                                                    </div>
                                                    <div class="ct-p-sm ct-mr-sm ct-bg grey kk" style="word-wrap:break-word;">
                                                        <asp:Label ID="EncodingAESKey" runat="server" Text="Label">
                                                        </asp:Label>
                                                    </div>
                                                </div>
                                                <div class="ct-mt tokenbox">
                                                    <div class="ct-clearfix ct-mb-sm">
                                                        <span class="token">
                                                            消息加密方式
                                                        </span>
                                                    </div>
                                                    <div class="ct-p-sm ct-mr-sm ct-bg grey kk" style="word-wrap:break-word;">
                                                        <asp:Label ID="MessageEnType" runat="server">
                                                        </asp:Label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="right" style="float:right;">
                                                <img src="/admin/weixin/images/account23.png">
                                            </div>
											<div class="clear"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row ct-center main-button" style="margin:0">
                                <asp:Button ID="Button3" runat="server" Text="保存配置" class="ct-btn green large"
                                onclick="Button3_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </asp:Panel>
        
   </div>     
</asp:Content>