<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/MasterPage.master"  Inherits="Kesion.NET.Mobile.Admin.Weixin.SendGroup" Codebehind="KS.SendGroup.aspx.cs" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.BLL" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Weixin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
     <link href="/admin/weixin/images/style.css" rel="stylesheet" />
    
<KS:TopNav ID="TopNav1" runat="server" /> 
<div class="content-area">
 <script>
     jQuery(document).ready(function () {
         var sex = $("#drsex").val();
         var type = $("#drType").val();
       
          DoSex(sex);
         DoType(type);
        // DoSendType();
     });
     function DoSex(id) {
       
                $.ajax({
                    url: "KS.SendGroup.aspx?action=getuser&sexid=" + id,
                    context: document.body,
                    type: "GET",
                    success: function (data) {
                    
                    }
                });

           

     }
     function DoType(id) {
         $.ajax({
             url: "KS.SendGroup.aspx?action=getgroup&type=" + id,
             context: document.body,
             type: "GET",
             success: function (data) {

                 $("#getsex").html(data);


             }
         });
     }
    
    </script>

  
 <%--     <script>
          $(function () {

              $(".group_send_box ul  li").click(function () {
                  var k = $(this).index();
                  $(".group_send_box u  li").each(function (index, domEle) {
                      $(this).attr("class", "");
                  });
                  $(".group_send_box u  li").each(function (index, domEle) {
                      if (k == index) {
                          if (k == 0) {
                              $("#sendtype").val('0');
                          } else if (k == 1) {
                              $("#sendtype").val('1');
                          } else if (k == 2) {
                              $("#sendtype").val('2');

                          }
                          $(this).attr("class", "change");
                      }
                  });
              });
          });
</script>--%>

    <script>
        $(function () {
            aa(<%=sendtype%>);
            $(".group_send_box ul li").click(function () {
                 var k = $(this).index();
                 aa(k);
             });
         });
         function aa(k) {

             $(".group_send_box ul li").each(function (index, domEle) {
                 $(this).attr("class", "");
             });
             $(".group_send_box ul li").each(function (index, domEle) {
                 if (k == index) {
                     $("#sendtype").val(k);

                     if (k == 0) {
                         //  $(this).attr("class", "hit");

                     } else if (k == 1) {
                         //$(this).attr("class", "hit");

                     } else if (k == 2) {
                         // $(this).attr("class", "hit");

                     }
                     $(this).attr("class", "change");
                 }
             });

         }

         function sendCheck() {
             $("#aspnetForm").attr("target", "hidframe");
             $("#<%=this.setbtn.ClientID%>").attr("value", "发送中...");
             $("#<%=this.setbtn.ClientID%>").post();
         }
      </script>
 <asp:Panel ID="Panel1" runat="server" >
     <iframe   src="about:blank" style="display:none" name="hidframe" id="hidframe"> </iframe>
     <div class="openKey" style="margin: 10px 20px 10px 20px;font-weight: normal;line-height: 30px;">
         群发消息规则：根据微信官方规定，订阅号每天可以群发1条信息，服务号每月可以群发4条信息，发送大于规定的信息数，用户将接收不到！
         <p class="tishi_send_group">注意：群发对象是按全部用户：订阅号不可用，服务号认证后可用；
         群发对象是按分组选择：订阅号和服务号认证后均可用。 </p>
     </div>
	 <input id="TxtTuWenID" type="hidden"  name="TxtTuWenID"/>
	 <input id="TxtShopID" type="hidden"  name="TxtShopID"/>
	 <textarea id="ShowTxtTuWen0" style="width:300px;height:200px;display:none"></textarea>
	 <textarea id="ShowTxtShop0" style="width:300px;height:200px;display:none"></textarea>
	 <input id="TxtSuCaiID" type="hidden" name="TxtSuCaiID" />
	 <textarea id="ShowTxtSuCai0" style="width:300px;height:200px;display:none"></textarea>
	 <input type="hidden" id="sendtype" name="sendtype" value="<%=sendtype %>" />
     <div class="group_send_dx"> 
	        
			<a href="KS.SendGroup.aspx?action=look" class="chack_recode">查看群发记录</a>
			
			群发对象：
                    
			<span> <select id="drType" name="drType"  onchange="DoType(this.value)">
			  
				<%if(WeiXinType==1){ %>
				<option value="1" >按全部用户</option>
				<option value="2">按分组选择</option>
			   <%}
				  else if (WeiXinType == 0)
				{%>
				   <option value="2">按分组选择</option> 
			   <% }%>
					

			</select>

			</span>
			<span class="txt" id="getsex">
			
			</span>
                 

     </div>
	 <div class="group_send_box">
							
	
	  <ul class="group_send_ul">
		  <li class="change"> <a href="javascript:;" onclick="$('#mybox1').show();$('#mybox2').hide();" >
			<i class="sm_tab wz"></i>文字 </a></li>
		  <li>
			 <a href="KS.SuCaiList.aspx?action=qunfa&qunfaId=<%=QunFaID%>"  onclick="$('#mybox2').show();$('#mybox1').hide();" target="iframemain0" >  <i class="sm_tab sc_tw"></i> 素材</a></li>
		  <li>
			 <a href="KS.TuWenList.aspx?action=qunfa&qunfaId=<%=QunFaID%>"  onclick="$('#mybox2').show();$('#mybox1').hide();" target="iframemain0" > <i class="sm_tab tw2"></i>  图文</a></li>
		   <%if (Utils.GetSysInfo("//sysinfo/model/mall").ToString().ToLower() == "true"){ %>
		  <li>
			 <a href="KS.ShopList.aspx?action=qunfa&qunfaId=<%=QunFaID%>"  onclick="$('#mybox2').show();$('#mybox1').hide();" target="iframemain0" >  <i class="sm_tab sp"></i> 商品</a>
	
		  </li>
			  <%} %>
		 <div class="clear"></div>
	   </ul>
	   <div class="group_send_con">
		 <div class="group_sc" id="mybox1"  style="display:block">
			  <asp:TextBox ID="TxtContent" runat="server" TextMode="MultiLine" Width="99%" Height="220px"  style="background-color: #fff;border: 1px solid #ddd" ></asp:TextBox>
					
	<%--     <% Kesion.APPCode.EditorAPI.EchoEditor("editor", this.TxtContent.ClientID, "Basic");%>--%>
			   
	
		 </div>
		 <div class="group_sc" id="mybox2" style="display:none">
			
				  <iframe class="editArea-ifrm" frameborder="no" border="0" src="KS.SuCaiList.aspx?action=qunfa&qunfaId=<%=QunFaID%>" style="width:100%;" name="iframemain0" id="iframemain0"> </iframe>
	
		 </div>
	   </div>
	  </div>
	  <div class="group_send_bottom">
	         <%=GetQunFaMessage(SendCount,WeiXinType) %>
			 <span class="group_send_botton">
				 <asp:Button ID="setbtn" runat="server" Text="群发" OnClientClick="return(sendCheck())"  class="send_button" OnClick="setbtn_Click"   />
			 </span>
			
	  </div>
  </asp:Panel>
<asp:Panel ID="Panel2" runat="server">
  <div class="groupmanage qf">
    <table style="width:98%;margin: 10px 1%;border: 1px solid #e7e7eb;text-align:center;" cellpadding="0" cellspacing="0">
      <asp:Repeater ID="QunFaList" runat="server" >
        <HeaderTemplate>
          <tr class="RepeaterGroup">
            <th width="5%">序号</th>
            <th width="10%">类型</th>
            <th width="20%">标题</th>
            <th width="20%">群发对象</th>
            <th width="5%">状态</th>
            <th width="15%">消息ID</th>
            <th width="15%">群发日期</th>
          </tr>
        </HeaderTemplate>
        <ItemTemplate>
          <tr style='background-color: <%#(Container.ItemIndex%2==0)?"#fff":"#F3F5F7"%>'>
            <td><%# QunFaList.Items.Count+1%></td>
            <td><%#GetSendType(Eval("sendtype").ToString())%></td>
            <td><%#GetSendContent(Eval("content").ToString(),Eval("SuCaiID").ToString(),Eval("tuwenid").ToString(),Eval("shopid").ToString(),Eval("sendtype").ToString())%></td>
            <td><%# Eval("MassObject") %></td>
            <td style="color:red;">
              <%# Eval("massStatus") %> 
            </td>
              <td>
              <%# Eval("MassMessageID") %> 
            </td>
              <td>
              <%# Eval("AddDate") %> 
            </td>
          </tr>
        </ItemTemplate>
          <FooterTemplate>
				 <tr width="100%" style="display:<%# bool.Parse((QunFaList.Items.Count==0).ToString())?"":"none"%>">
						<td class="empty" colspan="9" style="padding: 10px;text-align: center;">
						  暂无记录
						</td>
				  </tr>
				  </table>
			 </FooterTemplate>

      </asp:Repeater>
    </table>
  </div>
  <KS:Page ID="Page1" runat="server" />
  

</asp:Panel>
  </div>
</asp:Content>