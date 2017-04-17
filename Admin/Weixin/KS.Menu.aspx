<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true"Inherits="Kesion.Weixin.WebSite.weixin_menu" Codebehind="KS.Menu.aspx.cs" %>
    <%@ Import Namespace="Kesion.Publics" %>
        <%@ Import Namespace="System.Data" %>
            <asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
                 <KS:TopNav ID="TopNav1" runat="server" Text="菜单管理" />
            <div class="content-area" style="overflow:hidden">     
                <link href="/admin/weixin/images/style.css" rel="stylesheet" />
                <link rel="stylesheet" type="text/css" href="/admin/weixin/images/font/css/font-awesome.min.css">
                <script>
                    $(function () {
                        $(".phone_muen .f_nav").hover(function () {
                            $(this).toggleClass("show");
                        })
                    })
                </script>
                <script>
                    $(function () {
                        var w = 250;
                        var h = 50;
                        $(".prompt_box").css("position", "fixed");
                        $(".prompt_box").css("width", w).css("height", h);

                        var x = ($(window).width() - w) / 2;
                        var y = ($(window).height() - h) / 3;
                        $(".prompt_box").css("top", y).css("left", x);


                    });

                 </script>
                <script>
                    function TongBu() {
                        //同步
                        //jQuery(parent.document).find("#ajaxmsg").toggle();
                        $("#Loading").show();
                        $.ajax({
                            url: "KS.Menu.aspx?action=tongbu&rnd=" + Math.random(),
                            context: document.body,
                            type: "get",
                            success: function (data) {
                              //  jQuery('#ajaxmsg', window.parent.document).toggle();
                                if (data == 'ok') {
                                    KesionJS.Alert("恭喜,同步成功", "location.reload();");
                                } else {
                                    KesionJS.Alert("对不起,同步失败!原因："+data, "location.reload();");
                                }
                                $("#Loading").hide();
                             //   jQuery('#ajaxmsg', window.parent.document).fadeOut("slow");
                            }
                        });
                        return false;
                    }
                </script>

                  <script>
                      function JinYong() {
                          //禁用
                          //jQuery(parent.document).find("#ajaxmsg").toggle();
                          $("#jinyong").show();
                          $.ajax({
                              url: "KS.Menu.aspx?action=jinyong&rnd=" + Math.random(),
                              context: document.body,
                              type: "get",
                              success: function (data) {
                                  //  jQuery('#ajaxmsg', window.parent.document).toggle();
                                  if (data == 'ok') {
                                      KesionJS.Alert("恭喜,禁用自定义菜单成功", "location.reload();");
                                  } else if (data = 'openok') {
                                      KesionJS.Alert(" 恭喜，自定义菜单开启成功,设置完成菜单请点“同步到微信”按钮", "location.reload();");
                                  }
                                  else {
                                      KesionJS.Alert("对不起,禁用自定义菜单失败", "location.reload();");
                                  }
                                  $("#jinyong").hide();
                                  //   jQuery('#ajaxmsg', window.parent.document).fadeOut("slow");
                              }
                          });
                          return false;
                      }
                </script>

                 <div class="prompt_bg" style="display:none" id="Loading">
		           <div class="prompt_box">
		             <p><img src="/admin/weixin/images/loading.gif" />正在同步，请耐心等待...</p>
		           </div>
	               </div>
                <div class="prompt_bg" style="display:none" id="jinyong">
		           <div class="prompt_box">
		             <p><img src="/admin/weixin/images/loading.gif" />正在禁用，请耐心等待...</p>
		           </div>
	               </div>
                <asp:Panel ID="Panel11" runat="server">
                    <div class="phone_left">
                        <div class="phone_left_bottom">
                            <div class="right_img">
                                <img src="/admin/weixin/images/key.png" />
                            </div>
                            <asp:Repeater ID="list" runat="server" OnItemDataBound="list2_ItemDataBound">
                                <HeaderTemplate>
                                    <ul class="phone_muen">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <li class="f_nav">
                                        <a href="KS.Menu.aspx?action=visible&menuID=<%#Eval("id") %>&parentID=<%#Eval("ParentID ") %>">
                                            <%#Eval("ClassName")%>
                                        </a>
                                        <ul class="s_nav">
                                            <asp:Repeater ID="list2" runat="server">
                                                <HeaderTemplate>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <li>
                                                        <a href="KS.Menu.aspx?action=visible&menuID=<%#Eval(" id ") %>&parentID=<%#Eval("ParentID ") %>">
                                                            <%#Eval("ClassName")%>
                                                        </a>
                                                    </li>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                </FooterTemplate>
                                            </asp:Repeater>
                                        </ul>
                                    </li>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <div class="clear">
                                    </div>
                                    </ul>
                                    <div class="norecord1" style="display:<%#bool.Parse((list.Items.Count==0).ToString())?" ":"none "%>">
                                        <span style="text-align:center">
                                        </span>
                                    </div>
                                </FooterTemplate>
                            </asp:Repeater>
                            <div class="clear">
                            </div>
                        </div>
                    </div>
                    <div style="padding-left:340px; margin-right:10px;">
                        <div class="ct-tips --large">
                            <div class="__left">
                                <img src="/admin/weixin/images/zhusi.png" style="vertical-align: middle;" />
                                <span>
                                    由于微信缓存，如同步微信菜单后无变化，请取消关注公众号后重新关注。
                                </span>
                                <br />
                                <span>
                                    <%=GetMenuStatus() %>
                                </span>
                            </div>
                            <div class="__right">
                                <%=GetMenuOrderButton() %>
                                    <asp:Button ID="Button3" runat="server" Text="同步菜单到微信" class="ct-btn blue"
                                    OnClientClick="return(TongBu())" />
                                    <asp:Button ID="Button5" runat="server" Text="禁用自定义菜单" class="ct-btn red"
                                    OnClientClick="return(JinYong())"
                                    />
                                    <%=GetyijiAnniu(Count) %>
                                        <div class="clear">
                                        </div>
                            </div>
                        </div>
                    </div>
                </asp:Panel>
                <asp:Panel ID="Panel2" runat="server">
                    <div class="phone_right">
                        <div class="title_phone">
                            <%=GetTitle(ParentID,MenuID)%>
                        </div>
                        <div class="cz_list">
                            <%=GetCaozuo(ParentID, MenuID)%>
                        </div>
                    </div>
                </asp:Panel>
                <asp:Panel ID="Panel3" runat="server">
                    <div class="phone_right">
                        <div class="title_phone">
                        </div>
                        <div class="cz_list">
                            你可以点击左侧菜单，然后设置菜单内容
                        </div>
                    </div>
                </asp:Panel>
                <asp:Panel ID="Panel4" runat="server">
                    <script>
                        function check() {
                            var action='<%=KSCMS.S("action")%>';

                            var menuid='<%=MenuID %>';
                            var parentid='<%=ParentID %>';
                            var classname=jQuery("#<%=this.TxtClassName.ClientID %>").val();
                            if (classname=='') {
                                TipsDoFun("请输入菜单名!", '$("#<%=this.TxtClassName.ClientID %>").focus();');
                                return false;
                            }

                            else {

                                var hanzi = JHshStrLen(classname);
                                if (menuid !='0') {

                                    if (parentid =='0') {

                                        if (action =='modify') {

                                            if (hanzi > 8) {
                                                //KesionJS.Alert("一级栏目菜单名称名字不多于4个汉字或8个字母！", "jQuery('#<%=this.TxtClassName.ClientID %>').focus()");
                                                //alert("sss");
                                                TipsDoFun("一级栏目菜单名称名字不多于4个汉字或8个字母!", '$("#<%=this.TxtClassName.ClientID %>").focus();');
                                                return false;
                                            }

                                        }

                                        else {
                                            if (hanzi > 16) {
                                                TipsDoFun("二级栏目菜单名称名字不多于8个汉字或16个字母!", '$("#<%=this.TxtClassName.ClientID %>").focus();');
                                                return false;
                                            }

                                        }

                                    } else if (parentid != '0') {

                                        if (hanzi > 16) {
                                            TipsDoFun("二级栏目菜单名称名字不多于8个汉字或16个字母!", '$("#<%=this.TxtClassName.ClientID %>").focus();');
                                            return false;
                                        }

                                    }

                            } else {

                                if (hanzi > 8) {
                                    //KesionJS.Alert("一级栏目菜单名称名字不多于4个汉字或8个字母！", "jQuery('#<%=this.TxtClassName.ClientID %>').focus()");
                                        //alert("sss");
                                        TipsDoFun("一级栏目菜单名称名字不多于4个汉字或8个字母!", '$("#<%=this.TxtClassName.ClientID %>").focus();');
                                        return false;
                                    }

                                }

                            }
                        }
                    </script>
                    <script>
                        function JHshStrLen(sString) {
                            var sStr, iCount, i, strTemp;

                            iCount = 0;
                            sStr = sString.split("");
                            for (i = 0; i < sStr.length; i++) {
                                strTemp = escape(sStr[i]);
                                if (strTemp.indexOf("%u", 0) == -1) // 表示是汉字  
                                {
                                    iCount = iCount + 1;
                                } else {
                                    iCount = iCount + 2;
                                }
                            }
                            return iCount;
                        }
                    </script>
                    <div class="phone_right">
                        <div class="title_phone">
                            <%=MenuID !=0 ? GetTitle(ParentID, MenuID) : ""%>
                        </div>
                        <div class="cz_list">
                            <%=GetAddTitle(MenuID,Count)%>
                                <ul class="catalog mtm">
                                    <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                        <tr>
                                            <td>
                                                <asp:TextBox ID="TxtClassName" runat="server" style="width:60%" Text="">
                                                </asp:TextBox>
                                                <span class="xmark">
                                                    *
                                                </span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Button ID="Button1" runat="server" Text="保  存" class="btn btn-blue subtn"
                                                onclick="Button1_Click" OnClientClick="return(check());" />
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                    </table>
                                </ul>
                        </div>
                    </div>
                </asp:Panel>
                <asp:Panel ID="Panel5" runat="server">

                    <script>
                        function check2() {

                            var url=jQuery("#<%=this.TxtUrl.ClientID%>").val();
                            if (url =='') {
                                TipsDoFun("请输入页面地址!", '$("#<%=this.TxtUrl.ClientID %>").focus();');
                                return false;
                            }

                        }
                    </script>
                    <div class="phone_right">
                        <div class="title_phone">
                            <%=GetTitle(ParentID,MenuID)%>
                        </div>
                        <div class="cz_list">
                            点击该菜单会跳到以下链接
                            <ul class="catalog mtm">
                                <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                    <tr>
                                        <td width="100">
                                            页面地址：
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TxtUrl" runat="server" style="width:300px" Text="">
                                            </asp:TextBox>
                                            <span class="xmark"> * </span>
                                            <%if (System.IO.Directory.Exists(Utils.GetMapPath("~/admin/agent/"))){ %>
                                            <div class="tips">提示：分销系统如果公众号菜单点击进去要到主站，请加上?from=home。如：http://wfx.kesion.com/3g/index.aspx?from=home</div>
                                            <%} %>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Button ID="Button2" runat="server" Text="保  存" class="btn btn-blue subtn"
                                            onclick="Button2_Click" OnClientClick="return(check2());" />
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                </table>
                            </ul>
                        </div>
                    </div>
                </asp:Panel>
        
                <asp:Panel ID="Panel9" runat="server">
                    <script>
                        function check9() {

                            var url = jQuery("#<%=this.TxtContent.ClientID %>").val();
                            if (url == '') {
                                TipsDoFun("请输入指定关键词!", '$("#<%=this.TxtContent.ClientID %>").focus();');
                                return false;
                            }

                        }
                    </script>
                          <script>
                              $(function () {
                                  aa(<%=sendtype%>);
             $(".menu1box ul li").click(function () {
                 var k = $(this).index();
                 aa(k);
             });
         });
         function aa(k) {

             $(".menu1box ul li").each(function (index, domEle) {
                 $(this).attr("class", "");
             });
             $(".menu1box ul li").each(function (index, domEle) {
                 if (k == index) {
                     $("#sendtype").val(k);
                     if (k == 0) {
                         $('#iframemain0').attr('src', 'KS.TuWenList.aspx?action=menu&menuID=<%=MenuID %>&parentID=<%=ParentID %>');


                     } else if (k == 1) {
                         $('#mybox2').show();
                         $('#mybox1').hide();
                      // $('#key').attr('href', 'KS.Menu.aspx?action=WenZi&menuID=<%=MenuID %>&parentID=<%=ParentID %>');
                     } else if (k == 2) {
                         $('#iframemain0').attr('src', 'KS.ShopList.aspx?action=menu&menuID=<%=MenuID %>&parentID=<%=ParentID %>');

                     }
                     else if (k == 3) {
                         $('#iframemain0').attr('src', 'KS.SuCaiList.aspx?action=menu&menuID=<%=MenuID %>&parentID=<%=ParentID %>');

                     }
                     $(this).attr("class", "hit");
                 }
             });

         }


      </script>
                     <input type="hidden" id="sendtype" name="sendtype" value="<%=sendtype %>" />

                    <div class="phone_right">
                        <div class="title_phone">
                            <%=GetTitle(ParentID,MenuID)%>
                        </div>
                        <div class="cz_list">
                            <div class="tabs1">
                                <div class="menu1box">
                                    <ul class="menu1">
                                       <li  class="hit">
                                          
                                           
                                            <a href="KS.TuWenList.aspx?action=menu&menuID=<%=MenuID %>&parentID=<%=ParentID %>" onclick="$('#mybox1').show();$('#mybox2').hide();" target="iframemain0">
                                          <i class="sm_tab tw2"></i>      图文
                                            </a>
                                        </li>
                                        <li >
                                            
                                           
                                            <a href="javascript:;" onclick="$('#mybox2').show();$('#mybox1').hide();"  id="key"  >
                                             <i class="sm_tab wz"></i>    关键词回复
                                            </a>
                                        </li>
                                         <%if (Utils.GetSysInfo("//sysinfo/model/mall").ToString().ToLower() == "true"){ %>
                                        <li>
                                           
                                           
                                            <a href="KS.ShopList.aspx?action=menu&menuID=<%=MenuID %>&parentID=<%=ParentID %>" onclick="$('#mybox1').show();$('#mybox2').hide();" target="iframemain0">
                                           <i class="sm_tab sp"></i>      商品
                                            </a>
                                        </li>
                                        <%} %>
                                        <li  >
                                          
                                  
                                            <a href="KS.SuCaiList.aspx?action=menu&menuID=<%=MenuID %>&parentID=<%=ParentID %>" onclick="$('#mybox1').show();$('#mybox2').hide();" target="iframemain0">
                                                 <i class="sm_tab tw2"></i>      素材    </a>
                                        </li>
                                        <div class="clear">
                                        </div>
                                    </ul>
                                </div>
                               
                                <div class="main1box">
                                    <div class="main">
                                        <dt class="mbimg" style="display:block;">
                                            <div id="main">
                                                <div class="comment">
                                                    
                                                    <div class="com_form msgBox" id="mybox1">
                                                      

                                                       <iframe class="editArea-ifrm" frameborder="no" border="0" src="KS.TuWenList.aspx?action=menu&menuID=<%=MenuID %>&parentID=<%=ParentID %>" style="width:100%" name="iframemain0" id="iframemain0"> </iframe>
                                                        </div>
                                                    <div class="com_form msgBox" id="mybox2" style="display:none">
                                                        指定关键词：
                                                        <asp:TextBox ID="TxtContent"  style="width:60%;padding: 8px;border: 1px solid #ddd;" runat="server" >
                                                        </asp:TextBox>
                                                        
                                                             <p>
                                                                    <asp:Button ID="Button4" runat="server" Text="保存" class="sub_btn" onclick="Button4_Click"  OnClientClick="return(check9());" />
                                                            </p>
                                                    </div>

                                                </div>
                                            </div>
                                        </dt>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </asp:Panel>

                <asp:Panel ID="Panel7" runat="server">
                    <div class="phone_right">
                        <div class="title_phone">
                            <%=GetTitle(ParentID,MenuID)%>
                        </div>
                        <div class="action_content sended jsMain" style="display: block;">
                            <p class="action_tips">
                                订阅者点击该子菜单会收到以下消息
                            </p>
                            <div class="msg_wrp">
                                <div class="appmsg ">
                                    <div class="appmsg_content">
									    <div class="appmsg_thumb_wrp" >
                                            <img src="<%=ShopDr["DefaultPic"].ToString()%>" alt="" class="appmsg_thumb">
                                        </div>
										<div class="article_info">
                                        <h4 class="appmsg_title js_title">
                                            <a href="javascript:(0)">
                                                <%=ShopDr["title"].ToString()%>
                                            </a>
                                        </h4>
                                        <div class="appmsg_info">
                                            <em class="appmsg_date">
                                                <%=ShopDr["adddate"].ToString()%>
                                            </em>
                                        </div>
                                       
                                        <p class="appmsg_desc">
                                            <%=ShopDr["Price_Member"].ToString()%>
                                        </p>
										</div>
										
											<a href="KS.Menu.aspx?action=Shop&menuID=<%=MenuID %>&parentID=<%=ParentID %>"
											class="huifu_deletebutton" id="A1" style="display: inline-block;" >
												<img src="/admin/weixin/images/updata.png">
											</a>
										
										<div class="clear"></div>
                                    </div>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                </asp:Panel>
                <asp:Panel ID="Panel8" runat="server">
                    <div class="phone_right">
                        <div class="title_phone">
                            <%=GetTitle(ParentID,MenuID)%>
                        </div>
                        <div class="action_content sended jsMain" style="display: block;">
                            <p class="action_tips">
                                订阅者点击该子菜单会收到以下消息
                            </p>
                            <div class="msg_wrp">
                                <div class="appmsg ">
                                    <div class="appmsg_content">
									    <div class="appmsg_thumb_wrp">
                                          <img src="<%=Convert.ToString(TuDr["DefaultPic"].ToString())==""?"/SysImg/nopic.gif":TuDr["DefaultPic"].ToString()%>" alt="" class="appmsg_thumb">
                                        </div>
										<div class="article_info">
											<h4 class="appmsg_title js_title">
												<a href="javascript:(0)">
													<%=TuDr["title"].ToString()%>
												</a>
											</h4>
											<div class="appmsg_info">
												<em class="appmsg_date">
													<%=TuDr["adddate"].ToString()%>
												</em>
											</div>
											
											<p class="appmsg_inforin">
												<%=TuDr["intro"].ToString()%>
											</p>
										</div>
										
										
											<a href="KS.Menu.aspx?action=TuWen&menuID=<%=MenuID %>&parentID=<%=ParentID %>"
											class="huifu_deletebutton" id="changeBt" style="display: inline-block;">
												<img src="/admin/weixin/images/updata.png">
											</a>
										
										<div style="clear:both;"></div>
										
                                    </div>
                                </div>
								
                            </div>
                            
                        </div>
                    </div>
                </asp:Panel>
                    <asp:Panel ID="Panel13" runat="server">
                    <div class="phone_right">
                        <div class="title_phone">
                            <%=GetTitle(ParentID,MenuID)%>
                        </div>
                        <div class="action_content sended jsMain" style="display: block;">
                            <p class="action_tips">
                                订阅者点击该子菜单会收到以下消息
                            </p>
                            <div class="msg_wrp">
                                <div class="appmsg ">
                                    <div class="appmsg_content">
									    <div class="appmsg_thumb_wrp">
                                          <img src="<%=Convert.ToString(suCaiDr["PicUrl"].ToString())==""?"/SysImg/nopic.gif":suCaiDr["PicUrl"].ToString()%>" alt="" class="appmsg_thumb">
                                        </div>
										<div class="article_info">
											<h4 class="appmsg_title js_title">
												<a href="javascript:(0)">
													<%=suCaiDr["Title"].ToString()%>
												</a>
											</h4>
											<div class="appmsg_info">
												<em class="appmsg_date">
													<%=suCaiDr["AddTime"].ToString()%>
												</em>
											</div>
											
											<p class="appmsg_inforin">
												<%=Convert.ToString(suCaiDr["Info"].ToString())==""?Utils.CutStr(suCaiDr["content"].ToString(),10):suCaiDr["Info"].ToString()%>
											</p>
										</div>
										
										
											<a href="KS.Menu.aspx?action=SuCai&menuID=<%=MenuID %>&parentID=<%=ParentID %>"
											class="huifu_deletebutton" id="A2" style="display: inline-block;">
												<img src="/admin/weixin/images/updata.png">
											</a>
										
										<div style="clear:both;"></div>
										
                                    </div>
                                </div>
								
                            </div>
                            
                        </div>
                    </div>
                </asp:Panel>
                <asp:Panel ID="Panel12" runat="server">
                    <script>
                        function check12() {

                            var classid =jQuery("#<%=this.DrClassID.ClientID %>").val();
                            if (classid =='0') {
                                TipsDoFun("请选择栏目!",'$("#<%=this.DrClassID.ClientID %>").focus();');
                                return false;
                            }

                        }
                    </script>
                    <div class="phone_right">
                        <div class="title_phone">
                            <%=GetTitle(ParentID,MenuID)%>
                        </div>
                        <div class="cz_list">
                            点击该菜单会跳到以下链接
                            <ul class="catalog mtm">
                                <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                    <tr>
                                        <td width="100">
                                            指定栏目：
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="DrClassID" runat="server">
                                                <asp:ListItem Value="0" Selected="True">
                                                    选择栏目
                                                </asp:ListItem>
                                            </asp:DropDownList>
                                            <span class="xmark">
                                                *
                                            </span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Button ID="Button6" runat="server" Text="保  存" class="btn btn-blue subtn"
                                            onclick="Button6_Click" OnClientClick="return(check12());" />
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                </table>
                            </ul>
                        </div>
                    </div>
                </asp:Panel>
	</div>                
</asp:Content>