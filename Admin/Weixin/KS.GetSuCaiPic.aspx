<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.Mobile.Admin.Weixin.KS_GetSuCaiPic" Codebehind="KS.GetSuCaiPic.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" runat="server">
  <div class="content-area">
     <script type="text/javascript">
      
         function HuoQu() {
             //获取
             jQuery(parent.document).find("#ajaxmsg").toggle();
             $.ajax({
                 url: "KS.Picmsg.aspx?action=huoqu&rnd=" + Math.random(),
                 context: document.body,
                 type: "get",
                 success: function (data) {
                     // jQuery('#ajaxmsg', window.parent.document).toggle();
                     if (data == 'ok') {
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

         <asp:Button ID="TbButton" runat="server" Text="获取图片"  CssClass="add_sc_button" OnClientClick="return(TongBu())" style=" margin-left:10px;" />

    <asp:Panel ID="Panel1" runat="server">
        <asp:Repeater ID="list" runat="server" >
          <HeaderTemplate>
            <ul class="sc_images_content_list">
          </HeaderTemplate>
          <ItemTemplate>
              <li>
		  <div class="sc_images_content_box">
		   <div class="sc_images_content_top">
		     <img src="" />
			 <span class="sc_images_content_lable"><input type="checkbox"  class="change_box" id="imgno1"/><label class="sc_images_content_title" for="imgno1">aaaaa</label></span>
		   </div>
		   <div class="sc_images_content_bottom">2015-12-3</div>
		  </div>
		</li>
              </ItemTemplate>
                 <FooterTemplate>
                  </ul>
        
               <div class="norecord" style="display:<%# bool.Parse((list.Items.Count==0).ToString())?"":"none"%>">
                <span  style="text-align:center">
                  暂无图片！
                </span>
               </div> 
        </FooterTemplate>
         </asp:Repeater>

    </asp:Panel>

  </div>

</asp:Content>
