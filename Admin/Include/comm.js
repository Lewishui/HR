$(function() {

		$(".content-area").each(function() {
			var footPage = $(this).find("div").hasClass("footer_page");
			var footButton = $(this).find("div").hasClass("main-button");
			if(footPage==true){
				$(this).addClass('pageBlank');
			};
			if(footButton==true){
				$(this).addClass('footBlank');
			}
		});
		
		$(".property").hover(function(){
			$(this).find(".propertyBox").show();
			
		},function(){
			$(this).find(".propertyBox").hide();
		});
		

});

function doNone(evt) {
    var e = (evt) ? evt : window.event; //判断浏览器的类型，在基于ie内核的浏览器中的使用cancelBubble
    if (window.event) {
        e.cancelBubble = true;
    } else {
        e.stopPropagation();
    }
}
