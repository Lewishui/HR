<%@ Page Language="C#"  MasterPageFile="~/Admin/MasterPage.master"  AutoEventWireup="true" Inherits="Kesion.Weixin.WebSite.weixin_sendmsg" Codebehind="KS.Sendmsg.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
        <link href="/admin/weixin/images/style.css" rel="stylesheet" />
     <KS:TopNav ID="TopNav1" runat="server" />
  <div class="content-area">   
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
        function DoSend(id) {
            var content = escape($("#txtcontent" + id).val());
            var openid = $("#openid" + id).val();
            var sendid = $("#sendid" + id).val();
            var tuwenid = $("#TxtTuWenID" + id).val();
            var shopid = $("#TxtShopID" + id).val();
            var sucaiid = $("#TxtSuCaiID" + id).val();
           
            $("#Loading").show();
            $.ajax({
                url: "KS.Sendmsg.aspx?action=replymsg&sendopenid=" + openid + "&tuwenid=" + tuwenid + "&shopid=" + shopid + "&sucaiid=" + sucaiid + "&sendid=" + sendid + "&replycontent=" + content + "&rnd=" + Math.random(),
                context: document.body,
                type: "get",
                success: function (data) {

                    if (data =='ok') {
                        KesionJS.Alert("发送成功", "location.reload();");
                    } else {
                        KesionJS.Alert("发送失败", "location.reload();");
                    }
                    $("#Loading").hide();


                }
            });
            return false;


        }


    </script>
    

    <script>
       
        $(function () {
            $(".service_list_dg li .quick_reply").click(
                function () {
                    $(this).parents("li").children(".reply_box").slideToggle("slow");
                    /*$(".reply_box");*/

                }
        )
        })

</script>
    
  <style>
      .emoji {
          background: transparent url(/admin/weixin/images/qqface/emoji218877.png) no-repeat 0 0;
          width: 20px;
          height: 20px;
          display: -moz-inline-stack;
          display: inline-block;
          vertical-align: middle;
          margin-top: -0.2em;
          zoom: 1;
      }
.emoji1f604 {
background-position: 0 -3260px;
}



  </style>
  <asp:Panel ID="Panel1" runat="server">
  
       <div class="prompt_bg" style="display:none" id="Loading">
		<div class="prompt_box">
		  <p><img src="/admin/weixin/images/loading.gif" />正在发送，请耐心等待...</p>
		</div>
	</div>
  <div class="service">
  
  <asp:LinkButton ID="delbutton" runat="server" OnClientClick="if (GetIDS('del')){return true}else{return false}" onclick="BtnDelete_Click" class="sendmsg_delete_btn"><b></b>删除记录</asp:LinkButton>
  <span class="quanxuan"><input type="checkbox" name="chkall" id="chkall" onClick="CheckAll(this.form);" />全选</span>
      <asp:Repeater ID="list" runat="server">
  <HeaderTemplate>
  <ul class="service_list_dg">
   </HeaderTemplate>
  <ItemTemplate>
      
      
         
      
    <li class="clearfix">



       <input id='TxtTuWenID<%#Eval("id") %>' type="hidden"  name="TxtTuWenID<%#Eval("id") %>"/>
         <textarea id='ShowTxtTuWen<%#Eval("id") %>' style="width:300px;height:200px;display:none" name="ShowTxtTuWen<%#Eval("id")%>"></textarea>
         <textarea id='ShowTxtShop<%#Eval("id") %>' style="width:300px;height:200px;display:none" name="ShowTxtShop<%#Eval("id")%>"></textarea>
          <input id='TxtShopID<%#Eval("id") %>' type="hidden"  name="TxtShopID<%#Eval("id") %>"/>
           <input id="TxtSuCaiID<%#Eval("id") %>" type="hidden" name="TxtSuCaiID<%#Eval("id") %>" />
	     <textarea id="ShowTxtSuCai<%#Eval("id") %>" style="width:300px;height:200px;display:none"></textarea>

        
        
          <input id="sendid<%#Eval("id") %>" name="sendid<%#Eval("id") %>" type="hidden" value="<%#Eval("id") %>"/>
          <input id="openid<%#Eval("id") %>" name="openid<%#Eval("id") %>" type="hidden" value="<%#Eval("FromUserName") %>"/>
	   
        
        <div class="personal_replies">
        <input type="checkbox"  name="ids" id="ids" value='<%#Eval("id") %>' style="height:15px; width:15px; margin-right:10px; float:left;" /> 


	   <div class="service_list_left1">
	      <div class="service_img"><img src="<%#Eval("HeadImgurl") %>" /></div>
		  <div class="service_info_left">
			  <div class="service_info">
				 <%#Eval("NickName") %>(<a href="KS.Sendmsg.aspx?action=look&openid=<%#Eval("FromUserName") %>&sendid=<%#Eval("id") %>" style="color:red">
	
					总共<%#Count(Eval("FromUserName").ToString()) %>条|<%#NoReadCount(Eval("FromUserName").ToString()) %>未读消息) </a>
				 
			  </div>
			  <div class="service_list_right1">
				  <div class="operating_left">
					 <span class="response_time"><%#Eval("CreateTime") %></span>
					 <span class="response_status"><%#Convert.ToString(Eval("ReplyStatus").ToString())=="0"?"未回复":"已回复" %></span>
				  </div>
					 <%#GetReply(Utils.StrToDateTime(Eval("CreateTime").ToString())) %>
				
			  </div>
			  <div class="clear"></div>
			  <span class="send_message"><%#GetSendUserMessage(Eval("MsgType").ToString(),Eval("content").ToString(),Eval("PicUrl").ToString(),Eval("MediaId").ToString()) %></span>
		  </div>
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
	   </div>
	   
	  </div>
       <script>
           $(function () {

               $(".reply_box_tab ul li").click(function () {
                   var k = $(this).index();
                   $(".reply_box_tab ul li").each(function (index, domEle) {
                       $(this).attr("class", "");
                   });
                   $(".reply_box_tab ul li").each(function (index, domEle) {
                       if (k == index) {
                           if (k == 0) {


                           } else if (k == 1) {

                           } else if (k == 2) {

                           }
                           else if (k == 3) {

                           }
                           $(this).attr("class", "hit");
                       }
                   });
               });
           });
</script>
	  <div class="reply_box">
	   <div class="reply_box_tab">
	      <ul class="reply_title_tab">
		    <li class="hit">  
                 <a href="KS.TuWenList.aspx?action=sendmsg&sendid=<%#Eval("id") %>"  onclick="$('#mybox1<%#Eval("id") %>').show();$('#mybox2<%#Eval("id") %>').hide();" target="iframemain<%#Eval("id") %>" >图文</a></li>
			<li>

           <a href="javascript:;" onclick="$('#mybox2<%#Eval("id") %>').show();$('#mybox1<%#Eval("id") %>').hide();" >
               文字
             </a>
			</li>
             <%if (Utils.GetSysInfo("//sysinfo/model/mall").ToString().ToLower() == "true"){ %>
			<li><a href="KS.ShopList.aspx?action=sendmsg&sendid=<%#Eval("id") %>" onclick="$('#mybox1<%#Eval("id") %>').show();$('#mybox2<%#Eval("id") %>').hide();"  target="iframemain<%#Eval("id") %>"> 商品 </a></li>
              <%} %>
               <li >
               
                 <a href="KS.SuCaiList.aspx?action=sendmsg&sendid=<%#Eval("id") %>"  onclick="$('#mybox1<%#Eval("id") %>').show();$('#mybox2<%#Eval("id") %>').hide();" target="iframemain<%#Eval("id") %>" >
                                素材
                   </a>
                </li>
			  <div class=" clear"></div>
		  </ul>
		  <div class=" clear"></div>
		  <div class="reply_con_tab">
		    <div class="reply_con_info" style="display:block;" id="mybox1<%#Eval("id") %>">
			 <iframe class="editArea-ifrm" frameborder="no" border="0" src="KS.TuWenList.aspx?action=sendmsg&sendid=<%#Eval("id") %>" style="width:100%;height:230px;" name="iframemain<%#Eval("id") %>" id="iframemain<%#Eval("id") %>" scrolling="no"> </iframe>                     

			   
			</div>
			<div class="reply_con_info" id="mybox2<%#Eval("id") %>" style="display:none">
			<textarea id="txtcontent<%#Eval("id") %>" name="txtcontent<%#Eval("id") %>" cols="20" rows="2" style="width:100%; height:220px;"></textarea>

			</div>
			

		  </div>
		  
	   </div>
	   <button value="发送" class="send" onclick="return(DoSend(<%#Eval("id") %>))">发送</button> 
	  </div>
	</li>
	
   </ItemTemplate>
   <FooterTemplate>  
        </ul>
		
      <div class="clear"></div>
                             
       <div class="norecord" style="display:<%#bool.Parse((list.Items.Count==0).ToString())?" ":"none "%>; text-align:center;">
       <span style="text-align:center">
             暂无信息！                   
         </span>
         </div>
        </FooterTemplate>
   </asp:Repeater>
   <KS:Page ID="Page1" runat="server" />
</div>

</asp:Panel>
<asp:Panel ID="Panel2" runat="server">
    <script>
        var num = 1;
        function OnLoad() {        
          
            $("#topload").hide();

            num++;
            var openid = '<%=Openid%>';
            var order = jQuery("#<%=this.RdbOrderID.ClientID %> :radio[checked]").val()
                $.ajax({
                    url: "KS.Sendmsg.aspx?action=loadlist&sendopenid=" + openid + "&orderid="+order+"&type=1&page=" + num + "&rnd=" + Math.random(),
                    context: document.body,
                    type: "GET",
                    success: function (data) {

                        if (data == 'over') {

                            $("#topload").hide();
                        } else {

                            $("#dialogBox").append(data);
                            $("#topload").show();
                        }

                    }
                });


            }


    </script>
  <script>

      $(function () {

          $(".hit_player_img").click(function () {
              $(this).hide();
              $(this).prev().show()
          });
          $(".show_player_click").click(function () {
              $(this).parent(".show_player").hide();
              $(this).parent(".show_player").next().show();
          });

      });

</script>
 
       <div class="openKey" style="margin-right:40px;margin-left:40px;margin-bottom: 0;">
        <span class="txt" style="float:left;">消息排序方式:</span>
               
          <asp:RadioButtonList ID="RdbOrderID" RepeatDirection="Horizontal" runat="server"   AutoPostBack="true" OnSelectedIndexChanged="RdbOrderID_SelectedIndexChanged">
            <asp:ListItem Value="1" >升序</asp:ListItem>
            <asp:ListItem Value="0" Selected="True"> 降序</asp:ListItem>
             </asp:RadioButtonList>
           <div class="clear"></div>
     </div>

<div class="service">
  
  <asp:Repeater ID="InfoList" runat="server">
  <HeaderTemplate>

    <ul class="service_list_dg">
     </HeaderTemplate>
    <ItemTemplate>

     <li class="inner_msg_list clearfix">
	  <div class="personal_replies">
	   <div class="service_list_left">
	      <div class="service_img">
		      <img src="<%#Eval("HeadImgurl") %>" />
			  <div class="fans_message">
				
				<div class="xx_fans_message">
				   <i class="fans_message_jiantou"></i>
				   <div class="fans_message_title">详细信息</div>
				   <div class="fans_message_list">
					  <div class="message_no1"><span style="display:block;"><%#Eval("NickName") %></span></div>
					  <div class="message_no2"><span class="message_no1_name">地区</span><span class="message_no1_address"><%#Eval("Province") %>&nbsp;<%#Eval("City") %>&nbsp;<%#Eval("Country") %></span></div>
					  <div class="message_no3"><span class="message_no1_name">性别</span><span class="message_no1_write"><%# Eval("sex").ToString()=="1"?"男":"女"%></span></div>
				   </div>
				</div>
			  </div>
		  </div>
		  <div class="service_info_left">
		  
			  <div class="service_info">
				 <%#Eval("NickName") %>
				 
			  </div>
			  
			   <div class="service_list_right">
				  <div class="operating_left">
					 <span class="response_time"><%#Eval("CreateTime") %></span>
					 <span class="response_status">     
						 <%#Convert.ToString(Eval("ReplyStatus").ToString())=="1"?"已回复":"" %>
					 </span>
				  </div>
				  <div class="clear"></div>
			   </div>
			   <div class="clear"></div>
			   <span class="send_message">
					 
				 <%#GetSendContent(Eval("MsgType").ToString(),Eval("Content").ToString(),Eval("MediaId").ToString(),Eval("PicUrl").ToString()) %>
				   
	
	
			   </span>
			   
		  </div>
	   </div>
	   
	  </div>
	  
	</li>

   <%#Convert.ToString(Eval("ReplyStatus").ToString())=="1"? GetReplyContent(Eval("ReplyStatus").ToString(),Eval("ReplyTime").ToString(),Eval("ReplyContent").ToString(),Eval("tuwenid").ToString(),Eval("shopid").ToString(),Eval("sucaiid").ToString()):"" %>

	
   </ItemTemplate>
   <FooterTemplate> 
    
      </ul> 
     
      <div class="clear">
                             
       <div class="norecord" style="display:<%#bool.Parse((InfoList.Items.Count==0).ToString())?" ":"none "%>">
       <span style="text-align:center">
             暂无信息！                   
         </span>
         </div>
     </FooterTemplate>
   </asp:Repeater>
  </div>


  
  
    <KS:Page ID="Page2" runat="server" />

 </asp:Panel>
 
 </div>
</asp:Content>