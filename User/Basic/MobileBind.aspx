<%@ Page Language="C#" MasterPageFile="~/User/User.master" ValidateRequest="false" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_User_MobileBind" Title="Untitled Page" Codebehind="MobileBind.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>


<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

    <script>
    function checkform() {
        if ($("#<%=this.TxtMobile.ClientID %>").val() == '') {
            KesionJS.Alert('�����������ֻ����룡', "$('#<%=this.TxtMobile.ClientID %>').focus()");
            return false;
        }
        <%if (EnabledSms == 1)
         { %>
            if ($("#<%=this.TxtMobileCode.ClientID %>").val() == '') {
               KesionJS.Alert('�������ֻ���֤�룡', "$('#<%=this.TxtMobileCode.ClientID %>').focus()");
               return false;
               }
        <%} %>

    }
var OutTimes=<%=MyCache.GetCacheConfig(38) %>;
var SessionID="<%=SessionID %>";
 function leavePage() {
		 if (OutTimes==0){
		 $("#SendMobileBtn").attr("disabled",false);
		 $("#SendMobileBtn").val("��ѻ�ȡ�ֻ���֤��")
		 }
		 else{
		 OutTimes -= 1;
		 $("#SendMobileBtn").val("�ѷ������"+OutTimes+"���û���յ��������ط�!")
		 setTimeout("leavePage()", 1000);}
}

function getMobileCode(){
	var mobile=$("#<%=this.TxtMobile.ClientID %>").val();
	if (mobile==''){
	  $.dialog.alert('�������ֻ����룡',function(){ $("#<%=this.TxtMobile.ClientID %>").focus();});
	   return false;
	}
	if (ismobile(mobile)==false){
	  $.dialog.alert('�ֻ������ʽ����ȷ�����������룡',function(){ $("#<%=this.TxtMobile.ClientID %>").focus();});
	  return false;
	}
	$("#SendMobileBtn").attr("disabled",true);
	$.ajax({type:"get",async:false,url:"../regajax.ashx?action=sendmobilecode&model=modifymobile&mobile="+mobile+"&SessionID="+SessionID+"&anticache=" + Math.floor(Math.random()*1000),cache:false,dataType:"html",success:function(d){
		 if (d=='true'){
			leavePage();
		 }else{
			$.dialog.alert(d,function(){ $("#SendMobileBtn").attr("disabled",false); });
		 }
	}});
	return false;
	
}
</script>

	<div class="r_tybox nomar">
         <div class="r_title"><h4>���ֻ�</h4></div>
        <div class="r_padbox nopadtop">
		 <table  cellspacing="1" cellpadding="3" class="border" width="100%" align="center" border="0">
                          <%if (__info.IsMobileRZ == 1)
                            { %>
                          
                          <tbody id="MobileRZ">
                           <tr class="tdbg">
                            <td class="lefttd" style="width: 100px">��ܰ��ʾ��</td>
                            <td style="text-align:left">�����ֻ������Ѿ�����վ��֤�󶨡�</td>
                          </tr>
                           <tr class="tdbg">
                           <td  class="lefttd" height="50" style="width: 100px">�ֻ����룺</td>
                           <td style="text-align:left"><%=__info.Mobile %>
                           <input type="button" class="button" value="�޸İ�" onclick="$('#MobileRZ').hide();$('#ModifyMobile').show();"/>
                           
                            </td>
                          </tr>
                          </tbody>
                          <%}%>
                           
                          
                         <tbody id="ModifyMobile" <%=__info.IsMobileRZ == 1?" style='display:none'":""%>>
                          <tr class="tdbg">
                            <td  class="lefttd" style="width: 100px">�ֻ����룺</td>
                            <td style="text-align:left">
                            <asp:TextBox ID="TxtMobile" CssClass="textbox"  runat="server"></asp:TextBox><span class="tips">�����������ֻ����롣</span>
                            </td>
                          </tr>
                          
                          <%if (EnabledSms == 1)
                            { %>
                          <tr class="tdbg">
                            <td  class="lefttd" height="40" style="width: 100px">�� ֤ �룺</td>
                            <td style="text-align:left">
                            <asp:TextBox ID="TxtMobileCode" runat="server" CssClass="textbox" Width="60" MaxLength="6" />
                            <input type="button" id="SendMobileBtn" class="button" onclick="getMobileCode()" value="��ѻ�ȡ�ֻ���֤��"/>
                            </td>
                          </tr>
                         <%} %>
 
                          
						<tr class="tdbg">
                            <td class="lefttd" height="40" style="width: 100px">&nbsp;</td>
                            <td style="text-align:left">
                            	<div class="cz_btn">
                            		<asp:Button OnClientClick="return(checkform());" ID="Button1" CssClass="button" runat="server" OnClick="Button1_Click" Text="OK!ȷ���޸�" />
                                </div>
                             </td>
                        </tr>
                        </tbody>  
                        
                        <tr class="tdbg">
                           
                            <td class="tips" colspan="2" align="left" style="text-align:left;border-bottom:0px">
                                <div class="tips" style=" padding-left:0px">�������������(�ֻ��һ�����)�������֧���ֻ���֤���ܣ��� �����궩��������ʾ��</div>
                            
                               </td>
                        </tr>
            </table>
      		</div>   
       </div>
         

</asp:Content>

