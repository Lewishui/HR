<%@ Page Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin.Index" Codebehind="Index.aspx.cs" %>
<%@ Import Namespace="System.Xml" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.BLL" %>
<%@ Import Namespace="Kesion.Cache" %><!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/> 
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<title></title>
<link href="../admin/images/style.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="../KS_inc/Jquery.js"></script>
<script type="text/javascript" src="../ks_inc/kesion.common.js"></script>
<script src="../admin/include/main.js"></script>
<link rel="stylesheet" href="../ks_inc/prettyPhoto/prettyPhoto.css" type="text/css" media="screen"/>
<script src="../ks_inc/prettyPhoto/jquery.prettyPhoto.js" type="text/javascript"></script>
<script>
    var showtips = '<%=Convert.ToString(MyCache.GetCacheConfig(56).IndexOf('3') >= 0).ToLower()%>';
</script>
<!--[if IE 6]>
  <script src="../admin/include/iepng.js" type="text/javascript"></script>
  <script type="text/javascript">
    try{
     EvPNG.fix('div, ul, img, li, input, em, a, p,i,b,span,em,' ); 
    }catch(e){
    }
  </script>
  <![endif]-->

</head>

<body class="prebody s<%=getNavConfig()%>" style="overflow:hidden" scroll="no">

<form id="form1" runat="server">
  <div class="mainHeader">
    	<div class="logo"><img src='../admin/images/kesioni<%=Utils.GetSysInfo("//sysinfo/showver") %>.png' /> <span class="version">V<%=Utils.GetSysInfo("//sysinfo/version")%></span></div>
        <div id='ajaxmsg' style='display:none;text-align:center;height:25px;line-height:25px;background-color: #fff;border: 1px #f1f1f1 solid;position:absolute; z-index:1; left: 300px; top: 5px;'> 请稍候,正在执行您的请求...  </div>
    	<div class="navBar">
        	<ul>
                <%
                    XmlDocument doc = new XmlDocument();
                    doc.Load(Server.MapPath("~/config/managemenu.xml"));
                    XmlNode nodes = doc.SelectSingleNode("managemenu");
                    int topnum = 0;
                    if (getNavConfig(1) != "2") {
                        foreach (XmlNode node in nodes.ChildNodes)
                        {
                            if (KSSecurity.CheckMenuPower(node.SelectSingleNode("@role").InnerText)) //检查权限
                            {
                                bool isShow = true;
                                if (node.SelectSingleNode("@type") != null)
                                {
                                    if ((node.SelectSingleNode("@role").InnerText == "order" ||node.SelectSingleNode("@type").InnerText == "shop") && Utils.GetSysInfo("//sysinfo/model/mall").ToString().ToLower() != "true")
                                    {
                                        isShow = false;
                                    }
                                    else if (node.SelectSingleNode("@type").InnerText == "exam" && Utils.GetSysInfo("//sysinfo/model/exam").ToString().ToLower() != "true")
                                    {
                                        isShow = false;
                                    }
                                    else if (node.SelectSingleNode("@type").InnerText == "ods" && Utils.GetSysInfo("//sysinfo/model/ods").ToString().ToLower() != "true")
                                    {
                                        isShow = false;
                                    }
                                }
                                if (isShow)
                                {
                                    Response.Write(string.Format(@"<li{1}>{0}</li>", node.SelectSingleNode("@name").InnerText, topnum == 0 ? @" class=""on""" : string.Empty));
                                    topnum++;
                                }
                            }
                        }
                    }
                %>
                
			 
            </ul>            
        </div>
		<%if (topnum<8) { %>
                  <%if (MyCache.GetCacheConfig(56).IndexOf('2') >= 0 && (Internet.CheckIsConneted("www.kesion.com")))
                      {%>
                 <iframe class="ro" scrolling=no src="http://www.kesion.com/websystem/GetofficialInfo.asp" name="ShowAnnounce" id="ShowAnnounce" height="20" width="400" marginheight="0" marginwidth="0" frameborder="0" align="middle" allowtransparency="true"></iframe>
                 <%} else { %>
                  <div class="new_date fr">今天是：<script src="../ks_inc/time/2.js"></script></div>
                  <%} %>
               <%} %>

         <div class="r-button">
            <ul>
               <li><a class="icon home-icon" href="../<%=MyCache.GetCacheConfig(4) %>/index.aspx" title="后台首页" ></a></li>
               <li><a class="icon pc-icon" href="../index.aspx" title="网站首页（PC版）" target="_blank"></a></li>
               <li><a class="icon phone-icon" href="../<%=MyCache.GetCacheConfig(73) %>/" title="手机版" target="_blank"><i></i></a></li>
               
              <%if (KSSecurity.CheckPower("label", "l005")) { %>
              <li><a class="icon refresh-icon" href="System/KS.CleanCache.aspx" title="更新缓存" target="main"><i></i></a></li>
              <%} %>
              <li class="userinfo">
                 <span><%=KSCMS.GetCookie("Admin", "AdminUser") %></span>
              	<div class="operating">
                	<div class="arrow"></div>
                    <div class="name"><%=KSCMS.GetCookie("Admin", "AdminUser") %><font class="mainColor"><%=adminsf %></font></div>
                    <div class="info"><%=(!string.IsNullOrEmpty(roleStr) && UserType==0)?"<em>角色："+roleStr+"</em>":string.Empty%><em>登录时间：<%=LastLoginTime %></em></div>
                    <div class="btn">
                        <a href="javascript:void(0)" onClick="openWin('修改管理员密码','User/KS.AdminPassEdit.aspx',false,680,350)" title="修改密码"><i class="myicon icon-password"></i>修改密码</a>
                        <a href="javascript:Exit();" title="退出"><i class="myicon icon-out"></i>安全退出</a>
                    </div>    
                </div>
              </li>
              <script>
			  	$(function(){
					$("li.userinfo").hover(function(){
						$(this).find(".operating").show();
					},function(){
						$(this).find(".operating").hide();
					});
					$("#navbox-trigger").click(function(){
						$("#wrapbg").fadeIn(300);
						$(".navbox").animate({right:"0px"},300);
					});
					$("#wrapbg,.close,.shut").click(function(){
					    closeTool();
					});
					
					//侧栏是否打开
					var has = $(".leftmain div").hasClass("topnav");
					if(has==false){
						$(".main").addClass("noTopnav");
					};
					
					
					auto();
					$(window).resize(function(){
						auto();
					});
			  	});
				
				$("#ShowAnnounce").load(function(){
					$(this).contents().find("body").attr("style","font-family:'HelveticaLT55Roman',arial,'microsoft yahei ui','microsoft yahei',simsun,sans-serif;");
				});
				
				
			  	function closeTool(){
			  	    $("#wrapbg").fadeOut(300);
			  	    $(".navbox").animate({right:"-320px"},300);
			  	};
				function auto(){
					if($(window).width()<1500){
						$("#ShowAnnounce").hide();
					}
					else{
						$("#ShowAnnounce").show();
					};
				};
				
				//导航适屏
				navauto();
				
				$(window).resize(function(){
					navauto();
				});
				function navauto(){
					var w = $(window).width();
					var num = $(".navBar li").length;
					if(num>8&&w<1360){
						$(".navBar").addClass("navAuto")
					};
				
				};
				
				
			  </script>
              <li class="t6"><a href="http://bbs.kesion.com/" title="论坛" target="_blank">论坛</a></li>
              <li id="top-bar" class="top-bar t8">
                    <div class="bar">
                      <a id="navbox-trigger">关于</a>
                    </div>
                    <div class="navbox">
                    	<div class="close"></div>
                          <div class="changecolor">
                              <div id="demo">
                                  <div class="name">皮肤设置</div>
                                  <div class="pane"> 
                                      <div class="icons">
                                          <a onClick="switchbox(1);" href="javascript:void(0);"><em class="c1"></em></a> 
                                          <a onClick="switchbox(2);" href="javascript:void(0);"><em class="c2"></em></a> 
                                          <a onClick="switchbox(3);" href="javascript:void(0);"><em class="c3"></em></a> 
                                          <a onClick="switchbox(4);" href="javascript:void(0);"><em class="c4"></em></a> 
                                          <a onClick="switchbox(5);" href="javascript:void(0);"><em class="c5"></em></a> 
                                          <a onClick="switchbox(6);" href="javascript:void(0);"><em class="c6"></em></a> 
                                      </div> 
                                      <div class="clear"></div>
                                  </div> 
                              	  <div class="name">菜单设置</div>
                              	  <div class="menuSetup">
                                      <label><input name="menuSet" type="radio" value="0"<%=getNavConfig(1)=="0"?" checked":string.Empty %>>全部显示</label>
                                      <label><input name="menuSet" type="radio" value="1"<%=getNavConfig(1)=="1"?" checked":string.Empty %>>只显示头部</label>
                                      <label><input name="menuSet" type="radio" value="2"<%=getNavConfig(1)=="2"?" checked":string.Empty %>>只显示左侧</label>
                              	   </div>
                              </div>
                              <div class="colorbutton">
                                  <a href="javascript:saveNavColor();">保存</a>
                                  <a class="shut" href="javascript:;">关闭</a>
                                  <div class="clear"></div>
                              </div>
                        </div>
    					<div class="clear"></div>
                        <div class="navbox-tiles">
                          <div class="name">版权信息</div>
                          <div style="text-align:left;">
                               <asp:PlaceHolder ID="PlaceHolder1"  runat="server"></asp:PlaceHolder>
                           </div>
                        </div>
                    </div>
                </li>
            </ul>
            <div id="wrapbg"></div>
         </div>
		<script>
            var colorID = <%=getNavConfig(0)%>;
            function switchbox(a) {
             colorID = a;
             $("body").removeClass("s1").removeClass("s2").removeClass("s3").removeClass("s4").removeClass("s5").removeClass("s6");
             $("body").addClass("s" + a);
             $(".icons").find("a").eq(colorID-1).addClass("curr");
           }
            function saveNavColor() {
                var menuSet=$("input[name='menuSet']:checked").val();
                jQuery.ajax({
                    type: "POST",
                    url: "index.aspx",
                    data: "action=saveNavColor&menuSet="+menuSet+"&colorid=" + colorID,
                    success: function (data) {
                        KesionJS.Alert('恭喜，保存成功！','location.reload()');
                        
                    }
                });
        
            }
        
        (function () {
            $(document).ready(function () {
                switchbox(colorID);  //默认颜色
         
            });
        }.call(this));
        
        
        
        
        </script>
        
    </div>  
  	<!---mainHeader end-->





   <div class="main clearfix">
    <a href="javascript:;" onClick="closeLeft()" class="left_frame_open" id="closeBtn"></a>
    
    <div class="leftmain">
       	<%
 int i = 0;
            if (getNavConfig(1) != "1")
            { %>	
           <div class="topnav">
             <ul>
               <%
                                         #region 左部导航

                                        
                                         foreach (XmlNode node in nodes.ChildNodes)
                                         {
                                             if (KSSecurity.CheckMenuPower(node.SelectSingleNode("@role").InnerText)) //检查权限
                                             {
                                                 bool isShow = true;
                                                 if (node.SelectSingleNode("@type") != null)
                                                 {
                                                     if ((node.SelectSingleNode("@role").InnerText == "order" ||node.SelectSingleNode("@type").InnerText == "shop") && Utils.GetSysInfo("//sysinfo/model/mall").ToString().ToLower() != "true")
                                                     {
                                                         isShow = false;
                                                     }
                                                     else if (node.SelectSingleNode("@type").InnerText == "exam" && Utils.GetSysInfo("//sysinfo/model/exam").ToString().ToLower() != "true")
                                                     {
                                                         isShow = false;
                                                     }
                                                     else if (node.SelectSingleNode("@type").InnerText == "ods" && Utils.GetSysInfo("//sysinfo/model/ods").ToString().ToLower() != "true")
                                                     {
                                                         isShow = false;
                                                     }
                                                 }
                                                 if (isShow)
                                                 {
                                                     Response.Write(string.Format(@"<li{2}><span class=""{1}""></span><em class=""textbg"">{0}</em></li>", node.SelectSingleNode("@name").InnerText, node.SelectSingleNode("@icoclass").InnerText, i == 0 ? @" class=""curr""" : string.Empty)); i++;
                                                 }
                                             }
                                         }
                                         #endregion
               %>
            </ul>
       </div>
        <%} %>
	
       <div class="rightnav">
       <%
                    i = 0;
                    foreach (XmlNode node in nodes.ChildNodes)
                    {

                        if (KSSecurity.CheckMenuPower(node.SelectSingleNode("@role").InnerText)) //检查权限
                        {
                            bool isShow = true;
                            if (node.SelectSingleNode("@type") != null)
                            {

                                if ((node.SelectSingleNode("@role").InnerText == "order" ||node.SelectSingleNode("@type").InnerText == "shop") && Utils.GetSysInfo("//sysinfo/model/mall").ToString().ToLower() != "true")
                                {
                                    isShow = false;
                                }
                                else if (node.SelectSingleNode("@type").InnerText == "exam" && Utils.GetSysInfo("//sysinfo/model/exam").ToString().ToLower() != "true")
                                {
                                    isShow = false;
                                }else if (node.SelectSingleNode("@type").InnerText == "ods" && Utils.GetSysInfo("//sysinfo/model/ods").ToString().ToLower() != "true")
                                {
                                    isShow = false;
                                }

                            }
                            if (isShow)
                            {
        %>
                <div class="content" id="left<%=i %>"<%=(i>0)?@" style=""display:none""":string.Empty %>>
		        <ul class="menu-one">

                    <%
                        int num = 0;

                        #region 内容及网店选项
                        if (node.SelectSingleNode("@type") != null)
                        {
                            if (node.SelectSingleNode("@type").InnerText == "content")
                            {
                                #region 文章，图片，下载模型
                                %><li<%=(num == 0) ? @"  class=""firstChild""" : string.Empty %>>
                                  <div class="header">
					                   <span class="txt"><i class="iconfont font1">&#xe633;</i>内容管理</span>
					                    <span class="arrow"></span>
				                   </div>
				          <ul class="menu-two"<%=(num == 0) ? @"  style=""display:block""" : string.Empty %>>

                    <%
					using (DataTable dt = MyCache.GetCacheModelTable())
					{
						if (dt.Rows.Count > 0)
						{
							foreach (DataRow dr in dt.Rows)
							{
								if (KSSecurity.CheckMenuPower(dr["modelfolder"].ToString().ToLower())) //检查权限
									{
										if (dr["basictype"].ToString() != "4")
										  {
																   %>
																		 <li><a href="Content/KS.ContentManage.aspx?channelid=<%=dr["channelid"].ToString() %>" target="main"><%=dr["ModelName"].ToString() %></a>
																			   <%if (KSSecurity.CheckPower("content", dr["modelfolder"].ToString().ToLower(), 0))
																				{ %>
																				<a href="Content/KS.Content.Aspx?Action=Add&Channelid=<%=dr["channelid"].ToString() %>" target="main" class="additem"></a>
																			   <%} %>
																				<%if (KSSecurity.CheckPower("content", dr["modelfolder"].ToString().ToLower(), 3)) { %>
																			  <a href="Content/KS.ContentManage.aspx?showType=1&channelid=<%=dr["channelid"].ToString() %>" target="main"  class="verifyitem"></a>
																				<%} %>
																		  </li>
																 <% 
												
											}
									}
								}
																			 
							}
						}
						%>
                   </ul>
                 </li>
         <%num++;
        #endregion
    }
      }
                        #endregion

                        foreach (XmlNode leftnode in node.SelectNodes("leftitem"))
                        {
                            bool isEnable = true;
                            if (leftnode.SelectSingleNode("@enable") != null)
                                {
                                    isEnable = leftnode.SelectSingleNode("@enable").InnerText.ToLower().Equals("true");
                                }
                           

                            if (isEnable && KSSecurity.CheckMenuPower(leftnode.SelectSingleNode("@role").InnerText)) //检查权限
                            {
                            %>
                                <li<%=(num==0)?@"  class=""firstChild""":string.Empty %>>
				                    <div class="header">
					                    <span class="txt"><i class="font1 iconfont"><%=leftnode.SelectSingleNode("@icoclass").InnerText %></i><%=leftnode.SelectSingleNode("@name").InnerText %></span>
					                    <span class="arrow"></span>
				                    </div>
				                    <ul class="menu-two"<%=(num==0)?@"  style=""display:block""":string.Empty %>>


                                        <%
                                            if (node.SelectSingleNode("@type") != null) {
                                                if (num == 0 && node.SelectSingleNode("@type").InnerText == "shop")
                                                {
                                                    #region 商城模型
                                                    using (DataTable dt = MyCache.GetCacheModelTable())
                                                    {
                                                        if (dt.Rows.Count > 0)
                                                        {

                                                            foreach (DataRow dr in dt.Rows)
                                                            {

                                                                if (KSSecurity.CheckMenuPower(dr["modelfolder"].ToString().ToLower())) //检查权限
                                                                {
                                                                    if (Utils.StrToInt(dr["basictype"].ToString()) == 4)
                                                                    {
                                                                                     %>
                                                                                    <li><a href="Shop/KS.ShopManage.aspx?channelid=<%=dr["channelid"].ToString() %>" target="main"><%=dr["ModelName"].ToString() %></a>
                                                                                          <%if (KSSecurity.CheckPower("shop", dr["modelfolder"].ToString().ToLower(), 0))
    { %>
					                                                                              <a href="Shop/KS.Shop.Aspx?Action=Add&Channelid=<%=dr["channelid"].ToString() %>" target="main" class="additem" title="添加商品"></a>
                                                                                           <%} %>
                                                                                           <%if (KSSecurity.CheckPower("shop", dr["modelfolder"].ToString().ToLower(), 0))
    { %>
					                                                                             <!--  <a href="Shop/KS.ShopManage.aspx?showType=1&channelid=<%=dr["channelid"].ToString() %>" target="main" class="verifyitem" title="审核商品"></a>-->
                                                                                             <%} %>
				                                                                    </li>            

                                                                                     <% 

                                                                                                                 }
                                                                                                             }
                                                                                                         }
                                                                                                     }

                                                                                                 }
                                                                                             }
                                                                                         }
                                                                                         #endregion

                                                                                         foreach (XmlNode item in leftnode.SelectNodes("itemlist/item"))
                                                                                         {
                                                                                             string power = KSSecurity.RemovePowerBadChar(item.SelectSingleNode("url").InnerText);
                                                                                             bool isItemEnable = true;
                                                                                             if (item.SelectSingleNode("@enable") != null)
                                                                                             {
                                                                                                 isItemEnable = item.SelectSingleNode("@enable").InnerText.ToLower().Equals("true");
                                                                                             }
                                                                                             if (isItemEnable && KSSecurity.CheckMenuPower(power)) //检查权限
                                                                                             {
                                                                                                 string showAddBtnUrl = "Shop/KS.ShopGroupBuy.aspx,Shop/KS.ShopFightGroup.aspx,Shop/KS.ShopGroupOne.aspx";
                                                                                                 if (Utils.InArray(item.SelectSingleNode("url").InnerText.ToLower(), showAddBtnUrl.ToLower(), ","))
                                                                                                 {
                                                                                                     Response.Write(string.Format(@"<li><a href=""{1}"" target=""main"">{0}</a> <a href=""{1}?Action=add"" target=""main"" class=""additem"" title=""添加{0}""></a></li>", item.SelectSingleNode("name").InnerText, item.SelectSingleNode("url").InnerText));

                                                                                                 }
                                                                                                 else
                                                                                                 {
                                                                                                     Response.Write(string.Format(@"<li><a href=""{1}"" target=""main"">{0}</a></li>", item.SelectSingleNode("name").InnerText, item.SelectSingleNode("url").InnerText));
                                                                                                 }
                                                                                             }
                                                                                         }
                                        %>
				                    </ul>
			                    </li>
                              <%
                               num++;
                            }
                        }
                     %>

			
		

			
		        </ul>
	        </div>


                <%
                        i++;
                    }     
           }
        }
        %>
        </div>
	</div>

	<div class="rightmain">
    <%
        string mainUrl = string.Empty;
        if (Session["MainUrl"] != null) mainUrl = Session["MainUrl"].ToString();
        if (string.IsNullOrEmpty(mainUrl))
        {
            mainUrl = nodes.SelectSingleNode("@mainurl").InnerText;
        }
        Session["MainUrl"] = string.Empty;
    %>
    <iframe src="<%=mainUrl %>" id="main" name="main" frameborder="0" scrolling="auto" style="width:100%;height:691px"> </iframe>
       <%if (Session["MainClickClass"] != null)
         { %>
        <script>
            $(window).load(function () {
                $(".topnav").find("<%=Session["MainClickClass"].ToString()%>").parent().click();
            });
        </script>
    <%Session["MainClickClass"] = string.Empty;
        } %>
   </div>	
 </div>

<div class="clear"></div>
     <!--<div class="footer">
	   <div class="copyright"> 
		 福建·厦门科汛软件有限公司　 版权所有&copy; 2006-2016 统一社会信用代码:91350206MA2XN2XQ4A  闽ICP备06009871号
	   </div>
    </div>
     -->


    </form>

    
<script src="../admin/images/jquery.nicescroll.js"></script>
<script>
	$(".rightnav").niceScroll({  
	cursorcolor:"#d0d7d9",  
	cursoropacitymax:1,  
	touchbehavior:false,  
	cursorwidth:"3px",  
	cursorborder:"0",  
	cursorborderradius:"5px"  
	}); 
	
	$(".topnav").niceScroll({  
	cursorcolor:"#d0d7d9",  
	cursoropacitymax:1,  
	touchbehavior:false,  
	cursorwidth:"3px",  
	cursorborder:"0",  
	cursorborderradius:"5px"  
	}); 
	
</script>

</body>
</html>
