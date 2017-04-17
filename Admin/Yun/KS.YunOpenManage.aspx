<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin.Yun.KS_YunOpenManage" Codebehind="KS.YunOpenManage.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.BLL" %>
<%@ Import Namespace="System.Data" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" runat="server">
    <script>
        function YunDownLoad(templateId, page) {
            parent.openWin("下载云端网站风格", "<%=KSCMS.GetInstallDir()+MyCache.GetCacheConfig(4)%>/Label/KS.TemplateSkin.aspx?action=yundown&showType=-1&page=" + page + "&templateId=" + templateId, true, 820, 370);
         }
    </script>
   <!--<KS:TopNav ID="TopNav1" runat="server" Text="KESION云管理" />-->
   <div class="clear blank20"></div>
   <div class="content-area"> 
   		<div class="myTitle">我的云状态</div>
<asp:Panel ID="ListPanel" runat="server" Width="100%">

        <table width="100%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable">
            <tr>
                <td align="right" class="lefttd" height="30">KESION云状态：<%=StatusStr %></td>
                <td class="righttd" colspan="2"></td>
            </tr>
            
             <tr>
             	<td colspan="2">
                    <div class="clear blank20"></div>
                    <a href="<%=Yun.GetServerUrl %>reg.aspx?appid=<%=AppID%>&domain=<%=Domain %>"  target="_blank" class="mainButton button">申请成为开发者</a>
                    &nbsp; 如果您不想成为开发者，请点击 &nbsp; <asp:Button ID="Button6" runat="server" Text="从科汛云同步到本地订单" class="button" OnClientClick="return listlook()"/>
                    <div style="padding:20px;border:1px solid #E9EDED;margin-top:20px;display:none; padding-left:150px;" id="akdk">
                    <table  border="0" width="500" cellpadding="0" cellspacing="0">
                          <script>
                              function listlook() {
                                  $("#akdk").toggle();
                                  return false;
                              }
        
                          var OutTimes1 = '60';
        
        
                          function leavePage3() {
                              if (OutTimes1== 0) {
                                  $("#SendMobileBtn3").attr("disabled", false);
                                  $("#SendMobileBtn3").val("免费获取手机验证码")
                              }
                              else {
                                  OutTimes1 -= 1;
                                  $("#SendMobileBtn3").val("已发，如果" + OutTimes1 + "秒后没有收到，可以重发!")
                                  setTimeout("leavePage3()", 1000);
                              }
                          }
                          function checkForm() {
                              var username = $("#<%=this.TxtUserName.ClientID %>").val();
                              var password = $("#<%=this.TxtPSW.ClientID %>").val();
                              var mobiel = $("#<%=this.TextBox1.ClientID %>").val();
                              if (username == '') {
                                   KesionJS.Alert("请输入在KesionYun那边注册的电子邮箱！", "jQuery('#<%=this.TxtUserName.ClientID %>').focus()");
                                  return false;
                              }
                              if (password == '') {
                                  KesionJS.Alert("请输入在KesionYun那边登录密码！", "jQuery('#<%=this.TxtPSW.ClientID %>').focus()");
                                  return false;
                              }
                              if (mobiel == '') {
                                  KesionJS.Alert("请输入在KesionYun那边注册的手机号码！", "jQuery('#<%=this.TextBox1.ClientID %>').focus()");
                                  return false;
                              }
                              return true;
                          }
                          function getMobileCode3() {
                              var username = $("#<%=this.TxtUserName.ClientID %>").val();
                              var password = $("#<%=this.TxtPSW.ClientID %>").val();
                              var mobiel = $("#<%=this.TextBox1.ClientID %>").val();
                              if (username == '') {
                                   KesionJS.Alert("请输入在KesionYun那边注册的电子邮箱！", "jQuery('#<%=this.TxtUserName.ClientID %>').focus()");
                                  return false;
                              }
                              if (password == '') {
                                  KesionJS.Alert("请输入在KesionYun那边登录密码！", "jQuery('#<%=this.TxtPSW.ClientID %>').focus()");
                                  return false;
                              }
                              if (mobiel == '') {
                                  KesionJS.Alert("请输入在KesionYun那边注册的手机号码！", "jQuery('#<%=this.TextBox1.ClientID %>').focus()");
                                  return false;
                              }
                              $("#SendMobileBtn3").attr("disabled", true);
        
                               
                              $.ajax({
                                  url: "KS.YunOpenManage.aspx?action=sendmobilecode3&username="+username+"&password="+password+"&mobile=" + mobiel + "&rnd=" + Math.random(),
                                  context: document.body,
                                  type: "get",
                                  success: function (data) {
                                      if (data.indexOf('true') != -1) {
                                          leavePage3();
                                      } else {
                                          //alert(data);
                                          $.dialog.alert(data, function () { $("#SendMobileBtn3").attr("disabled", false); });
                                      }
        
                                  }
                              });
        
        
                              return false;
        
                          }
        
        
                      </script>
                      <tr>
                     	 <td class="lefttd" style="padding-bottom:15px;">电子邮箱：</td>
                         <td style="padding-bottom:15px;"><asp:TextBox ID="TxtUserName" runat="server" CssClass="textbox"  /></td>
                      </tr>   
                     <tr>
                     	 <td style="padding-bottom:15px;" class="lefttd">密码：</td>
                         <td style="padding-bottom:15px;"><asp:TextBox ID="TxtPSW" runat="server" CssClass="textbox"  /></td>
                      </tr>   
                      <tr>
                      		<td style="padding-bottom:15px;" class="lefttd">手机号码：</td>
                            <td style="padding-bottom:15px;"><asp:TextBox ID="TextBox1" runat="server" CssClass="textbox" MaxLength="11" /></td>
                      </tr>
                     <tr>
                     	 	<td style="padding-bottom:15px;" class="lefttd">验 证 码：</td>
                            <td style="padding-bottom:15px;"><asp:TextBox ID="TextBox2" runat="server" CssClass="textbox" Width="120" MaxLength="6" /><input type="button" id="SendMobileBtn3" class="button" onclick="getMobileCode3()" value="免费获取手机验证码" /></td>
                      </tr>
                      <tr>      
                          <td class="lefttd"></td>
                          <td>
                          <asp:Button ID="Button7" runat="server" Text="确定同步到本地" class="mainButton button" OnClientClick="return(checkForm())" OnClick="Button7_Click" /> 
                          </td>
                      </tr>           
                 </table>
                </div>
                
            	</td>
            </tr>
        </table>
 </asp:Panel>
<asp:Panel ID="YiPanel1" runat="server" Width="100%">
     <script>

         var OutTimes = '60';


         function leavePage() {
             if (OutTimes == 0) {
                 $("#SendMobileBtn").attr("disabled", false);
                 $("#SendMobileBtn").val("免费获取手机验证码")
             }
             else {
                 OutTimes -= 1;
                 $("#SendMobileBtn").val("已发，如果" + OutTimes + "秒后没有收到，可以重发!")
                 setTimeout("leavePage()", 1000);
             }
         }

         function getMobileCode() {
            $("#SendMobileBtn").attr("disabled", true);
             $.ajax({
                 url: "KS.YunOpenManage.aspx?action=sendmobilecode&rnd=" + Math.random(),
                 context: document.body,
                 type: "get",
                 success: function (data) {
                     if (data.indexOf('true')!=-1) {
                         leavePage();
                     }else{
                         $.dialog.alert(data, function () { $("#SendMobileBtn").attr("disabled", false); });
                     }

                 }
             });


             return false;

         }


         function leavePage1() {
             if (OutTimes == 0) {
                 $("#SendMobileBtn1").attr("disabled", false);
                 $("#SendMobileBtn1").val("免费获取手机验证码")
             }
             else {
                 OutTimes -= 1;
                 $("#SendMobileBtn1").val("已发，如果" + OutTimes + "秒后没有收到，可以重发!")
                 setTimeout("leavePage1()", 1000);
             }
         }

         function getMobileCode1() {


             $("#SendMobileBtn1").attr("disabled", true);


             $.ajax({
                 url: "KS.YunOpenManage.aspx?action=sendmobilecode1&rnd=" + Math.random(),
                 context: document.body,
                 type: "get",
                 success: function (data) {
                     // jQuery('#ajaxmsg', window.parent.document).toggle();
                     if (data.indexOf('true') != -1) {
                         leavePage1();
                     } else {


                         $.dialog.alert(data, function () { $("#SendMobileBtn1").attr("disabled", false); });
                     }

                 }
             });


             return false;

         }



        
</script>
   <table width="100%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable">
            <tr>
                <td align="right" class="lefttd" height="30">KESION云状态：<%=StatusStr %></td>
                <td class="righttd" colspan="2"></td>
            </tr>
        <tr>
                <td align="right" class="lefttd" height="30" >AppID：</td>
                <td class="righttd">

                <%=dr["AppID"].ToString() %>
                </td>
            </tr>
             <tr>
                <td align="right" class="lefttd" height="30" >AppSecret：</td>
                <td class="righttd">
                    <%=Utils.CutStr(dr["AppKey"].ToString(),10) %>***************
             
                     &nbsp; <asp:Button ID="Button1" runat="server" Text="重置秘钥"  CssClass="button" OnClick="Button1_Click1"  />

              </td>
            </tr>

             <tbody id="ModifyMobile" runat="server" style="display:none">
                          <tr class="tdbg">
                            <td  class="lefttd" style="width: 100px">手机号码：</td>
                            <td style="text-align:left">
                            <%=Utils.CutStr(dr["Mobile"].ToString(),3) %>*****<%=Utils.CutString(dr["Mobile"].ToString(),8)%></td>
                          </tr>
                          
                          <tr class="tdbg">
                            <td  class="lefttd" height="40" style="width: 100px">验 证 码：</td>
                            <td style="text-align:left">
                            <asp:TextBox ID="TxtMobileCode" runat="server" CssClass="textbox" Width="60" MaxLength="6" />
                          <input type="button" id="SendMobileBtn" class="button" onclick="getMobileCode()" value="免费获取手机验证码"/>
                            </td>
                          </tr>
                  </tbody>



             <tr>
                <td align="right" class="lefttd" height="30" >我的开发者账号：</td>
                <td class="righttd">
                  <%=dr["EMail"].ToString() %>
              </td>
                </tr>
              <%--  <tr>
                <td align="right" class="lefttd" height="30" >URL：</td>
                <td class="righttd">
                <%=YazUrl %>
              </td>
               
             </tr>--%>
              <tr>
                <td align="right" class="lefttd" height="30" >域名绑定：</td>
                <td class="righttd">
                  <%=Domain %>    <asp:Button ID="Button5" runat="server" Text="发现域名不一致请重新绑定域名"  CssClass="button"  Visible="false" OnClick="Button5_Click"/>
              </td>   
           <tbody id="show" runat="server" style="display:none">  
            
                          <tr class="tdbg">
                            <td  class="lefttd" style="width: 100px">手机号码：</td>
                            <td style="text-align:left">
                            <%=Utils.CutStr(dr["Mobile"].ToString(),3) %>*****<%=Utils.CutString(dr["Mobile"].ToString(),8)%></td>
                          </tr>
                          
                          <tr class="tdbg">
                            <td  class="lefttd" height="40" style="width: 100px">验 证 码：</td>
                            <td style="text-align:left">
                            <asp:TextBox ID="TxtMobileCode1" runat="server" CssClass="textbox" Width="60" MaxLength="6" />
                            <input type="button" id="SendMobileBtn1" class="button" onclick="getMobileCode1()" value="免费获取手机验证码"/>
                            </td>
                          </tr>
               
            </tbody>     
            </tr>
   </table>
       <div style="clear:both;text-align:center;">
            <asp:Button ID="Button4" runat="server" Text="重新验证为开发者"  CssClass="button"   Visible="false" OnClick="Button4_Click"/>
             <asp:Button ID="Button2" runat="server" Text="确定保存"  CssClass="button" OnClick="Button2_Click"  Visible="false"/>
            <asp:Button ID="Button3" runat="server" Text="取消"  CssClass="button" OnClick="Button3_Click" Visible="false"/>
   </div>

 </asp:Panel>
  </div>
 
    <div class="clear blank20"></div>
    <asp:Panel ID="LiveVideoList" runat="server" Width="100%" >
   <div class="content-area"> 
  	<div class="myTitle">
		<div style="float:right"><asp:Button ID="Button8" runat="server" Text="从科汛云同步到本地订单" class="button" OnClick="Button8_Click"  Visible="false" /></div>
    	云订单管理
    	<div class="clear"></div>
    </div>
  <div class="tabs_header">
    <ul class="tabs">
         <li<%=KSCMS.S("show")==""?" class='active'":string.Empty %>><a href="KS.YunOpenManage.aspx"><span>我的云产品(<%=DataFactory.GetOnlyValue("select count(1) From KS_YunManage ")%>)</span></a></li>
    <%if(Utils.GetSysInfo("//sysinfo/model/course").ToString().ToLower()=="1"){%>
      
    <li<%=KSCMS.S("show")=="1"?" class='active'":string.Empty %>><a href="KS.YunOpenManage.aspx?show=1"><span>云点播(<%=DataFactory.GetOnlyValue("select count(1) From KS_YunManage where yuntype=1")%>)</span></a></li>
    <li<%=KSCMS.S("show")=="4"?" class='active'":string.Empty %>><a href="KS.YunOpenManage.aspx?show=4"><span>云直播(<%=DataFactory.GetOnlyValue("select count(1) From KS_YunManage where yuntype=4 ")%>)</span></a></li>
     <%} %>
    <li<%=KSCMS.S("show")=="2"?" class='active'":string.Empty %>><a href="KS.YunOpenManage.aspx?show=2"><span>云短信(<%=DataFactory.GetOnlyValue("select count(1) From KS_YunManage where yuntype=2 ")%>)</span></a></li>
    <li<%=KSCMS.S("show")=="3"?" class='active'":string.Empty %>><a href="KS.YunOpenManage.aspx?show=3"><span>云模板(<%=DataFactory.GetOnlyValue("select count(1) From KS_YunManage where yuntype=3 ")%>)</span></a></li>
    <li<%=KSCMS.S("show")=="5"?" class='active'":string.Empty %>><a href="KS.YunOpenManage.aspx?show=5"><span>云服务器(<%=DataFactory.GetOnlyValue("select count(1) From KS_YunManage where yuntype=5 ")%>)</span></a></li>
    
    </ul>
    </div>
  <asp:Repeater ID="Repeater1" runat="server">
  <HeaderTemplate>
    <div class="r_padbox  wihte">	          
          <table width="98%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable">
              <tr class="CTitle">
                  
              <th>序号</th>
               <th>产品类型</th>
               <th>产品</th>
               <th style="text-align:center">最新下单时间</th>
               <th style="text-align:center">价格</th>
                <th style="text-align:center">状态</th>
               <th style="text-align:center">操作</th>
              </tr>
          </HeaderTemplate>
         <ItemTemplate>
             <TR>
                 
				 <td class="splittd" style="text-align:center">
					<%# Container.ItemIndex + 1%>
				</td>
                <td class="splittd" align="center">

                    <%#Yun.GetYunTypeName(Utils.StrToInt(Eval("yuntype").ToString ())) %>
                    <%#Eval("yuntype").ToString()=="1"?"<a href=\"KS.YunVideo.aspx?VideoType="+Eval("VideoType").ToString()+"\"></a>":"" %>
                </td>
                <td class="splittd" align="center">
                    
                    <%#Eval("Title") %>

                    <%#Eval("yuntype").ToString()=="1"||Eval("yuntype").ToString ()=="4"||Eval("yuntype").ToString ()=="5"? Eval("status").ToString()=="2"?  DateTime.Now> Convert.ToDateTime(Eval("EffectiveDate").ToString())?"已过期":"" :"" :""%>
                   <%#Utils.StrToInt(Eval("status").ToString())==0?"":Utils.StrToInt(Eval("status").ToString())==1?"":Eval("YunType").ToString()=="1"?"":Eval("YunType").ToString()=="2"?"<div class=\"userinfo-b\">短信余额："+Yun.getSmsCount(Utils.StrToInt(Eval("videoType").ToString()))+"</div>":Eval("YunType").ToString()=="4"?"":Eval("YunType").ToString()=="5"?"<div class=\"userinfo-b\">"+Yun.GetOpenUserInfo(Utils.StrToInt(Eval("infoid").ToString()),Eval("orderid").ToString(),Eval("ACCESS_KEY").ToString(),Eval("UserName").ToString(),Eval("PassWord").ToString())+"</div>":""%>
	
                </td>
                
                <td class="splittd" style="text-align:center"><%#Eval("adddate").ToString()%></td>

                <td class="splittd" style="text-align:center">
                   
              <%# Kesion.APPCode.Public.ReturnShopPrice(Convert.ToString(Eval("Price")))%></span></td>
               <td align="center">
                 <%#Yun.YunOrderStatus(Utils.StrToInt(Eval("status").ToString()),Utils.StrToDateTime(Eval("OpenDate").ToString()),Utils.StrToDateTime(Eval("EffectiveDate").ToString()),Utils.StrToInt(Eval("YunType").ToString()))  %>
               </td>
                 
              <td class="link-operate" align="center">
                 <%#Eval("yuntype").ToString()=="1"&&Utils.StrToInt(Eval("status").ToString())==2&&Utils.StrToDateTime(Eval("EffectiveDate").ToString())>DateTime.Now?"<a href=\"KS.YunVideo.aspx?VideoType="+Eval("videotype").ToString()+"\">管理视频</a>":""%>
                 <%#Eval("yuntype").ToString()=="3"?Utils.StrToInt(Eval("status").ToString())==0?"<a href=\""+Yun.GetServerUrl+"user/Shop/MyShowOrder.aspx?action=pay&id="+(Utils.StrToInt(Eval("ProOrderID")))+"&token="+Token+"&appid="+Appid+"\"  target=\"_blank\"><i class=\"iconfont icon\">&#xe645;</i>去支付</a><a href='KS.YunOpenManage.aspx?action=delete&VideoType="+Eval("VideoType").ToString()+"&yuntype="+Eval("yuntype").ToString()+"&yunid="+Eval("YunID").ToString()+"'>删除</a>":isHasDownYunTemplate(Utils.StrToInt(Eval("infoid")))?"<a href=\"javascript:;\"  ><i class=\"iconfont icon\">&#xe645;</i>已下载</a>":@"<a href=""javascript:;"" onclick='YunDownLoad("+ Eval("infoid")+","+CurrPage+@")'  >下载并导入</a>":Eval("yuntype").ToString()=="5"?"":checkNoPay(Utils.StrToInt(Eval("Yuntype").ToString()),Utils.StrToInt(Eval("videotype").ToString()))==0?"<a  href=\"KS.YunOrderItem.aspx?VideoType="+Eval("VideoType").ToString() +"&yuntype="+Eval("yuntype").ToString()+"\">订单详情</a>":"<a  href=\"KS.YunOrderItem.aspx?VideoType="+Eval("VideoType").ToString() +"&yuntype="+Eval("yuntype").ToString()+"\">未支付的订单("+checkNoPay(Utils.StrToInt(Eval("Yuntype").ToString()),Utils.StrToInt(Eval("videotype").ToString()))+"）</a>" %>
                    <%#Eval("yuntype").ToString()=="5"?Utils.StrToInt(Eval("status").ToString())==0?"<a href=\""+Yun.GetServerUrl+"user/Shop/MyShowOrder.aspx?action=pay&id="+(Utils.StrToInt(Eval("ProOrderID")))+"&token="+Token+"&appid="+Appid+"\"  target=\"_blank\"><i class=\"iconfont icon\">&#xe645;</i>去支付</a><a href='KS.YunOpenManage.aspx?action=delete&VideoType="+Eval("VideoType").ToString()+"&yuntype="+Eval("yuntype").ToString()+"&yunid="+Eval("YunID").ToString()+"'>删除</a>":"":"" %>
                  <%#Eval("yuntype").ToString()=="5"?Utils.StrToInt(Eval("status").ToString())==2?"<a onclick='openyun()'>续费或升级</a>":"":""%>

                </td>
			</TR>
			<tr>
			
             
         </ItemTemplate>
          <FooterTemplate>
           <tr class="tdbg emptycss" style="display:<%# bool.Parse((Repeater1.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="7">
                 没有云产品的信息，<a href="<%#Yun.GetServerUrl %>"  target="_blank" class="link-color">赶快去购买，有更多优惠呢</a>
                </td>
               </tr> 
           </table>
          </FooterTemplate>
        </asp:Repeater>

         <script>
             function openyun() {

                 if(confirm('确认升级或续费吗?\n如果要升级或续费的话，请联系科汛的客服,请点确认,否则请取消.'))
                 {
                     window.open("<%=Utils.IsBuyYunServer("serverurl/yunurl")%>");
                 
                 }
             }


         </script>

          <KS:Page ID="page1" runat="server" />

    </asp:Panel>
  </div>  
</asp:Content>

