//微店JS

var installDir3G="/3g/";   //3G的安装目录
$(function(){
     $.ajax({
            type: "POST",
            url: installDir3G+"agent/handler.aspx",
            data: "action=checkShopManage",
            success: function (isShow) {
			    if (isShow=="true"){
				 $("#showShopManage").show();
				 $(".footer").find("ul").addClass("ul1");
				}else{
                 $("#showShopManage").hide();
				  $(".footer").find("ul").addClass("ul2");
			   }
            }
        });
  });
﻿