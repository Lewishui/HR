﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.Mobile.Admin.Weixin.KS_SuCaiList" Codebehind="KS.SuCaiList.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>

<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
  <div class="content-area">
    <link href="/admin/weixin/images/style.css" rel="stylesheet" />
    <script>
        function SelectClassPage(FieldID) {
            top.openWin("素材", "weixin/KS.GetSuCai.aspx?action=<%=action%>&id=<%=sendId%>&fieldID=" + FieldID, false, 1000, 500);
    }


</script>
    <script type="text/javascript">
        $(function () {




            var tempstr = $("#ShowTxtSuCai<%=sendId%>", parent.document).val();
            //alert(tempstr);
            if (tempstr.length > 10) {
                $("#mysucaicontentpic<%=sendId%>").html(tempstr);
            }


        });
        //iframe 自适应高度
        $(window.parent.document).find("#iframemain<%=sendId%>").load(function () {
            // alert(12);
            autoIframeHeight();
        });

        function autoIframeHeight() {
            var main = $(window.parent.document).find("#iframemain<%=sendId%>");
            //alert($(document).height());
            var thisheight = $(document).height() + 0;
            if (thisheight < 300) thisheight = 300;
            main.height(thisheight);
            $(window.parent.document).find("#iframemain<%=sendId%>").parent().height($(window.parent.document).find("#main").contents().find("body").height() + 30); //设置Iframe外层高度

        }
		</script>  
<asp:Panel ID="Panel11" runat="server">

 <div class="tab_cont_cover jsMsgSendTab" data-index="0" style="display: block;">
                    <div class="media_cover">
                     
                        <div style="display:none"><asp:TextBox ID="txtSite" runat="server"  CssClass="inp245" Width="50%" ></asp:TextBox></div>

			            <span class="create_access" id="mysucaicontentpic<%=sendId%>"  onclick="SelectClassPage('<%=this.txtSite.ClientID%>');">
                                <i class="icon36_common add_gray"></i>
                                 <input type="button" class="button" onMouseOver="this.className='button_on';" onMouseOut="this.className='button';"/>
                                <strong>从素材中选择</strong>
                           
			            </span>
                    </div>
			  
			    </div>
<div class="tuwenbutton"> <asp:Button ID="Button3" runat="server" Text="保存" onclick="Button3_Click"   Visible="false"/></div>

</asp:Panel>

<asp:Panel ID="Panel2" runat="server">
<div id="msgSender_media_1_10"><div class="appmsg " style=" padding:0px; margin-top:0;" >
    <div class="appmsg_content" >
            <div class="appmsg_thumb_wrp"><img src="<%=DefaultPic %>" alt="" class="appmsg_thumb"></div>
            <div class="article_info">
				<h4 class="appmsg_title js_title"><%=title %></h4>
				<div class="appmsg_info">
					<em class="appmsg_date"><%=addDate %></em>
				</div>
				<p class="appmsg_inforin"><%=Intro%></p>
			</div>

          <%=GetDeteleButton()%>
			<div style="clear:both;"></div>
            
            
        
    </div>
    
    
</div>

<div style="clear:both;"></div>
</div>
</asp:Panel>

</div>

</asp:Content>