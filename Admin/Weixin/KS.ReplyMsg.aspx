<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Admin/MasterPage.master"  Inherits="Kesion.Weixin.WebSite.ReplyMsg" Codebehind="KS.ReplyMsg.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>
 <%@ Import Namespace="System.Data" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<link href="/admin/weixin/images/style.css" rel="stylesheet" />

<KS:TopNav ID="TopNav1" runat="server" />
<div class="content-area">
   	<div class="tab_regmessage">
           <ul>
           <li class="hit" style=" border-radius: 5px 0px 0px 5px;">
           <a href="KS.ReplyMsg.aspx"  >
              关注回复  </a>
           </li>  
               
          <li >
           <a href="KS.AutomaticReplyMsg.aspx"  >
              消息自动回复  </a>
           </li> 
                <li  style="    border-radius: 0px 5px 5px 0px;">
           <a href="KS.keyword.aspx" >
              关键词自动回复  </a>
           </li>   
		   <div class="clear"></div>                       
           </ul>  

   	</div>
    <div class="clear"></div>
 
   <script>
              jQuery(document).ready(function () {
                  showStatus();
              });

              function showStatus() {
                  var checkrad = jQuery("#<%=this.RdbStatus.ClientID %> :radio[checked]").val();
                  if (checkrad == "1") {
                      jQuery("#detail").show();
                      jQuery("#visiblebutton").hide();
                      // jQuery("#weixinstatus").css("display", "");
                  } else {

                      jQuery("#detail").hide();
                      jQuery("#visiblebutton").show();

                  }


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
                         $('#iframemain0').attr('src', 'KS.TuWenList.aspx?action=attention&keyId=<%=keyId%>');


                    } else if (k == 1) {
                        $('#mybox2').show();
                        $('#mybox1').hide();
                  
                     } else if (k == 2) {
                         $('#iframemain0').attr('src', 'KS.ShopList.aspx?action=attention&keyId=<%=keyId%>');

                     }
                     else if (k == 3) {
                         $('#iframemain0').attr('src', 'KS.SuCaiList.aspx?action=attention&keyId=<%=keyId%>');

                     }
                     $(this).attr("class", "hit");
                 }
             });

         }


      </script>
    <div class="openKey" style="margin-right: 20px;margin-left: 10px;margin-bottom: 0;">
        <span class="txt" style="float:left;">开启关注时回复:</span>
          <input type="hidden" name="keyid" id="keyid" value="<%=keyId%>">        
          <asp:RadioButtonList ID="RdbStatus" RepeatDirection="Horizontal" runat="server" style=" margin-right:5px;" onclick="showStatus()">
            <asp:ListItem Value="1" style=" margin-right:10px;">开启</asp:ListItem>
            <asp:ListItem Value="0" Selected="True"> 关闭</asp:ListItem>
             </asp:RadioButtonList>
           <div class="clear"></div>
     </div>


 <div id="detail" style="display:none">
     <asp:Panel ID="Panel1" runat="server" >
      <input id="keytype" type="hidden" value="<%=keytype%>"/>
      <input id="TxtTuWenID" type="hidden"  name="TxtTuWenID"/>
      <input id="TxtShopID" type="hidden"  name="TxtShopID"/>
      <textarea id="ShowTxtTuWen0" style="width:300px;height:200px;display:none"></textarea>
      <textarea id="ShowTxtShop0" style="width:300px;height:200px;display:none"></textarea>
      <input id="TxtSuCaiID" type="hidden" name="TxtSuCaiID" />
	 <textarea id="ShowTxtSuCai0" style="width:300px;height:200px;display:none"></textarea>
        <div class="phone_right">
                        
                        <div class="cz_list">
                            <div class="tabs1">
                                <div class="menu1box">
                                    <ul class="menu1">
                                       <li class="hit">
                                            
                                            <a href="KS.TuWenList.aspx?action=attention&keyId=<%=keyId%>"  onclick="$('#mybox1').show();$('#mybox2').hide();" target="iframemain0" >
                                             <i class="sm_tab tw2"></i>   图文
                                            </a>
                                        </li>
                                     <li>
                                           
                                            <a href="javascript:;" onclick="$('#mybox2').show();$('#mybox1').hide();" >
                                           <i class="sm_tab wz"></i>     文字
                                            </a>
                                        </li>
                                        <%if (Utils.GetSysInfo("//sysinfo/model/mall").ToString().ToLower() == "true"){ %>
                                        <li>
                                           
                                           
                                            <a href="KS.ShopList.aspx?action=attention&keyId=<%=keyId%>" onclick="$('#mybox2').hide();$('#mybox1').show();"  target="iframemain0">
                                            <i class="sm_tab sp"></i>     商品
                                            </a>
                                        </li>
                                        <%} %>
                                        <li >
                                          
                                            <a href="KS.SuCaiList.aspx?action=attention&keyId=<%=keyId%>"  onclick="$('#mybox1').show();$('#mybox2').hide();" target="iframemain0" >
                                           <i class="sm_tab tw2"></i>       素材
                                            </a>
                                        </li>
                                        <div class="clear">
                                        </div>
                                    </ul>
                                </div>
                                <div class="main1box">
                                    <div class="main">
                                        <dt class="mbimg" style="display:block; " id="mybox1">
                                            <iframe class="editArea-ifrm" frameborder="no" border="0" src="KS.TuWenList.aspx?action=attention&keyId=<%=keyId%>" style="width:100%;" name="iframemain0" id="iframemain0" > </iframe>
                                        </dt>
                                         <dt id="mybox2" class="com_form msgBox" style="display:none;margin-bottom: 10px;">
                                            
                                            <div><asp:TextBox ID="TxtContent" runat="server" TextMode="MultiLine" Width="98%" Height="200px"  style="background: #fff;background-color: #fff;border: 1px solid #ddd;" ></asp:TextBox></div>
                                         </dt>
                                      



                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
           <div class="opr1">
               <Br /><br />
                      <asp:Button ID="ButtonAdd" runat="server" Text="保存" class="ct-btn blue" OnClick="ButtonAdd_Click" />

            </div>

      </asp:Panel>
 
       
</div>
    <br /><Br />
<div id="visiblebutton" style="display:none">
     <asp:Button ID="Button1" runat="server" Text="保存"  class="ct-btn blue" style="float:left" OnClick="Button1_Click" />
     </div>
 
</div>

</asp:Content>