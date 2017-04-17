<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Course.Admin.Yun.KS_YunSystemInfo" Codebehind="KS.YunSystemInfo.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.Cache" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" runat="server">
    <style type="text/css">
.listinfo li{height:23px;line-height:23px;background:url(images/37.gif) no-repeat 0px 7px;padding-left:10px}
.bborder{border:2px solid #cccccc }

#uptips{margin:10px}
.line{margin:0 auto;border-bottom:1px solid #efefef}
.c{background:#FBFDFF;border-top:2px solid #E1EEFF;
	height:28px;
	line-height:28px;
	letter-spacing:2px;
	font-weight:bold;
	border-bottom:1px solid #E1EEFF;
}
.line li{height:23px;line-height:23px}
.line .l{width:40%;float:left;}
.line .r{width:50%;float:left}
.clear{clear:both;height:1px;}


</style>
 <script>
        function InnerHtml(i,msg) {
            eval("d"+i+".innerHTML = '"+msg+"';");
            document.getElementById('uptips').scrollTop = (i+1)*23;
        }
</script>
<div id="manage_top" class="toptitle menu_top_fixed">

       <KS:TopNav ID="TopNav1" runat="server" Text="KESION云管理" Visible="false" />

   


</div>
<div class="menu_top_fixed_height"></div> 
 <div class="content-area">
 
    <div class="navbox-tiles">
          
 <%if (KSCMS.S("action") == "begindown")
     {
         %>
       <div id="downstep1" style="font-size:20px;margin:40px;text-align:center;padding-top:70px;font-weight:bold;color:green;">
          <img src="../../sysimg/default/loading.gif" /> 正在初始化下载任务，请稍候......
       </div>
       <div id="downstep2" style="display:none;margin:40px;text-align:center;">
          <div style="font-size:16px;height:35px;line-height:35px;font-weight:bold" id="per">下载进度：0%</div> 
          <div style="margin:0 auto;width:700px;border:1px dashed #ccc;background:#fff;height:20px">
             <div id="bar" style="width:0px;height:20px;background:#0094ff"></div>
          </div>
           <div style="height:40px;font-size:16px;line-height:40px">
           补丁包大小：<span id="totalSize" style="color:brown;font-weight:bold">0</span> KB 当前已下载：<span id="currSize" style="color:brown;font-weight:bold">0</span> KB
           </div>
       </div> 
       
       <div style="text-align:center;display:none" id="downstep3">
        <input type='button' onclick="location.href='KS.YunSystemInfo.aspx?action=beginUpdate&id=<%=Utils.StrToInt(KSCMS.S("id"))%>    ';" value=" 立即更新 " class="button"/>
        <input type="button" value=" 暂不升级 " class="button" onclick="location.href='KS.YunSystemInfo.aspx?action=showupdateinfo';"/>
       </div>

        <script>
            var intervalID;
            function DownLoadTask() {
                jQuery.ajax({
                    type: "POST",
                    url: "KS.YunSystemInfo.aspx",
                    data: "action=dobegindown&id=<%=Utils.StrToInt(KSCMS.S("id"))%>",
                    success: function (data) {
                        clearInterval(intervalID);
                        if (data == "success") {
                            $("#downstep3").show();
                        } else {
                            alert("下载失败");
                           // KesionJS.Alert('下载失败!'+data, "location.href='<%=KSCMS.GetInstallDir()+MyCache.GetCacheConfig(5)%>/Yun/KS.YunSystemInfo.aspx?action=showupdateinfo';");
                            //alert("下载失败");
                            //alert('下载失败!' + data);
                        }
                    }
                });
            }
            function GetProcess() {
                $("#downstep2").show();
                $("#downstep1").hide();
                jQuery.ajax({
                    type: "POST",
                    url: "KS.YunSystemInfo.aspx",
                    data: "action=getprocess&rnd="+Math.random(),
                    success: function (data) {
                        var arr = data.split('|');
                        $("#totalSize").html((arr[0]/1024).toFixed(0));
                        $("#currSize").html((arr[1]/1024).toFixed(0));
                        var w = parseFloat(arr[1]) / parseFloat(arr[0]);
                        if (w < 1) {
                            $("#per").html("下载进度：" + (w * 100).toFixed(2) + " %");
                        } else {
                            $("#per").html("任务完成：100 %");
                        }
                        $("#bar").html('').width(w * 750);
                    }
                });
            }
            function Initialize() {
                DownLoadTask();
                intervalID = setInterval('GetProcess()', 1000);
            }

            $(document).ready(function () {
                Initialize();
            });

        </script>
        <%
     }
     else if (KSCMS.S("action") == "beginUpdate")
     {
         beginUpdate();
         
     }else
     {%>
      <%=sb.ToString()%>
  <%} %>

  

 
 </div>
</div> 
</asp:Content>
