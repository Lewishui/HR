<%@ Page Title="图文" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.Mobile.Admin.Weixin.KS_GetTuWen" Codebehind="KS.GetTuWen.aspx.cs" %>

<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="Kesion.BLL" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <link href="/admin/weixin/images/style.css" rel="stylesheet" />

<script>
    $(function () {
        initialSelect();
    })

    function initialSelect() {
        $('.style-inner  li').click(function () {
            $(this).addClass('current').siblings().removeClass('current');
        })
    }

</script>
    <script>
        jQuery(document).ready(function () {
            var channelid = $("#channelid").val();
            var classid = $("#classid").val();
            DoClasstype(channelid);
            DoClass(channelid, classid);
        });
        function DoClasstype(id) { 
            var chanelid = id;
            var key = jQuery("#<%=this.TxtKey.ClientID %>").val();
            if (chanelid != '0') {
                $.ajax({
                    url: "KS.GetTuWen.aspx?action=getclass&channelid=" + chanelid,
                    context: document.body,
                    type: "GET",
                    success: function (data) {
                        $("#getclassid").show();
                        $("#getclassid").html(data);
                        var classid = jQuery("#classid").val();
                       // alert(classid);
                        loaddata('infolist', key, chanelid, classid, 1);

                    }
                });

            } else 
            {
                $("#getclassid").hide();
                loaddata('infolist', key, chanelid, 0, 1);
            }
            
        }

        function DoClass(id, classid) {
            var chanelid = id;
            var key = jQuery("#<%=this.TxtKey.ClientID %>").val();
            if (chanelid != '0') {
                $.ajax({
                    url: "KS.GetTuWen.aspx?action=getclass&channelid=" + chanelid + "&classid=" + classid,
                    context: document.body,
                    type: "GET",
                    success: function (data) {
                        $("#getclassid").show();
                        $("#getclassid").html(data);
                        loaddata('infolist', key, chanelid, classid, 1);
                    }
                });

            } else {
                $("#getclassid").hide();
                loaddata('infolist', key, chanelid, 0, 1);
            }

        }
    </script>
    <script>
        function onserch() {
            var key = jQuery("#<%=this.TxtKey.ClientID %>").val();
            var channelid = jQuery("#channelid").val();
            var classid = jQuery("#classid").val();
           // alert(classid);
            loaddata('infolist', key,channelid,classid,1);

        }
        function loaddata(action, key, channelid, classid, page) {
            $.ajax({
                url: "KS.GetTuWen.aspx?action=" + action + "&rnd=" + Math.random() + "&key=" + key + "&channelid=" + channelid + "&classid=" + classid + "&page=" + page,
                context: document.body,
                type: "GET",
                success: function (data) {
                    if (action == "infolist") {
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
        title = $('.style-inner  li.current').find("input[name='tuwentitle']").val();
        var defaultpic = $('.style-inner  li.current').find("input[name='tuwendefaultpic']").val();

        if (v == '' || v==undefined) KesionJS.Alert('请选择<%=MyCache.GetCacheModel(ChannelId,5)%>!');
        else {
            <%if (!string.IsNullOrEmpty(KSCMS.S("fieldID").Trim())) { %>
            top.frames["main"]["iframemain<%=KSCMS.S("id")%>"].document.getElementById("<%=KSCMS.S("fieldID").Trim() %>").value = v;
            <%}%>
            $(top.frames["main"]["iframemain<%=KSCMS.S("id")%>"].document.getElementById("mycontentpic")).html("<ul class='style-inner'><li>" + $('.style-inner  li.current').html() + "</li></ul>");
           // alert(defaultpic);

          
            <%if (KSCMS.S("action") == "keyword" || KSCMS.S("action") == "attention" || KSCMS.S("action") == "qunfa" || KSCMS.S("action") == "AutomaticReply")
              { %>
            top.frames["main"].document.getElementById("TxtTuWenID").value = v;
            var str = "<ul class='style-inner'><li>" + $('.style-inner  li.current').html() + "</li></ul>";
           $(top.frames["main"].document.getElementById("MyTuwendetail")).html(str);
           $(top.frames["main"].document.getElementById("ShowTxtTuWen0")).val(str);

            <% }
             if (KSCMS.S("action") =="sendmsg")
              {%>
          
        
            top.frames["main"].document.getElementById("TxtTuWenID<%=KSCMS.S("id")%>").value = v;
            var str = "<ul class='style-inner'><li>" + $('.style-inner  li.current').html() + "</li></ul>";
           
           $(top.frames["main"].document.getElementById("ShowTxtTuWen<%=KSCMS.S("id")%>")).val(str);


            <%}
               if (KSCMS.S("action")=="sucai")
              {%>
           
            <%if (!string.IsNullOrEmpty(KSCMS.S("fieldID").Trim())) { %>
            top.frames["main"]["iframemain<%=KSCMS.S("nowIndex")%>"].document.getElementById("<%=KSCMS.S("fieldID").Trim() %>").value = v;
            <%}%>
            $(top.frames["main"]["iframemain<%=KSCMS.S("nowIndex")%>"].document.getElementById("mycontentpic")).html("<ul class='style-inner'><li>" + $('.style-inner  li.current').html() + "</li></ul>");
            top.frames["main"].document.getElementById("TxtTuWenID<%=KSCMS.S("nowIndex")%>").value = v;
            var str = "<ul class='style-inner'><li>" + $('.style-inner  li.current').html() + "</li></ul>";
            $(top.frames["main"].document.getElementById("ShowTxtTuWen<%=KSCMS.S("nowIndex")%>")).val(str);
            top.frames["main"].document.getElementById("default_title<%=KSCMS.S("nowIndex")%>").value = title;
             top.frames["main"].document.getElementById("default_img<%=KSCMS.S("nowIndex")%>").value = defaultpic;
             top.frames["main"].document.getElementById("default_tuwen<%=KSCMS.S("nowIndex")%>").value = v;
             top.frames["main"].document.getElementById("defaulttitle<%=KSCMS.S("nowIndex")%>").innerText = title;
             top.frames["main"].document.getElementById("img_box<%=KSCMS.S("nowIndex")%>").src = defaultpic;
             $(top.frames["main"].document.getElementById("default_content<%=KSCMS.S("nowIndex")%>")).val(str);
            top.frames["main"].document.getElementById("keytype<%=KSCMS.S("nowIndex")%>").value =1; 
           
            

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
.button{background:#69b7e4;border: none;color: #fff;width: 120px;height: 35px;font-size: 16px;display: block;margin:10px auto 0;}
</style>
<div class="content-inner">

	<div class="table">
		<table>
			<tr>
				<td>
					  <div class="style-column" id="tempsList">
					
					  	
					  	<div class="vtab tempsbox chooses">
							<div  class="searcher">
                               <%=GetModel("infolist") %>
                               <span id="getclassid"> </span>
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
<%-- <KS:Page ID="Page1" runat="server" />--%>


</asp:Content>



