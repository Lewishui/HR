<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.Weixin.WebSite.weixin_keyword" Codebehind="KS.Keyword.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>
 <%@ Import Namespace="System.Data" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
      <KS:TopNav ID="TopNav1" runat="server" />
  <div class="content-area">    
     <link href="/admin/weixin/images/style.css" rel="stylesheet" />
    	<div class="tab_regmessage" style="margin-left: 20px;">
           <ul style="margin-left: 1%;">
           <li style=" border-radius: 5px 0px 0px 5px;">
           <a href="KS.ReplyMsg.aspx"  >
              关注回复  </a>
           </li>  
               
          <li >
           <a href="KS.AutomaticReplyMsg.aspx"  >
              消息自动回复  </a>
           </li> 
           <li class="hit" style=" border-radius: 0px 5px 5px 0px;">
           <a href="KS.keyword.aspx"  >
              关键词自动回复  </a>
           </li> 
		   <div class="clear"></div>                         
           </ul>  

   	</div>
    <div class="clear"></div>
     <script>

         function SelectClassPage(FieldID) {

             top.openWin("图文", "weixin/KS.GetTuWen.aspx?action=keyword&fieldID=" + FieldID, false, 1000, 500);

             //  OpenThenSetValue('KS.GetTuWen.aspx', 800, 550, window, jQuery('#' + FieldID)[0]);

         }


</script>
     <script>
         $(function () {
             aa(<%=keytype%>);
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
                      $("#typekey").val(k);
                    
                      if (k == 0) {
                          $('#iframemain0').attr('src', 'KS.TuWenList.aspx?action=keyword&keyId=<%=keyId%>');


                        } else if (k == 1) {
                            $('#mybox2').show();
                            $('#mybox1').hide();

                        } else if (k == 2) {
                            $('#iframemain0').attr('src', 'KS.ShopList.aspx?action=keyword&keyId=<%=keyId%>');

                     }
                     else if (k == 3) {
                         $('#iframemain0').attr('src', 'KS.SuCaiList.aspx?action=keyword&keyId=<%=keyId%>');

                     }
                      $(this).attr("class", "hit");
                  }
              });

          }


      </script>
   
  <div class="content_wrap1" id="div_replyContent">
        <asp:Panel ID="Panel2" runat="server">
		<div class="search">
			<asp:TextBox ID="TxtKey" runat="server" class="search_box"></asp:TextBox>
			<asp:Button ID="buttonsearch" runat="server" Text=" " OnClick="buttonsearch_Click" class="search_btn"/>
		</div>
		<div class="btn_wrp">
	       <span class="quanxuan"><input type="checkbox" name="chkall" id="chkall" onClick="CheckAll(this.form);" />全选</span>
		   <asp:LinkButton ID="delbutton" runat="server" OnClientClick="if (GetIDS('del')){return true}else{return false}" onclick="BtnDelete_Click" CssClass="key_font_css"><b></b>删除关键字</asp:LinkButton>
		   <asp:Button ID="Button1" runat="server" Text="+添加规则"   class="btn btn_add btn_primary" OnClick="Button1_Click" />
		  
	
	
		</div>
        
        <div class="clear"></div>
       </asp:Panel>
       <asp:Panel ID="Panel4" runat="server">
       <input id="keytype" type="hidden" value="<%=keytype%>"/>
       <input id="TxtTuWenID" type="hidden"  name="TxtTuWenID"/>
       <input id="TxtShopID" type="hidden"  name="TxtShopID"/>
       <textarea id="ShowTxtTuWen0" style="width:300px;height:200px;display:none"></textarea>
       <textarea id="ShowTxtShop0" style="width:300px;height:200px;display:none"></textarea>
      <input id="TxtSuCaiID" type="hidden" name="TxtSuCaiID" />
	 <textarea id="ShowTxtSuCai0" style="width:300px;height:200px;display:none"></textarea>


    <ul id="Js_ruleList" class="keywords_rule_list2"  >
        <li class="keywords_rule_item open">
            <div class="keywords_rule_hd no_extra dropdown_area Js_detail_switch dropdown_opened">
                <div class="info">
                    <em class="keywords_rule_num">
                        <strong>新规则</strong>
                    </em>
                </div>

            </div>
       <%--  <div class="keywords_rule_bd keywords_rule_overview">
                <div class="keywords_info keywords">
                    <strong class="keywords_info_title">
                        是否设为默认回复：<asp:CheckBox ID="chkIsDefault" runat="server" Text="设置默认回复" />
                    </strong>
                   

                </div>
                
              
            </div>--%>
            <div class="keywords_rule_bd keywords_rule_detail">
                <div class="rule_name_area">
                    <div class="frm_control_group" >
                        
                        <div class="frm_controls">
                            <span class="frm_input_box">
                               <label for="" class="frm_label">
                                   <font style="font-size:20px; color:#ccc;">·</font><strong>规则名</strong>
                               </label>

                               <asp:TextBox ID="TxtTitle" runat="server"  CssClass="inp245" Width="40%"   MaxLength="50"></asp:TextBox>


                            </span>
                            <span class="tips frm_tips">
                                规则名最多50个字
                            </span>
                        </div>
                    </div>
                </div>
                <div class="keywords_tap keywords no_data">
                    <div class="keywords_tap_hd" style="border-bottom:none;">
                        <div class="info">
                            
                        </div>
                        <div class="opr">
						    <label>
                                <font style="font-size:20px; color:#ccc;">·</font><strong>关键字</strong>
                            </label>
                            <asp:TextBox ID="TxtKeyWord" runat="server"  CssClass="inp245" Width="40%"   MaxLength="50"></asp:TextBox>

                            <span class="tips keyword" style="color: red;">
                                 关键字最多可输入50字，请用&quot;|&quot;进行分隔，例如&quot;男装|女装"。

                            </span>

                        </div>
                        
                    </div>
                    
                </div>
               <%-- <div style="padding: 20px;">
                     <strong>回复类型：</strong>
                    <asp:DropDownList ID="DrType" runat="server">
                        <asp:ListItem Value="0">回复全部</asp:ListItem>
                        <asp:ListItem Value="1">回复图文</asp:ListItem>
                           <asp:ListItem Value="2">回复文字</asp:ListItem>
                           <asp:ListItem Value="3">回复商品</asp:ListItem>
                       
                    </asp:DropDownList>
                </div>--%>
               

                <div class="keywords_tap reply no_data">
                    <div class="keywords_tap_hd" style="border-top: 1px solid #e7e7eb;background-color: #F5F5F9;">
                        <div class="info">
                            <h4>
                                回复
                            </h4>
                        </div>
                      
                    </div>
                    <div class="keywords_tap_bd">
              <%--         <asp:Panel ID="Panel1" runat="server" >--%>
                        <div class="phone_right" style="margin-left:0; margin-right:0;">
                        
                        <div class="cz_list" style=" padding:0;">
                            <div class="tabs1" style="border:none; margin-top:0;">
                                <div class="menu1box">
                                    <ul class="menu1" style="background:none;">
                                        <li class="hit">
                                            
                                            <a href="KS.TuWenList.aspx?action=keyword&keyId=<%=keyId%>"  onclick="$('#mybox1').show();$('#mybox2').hide();" target="iframemain0" >
                                           <i class="sm_tab tw2"></i>     图文
                                            </a>
                                        </li>
                                     <li>
                                          
                                            <a href="javascript:;" onclick="$('#mybox2').show();$('#mybox1').hide();" >
                                            <i class="sm_tab wz"></i>     文字
                                            </a>
                                        </li>
                                        <%if (Utils.GetSysInfo("//sysinfo/model/mall").ToString().ToLower() == "true"){ %>
                                        <li>
                                           
                                            
                                            <a href="KS.ShopList.aspx?action=keyword&keyId=<%=keyId%>" onclick="$('#mybox2').hide();$('#mybox1').show();"  target="iframemain0">
                                           <i class="sm_tab sp"></i>     商品
                                            </a>
                                        </li>
                                        <%} %>
                                        <li >
                                           
                                            <a href="KS.SuCaiList.aspx?action=keyword&keyId=<%=keyId%>"  onclick="$('#mybox1').show();$('#mybox2').hide();" target="iframemain0" >
                                           <i class="sm_tab tw2"></i>      素材
                                            </a>
                                        </li>
                                        <div class="clear">
                                        </div>
                                    </ul>
                                </div>
                                <div class="main1box" style="min-height:auto;">
                                      <dt class="main">
                                        <dt class="mbimg" style="display:block; " id="mybox1">
                                            <iframe class="editArea-ifrm" frameborder="no" border="0" src="KS.TuWenList.aspx?action=keyword&keyId=<%=keyId%>" style="width:100%;" name="iframemain0" id="iframemain0" > </iframe>
                                        </dt>
                                         <dt id="mybox2" class="com_form msgBox" style="display:none;margin-bottom: 30px;">
                                            
                                            <div><asp:TextBox ID="TxtContent" runat="server" TextMode="MultiLine" Width="90%" Height="120px"  style="padding: 10px;border: 1px solid #ddd; background:#fff;" ></asp:TextBox></div>
                                         </dt>
                                       
                                    </div>
                                </div>
                            </div>
                        </div>
                          <%-- </asp:Panel>--%>
                    </div>
                    </div>
                </div>
            </li>
        </ul>


        <div class="main-button">


                  <asp:Button ID="ButtonAdd" runat="server" Text="保存" class="button" OnClick="ButtonAdd_Click" />
        </div>


      </asp:Panel>


    


  <asp:Panel ID="Panel5" runat="server">
     
      <asp:Repeater ID="list" runat="server" >
          <HeaderTemplate>
            <ul  class="keywords_rule_list"  >
              </HeaderTemplate>
            <ItemTemplate>
   <li class="keywords_rule_item open" >
      

    <div class="keywords_rule_hd no_extra dropdown_area Js_detail_switch dropdown_opened"
  data-reply="empty" style="-webkit-transition: all, 1s;">
        <div class="operating">
		  <a href="KS.Keyword.aspx?action=modify&keyId=<%#Eval("id")%>"><img src="/admin/weixin/images/updata.png" /></a>
          <a href="KS.Keyword.aspx?action=delete&keyId=<%#Eval("id")%>"><img src="/admin/weixin/images/delete.png" /></a>
		</div>
        <div class="info">
		    <input type="checkbox"  name="ids" id="ids" value="<%#Eval("id") %>" style="height:15px; width:15px; position:absolute;top: 15px;left: 11px;vertical-align: middle;" /> 
            <em class="keywords_rule_num" style="margin-left:20px;">
                规则<%#list.Items.Count+1 %>:
            </em>
            <strong class="keywords_rule_name">
                    <%#Eval("Title")%>
            </strong>
        </div>

    </div>
    
    <div class="keywords_rule_bd keywords_rule_detail">
    
        <div class="keywords_tap keywords ">
            <div class="keywords_tap_hd">
                <div class="info">
                    <h4 style="color:#DE8616;">
                       <font style="font-size:20px; color:#ccc;">·</font>关键字
                    </h4>
                </div>
                
            </div>
            <div class="keywords_tap_bd">
                <ul class="keywords_list" >
                    <li data-index="0" >
                        <div class="desc"> 
                                    &nbsp;&nbsp;<%#Eval("KeyWord")%>
						</div>
                        
                    </li>
                </ul>
            </div>
        </div>
        <div class="keywords_tap reply ">
            <div class="keywords_tap_hd">
                <div class="info">
                    <h4 style="color:#DE8616;">
                        <font style="font-size:20px; color:#ccc;">·</font>回复
                    </h4>
                </div>
              
            </div>
            <div class="keywords_tap_bd huifu">
                
              <div><%#Convert.ToString(Eval("Content").ToString())==""?"":GetContent(Eval("Content").ToString()) %>
            <%#GetContentDetail(Eval("TuWenID").ToString(),Eval("ShopID").ToString(),Eval("sucaiid").ToString())%></div>
            </div>
        </div>
    </div>
    
</li>

 </ItemTemplate>
                                <FooterTemplate>  
                                    </ul>
									
                                    <div class="clear"></div>
                             
                                  
                                    <div class="norecord" style="display:<%#bool.Parse((list.Items.Count==0).ToString())?" ":"none "%>; text-align:center; margin:20px 10px;">
                                        <span style="text-align:center">
                                            暂无规则
                                        </span>
                                    </div>
                                </FooterTemplate>
                            </asp:Repeater>


       <KS:Page ID="Page1" runat="server" />
</asp:Panel>

</div>

</div>

</asp:Content>

