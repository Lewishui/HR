<%@ Page Language="C#" validateRequest="false" enableEventValidation="false" viewStateEncryptionMode ="Never" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin.Admin_Login" Codebehind="Login.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.Cache" %><!DOCTYPE html>
<html>
<head runat="server">
<title>KESION Inc.</title>
<script src="../KS_Inc/jQuery.js"></script>
<script src="../KS_Inc/Kesion.Common.js"></script>
<script src="../admin/images/login/bgstretcher.js"></script>
<!--[if IE 6]>
  <script src="/admin/include/iepng.js" type="text/javascript"></script>
  <script type="text/javascript">
    try{
     EvPNG.fix('div, ul, img, li, input, em, a, p,i,b,span,em,' ); 
    }catch(e){
    }
  </script>
  <![endif]-->
<script>
	function isPlaceholderSupport() {  
		return 'placeholder' in document.createElement('input');  
	}  

	$(function(){
        //if (!isPlaceholderSupport()){
           
			$("#<%=this.UserName.ClientID%>").focus(function(){
			    if ($(this).val()=='�������¼�˺�'){ 
			        $(this).val('');
			    }
			    $(this).removeClass("put").addClass("puton");

			}).blur(function(){
			    if ($(this).val()==''){ $(this).val('�������¼�˺�'); }
			    if ($(this).val()=='�������¼�˺�'){
			        $(this).removeClass("puton").addClass("put");
			    }
			}).val('�������¼�˺�');


			$("#<%=this.UserPass.ClientID%>").focus(function(){
				if ($(this).val()=='******'){ 
					$(this).val(''); 
				}
			    $(this).removeClass("put").addClass("puton");
			}).blur(function(){
				if ($(this).val()==''){ $(this).val('******'); }
			    if ($(this).val()=='******'){
			        $(this).removeClass("puton").addClass("put");
			    }
			}).val('******');


			$("#<%=this.AdminLoginCode.ClientID%>").focus(function(){
				if ($(this).val()=='******'){ $(this).val(''); }
			    $(this).removeClass("put").addClass("puton");
				
			}).blur(function(){
				if ($(this).val()==''){ $(this).val('******'); }
			    if ($(this).val()=='******'){
			        $(this).removeClass("puton").addClass("put");
			    }
			}).val('******');
			
			

			$("#<%=this.ValidateCode.ClientID%>").focus(function(){
				if ($(this).val()=='��֤�룡'){ $(this).val(''); }
			    $(this).removeClass("put").addClass("puton");
				
			}).blur(function(){
				if ($(this).val()==''){ $(this).val('��֤�룡'); }
			    if ($(this).val()=='��֤�룡'){
			        $(this).removeClass("puton").addClass("put");
			    }
			}).val('��֤�룡');
			
			
			$("#<%=this.TxtMobile.ClientID%>").focus(function(){
				if ($(this).val()=='�������ֻ�����!'){ $(this).val(''); }
			    $(this).removeClass("put").addClass("puton");
				
			}).blur(function(){
				if ($(this).val()==''){ $(this).val('�������ֻ�����!'); }
			    if ($(this).val()=='�������ֻ�����!'){
			        $(this).removeClass("puton").addClass("put");
			    }
			}).val('�������ֻ�����!');
			
			
			$("#<%=this.TxtMobileCode.ClientID%>").focus(function(){
				if ($(this).val()=='��֤�룡'){ $(this).val(''); }
			    $(this).removeClass("put").addClass("puton");
				
			}).blur(function(){
				if ($(this).val()==''){ $(this).val('��֤�룡'); }
			    if ($(this).val()=='��֤�룡'){
			        $(this).removeClass("puton").addClass("put");
			    }
			}).val('��֤�룡');
			
		//}
    });
	function CheckMobile(){
	if (jQuery("#<%=this.TxtMobile.ClientID %>").val() == ''||jQuery("#<%=this.TxtMobile.ClientID %>").val() == '�������ֻ�����!') {
	        KesionJS.Alert('�������ֻ�����!', 'jQuery("#<%=this.TxtMobile.ClientID %>").focus();');
	        return false;
	    }
	if (jQuery("#<%=this.TxtMobileCode.ClientID %>").val() == ''||jQuery("#<%=this.TxtMobileCode.ClientID %>").val() == '��֤�룡') {
	        KesionJS.Alert('�������ֻ���֤��!', 'jQuery("#<%=this.TxtMobileCode.ClientID %>").focus();');
	        return false;
	    }
	}
	function CheckForm() {
	    if (jQuery("#<%=this.UserName.ClientID %>").val() == ''||jQuery("#<%=this.UserName.ClientID %>").val() == '�������¼�˺�') {
	        KesionJS.Alert('�������¼�û���!', 'jQuery("#<%=this.UserName.ClientID %>").focus();');
	        return false;
	    }
	    if (jQuery("#<%=this.UserPass.ClientID %>").val() == ''||jQuery("#<%=this.UserPass.ClientID %>").val() == '******') {
	        KesionJS.Alert('�������¼����!', 'jQuery("#<%=this.UserPass.ClientID %>").focus();');
	        return false;
	    }
	    <%if (MyCache.GetCacheConfig(3).IndexOf("login.aspx") == 0)
            { %>
	    if (jQuery("#<%=this.ValidateCode.ClientID %>").val() == ''||jQuery("#<%=this.ValidateCode.ClientID %>").val() == '��֤�룡') {
	        KesionJS.Alert('��������֤��!', 'jQuery("#<%=this.ValidateCode.ClientID %>").focus();');
	        return false;
	    }
	    <%} 
	    if (MyCache.GetCacheConfig(18) == "1")
            {%>
	     if (jQuery("#<%=this.AdminLoginCode.ClientID %>").val() == ''||jQuery("#<%=this.AdminLoginCode.ClientID %>").val() == '******') {
	        KesionJS.Alert('��������֤��!', 'jQuery("#<%=this.AdminLoginCode.ClientID %>").focus();');
	        return false;
	    }
	    <%} %>
	    return true;
	}

var OutTimes=<%=MyCache.GetCacheConfig(38) %>;	
function leavePage() {
		 if (OutTimes==0){
		     $("#SendMobileBtn").attr("disabled",false);
		     $("#SendMobileBtn").val("������֤��")
		 }
		 else{
		 OutTimes -= 1;
		 $("#SendMobileBtn").val(""+OutTimes+"����ط�")
		 setTimeout("leavePage()", 1000);}
}
function getMobileCode(){
	var mobile=$("#<%=this.TxtMobile.ClientID %>").val();
	if (mobile==''){
	  $.dialog.alert('��ѡ�����ֻ����룡',function(){ $("#<%=this.TxtMobile.ClientID %>").focus();});
	   return false;
	}
	if (ismobile(mobile)==false){
	  $.dialog.alert('�ֻ������ʽ����ȷ�����������룡',function(){ $("#<%=this.TxtMobile.ClientID %>").focus();});
	  return false;
	}
	$("#SendMobileBtn").attr("disabled",true);
	$.ajax({type:"get",async:false,url:"../user/regajax.ashx?action=sendmanagemobilecode&mobile="+mobile+"&anticache=" + Math.floor(Math.random()*1000),cache:false,dataType:"html",success:function(d){
		 if (d=='true'){
		    $.dialog.tips("�ѳɹ����ͣ���ע����գ�",2,"success.gif",function(){ });
			leavePage();
		 }else{
		 		$("#SendMobileBtn").attr("disabled",false);
			 $.dialog.alert(d,function(){ });
		 }
	}});
	return false;
	
}
 </script>

    <link href="../admin/images/login/login.css" rel="stylesheet" type="text/css" />

</head>
<script>
//���ֻ���Ч��
window.onload = function(){
	$(".connect img").eq(0).animate({"left":"0%"}, 600);
	$(".connect img").eq(1).animate({"left":"0%"}, 400);
};
</script>
<script type="text/javascript">
	$(document).ready(function(){
        //  Initialize Backgound Stretcher	   
		$('BODY').bgStretcher({
		    images: [<%=GetBgPic()%>],
			imageWidth: 1024, 
			imageHeight: 768, 
			slideDirection: 'N',
			slideShowSpeed: 1000,
			transitionEffect: 'fade',
			sequenceMode: 'normal',
			buttonPrev: '#prev',
			buttonNext: '#next',
			pagination: '#nav',
			anchoring: 'left center',
			anchoringImg: 'center center'
		});
		
	});
	
	$(function(){
		auto();
	});
	$(window).resize(function(){
		auto();
	});
	function auto(){
		var h = ($(window).height()-$(".bgstretcher-page").height()-$(".copyright").height())/2;
		$(".bgstretcher-page").css({marginTop:""+h+"px"});
	};
	
</script>

<body>


 <form id="form1" runat="server">
 <div class="connect clearfix">
      <div class="m-logo"><img src="../admin/images/login/logo-i<%=Utils.GetSysInfo("//sysinfo/showver") %>.png" align="center"></div>
      <div class="loginbox">
              <asp:PlaceHolder ID="PlaceHolder1"  runat="server"></asp:PlaceHolder>
         
         <div class="box">
         	<div class="m-title"><img src="../admin/images/login/login-tilte.png" alt="����Ա��¼" /></div>
            <ul>
                
                <asp:Panel ID="PanStep1" runat="server">
                
                    <li  class="loginput">
                        <asp:TextBox ID="TxtMobile" CssClass="sj od tel put" runat="server" MaxLength="12"></asp:TextBox>
                    </li>
                     <li class="loginput">
                      <asp:TextBox ID="TxtMobileCode" CssClass="pas od code put" runat="server" MaxLength="6"></asp:TextBox> 
                      <span class="pic">
                     <input type="button" onClick="getMobileCode()" value="������֤��" class="sendbtn" id="SendMobileBtn"/>
                      </span>
                   </li>
                     <li class="loginput loginin">
                      <asp:Button ID="ImageButton2" runat="server" Text="��¼"  OnClientClick="return(CheckMobile());" CssClass="btn btn-submit" OnClick="ImageButton1_Click"/>
                      <input name="" value="ȡ��" type="button" class="btn btn-reset" onClick="javascript:location.href='/';"/>
                        <asp:ValidationSummary ID="ValidationSummary2" runat="server" ShowMessageBox="True" ShowSummary="False" />
                   </li>

                </asp:Panel>



                 <asp:Panel ID="PanStep2" runat="server" Visible="false">
                   <li class="loginput">
                     <asp:TextBox ID="UserName" CssClass="username put" runat="server"  Text="" MaxLength="20"></asp:TextBox> <asp:RequiredFieldValidator
                     ID="RequiredFieldValidator1" runat="server" ControlToValidate="UserName" Display="None"
                     ErrorMessage="�������û���"></asp:RequiredFieldValidator>
                   </li>
                   <li style="position:relative;" class="loginput">
                       <asp:TextBox ID="UserPass" CssClass="password put"  value="" TextMode="Password" MaxLength="50" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                     ID="RequiredFieldValidator2" runat="server" ErrorMessage="�������¼����" ControlToValidate="UserPass" Display="None"></asp:RequiredFieldValidator>
                 

                   </li>
                   <li id="CodeArea" runat="server"  class="loginput">
                   		<span style="font-size:12px;color:#f46344; display:block;margin-top:-3px;">��̨��������֤����֤����������֤��</span>
                       <asp:TextBox ID="AdminLoginCode" TextMode="password" value="" MaxLength="50" CssClass="approve put" runat="server"></asp:TextBox><span id="AdminLoginCodeArea" runat="server"></span><asp:RequiredFieldValidator
                     ID="RequiredFieldValidator4" runat="server" ErrorMessage="��������֤��" ControlToValidate="AdminLoginCode" Display="None"></asp:RequiredFieldValidator>
                   </li>
                   <li id="VefifyCode" runat="server" class="loginput">
                    <asp:TextBox ID="ValidateCode" runat="server" CssClass="code put"  MaxLength="10"></asp:TextBox><asp:RequiredFieldValidator
                     ID="RequiredFieldValidator3" runat="server" ErrorMessage="��������֤��" ControlToValidate="ValidateCode" Display="None"></asp:RequiredFieldValidator>
                     <span class="pic">
                     <asp:Image ID="ValidateCode1" runat="server"  ToolTip="�����壬���ˢ��" ImageUrl="../plus/ValidateCode.aspx" ImageAlign="AbsMiddle" /> </span>
                   </li>
                   <li class="loginput loginin">
                      <asp:Button ID="ImageButton1" runat="server" Text="��¼" OnClientClick="return(CheckForm());" CssClass="btn btn-submit" OnClick="ImageButton2_Click"/>
                      <input name="" value="ȡ��" type="button"  class="btn btn-reset" onClick="javascript:location.href='/';"/>
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
                   </li>
                 </asp:Panel>

            </ul>
            <div class="clear"></div>
         </div>
      </div>

  </div>




	  
	 <div class="copyright"> Copyright &copy;2006-<%=DateTime.Now.Year.ToString()%> <a href="http://www.kesion.com" target="_blank"> www.kesion.com</a>,All Rights Reserved.
      <br />Powered by KesionI<%=Utils.GetSysInfo("//sysinfo/showver") %> Version <%=Utils.GetSysInfo("//sysinfo/version")%>  ���ſ�Ѵ������޹�˾
    </div>
     <script>
        jQuery(document).ready(function(){
             jQuery("#<%=this.form1.ClientID %>").attr("action","<%=Request.Url.Segments[Request.Url.Segments.Length - 1] %>");
        });
   
   </script> 
   </form>
</body>
</html>