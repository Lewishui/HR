function selectAddress(addressId){
	     if (addressId!=undefined && addressId!=0){
		    $('#showData .con').html($('#addressarea'+addressId).html()+$('#address'+addressId).html());
		 }else{
			 if ($("input[name=addressId][value!=0]").length>0){
				$('#showData .con').html('<a href="javascript:;" class="add-link">选择收货地址 +</a>'); 
			 }else{
		       $('#showData .con').html('<a href="javascript:;" class="add-link">增加收货地址 +</a>');
			 }
		 }
}
//订单信息页，加载配送方式
function showDeliveryList(from) {
    var addressId = $("input[name=addressId]:checked").val();
    if (from == 1) {  //手机调用
	    selectAddress(addressId);
	    if (addressId!=undefined){
			$('.ShowAddress .close').parents('.ShowAddress').removeClass('show');
			$('.gbstyle').css({overflow:'auto'});
		}
	}
    if (addressId == undefined && $("#bookcode").val() == undefined) {
        $("#ShowDeliveryList").html("<div style='padding:10px;background:#fef6d3;border:1px solid #fdc08e;margin-top:10px; font-family:SimSun'><font color=red>系统提示:</font>您还没有填写收货地址，请先完善并保存您的收货信息。</div>");
        OrderCalculat();
    } else {
       $("#ShowDeliveryList").html("<div style='padding:10px;background:#ffffee;margin:5px 2px;border:1px #f9c943 solid;font-weight:bold'><img src='sysimg/loading.gif' align='absmiddle'/>系统正在加载配送地址,请稍候...</div>");
        var provinceId = $("#provinceid_" + addressId).val()
        var cityId = $("#city_" + addressId).val();
        var countyId = $("#countyid_" + addressId).val();
        if (provinceId == undefined || provinceId == '0') {
            provinceId = $("#ProvinceID option:selected").val();
        }
        if (cityId == undefined || cityId == '0') {
            cityId = $("#CityID option:selected").val();
        }
        if (countyId == undefined || countyId == '0') {
            countyId = $("#CountyID option:selected").val();
        }
        jQuery.get(appurl+"plus/ajaxs.ashx", { a: "loaddeliverlist",from:from, provinceid: provinceId, cityId: cityId, countyId: countyId },
           function (data) {
               var d = data.split("@@@");
               //计算订单费用
               defaultFreight = d[0];
			   if (d[1]=='0'){
				 $("#ShowDeliveryList").html("<div style='padding:10px;background:#fef6d3;border:1px solid #fdc08e;margin-top:10px; font-family:SimSun'>对不起，您的收货地址所在仓库缺货！</div>");
			   }else{
                 $("#ShowDeliveryList").html(d[1]);
			   }
               OrderCalculat();
           })
    }

}
function OrderCalculat() {
    var freight = 0;  //运费
    var deliveryId = jQuery("input[name=DeliveryID]:checked").val();
    freight = jQuery("#Freight_" + deliveryId).val();
    if (freight == undefined) freight = defaultFreight;
    jQuery("#orderFreight").html(freight);
    //alert(i);
    //是否自提
    var isZT = jQuery("#isZT_" + deliveryId).val();
    if (isZT == 1 && $("#ShowStore").find("li").length > 0) {
        $("#ShowStore").show();
    } else {
        $("#ShowStore").hide();
    }

    //付款方式优惠
    var paymentId = jQuery("input[name=PayMentID]:checked").val();
    var goodsMoney = parseFloat(jQuery("#goodsMoney").html());
    var payDiscount = goodsMoney - goodsMoney * parseFloat(jQuery("#Discount_" + paymentId).val()) / 100;
    jQuery("#payDiscount").html(payDiscount.toFixed(DecimalPlaces));

    //发票费用
    var IsInvoice = $("input[name=invoiceId]:checked").val();
    var taxes = 0;
    if (parseInt(IsInvoice) > 0) {
        taxes = parseFloat(jQuery("#Taxes").html());
        $("#showTaxes").show();
    } else {
        $("#showTaxes").hide();
    }

    //实际金额：商品金额-支付方式优惠+运费+税金
    var orderTotalPrice = (goodsMoney - payDiscount + parseFloat(freight) + taxes);
    jQuery("#orderTotalPrice").html(orderTotalPrice.toFixed(DecimalPlaces));
    if (orderTotalPrice == 0)
        jQuery("#sorderTotalPrice").hide()
    else
        jQuery("#sorderTotalPrice").show()

    showCouponMsg = false;
    checkCoupon(); //检查是否有录入优惠券
	loadFrontPrice();

}
function checkOrder() {
    var pid = $("input[name='PayMentID']:checked").val();
    if ($("#TypeFlag_" + pid).val() == 0) {
        if ($("#payId").val() == 0) {
            alert('请选择支付平台！');
            $("#payId").focus();
            return false;
        }
    }

    if ($("#bookcode").val() == undefined) {
        var addrId = jQuery("input[name=addressId]:checked").val();
        if (addrId == 0 || addrId == undefined) {
            alert('请先完善并保存收货地址！');
            return false;
        }
    }
    var deliveryId = jQuery("input[name=DeliveryID]:checked").val();
    if (deliveryId == undefined) {
        alert('请选择配送方式！');
        return false;
    }

    if (jQuery("#deliveryDate option:selected").val() == "0" && jQuery("#specifiedDate").val() == "") {
        jQuery("#specifiedDate").focus();
        alert('请输入具体送货日期!');
        return false;
    }
    return true;
}

function SetCoupon() {
    if ($("#showcoupon").is(":hidden")) {
        $("#showcoupon").show();
    }
    else {
        $("#showcoupon").hide();
    }
}

/* *
 * 优惠券及显示订单金额等
 */
var selectedCoupon=0
var CouponNum=0;
var showCouponMsg=true;
var facevalue = 0;
var facevalue1 = 0;

function checkCoupon(){
	showResultMoney(1,1);
}
//清空session的优惠券号 1 红包 0 优惠券
function resetCouponNum(CouponType){
	  var url = '/plus/ajaxs.ashx';
	  $.get(url,{a:"cleancouponnum",CouponType:CouponType},function(s){ 
		if (CouponType==1){															
	     $("#redpacket option").eq(0).attr("selected",true);
		}else{
	     $("#coupon option").eq(0).attr("selected",true);
	     $("#couponnum").val('');
		}
	   // alert(s);
	  });
}
function updateOrderFee(returnStr, t, v) {
	var goodsMoney=0;
	var maxdiscount=0;
	var availablemoney=0;
	var minAmount=0;
	var rarr=null;
	var str = '';
	var name = '';
	if (t == 1) name = '红包';
	else name = '优惠券';
	if (t == 1 && v == 0) {
	    $("#ORDER_COSTS1").html(str);
	    showResultMoney(t, v);
	}
	else if (t == 2 && v == 0) {
	    $("#ORDER_COSTS").html(str);
	    showResultMoney(t, v);
	}
	//alert(t+"==="+v);
	if (returnStr!='' && returnStr !=null)
	{
		  rarr=returnStr.split('|');
		  if (rarr.length<=1)
		  {
		      if (showCouponMsg){
		          if (returnStr.indexOf("登录后才可以使用"+name)!=-1){ 
				      resetCouponNum(t);
		              KesionJS.Alert(returnStr,"showuserlogin()");
		          }else{
		              KesionJS.Alert(returnStr);
		          }
		          return;
		      }
		  } else {
		      if (t == 2 || t == 3) {
		          facevalue = parseFloat(rarr[0]).toFixed(DecimalPlaces);
		      }
		      else { facevalue1 = parseFloat(rarr[0]).toFixed(DecimalPlaces); }
			  minAmount=parseFloat(rarr[1]).toFixed(DecimalPlaces);
			  maxdiscount=parseFloat(rarr[2]);
			  availablemoney = parseFloat(rarr[3]).toFixed(DecimalPlaces);
			  goodsMoney=parseFloat($("#goodsMoney").html());  // 查找只含商品价格
			  if (parseFloat(goodsMoney)<parseFloat(minAmount))
			  {
				if (showCouponMsg)
				KesionJS.Alert('对不起,该'+name+'最小订单商品金额(不含运费)为'+priceunitsymbol+minAmount+ ' '+priceunit+'才可使用!' );
				else
				KesionJS.Alert('对不起,'+name +'['+rarr[4]+']最小订单商品(不含运费)总金额为'+priceunitsymbol+minAmount+ ' '+priceunit+'才可使用!' );
				if (t == 1){
				$("#ORDER_COSTS1").html('');
				}else{
				$("#ORDER_COSTS").html('');
				}
				resetCouponNum(t);
			  } else if (availablemoney <= 0) {
			      if (showCouponMsg){ 
				   KesionJS.Alert('对不起,该优惠券已用完!');
				   resetCouponNum(t);
				  }
			  } else {
			      if (v != 0 && t == 2 || t == 3) {
			          
			              if (maxdiscount == 0) {
							    if ($("#repacketfacemoney")[0]!=undefined){
									var cmoney=parseFloat($("#repacketfacemoney").html());
									if (facevalue+cmoney>=goodsMoney){
										 KesionJS.Alert('对不起，订单金额太小，不能同时使用优惠券和红包!');
										 resetCouponNum(0);
										 return;
									}
								  }
							  
			                  if (showCouponMsg) KesionJS.Alert('恭喜,该优惠券可抵用' + priceunitsymbol + facevalue + ' ' + priceunit + '!');
			              } else {
			                  var allowmoney = parseFloat(goodsMoney) * (maxdiscount / 100);                         //按百分比得可抵扣金额
			                  if (allowmoney > availablemoney) {
			                      allowmoney = availablemoney;
			                  }
							  
							   if ($("#repacketfacemoney")[0]!=undefined){
									var cmoney=parseFloat($("#repacketfacemoney").html());
									if (allowmoney+cmoney>=goodsMoney){
										 KesionJS.Alert('对不起，订单金额太小，不能同时使用优惠券和红包!');
										 resetCouponNum(0);
										 return;
									}
								  }
								  
							  
			                  if (availablemoney == facevalue || availablemoney - allowmoney != 0) {
			                      if (showCouponMsg) KesionJS.Alert('恭喜,该优惠券是按订单总金额的' + maxdiscount + '%抵用,最多不超过' + priceunitsymbol + facevalue + priceunit + ',当前可用余额' + priceunitsymbol + parseFloat(availablemoney).toFixed(DecimalPlaces) + priceunit + '。在本订单中可抵用' + priceunitsymbol + parseFloat(allowmoney).toFixed(DecimalPlaces) + ' ' + priceunit + ',使用后该优惠券还剩' + priceunitsymbol + (availablemoney - allowmoney).toFixed(DecimalPlaces) + priceunit + '!');
			                  } else {
			                      facevalue = allowmoney; KesionJS.Alert('恭喜,该优惠券还可抵用' + priceunitsymbol + parseFloat(allowmoney).toFixed(DecimalPlaces) + ' ' + priceunit + ',使用后该优惠券还剩' + priceunitsymbol + (availablemoney - allowmoney).toFixed(DecimalPlaces) + priceunit + '!');
			                  }
			                  facevalue = allowmoney;
			              }
						  
						  
						
						  
			              str = '<br />使用优惠券抵销：<font color=blue>' + priceunitsymbol + '<span id="couponfacemoney">' + parseFloat(facevalue).toFixed(DecimalPlaces) + '</span></font>' + priceunit;
			              $("#ORDER_COSTS").html(str);
			              showResultMoney(t, v);  //显示最终价格信息
			          
			         
			      }
			      else {	
				      if ($("#couponfacemoney")[0]!=undefined){
				        var cmoney=parseFloat($("#couponfacemoney").html());
					    if (facevalue1+cmoney>=goodsMoney){
						  	 KesionJS.Alert('对不起，订单金额太小，不能同时使用优惠券和红包!');
							 resetCouponNum(1);
							 return;
						}
					  }
			          KesionJS.Alert('恭喜,该红包可抵用' + priceunitsymbol + facevalue1 + ' ' + priceunit + '!');
			          str = '<br />使用红包抵销：<font color=blue>' + priceunitsymbol + '<span id="repacketfacemoney">' + parseFloat(facevalue1).toFixed(DecimalPlaces) + '</span></font>' + priceunit;
			          $("#ORDER_COSTS1").html(str);
			          showResultMoney(t, v);  //显示最终价格信息
			      }
			  }
			  
	  }
	}
	
	
	
}

//显示付定金
function loadFrontPrice(){
	//==========================判断是否支持仅付定金 begin==================================　
     var total=0;
	 var payType=0;
	 $(".frontPrice").each(function(){
		   payType=$(this).attr("paytype");
		   if (payType!=0)
		   total+=parseFloat($(this).html())*parseFloat($("#num_"+$(this).attr("cartid")).val());
		   
	 });
	 if (total!=0){
	     $("#showFrontPrice").html("<br/><strong>"+((payType=="2")?"至少":"")+"需要支付订金：<span class='price'>"+priceunitsymbol+total.toFixed(DecimalPlaces)+priceunit+"</span></strong>");
	 }
	 //==========================判断是否支持仅付定金 end==================================　
}

//显示最终价格信息
function showResultMoney(t, v) {
    if (t==1&&v == 0) {
        facevalue1=0;
    }
    else if ( t == 2&& v == 0) {
        facevalue = 0;
    }
    var showResult = parseFloat($("#orderTotalPrice").html()) - facevalue - facevalue1;   //最终价格等于商品价格－优惠券金额/红包金额
    
    //================================商场优惠  begin==============================================================
   
        if (mallActivities == "1") {
            var totalYHPrice = 0;
            jQuery(".subtotal").each(function () {
                if ($(this).attr("IsPromotions") == "1") {
                    totalYHPrice += parseFloat($(this).html());
                }
            });
            var cxSaveMoney = 0;
            if (totalYHPrice > 0) {
                var cxarr = mallActivitieArr.split('§');
                for (var ci = 0; ci < cxarr.length; ci++) {
                    var carr = cxarr[ci].split('|');
                    if (totalYHPrice >= parseFloat(carr[0])) {
                        cxSaveMoney = carr[1];
                    }
                }
                if (parseFloat(cxSaveMoney) > 0) {
                    $("#showsave").show();
                } else {
                    $("#showsave").hide();
                }
                $("#SaveMoney").html(parseFloat(cxSaveMoney).toFixed(DecimalPlaces));
            } else {
                $("#showsave").hide();
            }
        }
		 showResult=showResult-parseFloat($("#SaveMoney").html());
	 
	 //================================商场优惠 end==============================================================
	 
	  $("#showMustPayPrice").html("<input type='hidden' value='"+showResult+"' name='orderTotalPrice'/><div class='paymoney'><strong>您需要支付：<span class='price'>"+priceunitsymbol+showResult.toFixed(DecimalPlaces)+priceunit+"</span></strong></div>");
	  if ($("#orderScore").html()!='0'){ $("#showjf").show(); }
	 
}



function validateCoupon(v,t)
{
    //alert(v + "====" + t);
    var couponnum = '';
    if (v==3&&t ==2) {
        if ($("#couponnum").val() == '') {
            try {
                KesionJS.Alert('请输入优惠券号!', '$("#couponnum").focus();');
            } catch (e) {
                alert('请输入优惠券号!');
            }
            return false;
        }
    }
    
  if (CouponNum == $("#couponnum"))
  {
    return;
  }
  else
  {
    CouponNum = $("#couponnum");
  }
  if (v == 3) {
      couponnum = $("#couponnum").val();
  }
  else {
      couponnum = v;
  }
  showCouponMsg=true;
  var url = appurl+'plus/ajaxs.ashx';
  $.get(url, { a: "validatecoupon", CouponNum: couponnum,CouponType:t}, function (s) {
    var returnStr=unescape(s);
    //alert(s);
    if (v != 0 && returnStr == '' || returnStr == null) {
		try{
		    KesionJS.Alert('对不起,您输入的优惠券不可用!', '');
		}catch(e){
			alert('对不起,您输入的优惠券不可用!');
		}
	  return ;
	}
	 else{
	   updateOrderFee(returnStr,t,v);
	}
  });
}

﻿

//＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝购物车相关操作 begin===============================================
function initialPayMoney() {
	  $.get(appurl+"plus/ajaxs.ashx", { a: "saveCartIds", flag:1},
			 function(data){
				 var arr=data.split(',');
				 for(var i=0;i<arr.length;i++){
							   $("input[type='checkbox'][value='"+arr[i]+"']").attr("checked",true);
				 }
			getPayMoney(1);
	});
}
 var totalPayMoney=0;
 var totalChangeScore=0;
 var tips="";
 var selectNum=0;
function getPayMoney(flag,obj){
		  var djmoney=0;
		  var payType=0;
		  var cartIds='';
		  var isChangeBuy=0;
		  totalPayMoney=0;
		  totalChangeScore=0;
		  tips="";
		  selectNum=0;
	      $("input[type='checkbox'][name='cartid']").each(function(){
		        if ($(this).prop("checked")==true){
				   isChangeBuy=$(this).attr("ischangubuy");
				   payType=parseInt($("span[cartid='"+$(this).val()+"']").attr("payType"));
				   if (isChangeBuy!="1" && checkDJProductInCart() && payType==0){
					    KesionJS.Alert('对不起，支付订金和普通商品不能一块结算！');
						$(obj).attr("checked",false);
						//obj.checked=false;
				   }else{
					   totalPayMoney+=parseFloat($("#subtotal_"+$(this).val()).html());
					   totalChangeScore+=parseInt($("#changescoresubtotal_"+$(this).val()).html());
					   djmoney+=parseFloat($("span[cartid='"+$(this).val()+"']").html())*parseFloat($("#num_"+$(this).val()).val()); //定金
					   cartIds+=','+$(this).val();
					   selectNum++;
				   }
				}
		 });
		 
		 if (flag!=1){
		    $.get(appurl+"plus/ajaxs.ashx", { a: "saveCartIds", flag:flag,cartIds:cartIds,totalPayMoney:totalPayMoney},
				 function(data){
					 if (data=='errorchangebuy'){
					    KesionJS.Alert('对不起，选中的商品未满足换购条件,换购商品将清除！','top.location.reload()');
					 }else if (data.indexOf('errorlimitbuy|')!=-1){
					    KesionJS.Alert(data.split('|')[1],'top.location.reload()');
					 }
			});
		 }
		 
		 
		 
		 //==========================判断是否支持仅付定金 begin==================================　
		  if (djmoney!=0){
			  $("#showFrontPrice").show().html("<strong>"+((payType=="2")?"至少":"")+"支付订金：<span class='price'>"+priceunitsymbol+djmoney.toFixed(DecimalPlaces)+priceunit+"</span></strong>");
			 // totalPayMoney=djmoney;
	
		 }else{
			 $("#showFrontPrice").html('0').hide();
		 }
	  //==========================判断是否支持仅付定金 end==================================　
		
		 if (totalChangeScore>0) tips="<font color=red>"+totalChangeScore+"分</font>";
		 if (totalPayMoney>0){
				 if (tips!="") tips+=" + ";
				 tips+="<span class='price'>"+priceunitsymbol+totalPayMoney.toFixed(DecimalPlaces)+priceunit+"</span>"
		  }
		  if (tips=='') tips+="<span class='price'>"+priceunitsymbol+"0.00"+priceunit+"</span>"
		 $("#showMustPayPrice").html("<strong>合计："+tips+"</strong>");
		 $("#jsbtn").val('去结算('+selectNum+')');
		 
 }
 
 //检查购物车选中的是否有允许交订单的商品
function checkDJProductInCart(){
	 var check=false;
	 $("input[type='checkbox'][name='cartid']").each(function(){
		        if ($(this).prop("checked")==true){
				   payType=parseInt($("span[cartid='"+$(this).val()+"']").attr("payType"));
				   if (payType>0){
					    check=true;
						return;
				   }
				}
	 });
	 return check;
}
function getAllProduct(obj){
	$("input[type='checkbox'][name='cartid']").attr("checked",obj.checked);
	getPayMoney();
}
function checkCart(){
	if ($("input[type='checkbox'][name='cartid']:checked").length==0){
		KesionJS.Alert('请选择需要结算的商品!'); 
	   return false;
	}
}
function removeOnShoppingCart(cartid){ 
	   KesionJS.Confirm("确定从购物车里删除吗?","delfromcart("+cartid+")","");
	 }
function delfromcart(cartid){
	    jQuery.get(appurl+"plus/ajaxs.ashx", { a: "delfromcart", cartid:cartid},
			 function(data){
					if (data=="success"){
					 location.href='?app=shoppingcart';
					}else{
					 KesionJS.Alert('删除失败!');
					}
			  });
 }
 function addChangeBuyPro(proid,needPrice){
	    var totalPrice=parseFloat(totalPayMoney);
		if (parseFloat(needPrice)>totalPrice){
		  KesionJS.Alert('对不起,您的订单金额不足,还差'+priceunitsymbol+(needPrice-totalPrice).toFixed(DecimalPlaces)+priceunit+'!');
		  return false;
		}
		if (jQuery("#chnagebuyproid")[0]){
		  if (jQuery("#chnagebuyproid").val()!=proid){
		    if (confirm('您已挑选过换购品,确认替换吗?')==false) return false;
		  }
		}
	     $.get(appurl+"plus/ajaxs.ashx", { a: "addchangebuytocart", proid:proid},
			 function(data){
					if (data=="success"){
					 location.href='?app=shoppingcart';
					}else{
					 KesionJS.Alert('添加失败!');
					}
		  });
	 }
	 function removeAllPro(){
	   KesionJS.Confirm('确定清空购物车里的商品吗?','removeallprofromcart();','');
	 }
	 function removeallprofromcart(){
	   jQuery.get(appurl+"plus/ajaxs.ashx", { a: "removeallprofromcart"},
			 function(data){
					if (data=="success"){
					 location.href='?app=shoppingcart';
					}else{
					 KesionJS.Alert('删除失败!');
					}
			  });
	 }
	 function changeBar(t,cartid,obj){
	   var num=parseInt(jQuery("#num_"+cartid).val());
	   var ProID=jQuery("#proid_"+cartid).val()
	   if (t=='+'){
	    num++;
	   }else if(t=='o'){
	    num=parseInt(jQuery('#num_'+cartid).val());
	   }else{
	    num--;
	   }
	   if (num<=0){
		 removeOnShoppingCart(cartid);
	   }else{
	   
	    jQuery.getScript(appurl+'plus/ajaxs.ashx?a=setbuynum&cartid='+cartid+'&num='+num+'&ProID='+ProID,function(){
	          if (data.issuccess=='false')
			   KesionJS.Alert('操作失败了!');
			  else if (data.issuccess=='failnum')
			   KesionJS.Alert('库存量不足,最多还能购买'+data.amount+'件!');
			  else if (data.issuccess=='failmaxnum')
			   KesionJS.Alert('本商品限定每人最多只能购买'+data.amount+'件!');
			  else if (data.issuccess=='failminnum'){
			    if (confirm('本商品限定每人最少需要购买'+data.amount+'件,您要取消本次购买吗?')){ removeOnShoppingCart(cartid);	}
			   }
			  else if (data.issuccess=='reload'){
			   location.href=appurl+'index.aspx?app=shoppingcart';
			  }
			  else if(data.issuccess=='true'){
			   jQuery("#num_"+cartid).val(num);
			   jQuery("#subtotal_"+cartid).html(parseFloat(num*parseFloat(jQuery('#price_'+cartid).html())).toFixed(DecimalPlaces));
			   jQuery("#changescoresubtotal_"+cartid).html(parseInt(num*parseInt(jQuery('#changescore_'+cartid).html())));
			   jQuery("#subscore_"+cartid).html(parseInt(num*parseInt(jQuery('#score_'+cartid).val())));
		   
			   getPayMoney();
	            if ($("input[type='checkbox'][name='cartid'][value='"+cartid+"']")[0].checked){  //选中的商品才提示
			     showTipsBox("恭喜,商品数量更新成功,当前选中合计：<span color=red>"+tips+"</span>。",obj);
				}
			 }
		});	  
	   
       
	   }
	 }
//＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝购物车相关操作 end===============================================

$(function(){
	 //清除0的标签
	 $(".removezero").each(function(){
	   if (parseInt($(this).html())==0){
		     $(this).parent().parent().hide();
		   }
	  });
});
