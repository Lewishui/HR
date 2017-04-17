<%@ Page Title="素材" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.Mobile.Admin.Weixin.KS_GetSuCai" Codebehind="KS.GetSuCai.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="Kesion.BLL" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <link href="/admin/weixin/images/style.css" rel="stylesheet" />
<script>
    $(function () {
        // alert(top.frames["main"].document.body);
        // alert($(top.document.getElementById('main').contentWindow.document.body).html());

        initialSelect();
    })

    function initialSelect() {
        $('.style-inner  li').click(function () {

            $(this).addClass('current').siblings().removeClass('current');
        })
    }

</script>
    <script>
        function onserch() {
            var key = jQuery("#<%=this.TxtKey.ClientID %>").val();
          
            loaddata('sucailist', key, 1);

        }
        function loaddata(action, key, page) {
            // alert("ddd");

            $.ajax({
                url: "KS.GetSuCai.aspx?action=" + action + "&rnd=" + Math.random() + "&key=" + key + "&page=" + page,
                context: document.body,
                type: "GET",
                success: function (data) {
                    // alert(data);
                    if (action == "sucailist") {
                        //alert(data);
                        $("#LoadData").html(data);

                        initialSelect();
                    }
                }
            });
        }

    </script>
<script>
    function SetClassUrl() {
        var title = '';
        var v = '';

        v = $('.style-inner  li.current').find("input[name='titleid']").val();
     


        if (v == '') KesionJS.Alert('请选择素材');
        else {
            top.frames["main"]["iframemain<%=KSCMS.S("id")%>"].document.getElementById("<%=KSCMS.S("fieldID").Trim() %>").value = v;
            $(top.frames["main"]["iframemain<%=KSCMS.S("id")%>"].document.getElementById("mysucaicontentpic<%=KSCMS.S("id")%>")).html("<ul class='style-inner'><li>" + $('.style-inner  li.current').html() + "</li></ul>");
           
            
          
            <%if (KSCMS.S("action") == "qunfa" || KSCMS.S("action") == "attention" || KSCMS.S("action") == "keyword" || KSCMS.S("action") == "AutomaticReply")
              { %>

            top.frames["main"].document.getElementById("TxtSuCaiID").value = v;
            var str = "<ul class='style-inner'><li>" + $('.style-inner  li.current').html() + "</li></ul>";
           
            $(top.frames["main"].document.getElementById("ShowTxtSuCai0")).val(str);

            <% }
             if (KSCMS.S("action") =="sendmsg")
              {%>
            top.frames["main"].document.getElementById("TxtSuCaiID<%=KSCMS.S("id")%>").value = v;
            var str = "<ul class='style-inner'><li>" + $('.style-inner  li.current').html() + "</li></ul>";

            $(top.frames["main"].document.getElementById("ShowTxtSuCai<%=KSCMS.S("id")%>")).val(str);



            <%}
               if (KSCMS.S("action")=="sucai")
              {%>
            <%}
              
              %>

            <%if (KSCMS.S("fieldID")!=""){ %>
            top.box.close();
            <%}else{%>
            <%} %>
        }
    }
</script>
<style type="text/css">

.style-inner .style-inner-item{padding: 15px;border-radius: 0;border: 1px solid #ddd;}
.style-inner .style-versions { text-align:left;}
.table td, .table th { border:none;}
.article_title{ font-weight:bold; color:#666;}
.font_color{ color:#AD6E1D !important;}
.vtab .searcher {margin-bottom: 10px;border-bottom: 1px dashed #ddd;padding-bottom: 15px;}
.style-column{ border-bottom:1px dashed #ddd;}
.button{background:#69b7e4;border: none;color: #fff;width: 120px;height: 35px;font-size: 16px;display: block;margin: auto;}
</style>
<div class="content-inner">
	<div class="table">
		<table>
			<tr>
				<td>
					  <div class="style-column" id="tempsList">
					
					  	
					  	<div class="vtab tempsbox chooses">
							<div  class="searcher">
                             
         
                                <asp:TextBox ID="TxtKey" runat="server" class="searchbox"></asp:TextBox>
                                <input id="Button2" type="button" value=""   onclick="onserch()"  class="searchbtn"/>
                            </div>
							
							<div class="cb h5"></div>
							
							<div class="cb vtab-content" id="styleList">
                         
                            <ul class="style-inner clearfix item" id="LoadData">
                                <%=initialList()%>
                            </ul>
						    </div>
					    
					    </div>
					  </div>
				</td>
				
			</tr>
		</table>
	</div>
	
</div>
     <Input class="button" type="button" value=" 确 定 " name=Submit  onclick="SetClassUrl();"> 
</asp:Content>