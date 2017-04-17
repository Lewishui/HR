//分页滚动加载
function LoadPage(currPage) {
    if (currPage > parseInt(pageCount) && parseInt(pageCount)>0) {
		$("#pagelistend").show().html("已全部加载完毕！");
        return;
    }else if (parseInt(pageCount)<=0){
		$("#pagelistend").hide();
		 return;
	}
    var str = "";
    if (postParam.indexOf("=") != -1 || postParam=="") {
        str = "page=" + currPage + "&" + postParam + "&rnd=" + Math.random();
    } else {
        str = "rnd-"+Math.random()+",p-" + currPage + "," + postParam
    }
	//alert(postUrl+"=="+str);
 	  jQuery.ajax({
            type: "get",
            url: postUrl,
            data: str,
            success: function (data) {
            //   alert(data)
                if (data == "") {                    
				   $("#pagelistend").show().html("已全部加载完毕！");
                } else {
                    
                    $("#pagelist").append(data);
				 }
            }
        });
	}
	var currPage=1;
	$(function(){
	  if (parseInt(pageCount)>1){
		  $("#pagelistend").show().html("滚动加载更多...");
	  }
	  $(window).scroll(function() {
		  //当内容滚动到底部时加载新的内容
		  if ($(this).scrollTop() + $(window).height() + 20 >= $(document).height() && $(this).scrollTop() > 20) {
		      //当前要加载的页码		      
			  currPage++;
			  LoadPage(currPage);
		  }
	  });
});