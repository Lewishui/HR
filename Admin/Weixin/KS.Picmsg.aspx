<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.Weixin.WebSite.weixin_picmsg" CodeBehind="KS.Picmsg.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
     <link href="/admin/weixin/images/style.css" rel="stylesheet" />
    <KS:TopNav ID="TopNav1" runat="server" Text="素材管理" />
 <div class="content-area">   
     <script>
         //加载的效果
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
     <script type="text/javascript">
         function TongBu() {
             //同步
             //jQuery(parent.document).find("#ajaxmsg").toggle();
             $("#Loading").show();
             $.ajax({
                 url: "KS.Picmsg.aspx?action=tongbu&rnd=" + Math.random(),
                 context: document.body,
                 type: "get",
                 success: function (data) {
                    
                     if (data =='ok') {
                         KesionJS.Alert("恭喜,同步成功", "location.reload();");
                     } else {
                         KesionJS.Alert("对不起,同步失败", "location.reload();");
                     }
                     $("#Loading").hide();
                     //jQuery('#ajaxmsg', window.parent.document).fadeOut("slow");
                 }
             });
             return false;
         }  
         function HuoQu(){
             //获取
             jQuery(parent.document).find("#ajaxmsg").toggle();
             $.ajax({
                 url: "KS.Picmsg.aspx?action=huoqu&rnd=" + Math.random(),
                 context: document.body,
                 type: "get",
                 success: function (data) {
                     // jQuery('#ajaxmsg', window.parent.document).toggle();
                     if (data =='ok') {
                         KesionJS.Alert("恭喜,获取成功", "location.reload();");
                     } else {
                         KesionJS.Alert("对不起,获取失败", "location.reload();");
                     }
                     jQuery('#ajaxmsg', window.parent.document).fadeOut("slow");
                 }
             });
             return false;


         }

         </script>
   
     <script>
         var num=<%=num%>;
         var nowIndex=0;
         var oldnum=nowIndex;
         var editor='';
         $(function(){	
             initialSelect();   //初始化选择中框   
             if($("#default_title0").val()!='')
             {
                 $("#defaulttitle0").html($("#default_title0").val());
             }
             if($("#default_img0").val()!='')
             {
                 $("#img_box"+nowIndex).attr("src",$("#default_img0").val()); 
             }

             $('.sucai_img_list li').eq(0).click();

             for (var i=1;i<=num;i++)
             {
                 jQuery("#mybox1").append('<iframe class="editArea-ifrm" frameborder="no" border="0" src="KS.TuWenList.aspx?action=sucai&sucaiId=<%=SuCaiId%>" style="width:100%" name="iframemain'+i+'" id="iframemain'+i+'"> </iframe>');
               
             }
         });
         function initialSelect(){
             $('.sucai_img_list li').click(function(){
                 var k = $(this).attr("num");
                 oldnum=nowIndex;
                 nowIndex=k; 
                 $('.sucai_img_list li').removeClass('xz');
                 $(this).addClass('xz');
                 fz(nowIndex);//赋值

             });

         }
         function fz(num)//赋值
         {
             var nowType=parseInt($("#default_type"+num).val()); 
            // alert(nowType);
             if (editor!=''&&nowType==0){
                 $("#default_content"+oldnum).html(editor.getContent());
                 editor.setContent('');
             }
             //切换添加面板
             $("#<%=this.RadioButtonList1.ClientID %>").find("input").each(function(){
                     if (parseInt($(this).attr("value"))==nowType){
                         $(this).attr("checked",true);
                     }
                 });
            
                 if (nowType==0){
                     jQuery("#xitongdetail").hide();
                     jQuery("#zidingyideatil").show();
                 }else{
                     jQuery("#xitongdetail").show();
                     jQuery("#zidingyideatil").hide();
                 }

                     if (nowType==0){  //自定义的
                         if (editor!=''){
                             if ($("#default_content"+num).val()!=''){
                                 editor.setContent($("#default_content"+num).val());
                             }else{
                                 editor.setContent('');
                             }
                         }
                     }else{  //系统
                         var keytype=$("#keytype"+num).val();
                         var id=$("#default_ID"+num).val();
                         $(".editArea-ifrm").hide().eq(num).show();
                         if(keytype==1)
                         {
                             $(".menu1box ul li").removeClass("hit");
                             $(".menu1box ul li").eq(0).addClass("hit");
                             $('#iframemain'+num).attr('src', 'KS.TuWenList.aspx?action=sucai&sendid='+num+'&sucaiId='+id);
                         }
                         else if(keytype==2){
                             $(".menu1box ul li").removeClass("hit");
                             $(".menu1box ul li").eq(1).addClass("hit");
                             $('#iframemain'+num).attr('src', 'KS.ShopList.aspx?action=sucai&sendid='+num+'&sucaiId='+id);
                         }
                     }
           
                 
             if($("#default_title"+num).val()!=''){
                     jQuery("#<%=this.TxtTitle.ClientID %>").val($("#default_title"+num).val());
             }
             else
             {
                 jQuery("#<%=this.TxtTitle.ClientID %>").val('');
                // $("#ShowTxtTuWen0").html('');

             }

             if($("#default_url"+num).val()!=''){
                 jQuery("#<%=this.TxtUrl.ClientID %>").val($("#default_url"+num).val());
             }
             else
             {
                 jQuery("#<%=this.TxtUrl.ClientID %>").val('');
             }
             if($("#default_img"+num).val()!=''){
                 jQuery("#<%=this.TxtPic.ClientID %>").val($("#default_img"+num).val());
             }
             else
             {
                 jQuery("#<%=this.TxtPic.ClientID %>").val('');
             }
             if($("#default_intro"+num).val()!=''){
                 jQuery("#<%=this.Txtinfo.ClientID %>").val($("#default_intro"+num).val());
             }
             else{
                 jQuery("#<%=this.Txtinfo.ClientID %>").val("");
             }
             var checkrad =$("#default_ShowPic"+num).val();  
             if(checkrad==1)
             {
                 $("#<%=this.CheckBox1.ClientID%>").attr("checked",true);
             }
             else{
                 $("#<%=this.CheckBox1.ClientID%>").attr("checked",false);
             }
         
         }
        
 </script>

   <script>
       function showStatus() {
           var checkrad = $("#<%=this.RadioButtonList1.ClientID %> :radio[checked]").val();
          // alert(checkrad);
           if (checkrad == "1") {
              
               if(confirm("确定切换到系统吗？"))         
               {   
                   jQuery("#xitongdetail").show();
                   jQuery("#zidingyideatil").hide();
                   $("#default_type"+nowIndex).val('1');
                   clearziyi(nowIndex);//清空自定义
                  
                   return true;
               }
               else{ //保留原状态
                   $("#<%=this.RadioButtonList1.ClientID %>").find("input").each(function(){
                            if (parseInt($(this).attr("value"))==parseInt($("#default_type"+nowIndex).val())){
                                $(this).attr("checked",true);
                            }
                        });
                        return false;
                       
                    }
                } else {
                    if(confirm("确定切换到自定义吗？"))
                    { 
                        jQuery("#xitongdetail").hide();
                        jQuery("#zidingyideatil").show();
                        $("#default_type"+nowIndex).val('0');
                        clear(nowIndex);//清空系统
                        return true;
                    }
                    else{  //保留原状态
                        $("#<%=this.RadioButtonList1.ClientID %>").find("input").each(function(){
                            if (parseInt($(this).attr("value"))==parseInt($("#default_type"+nowIndex).val())){
                                $(this).attr("checked",true);
                            }
                        });
                        return false;
                    }
                }
              
            }

            function checkboxOnclick(checkbox){
                if(checkbox.checked == true){
                    $("#default_ShowPic"+nowIndex).val('1');
                }
                else{
                    $("#default_ShowPic"+nowIndex).val('0');
                }
            }
            function Add(){
                if($(".sucai_img_list").find("li").length>=7)
                {
                    alert("对不起！,每个主多条图文的子多条图文最多只能7个!");
                    return;
                }
                num++;

                var defaultType=jQuery("#<%=this.RadioButtonList1.ClientID %> :radio[checked]").val();
                var keytype=$("#keytype"+num).val();
               
               jQuery("#mybox1").append('<iframe class="editArea-ifrm" frameborder="no" border="0" src="KS.TuWenList.aspx?action=sucai&sucaiId=<%=SuCaiId%>" style="width:100%" name="iframemain'+num+'" id="iframemain'+num+'"> </iframe>');
               
           $("#tiaoshu").val(num);
           var str='<li id="appmsg_item'+num+'" num="'+num+'" >'
			       +'<div class="left_img_box_list">'
				   +'<div class="add_sc_img">'
                   +'<div class="add_sc_img_right">'
				   +'<img src="/SysImg/nopic.gif"  id="img_box'+num+'"/>'
				   +'</div>'
				   +'<div class="add_sc_img_left'+num+'" id="defaulttitle'+num+'">'
				   +'<a class="title_add_sc">标题</a>'
				   +'</div>'
				   
				   +'<div class="clear"></div>'
				   +'</div>'
				   +'<div class="sc_default_title_bg">'
				   +'<a href="javascript:del('+num+')" class="order_by_delete"><img src="/admin/weixin/images/scdelete.png" /></a>'
				   //+'<a title="上移" href="javascript:;" onclick="pic_move(this,1);">上移</a>'
				   +'</div>'
			       +'</div> '
                   +' <input type="hidden" name="default_title'+num+'" id="default_title'+num+'" />'
                   +' <textarea id="default_content'+num+'" name="default_content'+num+'" cols="20" rows="2" style="display:none"></textarea>'
                   +' <input id="keytype'+num+'"  name="keytype'+num+'" value="1" type="hidden"  />'

                   +' <input type="hidden" name="default_url'+num+'" id="default_url'+num+'"/>'
                   +' <textarea name="default_intro'+num+'" id="default_intro'+num+'" style="display:none"></textarea>'
                   +' <input type="hidden" name="default_img'+num+'" id="default_img'+num+'"  />'
                   +' <input type="hidden" name="default_type'+num+'" id="default_type'+num+'" value="'+defaultType+'" />'
                   +' <input type="hidden" name="default_ID'+num+'>" id="default_ID'+num+'" value="0"/>'
                   +' <input type="hidden" name="default_ShowPic'+num+'" value="0" id="default_ShowPic'+num+'" />'
		           +' <input type="hidden" name="default_tuwen'+num+'" id="default_tuwen'+num+'" />'
                   +' <input type="hidden" name="default_shop'+num+'" id="default_shop'+num+'" />'

                  +' <input id="TxtTuWenID'+num+'" type="hidden"  name="TxtTuWenID'+num+'"/>'
                  +' <input id="TxtShopID'+num+'" type="hidden"  name="TxtShopID'+num+'"/>'
                  +'<textarea id="ShowTxtTuWen'+num+'" style="width:300px;height:200px;display:none"></textarea>'
                  +'<textarea id="ShowTxtShop'+num+'" style="width:300px;height:200px;display:none"></textarea>'
                  +'</li>';
         
           $(".sucai_img_list").append(str);
           initialSelect();
          
       }
      
       function del(id){
          // $("#tiaoshu").val(num);
           $("#appmsg_item"+id).remove();

       }
       function deletesucai(id,sucaiid){
           $.ajax({
               url: "KS.Picmsg.aspx?action=deletechild&childID="+sucaiid,
               context: document.body,
               type:"get",
               success: function (data) {
                   if (data =='ok') {
                       $("#appmsg_item"+id).remove();
                       KesionJS.Alert("删除成功");
                   } else {
                       KesionJS.Alert("删除失败");
                   }
               }
           });
       }
       function pic_move(obj,fx){
           var box_d=jQuery(obj).parent().parent().parent();
           var box_fx='';
           if (fx==1)
           {
               box_fx=box_d.prev();
           }
           else
           {box_fx='';}
           if ( box_fx.length > 0 ) {
               if(fx==1) box_fx.before(box_d.clone());
               if(fx==1 )box_d.remove();
           }


       }
       //设置编辑器内容
       function setcontent(){
           if (parseInt($("#default_type"+nowIndex).val())==0){
               $("#default_content"+nowIndex).val(editor.getContent());
           }
       }
       function out_title(){
           var titile=jQuery("#<%=this.TxtTitle.ClientID %>").val();
           $("#defaulttitle"+nowIndex).html(titile);
           $("#default_title"+nowIndex).val(titile);
           setcontent();
       }
       function out_pic(){
           var pic=jQuery("#<%=this.TxtPic.ClientID %>").val();
           $("#img_box"+nowIndex).attr("src",pic); 
           $("#default_img"+nowIndex).val(pic);
           setcontent();
       }
     
       function out_intro(){
           var info=jQuery("#<%=this.Txtinfo.ClientID %>").val();
           $("#default_intro"+nowIndex).val(info);
           setcontent();
       }
       function out_url(){
           var url=jQuery("#<%=this.TxtUrl.ClientID %>").val();
           $("#default_url"+nowIndex).val(url);
           setcontent();
       }
       function check(){
           setcontent();
           for(var i=0;i<=num;i++)
           {
               var title=$("#default_title"+i).val();
               var pic=$("#default_img"+i).val();
               var info=$("#default_intro"+i).val();
               var url=$("#default_url"+i).val();
               var content=$("#default_content"+i).val();
               var default_type=parseInt($("#default_type"+i).val());

               if (title!=undefined && title==''){
                   if (default_type==1){
                       KesionJS.Alert("请选择图文消息"+i);
                   }else{
                       KesionJS.Alert("请输入标题","$('#<%=TxtTitle.ClientID%>').focus();");
                   }
                   return false;
               }
               if(pic!=undefined && pic==''){
                   KesionJS.Alert("请上传图片","$('#<%=TxtPic.ClientID%>').focus();");
                   return false;
               }
               if (default_type==0){

                   if(content!=undefined && content==''){
                       KesionJS.Alert("请输入内容","editor.focus();");
                       return false;
                   }
                   if(info!=undefined && info==''){
                       KesionJS.Alert("请输入摘要","$('#<%=Txtinfo.ClientID%>').focus();");
                       return false;
                   }
                   if(url!=undefined && url==''){
                       KesionJS.Alert("请输入链接","$('#<%=TxtUrl.ClientID%>').focus();");
                       return false;
                   }

               }

           }
           return true;
           
       }

       function clear(nowIndex){
           //alert(nowIndex);
           $("#defaulttitle"+nowIndex).html('标题');
           $("#img_box"+nowIndex).attr("src",'/SysImg/nopic.gif'); 
           $("#default_img"+nowIndex).val('');  
           $("#default_url"+nowIndex).val('');
           $("#default_intro"+nowIndex).val('');
           $("#default_title"+nowIndex).val('');
           $("#default_content"+nowIndex).html('');
          
             
           jQuery("#<%=this.TxtUrl.ClientID %>").val('');
           jQuery("#<%=this.Txtinfo.ClientID %>").val("");
           jQuery("#<%=this.TxtTitle.ClientID %>").val('');
           jQuery("#<%=this.TxtPic.ClientID %>").val('');
           editor.setContent('');

       }
       function clearziyi(nowIndex)
       {
           $("#defaulttitle"+nowIndex).html('标题');
           $("#img_box"+nowIndex).attr("src",'/SysImg/nopic.gif'); 
           $("#default_img"+nowIndex).val('');  
           $("#default_title"+nowIndex).val('');
         
       }
        </script>
   
      <script>

          $(function () {
             $(".menu1box ul li").click(function () {
                 var k = $(this).index();
                 aa(k);
             });
         });
          function aa(k) {
             
            // alert(nowIndex);
              // return;
              var sucaiId=$("#default_ID"+nowIndex).val();

             $(".menu1box ul li").each(function (index, domEle) {
                 $(this).attr("class", "");
             });
             $(".menu1box ul li").each(function (index, domEle) {
                 if (k == index) {
                     if (k == 0) {
                         $("#keytype"+nowIndex).val('1');
                       

                         $('#iframemain'+nowIndex).attr('src', 'KS.TuWenList.aspx?action=sucai&sendid='+nowIndex+'&sucaiId='+sucaiId);
                     }  else if (k == 1) {
                         $("#keytype"+nowIndex).val('2');
                        // alert("dd=="+nowIndex);
                          $('#iframemain'+nowIndex).attr('src', 'KS.ShopList.aspx?action=sucai&sendid='+nowIndex+'&&sucaiId='+sucaiId);
                     }
              
                 $(this).attr("class", "hit");
             }
              });

            }


      </script>

    <div class="prompt_bg" style="display:none" id="Loading">
		 <div class="prompt_box">
		 <p><img src="/admin/weixin/images/loading.gif" />正在同步，请耐心等待...</p>
		 </div>
	 </div>
 <asp:Panel ID="Panel1" runat="server">

     <div  style="border-bottom:#E5E5E5 solid 1px;" class="myTitle toptitle">添加/编辑素材</div>
     <div style="overflow:hidden; padding-top:20px;">
     <input id="tiaoshu" type="hidden" name="tiaoshu" value="<%=num%>"/>
        <div class="left_img_box">
           
		  <ul class="sucai_img_list">
           
		   <li class="xz" id="appmsg_item0" num="0">
			   <div class="left_img_default">
			      <div class="default_img_box">
				     <img src="/SysImg/nopic.gif" id="img_box0"/>
					 <span class="sc_default_title" id="defaulttitle0">标题</span>
				  </div>
                   
			   </div>
                <input id="keytype0" type="hidden"  name="keytype0" value="<%=keytype%>"/>
               <input type="hidden" name="default_title0" id="default_title0" value="<%=title %>"/>
               <textarea id="default_content0" name="default_content0" cols="20" rows="2" style="display:none"><%=Content %></textarea>
               <input type="hidden" name="default_url0" id="default_url0" value="<%=Url %>"/>
               <textarea name="default_intro0" id="default_intro0" style="display:none"><%=Intro %></textarea>
               <input type="hidden" name="default_img0" id="default_img0" value="<%=PicUrl %>"/>
               <input type="hidden" name="default_type0" id="default_type0" value="<%=Type %>"/>
                <input type="hidden" name="default_ID0" id="default_ID0" value="<%=id%>"/>
                <input type="hidden" name="default_ShowPic0" id="default_ShowPic0" value="<%=Show_cover_pic%>"/>
                 <input type="hidden" name="default_tuwen0" id="default_tuwen0" />
                <input type="hidden" name="default_shop0" id="default_shop0" />
                <input id="TxtTuWenID0" type="hidden"  name="TxtTuWenID0"/>
                <input id="TxtShopID0" type="hidden"  name="TxtShopID0"/>
                <textarea id="ShowTxtTuWen0" style="width:300px;height:200px;display:none"></textarea>
                <textarea id="ShowTxtShop0" style="width:300px;height:200px;display:none"></textarea>
		   </li>
		   <%=GetModifystr(num,SuCaiId)%>

		   
		  </ul>
		  <a class="add_one" href="javascript:Add();">
               <i class="add_one_css">增加一条</i>
          </a>
		</div>

        <div class="sc_right">
            <div style="border-bottom: 1px solid #eee;">
          <asp:RadioButtonList ID="RadioButtonList1" runat="server" onclick="showStatus();" RepeatDirection="Horizontal" >
              <asp:ListItem Value="0" Selected>自定义</asp:ListItem>
              <asp:ListItem Value="1">系统</asp:ListItem>
          </asp:RadioButtonList>
            </div> 
            <div id="xitongdetail" style="display:none">
                  
                 <div class="tabs1" style="border:none; margin-top:0;">
                                <div class="menu1box">
                                    <ul class="menu1">
                                        <li class="hit">
                                            <i class="fa fa-newspaper-o"></i>
                                            <a href="javascript:;" >图文</a>
                                        </li>
                                    
                                        <%if (Utils.GetSysInfo("//sysinfo/model/mall").ToString().ToLower() == "true"){ %>
                                        <li>
                                            <i class="fa fa-photo"></i>
                                            <a href="javascript:;">商品</a>
                                        </li>
                                        <%} %>
                                        <div class="clear"> </div>
                                    </ul>
                                </div>
                                <div class="main1box" style="min-height:auto;">
<!--                                      <div class="main">-->
                                        <dt class="mbimg" style="display:block; " id="mybox1">
                                            <iframe class="editArea-ifrm" frameborder="no" border="0" src="KS.TuWenList.aspx?action=sucai&sucaiId=<%=SuCaiId%>" style="width:100%" name="iframemain0" id="iframemain0"> </iframe>
                                        </dt>
                                     <!-- </div>-->
                                    </div>
                                </div>

            </div>
            <div id="zidingyideatil">
            <div class="title">
            <span class="txt" id="titename">标题：</span>
	        <asp:TextBox ID="TxtTitle" runat="server" CssClass="inp245" width="350px" onkeydown="out_title();" onKeyUp="out_title();" ></asp:TextBox>   

            </div>
                 <div class="content">
              <span class="txt">内容：</span>
   
              <asp:TextBox ID="TxtContent" runat="server" TextMode="MultiLine" Width="100%" Height="220px"  ></asp:TextBox>
                
                   <% Kesion.APPCode.EditorAPI.EchoEditor("editor", this.TxtContent.ClientID, "Common");%>
	           
            </div>
            <div class="info">
              <span class="txt">摘要：</span>
               <asp:TextBox ID="Txtinfo" runat="server" TextMode="MultiLine" Height="80px" Width="100%" style="background-color: #fff;"  MaxLength="200"  onKeyUp="out_intro();" onkeydown="out_intro();"></asp:TextBox>   
            </div>
            <div class="default"><span class="txt">选择图片：</span>
    <table cellspacing="0" cellpadding="0"><tr><td>         
        <asp:TextBox ID="TxtPic" runat="server"  CssClass="inp245" Width="350px" onfocus="out_pic();" onkeydown="out_pic();" onKeyUp="out_pic();" ></asp:TextBox>
&nbsp; <input type="button" class="button" onclick=SelectFiles('<%=this.TxtPic.ClientID %>',0,'','out_pic()'); value="选择图片"/></td>
      <%if (Kesion.BLL.KSSecurity.CheckCommonUploadPower()){ %>
          <td style="padding-left:4px;padding-top:15px; vertical-align:middle;*padding-top:12px; "> <%=Kesion.APPCode.UploadAPI.EchoUpload("classpic",this.TxtPic.ClientID,150) %></td>
            <%} %>
           <td><img id="show<%=TxtPic.ClientID %>" src="<%=TxtPic.Text%>"  height="30" style="border:1px solid #f1f1f1;" onerror="this.src='../../sysimg/nopic.gif'"/></td>
          </tr>
         </table>
                                                
         
            
            
       <br /><br />
          <asp:CheckBox ID="CheckBox1" runat="server" onclick="checkboxOnclick(this)" style=" margin-right:5px;"/>封面图片显示在正文中
                
         </div>

            <div class="url">
          <span class="txt">链接地址：</span>
          <asp:TextBox ID="TxtUrl" runat="server" CssClass="inp245" Width="350px" onKeyUp="out_url();" onkeydown="out_url();"></asp:TextBox>
         </div>

		</div>
          <asp:Button ID="Btn_Save" runat="server" Text="保存" OnClick="Btn_Save_Click"  OnClientClick="return(check());" CssClass="sc_save_button"/>
        </div>
   </div>
       </asp:Panel>
<div class="content_wrap1">
    <asp:Panel ID="Panel2" runat="server">
        <div class="search" style="margin-left: 2.4%; width:40%;">
            <asp:TextBox ID="TxtKey" runat="server" class="search_box"></asp:TextBox>
            <asp:Button ID="buttonsearch" runat="server" Text=" " OnClick="buttonsearch_Click" class="search_btn"/>
          

        </div>
<%-- <asp:Button ID="HqButton" runat="server" Text="获取素材"  CssClass="add_sc_button"  OnClick="HqButton_Click" style=" margin-left:10px;margin-right: 2.4%; background:#BCBCBC;"/>--%>
    <div style="float:right;margin-right: 20px;"><asp:Button ID="TbButton" runat="server" Text="同步素材"  CssClass="add_sc_button" OnClientClick="return(TongBu())" style=" margin-left:10px;" />
     <asp:Button ID="Button1" runat="server" Text="+添加素材" OnClick="Button1_Click" CssClass="add_sc_button" style=" margin-left:10px;"/>
     <asp:Button ID="Btn_Del" runat="server" Text="删除素材"  OnClientClick="if (GetIDS('del')){return true}else{return false}" OnClick="Btn_Del_Click"  CssClass="add_sc_button" style=" margin-left:0;" />
     <span class="quanxuan" style="float:right; height:29px; line-height:29px;"><input type="checkbox" name="chkall" id="chkall" onClick="CheckAll(this.form);" style=" vertical-align:middle;"/>全选</span>
	 <div class="clear"></div>
	</div>
		<div class="clear"></div>
       <div class="sc_show_conlist">
        <asp:Repeater ID="list" runat="server" >
          <HeaderTemplate>
           <ul class="sc_ul_con">
              </HeaderTemplate>
            <ItemTemplate>
     
	    <li class="sc_ul_con_li">
		
		  <div class="op_sc_con">

                <a style="text-align:center; position:relative; height:37px;"><input type="checkbox"  name="ids" id="ids" value="<%#Eval("id") %>" style="vertical-align:middle; position:absolute; top:11px; left:40%; right:40%;" /></a>

				<a href="KS.Picmsg.aspx?action=modify&sucaiId=<%#Eval("id") %>"><i class="sc_bianjian"></i></a>
				<a href="KS.Picmsg.aspx?action=delete&sucaiId=<%#Eval("id") %>" style="border: none;margin-left: -2px;"><i class="sc_shanchu"></i></a>

				<div class="clear"></div>
		  </div>
		  <div class="sc_ultop_con">
		    <div class="sc_ultime"><%#Eval("AddTime")%></div>
			<div class="sc_ulimgt">
			   <img src="<%#Convert.ToString(Eval("picurl").ToString())==string.Empty?"/SysImg/nopic.gif":Eval("picurl").ToString() %>" />
			   <div class="sc_ulimg_t"><a href="#"><%#Eval("title")%></a></div>
			</div>
		  </div>
		  <div class="bottom_big_box">
			  <%#GetChildSu(Utils.StrToInt(Eval("id").ToString())) %>
			  
		  </div>
		  
		</li>
                </ItemTemplate>
              <FooterTemplate>  
                         	<div class="clear"></div>
	                         </ul>
                                    <div class="clear"></div>
                                    <div class="norecord" style="display:<%#bool.Parse((list.Items.Count==0).ToString())?" ":"none "%>; text-align:center;">
                                        <span style="text-align:center">
                                            暂无素材
                                        </span>
                                    </div>
                                </FooterTemplate>
   </asp:Repeater>
   </div>

   <KS:Page ID="Page1" runat="server" />
</asp:Panel>

</div>

</div>

</asp:Content>

