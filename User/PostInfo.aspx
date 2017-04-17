<%@ Page Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_Post" Title="Untitled Page" Codebehind="PostInfo.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
 <div class="r_tybox nomar">

    <% Kesion.APPCode.EditorAPI.EchoHead();%>

    <asp:Panel ID="Panel1" runat="server" Width="100%">
    <input type="hidden" id="classid" name="classid" value="0"/>
       <div class="r_title"><h4>ѡ�񷢲���Ŀ</h4></div>
    <table class="border" cellspacing="2" cellpadding="1" width="96%" align="center" border=0>
    
      <tr>
          <td style="padding-left:5px;height:320px;border-bottom:0px;">
             <style>
                  #loadclass li.select_list{width:190px; background:#fff; text-align:left;margin-left:20px; float:left;height:300px; overflow-x:hidden; overflow-y:auto;border:1px solid #d0d6dc}
				  #loadclass li.select_list li{ cursor:pointer; padding-left:20px;height:30px; line-height:30px;}
				  #loadclass li.select_list li.curr{ background:#E6F2FB}
				  #loadclass li.select_list li:hover{ background:#f4f7f9;}
				  .hover_tips_cont{ padding-left:10px;}
              </style>
            <div>
                <ul id="loadclass"></ul>
            </div>
          </td>
      </tr>
      <tr>
          <td style="padding-left:15px;">
             <div style="margin-top:10px;display: block; clear:both;" class="tips_choice">
                    <span class="tips_zt"></span>
                    <dl class="hover_tips_cont">
                        <dt id="commodityspan">
                            <span style="color:#F00;">��ѡ����Ŀ</span>
                        </dt>
                        <dt class="current_sort" style="font-weight:bold;display: none;" id="commoditydt">����ǰѡ�����Ŀ�ǣ�</dt>
                        <dd id="commoditydd"></dd>
                    </dl>
                </div>
          </td>
      </tr>
 
      <tr>
          <td style="height:50px;padding-left:25px;"><input type="button" onclick="return(checknext())"class="button" value=" ��һ�� " /></td>
      </tr>
    </table>

       

    <script>
        $(document).ready(function () {
            loadClass(0,1);
        });
        function loadClass(id, depth) {
            jQuery.get("../plus/ajaxs.ashx", { a: "getinputclass", rnd:Math.random(),classid: id },
				  function (data) {
				      $("#loadclass").find("li").each(function () {
				          if ($(this).attr("depth")> depth) {
				              $(this).remove();
				          }
				      });
				      if (data != '') {
				          $("#loadclass").append(data);
				        //  autoIframeHeight();
				      }
				  });
        }
        function changeclass(id, parentid, depth) {
            $("#commodityspan").hide();
            $("#commoditydt").show();
            $("#commoditydd").show();

            $("#classid").val(id);
            $("#loadclass").find("li[depth=" + depth + "]").removeClass("curr");
            $("#loadclass").find("li[value=" + id + "]").addClass("curr");
            loadClass(id, depth);
            var tips = '';
            $("#loadclass").find("li.curr").each(function () {
                if (tips == '') {
                    tips = $(this).html();
                } else {
                    tips +=" -> "+ $(this).html();
                }
            });
            $("#commoditydd").html(tips);
        }
        function checknext() {
            var classid = $("#classid").val();
            if ($("#m" + classid)[0] != undefined) {
                KesionJS.Alert("��ѡ������Ҫ�������࣡");
                return false;
            }
            location.href = 'PostInfo.aspx?classId='+classid;
        }
    </script>
    </asp:Panel>

    <asp:Panel ID="Panel2" runat="server" Width="100%" Visible="false">
       <script type="text/javascript" src="<%=ResolveUrl("~/ks_inc/DatePicker/WdatePicker.js") %>"></script>
       <script>
        function GetKeyTags() {
            var text = escape(jQuery('#Title').val());
            if (text != '') {
                jQuery('#KeyTags').val('���Ե�,ϵͳ�����Զ���ȡtags...').attr("disabled", true);
                jQuery.get("../plus/ajaxs.ashx", { a: "GetTags", text: text },
				  function(data) { jQuery('#KeyTags').val(unescape(data)).attr("disabled", false); });
            } else { KesionJS.Alert('�Բ���,�����������!',"jQuery('#Title').focus();"); }
        }
        //�����ĵ�
        function LoadItemInfo(objId, classID, channelId, infoId) {
            $.ajax({
                type: "POST",
                url: "/plus/Ajaxs.ashx",
                data: "classid=" + classID + "&a=LoadItemInfo&channelid=" + channelId + "&infoid=" + infoId,
                success: function (data) {
                    $("#" + objId).empty().append(unescape(data));
                }
            });
        }
   
    </script>
         <KS:ModelJS ID="ModelJS1" runat="server" />
       <%if (ChannelID >= 2)
      {%>
             <script>
                 var post_params = { "username": "<%=Kesion.Publics.KSCMS.GetCookie("User","username") %>", "password": "<%=Kesion.Publics.KSCMS.GetCookie("User","password") %>", "CreateThumbs": 1, "ChannelID": 2, "AutoRename": 4, "addwatermark": "1", "fieldid": "-1", "upbyswf": 1 };
             </script>
             <%}%>
         <%=JSStr %>

        <asp:Repeater ID="RepeatFieldGroup" runat="server" OnItemDataBound="RepeatFieldGroup_ItemDataBound">
               <ItemTemplate>
                     <table class="border" cellspacing="2" cellpadding="1" width="98%" align=center border=0>
                      <tr class="title">
                         <td align="left" colspan="2"><%# Eval("GroupName") %></td>
                       </tr>

                   <asp:Repeater ID="List" runat="server">
                    <ItemTemplate>
                         <KS:UserFields ID="Fields1" ModelID='<%# ChannelID%>' ClassID='<%# ClassID%>' FieldID='<%# Eval("Name")%>' ParentFieldID='<%# Eval("ParentFieldID")%>' FieldAlias='<%# Eval("FieldAlias")%>' FieldType='<%# Eval("FieldType")%>'
                         Disabled='<%# Eval("Disabled")%>' FieldWidth='<%# Eval("FieldWidth")%>' FieldHeight='<%# Eval("FieldHeight")%>' Options='<%# Eval("options")%>'
                         Tips='<%# Eval("Tips")%>' DefaultValue='<%# Eval("DefaultValue")%>' ToolBar='<%# Eval("ToolBar")%>' ContributionItem='<%# Eval("ContributionItem") %>' MustFillItem='<%# Eval("MustFillItem")%>'  runat="server">
                         </KS:UserFields>
                 
                        </ItemTemplate>
                    <FooterTemplate>
             
                    </FooterTemplate>
                </asp:Repeater>


               </ItemTemplate>
            </asp:Repeater>

               <tr class="tdbg">
	                <td class="lefttd" style="text-align:right;">�� �ۣ�</td>
	                <td class="list_right_box">
                      <asp:TextBox ID="TxtReadPoint" runat="server" CssClass="textbox" Text="0" style="text-align:center;width:50px;" />
                        <%=Kesion.Cache.MyCache.GetCacheConfig(50) %> <span class="tips">����Ķ�����Ϊ "<span style="color:red">0</span>"��
	                 </td>
                </tr>
         
              <tr class="tdbg">
	                <td class="lefttd" style="text-align:right;">״ ̬��</td>
	                <td class="list_right_box">
        <asp:RadioButtonList ID="RdbVerify" runat="server" RepeatDirection="horizontal" RepeatLayout="flow">
                         <asp:ListItem Value="0" Selected>Ͷ��</asp:ListItem>
                         <asp:ListItem Value="2">�ݸ�</asp:ListItem>
                        </asp:RadioButtonList>
	                 </td>
                </tr>
         </table>

   <asp:HiddenField ID="hidVerify" runat="server" Value="0" />
        <div class="cz_btn" align="center" style="padding-bottom:20px;">
                 <span><asp:Button ID="BtPostInfo" CssClass="button" runat="server" Text="ȷ������" OnClick="BtPostInfo_Click" />
             </span>
         </div>

      </asp:Panel>  
  
  </div>
</asp:Content>

