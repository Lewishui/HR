<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Admin/MasterPage.master" Inherits="Kesion.Weixin.WebSite.GetClassPage" Codebehind="KS.GetClassPage.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.BLL" %>
<%@ Import Namespace="Kesion.Publics"%>
<%@ Import Namespace="Kesion.Weixin"%>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<script>

    function winClose() {
        try {
            top.box.close();
        } catch (e) {
            window.close();
        }
    }
    function ExtSub(ID, event) {

        //阻止冒泡调用parent
        var e = (event) ? event : window.event;
        if (window.event) {//IE
            e.cancelBubble = true;
        } else { //FF
            e.stopPropagation();
        }

        if (jQuery('#C' + ID).attr('class') == "tree_Close") {
            jQuery('#C' + ID).attr('class', 'tree_Open');
            if ($(".CTable").find("tr[attr*='," + ID + ",']").length > 0) {
                $(".CTable").find("tr[attr*='," + ID + ",']").show();
            } else {
                jQuery('#ajaxmsg', window.parent.document).toggle();
                jQuery.ajax({
                    type: "POST",
                    url: "KS.GetClassPage.aspx",
                    data: "parentid=" + ID + "&a=ExtSub&Action=<%=KSCMS.S("Action")%>",
                    success: function (data) {
                        jQuery('#ajaxmsg', window.parent.document).toggle();
                        jQuery("#sub" + ID).after(data);
                        //jQuery("#sub"+ID).html(data);
                    }
                });
            }
        }
        else {
            $(".CTable").find("tr[attr*='," + ID + ",']").hide();
            jQuery('#C' + ID).attr('class', 'tree_Close');
        }
    }

 </script>
 <script>
function SetClassUrl(){  
 var v='';
 v= $("input[name='ids']:checked").val();

if (v=='') KesionJS.Alert('请选择栏目内容页');    
else   
 {
    alert(v);
    <%if (KSCMS.S("fieldID")!=""){ %>
    alert(v);
    top.frames["main"].document.getElementById("<%=KSCMS.S("fieldID").Trim() %>").value = v;
    
    try {
        top.frames["main"].document.getElementById("show<%=KSCMS.S("fieldID")%>").style.display = '';
        top.frames["main"].document.getElementById("show<%=KSCMS.S("fieldID")%>").src = v;
    }
    catch (e) {
    }
    top.box.close();
  <%}else{%>
     window.returnValue=v;     
     window.close();    
  <%} %>
 }
}
</script>
<div class="content-area">
  <div class="heae_tabs">   
           <span <%=KSCMS.S("Action")==""?" class='active'":string.Empty %>><a href="KS.GetClassPage.aspx">内容管理</a></span> 
		 <span <%=KSCMS.S("Action")=="shop"?" class='active'":"" %>> <a href="KS.GetClassPage.aspx?Action=shop&fieldID=<%=KSCMS.S("fieldID")%>">商城系统</a></span>  
		<span <%=KSCMS.S("Action")=="exam"?" class='active'":"" %>><a href="KS.GetClassPage.aspx?Action=exam&fieldID=<%=KSCMS.S("fieldID")%>">考试管理</a></span> 
		<span <%=KSCMS.S("Action")=="ask"?" class='active'":"" %>><a href="KS.GetClassPage.aspx?Action=ask&fieldID=<%=KSCMS.S("fieldID")%>">问答管理</a></span> 
   
      </div>  
      <div class="clear blank10"></div>             
    <div class="Exlbos">
         <asp:Repeater ID="list" runat="server"  >
          <HeaderTemplate>
           <table width="100%" class="CTable" align="center" border="0" cellpadding="0" cellspacing="0">
          <tr class="CTitle"> 
           <td>栏目ID</td>     
          <td style="text-align:left">栏目名称 (<a class="tips" style="font-weight:normal" href="KS.GetClassPage.aspx?flag=showall&Action=<%=KSCMS.S("Action")%>&fieldID=<%=KSCMS.S("fieldID")%>">展开</a>)</td>
           <td></td>
            </tr>  
        
          </HeaderTemplate>
          <ItemTemplate>
                <tr id='sub<%#Eval("classid") %>' onmouseover="jQuery('#a<%# Eval("classid") %>').show();jQuery(this).addClass('CtrMouseOver');jQuery(this).removeClass('CtrMouseOut');" onmouseout="jQuery('#a<%# Eval("classid") %>').hide(); jQuery(this).addClass('CtrMouseOut');jQuery(this).removeClass('CtrMouseOver');" onclick="chk(this)">
              <td style="width:5%"><%# Eval("classid") %></td>
             <td style="width:55%;text-align:left">
               <%if (KSCMS.S("flag") != "showall")
               { %>
                <a href="javascript:void(0)" style="text-decoration:none" onclick='ExtSub("<%# Eval("ClassID") %>",event);'><%# getClassName(Convert.ToInt32(Eval("ClassID")),Eval("Classname", "{0}"), Convert.ToInt16(Eval("child")), Convert.ToInt16(Eval("NextID")), Convert.ToInt16(Eval("depth", "{0}")), Convert.ToInt16(Eval("ClassType", "{0}")))%></a><%}
               else
               { %><%# getClassName(Convert.ToInt32(Eval("ClassID")),Eval("Classname", "{0}"), Convert.ToInt16(Eval("child")), Convert.ToInt16(Eval("NextID")), Convert.ToInt16(Eval("depth", "{0}")), Convert.ToInt16(Eval("ClassType", "{0}")))%><%} %>
               
               <span style="display:none;padding-left:20px;" id="a<%# Eval("classid") %>">
 
                <a href='<%# GetClassUrl(Convert.ToInt16(Eval("ClassID")),KSCMS.S("Action"))%>'target="_blank" style="color:#999">预览</a>
               </span>              
                </td>
               <td> 
               
                <input type="radio" name="ids"   value="<%#GetClassUrl(Convert.ToInt16(Eval("ClassID")),KSCMS.S("Action"))%>"/></td>
            </tr>
           
           
         
          </ItemTemplate>
         <FooterTemplate>
          
          </table>
          </FooterTemplate>
         </asp:Repeater>
       </div>  
     <KS:Page ID="Page1" runat="server" />
  
     <br />
    <Input class="button" type="button" value=" 确 定 " name=Submit  onclick="SetClassUrl();"> 
    <Input onClick="winClose()" class="button" type="button" value=" 取 消 " name=Submit3>
   
</div>

</asp:Content>