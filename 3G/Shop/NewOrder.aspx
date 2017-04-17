<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewOrder.aspx.cs" Inherits="Kesion.NET.WebSite.G3.Shop.NewOrder" %>
<%@ Import Namespace="Kesion.Cache" %>
document.write('<div class="new_mess" style="display:none">');
document.write('	<div class="new_img"><img id="orderface" src="/UploadFiles/user/592/201661811571X8XEB2DE7R.jpg"></div>');
document.write('    <div class="new_txt"></div>');
document.write('</div>');

setInterval("showNewOrder()",5000);
function showNewOrder()
{
   jQuery.ajax({
            type: "POST",
            url: "<%=MyCache.GetCacheConfig(0)+MyCache.GetCacheConfig(73) %>/shop/neworder.aspx",
            data: "action=check&rnd=" + Math.random(),
            success: function (data) {
               if (data!=''){
                  var arr=data.split('|');
                  $("#orderface").attr("src","<%=MyCache.GetCacheConfig(0) %>UploadFiles/avatar/"+arr[0]+"_60x60.jpg");
                  $(".new_txt").html("最新订单来自于会员"+arr[1]+" "+arr[2]);
                  $(".new_mess").show(); 
                  setTimeout("$('.new_mess').hide('fast')",2000);
                }
               
            }
        });

   
}
